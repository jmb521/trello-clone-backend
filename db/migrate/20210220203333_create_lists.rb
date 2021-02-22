class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :content
      t.belongs_to :board
      t.timestamps
    end
  end
end
