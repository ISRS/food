require 'restaurant'
class Guide
  class Config
    @@actions=['list','find','add','quit']
    def self.actions
      return @@actions
    end
  end
 def initialize(path=nil)
   Restaurant.filepath(path)
     if Restaurant.file_usable?
        puts "found restaurant fikle."
      elsif Restaurant.create_file
           puts "Created restaurant file"
         else
           puts "\n\n\n\Existing The application..\n"
           exit!
     end
   #locate the restaurant text file at Path
   #or create a new file
   #exit if create fails
 end


  def launch!
    introduction
    result=nil
    until result==:quit
      action=get_action
      result=do_action(action)
     end
    #action loop
    conclusion
  end

  def get_action
    #keep on asking for the response' '
    action=nil
   until    Guide::Config.actions.include?(action)
     puts "Actions:" +Guide::Config.actions.join(",") if action
      print ">>"
      action=gets.chomp
      action=action.downcase.strip
   end
      return action
  end

  def do_action(action)
    case action
  when "list"
     puts "listings.."
  when "find"
     puts "Find.."
  when "add"
     add
  when "quit"
     return :quit
  else
      puts "I do not understand the option"
  end

end
    def add
       puts "\Add a Restayurant \n\n ".upcase
       restaurant=Restaurant.new
       print "Restaurant Name:"
       restaurant.name=gets.chomp.strip
       print "Cuisine Type:"
       restaurant.cuisine=gets.chomp.strip
       print "Average Price:"
       restaurant.price=gets.chomp.strip

       if restaurant.save
         puts "\n Restaurant Added \n\n"
       else
         puts "\n Error: Restaurant not edded\n\n"
       end



    end

    def introduction
     puts "\n\n<<< Welcome to the Food Finder >>>>>\n\n"
     puts "This is an iterative guide to help you find the food you crave. \n\n"
  end

  def conclusion
   puts "\n <<<< Good bye and Bon appite >>>\n\n"
  end

end
