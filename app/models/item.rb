class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  
    validates :price,
              numericality: { only_integer: true, with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'は半角数字で300円以上9,999,999円以下で入力して下さい' }

    validates :images
  end

  with_options presence: true, numericality: { other_than: 1, message: 'は--以外を選択して下さい' } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_prefecture_id
    validates :delivery_date_id
  end

  has_many_attached :images
  has_one :record
  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_prefecture
  belongs_to_active_hash :delivery_date
end
