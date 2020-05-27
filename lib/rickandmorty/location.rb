class Location
    attr_accessor :name, :type, :dimension, :residents, :created, :id
    @@all = []

    def initialize(location_hash)
        @@all << self
        @id = location_hash["id"]
        @name = location_hash["name"]
        @type = location_hash["type"]
        @dimension = location_hash["dimension"]
        @residents = location_hash["residents"]
        @created = location_hash["created"]
    end

    def self.all
        @@all
    end
end