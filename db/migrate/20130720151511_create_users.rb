class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :nick_name
      t.date :birthdate_on
      t.string :sex, limit: 8
      t.string :phone
      t.string :photo
      t.string :photo_big
      t.string :city
      t.string :country
      t.string :role
      t.timestamps
    end
  end
end
