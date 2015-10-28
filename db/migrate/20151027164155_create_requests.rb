class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :light, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :state, default: :green
      t.string :text
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
