class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.string :name, index: true, null: false
      t.text :desc
      t.string :state, default: :red
      t.string :text

      t.timestamps null: false
    end
  end
end
