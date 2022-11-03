# In these exercises, you'll define a few small classes
# The first ones will be familiar
# Do them without looking back at your previous work
# The next will be a bit more complex
# And so on...

# In some cases, you'll define classes with methods that manipulate arrays or hashes

# The requirements will be provided as follows

# Class Name
# Initialization args, if there are any
# Method Name
# Method arguments, if there are any
# Method return value
# Examples, if needed
# More methods, as needed

# Example requirements

# Greeter
# hello
# Takes one string as an arg (a name)
# Returns 'Hello, Rita', if the arg is 'Rita'


# Example solution

# > class Greeter
# >   def hello(name)
# >    return 'Hello, ' + name
# >  end
# > end

# Greeter
# hello
# Takes one string as an arg (a name)
# Returns 'Hello, Rita', if the arg is 'Rita'
# goodbye
# Takes one string as an arg (a name)
# Returns 'Goodbye, Sam', if the arg is 'Sam'
# goodnight
# Takes one string as an arg (a name)
# Returns 'Goodnight, Jo', if the arg is 'Jo'
# goodmorning
# Takes one string as an arg (a name)
# Returns 'Goodmorning, Alex', if the arg is 'Alex'

class Greeter
  def hello(name)
    return "Hello, #{name}"
  end
  def goodbye(name)
    return "Goodbye, #{name}"
  end
  def goodnight(name)
    return "Goodnight, #{name}"
  end
  def goodmorning(name)
    return "Goodmorning, #{name}"
  end
end


# Basket
# add
# takes one argument of any type
# adds it to the list of items
# items
# returns everything that has been added to the basket
class Basket
  def initialize
    @bag = []
  end
  def add(arg)
    @bag << arg
  end
  def items
    return @bag
  end
end


# Basket2
# add
# takes two arguments: a string for the item and a number for the amount of that item
# adds both pieces of information to a list of items
# contents
# returns everything that has been added to the basket
# eg: after having added "carrots", 3
# contents returns [{"item" => "carrots", "amount" => 3}]
class Basket2
  def initialize
    @contents = []
  end
  def add(item, amt)
    @contents << {"item"=>item, "amount"=>amt}
  end
  def contents
    return @contents
  end
end

# Calculator
# add
# takes two numbers as args
# returns the total
# multiply
# takes two numbers as args
# multiplies one by the other
# returns the result
# subtract
# takes two numbers as args
# subtracts the second from the first
# returns the result
# divide
# takes two numbers as args
# divides the first by the second
# returns the result
# history
# takes no args
# returns an array containing hashes of the operation, arguments and results of all previous calculations
# eg: after multiplying 4 and 6, the history is 
# [{"operation" => "multiply", "arguments" => [4, 6], "result" => 24}]

class Calculator
  def initialize
    @history = []
  end
  def add(a,b)
    @history << {"operation" => "add", "arguments" => [a,b], "result" => a+b}
    return a+b
  end
  def multiply(a,b)
    @history << {"operation" => "multiply", "arguments" => [a,b], "result" => a*b}
    return a*b
  end
  def divide(a,b)
    @history << {"operation" => "divide", "arguments" => [a,b], "result" => a/b}
    return a/b
  end
  def subtract(a,b)
    @history << {"operation" => "subtract", "arguments" => [a,b], "result" => a-b}
    return a-b
  end
  def history
    return @history
  end
end



# Cohort
# add_student
# takes one hash, representing a student, as an arg.
# E.g. {'name' => 'Jo', 'employer' => 'NASA'}
# adds the new student to the list of students
# students
# returns all the students who have been added to the cohort
# employed_by
# takes one string, the name of an employer, as an arg.
# E.g. 'NASA'
# returns only the students who work for that employer
class Cohort
  def initialize
    @studentslist =[]
  end
  def add_student(hash)
    @studentslist << hash
  end
  def students
    return @studentslist
  end
  def employed_by(employ)
    @studentslist.select {|hashdata| hashdata["employer"] == employ}
  end
end





# Person
# is initialized with a complex hash, for example...\
"""
{
  'name' => 'alex',
  'pets' => [
    {'name' => 'arthur', 'animal' => 'cat'},
    {'name' => 'judith', 'animal' => 'dog'},
    {'name' => 'gwen', 'animal' => 'goldfish'}
  ],
  'addresses' => [
    {'name' => 'work', 'building' => '50', 'street' => 'Commercial Street'},
    {'name' => 'home', 'building' => '10', 'street' => 'South Street'}
  ]
}"""

#get address info
#building = @alex.select {|k,v| k == "addresses" }.values.flatten.select {|key,val| p val["name"] == "work"}[0]["building"]
#street = @alex.select {|k,v| k == "addresses" }.values.flatten.select {|key,val| p val["name"] == "work"}[0]["street"]

#gets pets
#petname= @alex.select {|key,val| key == 'pets'}.values.flatten[0]["name"]
#petanimal = @alex.select {|key,val| key == 'pets'}.values.flatten[0]["animal"]

#petssize
# petsize = @alex.select {|key,val| key == "pets"}.values.flatten.size - alex has petsize pets

# work_address
# takes no args
# returns the work address in a nice format
# E.g. '50 Commercial Street'
# home_address
# takes no args
# returns the home address in a nice format
# E.g. '10 South Street'
# pets
# takes no args
# returns a nice summary of the person's pets
# E.g.
# Alex has 3 pets
# - a cat called Arthur
# - a dog called Judith
# - a goldfish called Gwen

class Person
  def initialize(person)
    @person = person
  end
  def work_address
    address = ""
    building = @person.select {|k,v| k == "addresses" }.values.flatten.select {|val| val["name"] == "work"}[0]["building"]
    street = @person.select {|k,v| k == "addresses" }.values.flatten.select {|val| val["name"] == "work"}[0]["street"]
    address += building + " " + street    
    return address
  end

  def home_address
    address = ""
    building = @person.select {|k,v| k == "addresses" }.values.flatten.select {|val| val["name"] == "home"}[0]["building"]
    street = @person.select {|k,v| k == "addresses" }.values.flatten.select {|val| val["name"] == "home"}[0]["street"]
    address += building + " " + street    
    return address
  end

  def pets
    owner = @person.select {|k,v| k == "name"}.values.join()
    petsize = @person.select {|key,val| key == "pets"}.values.flatten.size.to_s
    pets = @person.select {|key,val| key == "pets"}.values.flatten.map {|x| "- a "+ x["animal"] + " called " + x["name"]+ "\n"}
    return owner + " has " + petsize + " pets\n" + pets.join()
  end
end