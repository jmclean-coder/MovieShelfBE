require "json"
require "rest-client"
class MovieDatabase
    def self.search(search_term)
        url = "https://movie-database-imdb-alternative.p.rapidapi.com/?page=1&r=json&s=#{search_term}"
        response = RestClient.get(url, headers={
            "X-RapidAPI-Host" => "movie-database-imdb-alternative.p.rapidapi.com",
            "X-RapidAPI-Key" => "61cd997641mshecc536a501fa685p1ce10djsn9b8b0710bd78"
            })
            response_body = response.body
            json_response = JSON.parse(response_body)
            return json_response
    end

    def self.get_movie(movieID)
        url = "https://movie-database-imdb-alternative.p.rapidapi.com/?i=#{movieID}&r=json"
        response = RestClient.get(url, headers={
            "X-RapidAPI-Host" => "movie-database-imdb-alternative.p.rapidapi.com",
            "X-RapidAPI-Key" => "61cd997641mshecc536a501fa685p1ce10djsn9b8b0710bd78"
            })
            response_body = response.body
            json_response = JSON.parse(response_body)
            return json_response
    end
end

# MovieDatabase.search("avengers")
# MovieDatabase.get_movie("tt0848228")


