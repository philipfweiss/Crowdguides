class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.text :title
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end

    add_index :guides, [:user_id, :created_at]
  end
end
