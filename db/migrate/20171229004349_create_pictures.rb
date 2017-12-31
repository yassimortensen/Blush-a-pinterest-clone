class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :url
      t.string :photographer_name
      t.string :photographer_link
      t.string :keyword

      t.timestamps
    end
  end
end
