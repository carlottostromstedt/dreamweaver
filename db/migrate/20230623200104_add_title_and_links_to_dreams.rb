# frozen_string_literal: true

class AddTitleAndLinksToDreams < ActiveRecord::Migration[7.0]
  def change
    add_column :dreams, :title, :string
    add_column :dreams, :links, :text
  end
end
