class CLI
    # binding.pry
    def start
         
        puts "Welcome! We are Star Wars Starships! What is your name?"
        API.get_data
       input = user_input
        greet(input)
    end

    def user_input 
        gets.strip
    end 

    def greet(name)
        puts "Greetings #{name} let's get started! Would you like to see some starships today? enter y to see list, enter exit to exit"
        menu
    end

    def menu
         selection = user_input
        if selection == "y"
            #print starships
            print_starships
            # menu
        elsif selection == "exit"
            goodbye
            #exit application 
        else
            invalid
            #invalid message and let them keep choosing
        end
        #enter y print out a list of starships 
        #enter exit I want them to exit 
        #invalid message 
    end

    def goodbye 
        puts "Thank you for shopping come back soon!!"
    end

    def invalid 
        puts "hmmmm..... that doesn't look right let's try again"
        menu
    end

    def print_starships 
        
        Starship.all.each.with_index(1) do |starship, index | 
            puts "#{index}. #{starship.name}"
        end
        select_starship
    end

    def select_starship
        puts "please enter the name of the starship you would like to learn more information about."
        selection = user_input
        if Starship.find_by_selection(selection)
            starship = Starship.find_by_selection(selection)
        else 
            starship = selection
        end
        # puts "input y to see a list or exit to leave lot "
        starship_details(starship)
    end

    def starship_details(starship) 
        # binding.pry
        if starship == "exit"
            goodbye 
        elsif starship.class == Starship
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
       puts "Name: #{starship.name}"
       puts "Crew: #{starship.crew}"
       puts "Consumables: #{starship.consumables}"
       puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
       puts ""
        puts ""
        puts "enter y to see more starships or exit to exit"
    #    :crew, :name, :consumables
        else 
            invalid 
        end
    end
end