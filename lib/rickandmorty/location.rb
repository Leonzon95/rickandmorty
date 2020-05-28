class Location
    attr_accessor :name, :type, :dimension, :created, :id
    @@all = []

    def initialize(location_hash)
        @@all << self
        @id = location_hash["id"]
        @name = location_hash["name"]
        @type = location_hash["type"]
        @dimension = location_hash["dimension"]
        @created = location_hash["created"]
    end

    def self.all
        @@all
    end

    def residents
        resident_array = Character.all.select{|resident| resident.origin == self}
        resident_array
    end
end