class StoriesController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def show
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: "Imagine you are telling a fantasy visual story with 6 frames that has a start and an end. Can you give these 6 frames as 6 gener
        ative image prompts? Be detailed when it comes to visuals such as describing a person and be coherent over the 6 frames. Dont make it a numbered list."}], # Required.
        temperature: 0.7,
      })

    @story = response.dig("choices", 0, "message", "content")
    @story = @story.gsub("\n\n", "\n")

    title_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: "Create a title for this story: #{@story}"}], # Required.
        temperature: 0.7,
      })
    title = title_response.dig("choices", 0, "message", "content")

    @split_story = @story.split("\n")
    line = 0
    numbering = 1
    @split_story.each do |i|
      @split_story[line] = i.gsub("#{numbering}. ", "")
      line += 1
      numbering+= 1
    end
    # @split_story = ["A young woman with a backpack, standing at the entrance of a forest trail, looking determined and excited.",
    #                 "Close-up of the woman's hiking boots as she takes her first steps onto the trail, surrounded by tall trees and dappled sunlight.",
    #                 "A panoramic view of the woman hiking uphill, sweat on her forehead, taking in the stunning vista of a mountain range in the distance.",
    #                 "A sudden storm clouds the sky and rain starts pouring down. The woman takes shelter under a large rock, looking worried.",
    #                 "The rain stops, and the woman emerges from under the rock to see a rainbow stretching across the valley below.",
    #                 "The woman reaches the peak of the mountain, arms raised in triumph, as the sun sets behind her, casting a golden glow over the landscape."]
    # @dalle_urls = ["https://www.hundeo.com/wp-content/uploads/2019/01/Dackel.jpg",
    #                "https://www.zooroyal.de/magazin/wp-content/uploads/2017/03/dackel-hunderassen-760x560.jpg",
    #                "https://www.zooplus.ch/magazin/wp-content/uploads/2017/03/fotolia_126825120.jpg",
    #                "https://www.petbook.de/data/uploads/2022/09/gettyimages-1254074121-1040x690.jpg",
    #                "https://www.santevet.de/uploads/images/de_DE/rassen/shutterstock_1188204901.jpeg",
    #                "https://img.donaukurier.de/ezplatform/images/2/4/0/9/19509042-5-ger-DE/urn:newsml:dpa.com:20090101:211012-99-571746-v2-s2048.jpeg"]
    @dalle_urls = []
    (0..5).each do |i|
      picture_response = client.images.generate(parameters: { prompt: "#{@split_story[i]}. expressive oil painting", size: "256x256" })
      @dalle_urls.push(picture_response.dig("data", 0, "url"))
      puts @dalle_urls
    end
    #picture_response = client.images.generate(parameters: { prompt: "#{@split_story[0]}", size: "256x256" })
    #@dalle_url = "https://www.hundeo.com/wp-content/uploads/2019/01/Dackel.jpg"
    @dalle_url = @dalle_urls[0]

    dream = Dream.new(title: title, story:@split_story.to_json, links: @dalle_urls.to_json)
    dream.save
  end

  def redream

  end
end
