class CreateTidbits < ActiveRecord::Migration
  def change
    create_table :tidbits do |t|
      t.references :advice, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :contents

      t.timestamps null: false
    end
  end
end
