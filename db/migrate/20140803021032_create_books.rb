class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :status
      t.string :isbn
      t.string :tags
      t.string :review
      t.boolean :active
      t.datetime :approved_at

      t.timestamps
    end
  end
end
