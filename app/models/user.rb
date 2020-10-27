class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :date
    validates :nickname
    validates :sur_name
    validates :name
    validates :sur_name_ruby
    validates :name_ruby
  end
  with_options format:{with:/\A[ぁ-んァ-ン一-龥]/} do
    validates :sur_name
    validates :name
  end
  with_options format:{with:/\A[ァ-ヶー－]+\z/} do
    validates :sur_name_ruby
    validates :name_ruby
  end
  with_options format:{with:/\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/} do
    validates :password
  end
end
