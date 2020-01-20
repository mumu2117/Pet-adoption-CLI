class PetAdoptions::CLI
  
    BUDDIES = ["Dogs", "Cats", "Rabbits", "Birds", "Equine", "Pigs", "Barnyard", "Small"]
  
    def call
      puts "\nWelcome to PetAdoptions. Where you can find your next Bud."

      puts "--------------------------------"

      start
    end
  
    def start
      puts "\n Welcome! Buddiess available for adoption. (Please enter a number)\n"
      puts "--------------------------------"
  
      BUDDIES.each.with_index(1) do |buddy, number|
        puts "#{number}. #{buddy}"
      end
  
      user_input = numbers(gets.chomp)
  
      if !user_input.between?(0,BUDDIES.size-1)
        puts "\n Sorry. Please try again.\n"
        start
      end
  
      @tribe_member = tribe_memeber_definition(user_input)
      BuddyCount.new(BUDDIES[user_input], @tribe_member)
  
      display_allbuddies

    end
  
    def display_allbuddies

      if @tribe_member == Small
        puts "\n\nAVAILABLE SMALL & FURRY ANIMALS FOR ADOPTION:"
      else
        puts "\n\nAVAILABLE #{@tribe_member.to_s.upcase} FOR ADOPTION:"
      end
      puts "Name - Breed - Age"
      puts "-----------------------------"
  
      buddy_gang = @tribe_member.all
      buddy_gang.each.with_index(1) {|bud, num| puts "#{num}. #{bud.name} - #{bud.breed} - #{bud.age}"}
  
      puts "\nWhich pet would you like more information on? (Please enter a number)"
  
      buddy_number = numbers(gets.chomp)
  
      if buddy_number < 0 || buddy_number >= buddy_gang.size

        puts "I'm sorry, that was an incorrect entry. Please try again."
        
        display_allbuddies

      end
  
      BuddyCount.additonal_features_of_buds(buddy_number, @tribe_member)

      display(buddy_number)

    end
  
    def display(num)
          
       bud=@tribe_member.all[num]

        if bud.species == "small-furry"

          puts "\n#{bud.name.upcase} - Small & Furry"

        else

          puts "\n#{bud.name.upcase} - #{bud.species.capitalize}"

        end
        puts "------------------------------"
        puts "Breed:"+ " #{bud.breed}"
        puts "Age:"+ " #{bud.age}"
        puts "Color:" + " #{bud.color}"
        puts "Sex:"  + " #{bud.sex}"
        puts "Size:"  + "#{bud.size}\n\n"
        puts "#{bud.description}\n\n"
        puts "Love to adopt more buds like #{bud.name}, visit www.bestfriends.org #{bud.url}"
  
        repeat?
    end
  
    def repeat?
      puts "\n\nWould you like to search more adoptable buddies? (Please enter a number)\n"
      puts "1. Yes. Take me back to the list of buddies #{@tribe_member.to_s.downcase}."
      puts "2. Take me to the main menu."
      puts "3. No, I'm done.\n\n"

      user_input = gets.chomp
  
      if user_input == "1"
        
        display_allbuddies

      elsif user_input == "2"
        start
      elsif user_input == "3"
        exit
      else
        puts "Sorry! Incorrect entry. Pleae try again!"
        repeat?
      end
    end
  
    def numbers(user_input)
      user_input.to_i - 1
    end
  
    def tribe_memeber_definition(user_input)
      Object.const_get("#{BUDDIES[user_input]}")
    end
  end
