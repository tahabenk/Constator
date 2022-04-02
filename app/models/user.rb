class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # bon courage
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :driver
end
