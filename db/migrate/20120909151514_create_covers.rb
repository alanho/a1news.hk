class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.date :date
      t.string :source
      t.string :image_url
      t.string :link_url
      t.string :source_image_url
      t.string :status

      t.timestamps
    end
  end
end
