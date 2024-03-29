class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name
      t.boolean :admin, default: false
      t.integer :operators_count, default: 0
      t.integer :watchers_count, default: 0
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
