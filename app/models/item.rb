class Item < ApplicationRecord
  #extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :text, length: { maximum: 1000 }
    #validates :price, numericality: { only_integer: ture, with: /\A[0-9]+\z/, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999, message: 'は半角数字で300円以上9,999,999円以下で入力して下さい' }

    validates :images
  end

  with_options presence: true, numericality: { other_than: 1, message: 'は--以外を選択して下さい' } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_prefecture_id
    validates :delivery_date_id
  end
end