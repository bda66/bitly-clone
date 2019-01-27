class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links, id: :uuid do |t|
      t.string :original_url, null: false
      t.string :short_url, null: false
      t.uuid :created_by, null: false
      t.integer :clicks_count, default: 0, null: false

      t.timestamps
    end
  end
end
