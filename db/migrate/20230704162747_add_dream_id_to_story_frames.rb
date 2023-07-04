class AddDreamIdToStoryFrames < ActiveRecord::Migration[7.0]
  def change
    add_reference :story_frames, :dream, null: false, foreign_key: true
  end
end
