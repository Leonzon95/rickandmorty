class Character
    attr_accessor :id, :name, :status, :species, :gender, :type, :origin, :episode
    @@all = []

    def initialize(char_hash)
        @@all << self
        @id = char_hash["id"]
        @name = char_hash["name"]
        @status = char_hash["status"]
        @species = char_hash["species"]
        @gender = char_hash["gender"]
        @origin = char_hash["origin"]["name"]
        @episode = char_hash["episode"]
        @type = char_hash["type"]
    end

    def self.all
        @@all
    end
end