class Starship 
    attr_accessor :crew, :name, :consumables
    @@all = []

    def initialize(starship_hash)
       starship_hash.each do |key, value| 
        self.send("#{key}=", value) if self.respond_to?("#{key}=")
       end
        save 
    end

    def save 
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.find_by_selection(starship_name)
        self.all.detect do |starship| 
            starship.name == starship_name
        end
    end
end