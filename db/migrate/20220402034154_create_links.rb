class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :user_id
      t.string :original_url
      t.string :slug
      t.integer :clicked_times, default: 0
      t.timestamps
    end
  end
end
