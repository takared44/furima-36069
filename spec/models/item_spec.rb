require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it 'product_name,text,price,category_id,state_id,delivery_fee_id,delivery_prefecture_id,delivery_date_id が存在すれば登録できる' do
        expect(@item).to be_valid
        
      end
    end
      
    context '商品出品がうまくいかないとき' do
      it 'user_idが空では登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      
      it '画像が空だとできない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は--以外を選択して下さい')
      end
      it '商品の状態が空だと登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '商品の状態が1だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State は--以外を選択して下さい')
      end
      it '商配送料が空だと登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee は--以外を選択して下さい')
      end
      it '商配送料が1だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee は--以外を選択して下さい')
      end
      it '配送元の地域が空だと登録できない' do
        @item.delivery_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery prefecture can't be blank")
      end
      it '配送元の地域が1だと登録できない' do
        @item.delivery_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery prefecture は--以外を選択して下さい')
      end
      it '発想までの日数が空だと登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it '発想までの日数が1だと登録できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date は--以外を選択して下さい')
      end
      it '価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格範囲が300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下で入力して下さい')
      end
      it '価格範囲が9,999,999より大きいと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下で入力して下さい')
      end
      it '価格は半角数字でなければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下で入力して下さい')
      end
      it '価格は全角文字では登録できない' do
        @item.price = 'ＡＡＡＡＡＡ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下で入力して下さい')
      end
      it '価格は全角数字では登録できない' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下で入力して下さい')
      end
      it '価格は英数混合文字では登録できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下で入力して下さい')
      end
      it '価格は半角英字では登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下で入力して下さい')
      end
    end
  end
end

