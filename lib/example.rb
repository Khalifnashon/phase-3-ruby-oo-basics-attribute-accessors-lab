require "pry"
class Person
    # Create a getter method for us
    attr_reader :name
    # def name
    #   @name
    # end

    # Create a setter method for us
    attr_writer :name
    # def name=(value)
    #   @name = value
    # end
  
end

# We can now do the following, without explicitly defining a #name or #name= method ourselves:
jay_z = Person.new
jay_z.name = "Shawn Carter"
jay_z.name

# Using explicit method definitions:

# class Person
#   def name=(name)
#     @name = name
#   end

#   def name
#     @name
#   end
# end

# Macros exception
# Creating a custom setter method that will enable us to continue passing 
# the full name when we create an instance, but will store the first and last 
# name as separate attributes:

def name=(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name
end

# With this code, we assign a name to an instance in the usual way, 
# passing in the full name as the argument. Our custom setter method 
# splits the full name into the first and last names and assigns them 
# to the corresponding instance variables.

# We can also create a custom getter method for name that will return the full name
# even though it is no longer stored in an instance variable:

class Person
  attr_reader :first_name, :last_name

  def name=(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

end

jay_z = Person.new
jay_z.name = "Shawn Carter"
jay_z.first_name
jay_z.last_name
jay_z.name


# With our custom setter and getter, we can still assign and return the full 
# name, just as before. Furthermore, by adding the attr_readers for first_name 
# and last_name, we can also access the first and last names separately.
binding.pry