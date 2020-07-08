require "byebug"
require "json"
require "rest-client"
class OpenMovieDatabase
    def self.search(search_term)
        url = "http://www.omdbapi.com/?apikey=b5d65b77&s=#{search_term}&r=json&p=2"
        response = RestClient.get(url)
            response_body = response.body
            json_response = JSON.parse(response_body)
            byebug
    end

    def self.get_movie(movieID)
        url = "http://www.omdbapi.com/?apikey=b5d65b77&i=#{movieID}&r=json"
        response = RestClient.get(url)
            response_body = response.body
            json_response = JSON.parse(response_body)
            byebug
    end
end

# OpenMovieDatabase.search("avengers")
# OpenMovieDatabase.get_movie("tt0848228")
