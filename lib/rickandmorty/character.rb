class Character
    attr_accessor :id, :name, :status, :species, :gender, :type
    attr_reader :episode, :origin
    @@all = []

    def initialize(char_hash)
        @@all << self
        self.episode=(char_hash["episode"])
        @id = char_hash["id"]
        @name = char_hash["name"]
        @status = char_hash["status"]
        @species = char_hash["species"]
        @gender = char_hash["gender"]
        self.origin=(char_hash["origin"]["url"])
        @type = char_hash["type"]
    end

    def self.all
        @@all
    end

    def episode=(url_array)
        episode_array = url_array.collect do |episode_url|
            array = episode_url.split("/")
            last_peice = array[-1].to_i
            episode_obj = Episode.all.detect {|episode| episode.id == last_peice}
            episode_obj
        end
        @episode = episode_array
    end

    def origin=(url)
            array = url.split("/")
            last_peice = array[-1].to_i
            location_obj = Location.all.detect {|episode| episode.id == last_peice}
            @origin = location_obj
    end

    def origin_name
        if !self.origin
            "unknown"
        else
            self.origin.name
        end
    end

end