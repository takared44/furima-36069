class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ケ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナを使用して入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :items
  has_many :records
end
