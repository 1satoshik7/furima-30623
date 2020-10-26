class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :date, presence: true
  validates :nickname, presence: true
  validates :sur_name, presence: true
  validates :name, presence: true
  validates :sur_name_ruby, presence: true
  validates :name_ruby, presence: true
end
