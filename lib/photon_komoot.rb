require 'net/http'
require 'uri'
require 'json'

class PhotonKomootIO
  def initialize
  end

  def search(city)
    uri = URI("https://photon.komoot.io/api/?q=#{city}")
    # params = { lat: @lat, lon: @lon, appid: @appid, units: @units, lang: @lang }
    # uri.query = URI.encode_www_form(params)

    request = Net::HTTP::Get.new(uri)
    request['Content-Type'] = 'application/json'
    request['Accept'] = 'application/json'

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body, symbolize_names: true)
    else
      puts "Error: #{response.code} #{response.message}"
    end
  end
end
