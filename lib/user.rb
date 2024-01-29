require 'pry'

class User
attr_accessor :email, :age

def initialize( email_to_save , age_to_save )
    @email = email_to_save 
    @age = age_to_save
    puts "Ceci est ton email et ton age héhé :"
end
end



binding.pry
puts "end of file"



