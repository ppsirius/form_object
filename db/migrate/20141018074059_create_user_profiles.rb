class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :city
      t.string :postal_code
      t.string :street
      t.string :display_name
      t.integer :user_id

      t.timestamps
    end
  end
end
