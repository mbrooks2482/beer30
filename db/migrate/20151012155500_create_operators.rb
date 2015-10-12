class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.belongs_to :light, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.boolean :admin, default: false, null: false

      t.timestamps null: false
    end
  end
end
