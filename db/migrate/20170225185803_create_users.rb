class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin,  default: false
      t.string :password
      t.boolean :activated

      t.timestamps
    end
  end
end
