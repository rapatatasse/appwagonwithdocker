class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :products, dependent: :destroy

  def full_name
    "#{firstname} #{lastname[0...3] if lastname}"
  end
end
