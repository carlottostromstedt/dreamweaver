class CreateStoryFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :story_frames do |t|
      t.text :frame

      t.timestamps
    end
  end
end
