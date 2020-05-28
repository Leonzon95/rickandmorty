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
        puts "Enter the correspinding number to from the list to start your journey"
        puts "1. Characters"
        puts "2. Episodes"
        puts "3. Locations"
        puts "4. Exit the program"
        input = gets.strip.to_i
        until input.between?(1,4)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        if input == 1
            character_menu
        elsif input == 2
            location_menu
        elsif input == 3
            location_menu
        elsif input == 4
            puts "Goodbye!"
        end
    end

    def character_menu
        puts "1. To browse through the list"
        puts "2. To search a character by name"
        input = gets.strip.to_i
        until input.between?(1,2)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        if input == 1
            display_characters
        elsif input == 2
            search_character_by_name
        end
    end

    def display_characters
        Character.all.each do |character|
            puts "#{character.id}. #{character.name}"
        end
        puts "Choose a character you would like to see in detail"
        input = gets.strip.to_i - 1
        until input.between?(0,Character.all.length - 1)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i - 1
        end
        display_character_detail(Character.all[input])
    end

    def search_character_by_name
        puts "Please type the name of character you would like to look for"
        input = gets.strip
        character_array = []
        Character.all.each do |character|
            if character.name.downcase.include?(input.downcase)
                character_array << character
            end
        end
        if character_array.length == 0
            no_character_match
        else
            puts "These is/are your result(s):"
            character_array.each.with_index(1) do |char, i|
                puts "#{i}. #{char.name}"
            end
            puts "Choose the character you would like to see in detail"
            input = gets.strip.to_i - 1
            until input.between?(0,character_array.length - 1)
                puts "Not a valid choice, please try again"
                input = gets.strip.to_i - 1
            end
            display_character_detail(character_array[input])
        end
    end

    def no_character_match
        puts "Sorry nothing matches your search"
        puts "1. Try again"
        puts "2. Go back to character menu"
        puts "3. Go back to main menu"
        puts "4. Exit the program"
        input = gets.strip.to_i
        until input.between?(1,4)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        if input == 1
            search_character_by_name
        elsif input == 2
            character_menu
        elsif input == 3
            menu
        else
            puts "Goodbye!"
        end
    end

    def display_character_detail(character_instance)
        puts "Name: #{character_instance.name}"
        puts "Species: #{character_instance.species}"
        puts "Status: #{character_instance.status}"
        puts "Origin: #{character_instance.origin.name}"
        puts "Gender: #{character_instance.gender}"
        puts "Type: #{character_instance.type}"
        puts "Episodes:"
        character_instance.episode.each {|epi| puts "         #{epi.name}"}
        sleep(3)
        exit_menu
    end

    def exit_menu
        puts "1. To go back to main menu"
        puts "2. To exit the program"
        input = gets.strip.to_i
        until input.between?(1,2)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        if input == 1 
            menu
        else
            puts "Goodbye!"
        end
    end

    def location_menu
        puts "1. To browse through the list"
        puts "2. To search a location by name"
        input = gets.strip.to_i
        until input.between?(1,2)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        if input == 1
            display_locations
        elsif input == 2
            search_location_by_name
        end
    end

    def display_locations
        Location.all.each do |location|
            puts "#{location.id}. #{location.name}"
        end
        puts "Choose the location you would like to see in detail"
        input = gets.strip.to_i
        until input.between?(1, Location.all.length)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        display_location_detail(Location.all[input - 1])
    end 

    def search_location_by_name
        puts "Please type the name of location you would like to look for"
        input = gets.strip.downcase
        location_array = Location.all.select{|location| location.name.downcase.include?(input)}
        if location_array.length == 0
            no_location_match
        else
            location_array.each.with_index(1) do |location, i|
                puts "#{i}. #{location.name}"
            end
            index = gets.strip.to_i - 1
            until index.between?(0, location_array.length - 1)
                puts "Not a valid choice, please try again"
                index = gets.strip.to_i - 1
            end
            display_location_detail(location_array[index])
        end
    end

    def no_location_match
        sleep(2)
        puts "Sorry nothing matches your search"
        puts "1. Try again"
        puts "2. Go back to location menu"
        puts "3. Go back to main menu"
        puts "4. Exit the program"
        input = gets.strip.to_i
        until input.between?(1,4)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        if input == 1
            search_location_by_name
        elsif input == 2
            location_menu
        elsif input == 3
            menu
        else
            puts "Goodbye!"
        end
    end

    def display_location_detail(location_instance)
        puts "Name: #{location_instance.name}"
        puts "Dimension: #{location_instance.dimension}"
        puts "Type: #{location_instance.type}"
        puts "Created: #{location_instance.created}"
        puts "Residents: #{location_instance.residents}"
        sleep(3)
        exit_menu
    end
end