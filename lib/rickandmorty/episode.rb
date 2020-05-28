class Episode
    attr_accessor :name, :id, :air_date, :episode, :created
    @@all = []

    def initialize(episode_hash)
        @@all << self
        @name = episode_hash["name"]
        @air_date = episode_hash["air_date"]
        @id = episode_hash["id"]
        @episode = episode_hash["episode"]
        @created = episode_hash["created"]
    end

    def self.all
        @@all
    end

    def characters
        character_array = []
        Character.all.each do |character|
            character.episode.each do |episode_char|
                if episode_char == self
                    character_array << character
                end
            end
        end
        character_array
    end
end