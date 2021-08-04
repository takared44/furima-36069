# class Order 
#   incude AcitiveModel::model
#   attr_accessor :user_id, :item_id, :product_name, :text, :price, :postcode, :prefecture_id, :city, :blok, :building, :phone, :token


#  with_options presence: true do
#     validates :user_id
#     validates :item_id
#     validates :postcode,              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は(-)を入れて7文字で入力してください' }
#     validates :prefecture_id,         numericality: { other_than: 1, message: "は--以外を選択してください" }
#     validates :city
#     validates :bloc
#     validates :phone, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
#     validates :token
# end
# varidates :phone,format: { with: /\A\d{10,11}\z/, message: 'は(-)を抜いた11桁までを入力してください' }

# def save

#   record = Record.create(user_id: user_id, item_id: item_id)
#   Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, bloc: bloc, building: building, phone: phone,record_id: record.id)
# end
# end#