require "json"
require "rest-client"

API_KEY = ENV['OMDB_api_key']
class MovieDatabase

    def self.get_movie(movieID)
        url = "https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{movieID}&r=json"
        response = RestClient.get(url, headers={
            "X-RapidAPI-Host" => "movie-database-imdb-alternative.p.rapidapi.com",
            "X-RapidAPI-Key" => "#{API_KEY}"
            })
            response_body = response.body
            json_response = JSON.parse(response_body)
            return json_response
    end
end

# MovieDatabase.search("avengers")
# MovieDatabase.get_movie("tt0848228")


