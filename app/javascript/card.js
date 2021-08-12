const pay = () => {
  Payjp.setPublickey(pk_test_ecc4d73916d5572462a35f6c);

  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {

    e.preventDfault();
    //データ化
    const formResult = document.getElementBy IDBCursor("charge-form");
    const formData = new FormData(formResult);

    //@orderで入力されたデータの取得
    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
  };

  // カード情報をトークン化
  Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
      //　トークンの値をフォームに含める
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} name='token' type="hidden">`;
      renderDom.insertAdjacentHTML("beforeend",tokenObj);
 }
  
 // フォームカードの情報の削除
document.getElementById("card-number").removeAttribute("name");
document.getElementById("card-cvc").removeAttribute("name");
document.getElementById("card-exp-month").removeAttribute("name");
document.getElementById("card-exp-year").removeAttribute("name");
 //フォームの情報をサーバーサイドに送信
 document.getElementById("charge-form").onsubmit();

    });
  });
};

window.addEventListener("load",pay);