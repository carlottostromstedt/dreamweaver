# frozen_string_literal: true

class StoryFrame < ApplicationRecord
  has_one_attached :image
  has_one_attached :audio
  belongs_to :dream
end
