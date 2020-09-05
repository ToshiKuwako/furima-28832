class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  with_options presence: true do
    validates :nickname, 
    validates :email,             uniqueness: true,inclusion: {in:@}
    validates :password,          length: { minimum: 6 },format: { with:/^[a-z0-9]+$/}
    validates :first_name,        format: { with:}
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :birth_date
    
    
  end


        end
