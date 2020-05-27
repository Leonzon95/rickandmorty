class API
    def self.fetch_characters
        page_number = 1
        while page_number <= 30
            url = "https://rickandmortyapi.com/api/character/?page=#{page_number}"
            uri = URI(url)
            response = Net::HTTP.get(uri)
            hash = JSON.parse(response) 
            hash["results"].each do |char_hash|
                Character.new(char_hash)
           end
           page_number += 1
        end    
    end
    
    def self.fetch_location
        page_number = 1
        while page_number <= 5
            url = "https://rickandmortyapi.com/api/location/?page=#{page_number}"
            uri = URI(url)
            response = Net::HTTP.get(uri)
            hash = JSON.parse(response) 
            hash["results"].each do |location_hash|
                Location.new(location_hash)
           end
           page_number += 1
        end

    end
    
    def self.fetch_episode
        page_number = 1
        while page_number <= 2
            url = "https://rickandmortyapi.com/api/episode/?page=#{page_number}"
            uri = URI(url)
            response = Net::HTTP.get(uri)
            hash = JSON.parse(response) 
            hash["results"].each do |episode_hash|
                Episode.new(episode_hash)
           end
           page_number += 1
        end
    end
end
