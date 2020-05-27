class CLI
    def start
        API.fetch_episode
        API.fetch_location
        API.fetch_characters
        puts "Welcome!"
        puts "See different facts about favorite TV show: Rick & Morty"
        self.menu
    end

    def menu 
        puts "What would you like to look at today?"
        puts "Enter the correspinding number to from the list to start you journey or type 'exit' to exit the program"
        puts "1. Characters"
        puts "2. Episodes"
        puts "3. Locations"
        input = gets.strip
        if input == "1"
            Character.display_characters
        elsif input == "2"
            display_locations
        elsif input == "3"
            display_locations
        elsif input == exit
            puts "Goodbye!"
        end
    end
end