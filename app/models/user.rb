class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
 end
 

validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください'}
 with_options presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください'} do
   
   
  end
  with_options presence: true, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください'}do
    
    
  end

 has_many :items
 has_many :records
end 
