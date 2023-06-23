class StoriesController < ApplicationController
  def index

  end

  def show
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: "Imagine you are telling a fantasy visual story with 6 frames that has a start and an end. Can you give these 6 frames as 6 gener
        ative image prompts? Be detailed when it comes to visuals such as describing a person and be coherent over the 6 frames"}], # Required.
        temperature: 0.7,
      })

    @story = response.dig("choices", 0, "message", "content")

    @split_story = @story.split("\n")
  end
end
