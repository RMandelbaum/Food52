require 'pry'

class Dog
  # creates setter and getter methods for each attribute
  attr_accessor :age, :name, :weight
  #create a new Dog instance and sets attributes based on params, Dog.new(params)
  def initialize(params)
    @name = params[:name]
    @age = params[:age]
    @weight = params[:weight]
  end

  # Takes a list of up to three dogs and determine whether they'll play nice.
  # Dogs of highly varied weights can't play nice together, and groups with
  # too many puppies and large dogs don't play nice either.

  # class method that checks if dogs play nice together, and takes in three dogs with a default of nil
  def self.play_nice(dog_one=nil, dog_two=nil, dog_three=nil)
    dogs = [dog_one, dog_two, dog_three] # creates dog variable of an array of dogs from arguments
    dogs.compact! # removes any nil element so the following methods dont error out

    # returns if no dogs are created
    if dogs.none?
      puts "No dogs to play together"
      return
    end

  # if only one dog present, return early
    if dogs.count == 1
      puts "Lone dog has no rules"
      return
    end

    weights = dogs.map(&:weight) # creates weight variable of an array of all the weights
    weights.compact! # removes any nil element so the following methods dont error out

    # check to see if dogs have weights or should return from code
    if weights.any?
      # weights.index(weights.max) will return the first object's index that matches weights.max,
      # then set heaviest to the dog with that index
      heaviest = dogs[weights.index(weights.max)]
      # weights.index(weights.min) will return the first object's index that matches weights.min,
      # then set heaviest to the dog with that index
      lightest = dogs[weights.index(weights.min)]
      big_dogs = heaviest.weight > 60 # sets variable to boolean depending on if weight is greater than 60
    else
      puts "Weightless dogs have no rules"
      return
    end

    default_name = "Doggie" # if name is blank, interpolate name with this default name

    # sets variable to boolean if there are more than 1 dog that is younger than 5
    too_many_puppies = dogs.count do |dog|
      dog.age < 5 if dog.age # only does fixnum comparison if value is present. nil causes error
    end >= 2

    # if/else conditional block that sets output message
    if heaviest.weight - lightest.weight > 20
      # only executes if weight difference is greater than 20, then goes to next conditional
      puts "#{heaviest.name ||= default_name} is too large to play nice with little #{lightest.name ||= default_name}."
    elsif too_many_puppies && big_dogs
      # only executes if both return true otherwise continues to next line
      puts "These pups are too rambunctious to place nice together."
    else
      puts "Sure, they'll play nice!" if result == ''
    end
  end

# Step D:
  def self.play_nice_plus(*args) #pass in any amount of arguments
    dogs = args # creates dog variable of an array of dogs from arguments
    dogs.compact! # removes any nil element so the following methods dont error out

    # code block will only execute if dogs exist
    if dogs.any?
    # if only one dog present, return early
      if dogs.count == 1
        puts "Lone dog has no rules"
        return
      end

      weights = dogs.map(&:weight) # creates weight variable of an array of all the weights
      weights.compact! # removes any nil element so the following methods dont error out

      # check to see if dogs have weights or should return from code
      if weights.any?
        heaviest = dogs[weights.index(weights.max)]
        # weights.index(weights.max) will return the first object's index that matches weights.max,
        # then set heaviest to the dog with that index
        lightest = dogs[weights.index(weights.min)]
        # weights.index(weights.min) will return the first object's index that matches weights.min,
        # then set heaviest to the dog with that index
        big_dogs = heaviest.weight > 60 # sets variable to boolean depending on if weight is greater than 60
      else
        puts "Weightless dogs have no rules"
        return
      end

      default_name = "Doggie" # if name is blank, interpolate name with this default name

      # sets variable to boolean if there are more than 1 dogs that are younger than 5
      too_many_puppies = dogs.count do |dog|
        dog.age < 5 if dog.age # only does fixnum comparison if value is present. nil causes error
      end >= 2

      # if/else conditional block that sets output message
      if heaviest.weight - lightest.weight > 20
        # only executes if weight difference is greater than 20, then goes to next conditional
        puts "#{heaviest.name ||= default_name} is too large to play nice with little #{lightest.name ||= default_name}."
      elsif too_many_puppies && big_dogs
        # only executes if both return true otherwise continues to next line
        puts "These pups are too rambunctious to place nice together."
      else
        puts "Sure, they'll play nice!" if result == ''
      end
    else
      puts "No dogs to play together"
    end
  end

end

# Seed data for dog params:
dog_one_params =
  {name: "Buddy",
   age: 5,
  weight: 100,
}
dog_two_params =
  {name: "Sasha",
   age: 5,
   weight: 300,
}
dog_three_params =
  {name: "Leo",
   age: 10,
   weight: 200,
}
dog_four_params =
  {name: "Maxie",
   age: 10,
   weight: 200,
}
dog_five_params =
  {name: "Jupiter",
   age: 10,
   weight: 200,
}
dog_six_params =
  {name: "Sammie",
   age: 10,
   weight: 200,
}
dog_seven_params =
  {name: "Dante",
   age: 10,
   weight: 200,
}

# Creates new instances of Dog:
dog_one = Dog.new(dog_one_params)
dog_two = Dog.new(dog_two_params)
dog_three = Dog.new(dog_three_params)
dog_four = Dog.new(dog_four_params)
dog_five = Dog.new(dog_five_params)
dog_six = Dog.new(dog_six_params)
dog_seven = Dog.new(dog_seven_params)

# Runs code
Dog.play_nice
Dog.play_nice_plus(dog_one, dog_two, dog_three, dog_four, dog_five, dog_six, dog_seven)


# Step A:
  #Bugs:
   #  1. Without puts it doesnt output the string we want when running the file.
   #  2. Edge cases, if the weight is the same for all three dogs, .index will always return the first object that is true
   #     so dog[0] would be set to both heaviest and lightest.
   #       -- But maybe that is not an issue because if all 3 are the same weight,
   #          they can all play together and that will be the return string.
   #  3. dog default value is nil, but .map will error out when called on nil.
   #  4. If any attribute is blank, it is set to nil which will return errors
   #  - dog.age cant be nil
   #  - dog.weight cant be nil dogs[weights.index(weights.max)] will error out
   #  - heaviest.weight - lightest.weight > 20 will error out if nil
   #  - dog.name returns nil so blank spot in string
   # 5. dogs[weights.index(weights.max)] will only work if the dogs array and the weights array stay in the same order
   # - This can raise an issue if, for example, someone sorts the dog array by age, then the weights and dogs array won't
   # - match up.

# Step C:
  # There can be a time that heaviest.weight - lightest.weight > 20 and too_many_puppies && big_dogs are true.
  # - If we want both strings to execute, then we need to change the syntax to:
  # result = ''
  # if heaviest.weight - lightest.weight > 20
  #   result += "#{heaviest.name ||= default_name} is too large to play nice with little #{lightest.name ||= default_name}."
  # end
  # if too_many_puppies && big_dogs
  #   result += "These pups are too rambunctious to place nice together."
  # end
  # result = "Sure, they'll play nice!" if result == ''
  #
  # puts result
