# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    
      t.string :nickname,           null: false
      t.string :email,              null: false, unique:true
      t.string :password,           null: false
      t.string :first_name,         null: false
      t.string :family_name,        null: false
      t.string :first_name_kana,    null: false
      t.string :family_name_kana,   null: false
      t.date   :birth_date,         null: false
      

      t.timestamps null: false
    end

  
  end
end
