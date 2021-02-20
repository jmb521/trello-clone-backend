class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :content
      t.belongs_to :baord
      t.timestamps
    end
  end
end
