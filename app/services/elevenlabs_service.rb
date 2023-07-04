require 'net/http'
require 'json'

class ElevenLabsService
  API_BASE_URL = 'https://api.elevenlabs.io/v1'

  def initialize(api_key)
    @api_key = api_key
  end

  def text_to_speech(voice_id, text)
    endpoint = URI("#{API_BASE_URL}/text-to-speech/#{voice_id}")

    headers = {
      'Content-Type' => 'application/json',
      'xi-api-key' => @api_key
    }

    request_body = {
      text: text,
      model_id: 'eleven_monolingual_v1',
      voice_settings: {
        stability: 0,
        similarity_boost: 0
      }
    }

    http = Net::HTTP.new(endpoint.host, endpoint.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(endpoint.path, headers)
    request.body = request_body.to_json

    response = http.request(request)

    if response.code == '200'
      audio = response.body
      # Do something with the audio data
      # ...
    else
      puts "Error: #{response.code} - #{response.message}"
    end
  end
end

