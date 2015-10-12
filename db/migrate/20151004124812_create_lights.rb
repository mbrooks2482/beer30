class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.string :name, index: true, null: false, uniq: true
      t.text :desc
      t.string :state, default: :red
      t.string :text, null: false, default: ''
      t.string :default_red
      t.string :default_yellow
      t.string :default_green
      t.integer :operators_count, default: 0
      t.integer :watchers_count, default: 0

      t.timestamps null: false
    end
  end
end
