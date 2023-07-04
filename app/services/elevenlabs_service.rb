require 'net/http'

class ElevenlabsService < ApplicationService
  CHUNK_SIZE = 1024
  API_URL = "https://api.elevenlabs.io/v1/text-to-speech/evhAppD5SVsfQtTIPhyF"
  HEADERS = {
    "Accept" => "audio/mpeg",
    "Content-Type" => "application/json",
    "xi-api-key" => "9a17f7baaeccf7b39d5568cc91b9b0f6"
  }

  def self.call(story_frame, text)
    data = {
      text: text,
      model_id: "eleven_monolingual_v1",
      voice_settings: {
        stability: 0.5,
        similarity_boost: 0.5
      }
    }

    response = send_api_request(data)
    attach_audio_to_story_frame(response.body, story_frame)
  end

  def self.send_api_request(data)
    uri = URI(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path)
    request.body = data.to_json
    HEADERS.each { |key, value| request[key] = value }

    http.request(request)
  end

  def self.attach_audio_to_story_frame(response_body, story_frame)
    story_frame.audio.attach(
      io: StringIO.new(response_body),
      filename: 'output.mp3',
      content_type: 'audio/mpeg'
    )
  end
end
