class CreatePictureBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :picture_boards do |t|
      t.integer :picture_id
      t.integer :board_id

      t.timestamps
    end
  end
end
