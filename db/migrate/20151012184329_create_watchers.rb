class CreateWatchers < ActiveRecord::Migration
  def change
    create_table :watchers do |t|
      t.belongs_to :light, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
