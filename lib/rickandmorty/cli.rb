class CLI
    def start
        Cartoon.new.loading
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
            episode_menu
        elsif input == 3
            location_menu
        elsif input == 4
            Cartoon.new.goodbye
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

    def display_characters(index=0)
        range_index = index + 29
        if range_index > Character.all.length - 1
            range_index = Character.all.length - 1
        end
        Character.all[index..(range_index)].each do |character|
            puts "#{character.id}. #{character.name}"
        end
        puts "Choose a character you would like to see in detail"
        puts "Or press enter to see more characters"
        input = gets.strip
        new_input = input.to_i - 1
        until new_input.between?(0,(range_index)) || input == ""
            puts "Not a valid choice, please try again"
            input = gets.strip
            new_input = input.to_i - 1
        end
        if input == ""
            new_index = index + 30
            if range_index == Character.all.length - 1
                no_more_characters_to_display
            elsif new_index > Character.all.length - 1
                display_characters(Character.all.length - 1)
            else
                display_characters(new_index)
            end
        else
            display_character_detail(Character.all[new_input])
        end
    end

    def no_more_characters_to_display
        puts "There are no more characters to display"
        puts "Please choose the character you would like to see in detail"
        input = gets.strip.to_i
        until input.between?(1, Character.all.length)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        display_character_detail(Character.all[input - 1])
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
            Cartoon.new.goodbye
        end
    end

    def display_character_detail(character_instance)
        sleep(1)
        puts "Name: #{character_instance.name}"
        puts "Species: #{character_instance.species}"
        puts "Status: #{character_instance.status}"
        puts "Origin: #{character_instance.origin_name}"
        puts "Gender: #{character_instance.gender}"
        puts "Type: #{character_instance.type}"
        puts "Episodes:"
        character_instance.episode.each {|epi| puts "         #{epi.episode}. #{epi.name}"}
        sleep(1)
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
            Cartoon.new.goodbye
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

    def display_locations(index=0)
        range_index = index + 29
        if range_index > Location.all.length - 1
            range_index = Location.all.length - 1
        end
        Location.all[index..(range_index)].each do |location|
            puts "#{location.id}. #{location.name}"
        end
        puts "Choose a location you would like to see in detail"
        puts "Or press enter to see more locations"
        input = gets.strip
        new_input = input.to_i - 1
        until new_input.between?(0,(range_index)) || input == ""
            puts "Not a valid choice, please try again"
            input = gets.strip
            new_input = input.to_i - 1
        end
        if input == ""
            new_index = index + 30
            if range_index == Location.all.length - 1
                no_more_locations_to_display
            elsif new_index > Location.all.length - 1
                display_characters(Location.all.length - 1)
            else
                display_locations(new_index)
            end
        else
            display_location_detail(Location.all[new_input])
        end
    end 

    def no_more_locations_to_display
        puts "There are no more locations to display"
        puts "Please choose the location you would like to see in detail"
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
        sleep(1)
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
            Cartoon.new.goodbye
        end
    end

    def display_location_detail(location_instance)
        sleep(1)
        puts "Name: #{location_instance.name}"
        puts "Dimension: #{location_instance.dimension}"
        puts "Type: #{location_instance.type}"
        puts "Created: #{location_instance.created}"
        puts "Residents:"
        location_instance.residents.each.with_index(1) do |resident, i|
            puts "          #{i}- #{resident.name}"
        end
        sleep(1)
        exit_menu
    end

    def episode_menu
        puts "1. To browse through the list"
        input = gets.strip.to_i
        until input == 1
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        display_episodes
    end

    def display_episodes
        Episode.all.each do |episode|
            puts "#{episode.id}. #{episode.name}"
        end
        puts "Choose the episode you would like to see in detail"
        input = gets.strip.to_i
        until input.between?(1, Episode.all.length)
            puts "Not a valid choice, please try again"
            input = gets.strip.to_i
        end
        display_episode_detail(Episode.all[input - 1])
    end 

    def display_episode_detail(episode_instance)
        sleep(1)
        puts "Name: #{episode_instance.name}"
        puts "Dimension: #{episode_instance.episode}"
        puts "Type: #{episode_instance.air_date}"
        puts "Created: #{episode_instance.created}"
        puts "Residents:"
        episode_instance.characters.each.with_index(1) do |character, i|
            puts "          #{i}. #{character.name}"
        end
        sleep(1)
        exit_menu
    end
end