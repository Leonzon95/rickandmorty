class Episode
    attr_accessor :name, :id, :air_date, :episode, :characters, :created
    @@all = []

    def initialize(episode_hash)
        @@all << self
        @name = episode_hash["name"]
        @air_date = episode_hash["air_date"]
        @id = episode_hash["id"]
        @episode = episode_hash["episode"]
        @characters = episode_hash["characters"]
        @created = episode_hash["created"]
    end

    def self.all
        @@all
    end

end