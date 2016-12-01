module Giphy

  def self.add_giphy(user_query)
    response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{user_query}&api_key=dc6zaTOxFJmzC")
    return response["data"][rand(1..10)]["images"]["original"]["url"]
  end

end
