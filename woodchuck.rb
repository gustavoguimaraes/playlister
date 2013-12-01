# - create a random number of woodchucks
# - have each woodchuck chuck a random amount of wood
# - give a total of how much wood was chucked

class Woodchuck

#this will be able to call the instance @chuck_count in methods,
#and also write over the counter
	attr_accessor :chuck_count

	#class variable. You want the class to keep track of how many objects the class has created 
	@@woodchuck_count = 0
	#this could be a class variable as well. But here we use a constant so we are sure that the object is always an array.
	WOODCHUCKS= []
	
	def initialize
		#all listed here are instances of the object Woodchuck
		@chuck_count = 0
		@@woodchuck_count += 1
		WOODCHUCKS << self
	end

	#this is the instance variable
	def chuck_wood(num)
		@chuck_count += num
	end

	#this is a class method. FOr the class we don't have a attr reader or attr writter.So we need to do it the old way in order to access this value outside of the class WoodChuck scope.
	#the bit after .self could be anything I wanted. But I decided to use woodchuck.count for personal easier understanding. Becasue I am used to it when I do to the instance fo the class with attr_accessor
	def self.woodchuck_count
		@@woodchuck_count
	end


	# # this is an instance method. It is called on an object
	# def what_is_self
	# 	#this puts the name of the class which self is from
	# 	self
	# end

	# #this is a class method because you are calling on self (which is of class Woodchuck)
	# def self.what_is_self
	# 	self
	# end


end


#every time we have a class method we can call it on a class
# woodychucky = Woodchuck.new
# woodychucky = Woodchuck.new
# woodychucky = Woodchuck.new

# puts Woodchuck.woodchuck_count

random_number_woodchuck = 0
(rand(100) + 1).times do |woodchuck|
 		Woodchuck.new
 	end


print Woodchuck.woodchuck_count
print " woodchucks were created randomly.\n"

Woodchuck::WOODCHUCKS.each do |woodchuck|
 	woodchuck.chuck_wood((rand(100) + 1))
end

chucked_wood = 0
Woodchuck::WOODCHUCKS.each do |wood_count|
	 chucked_wood += wood_count.chuck_count
	 #chucked_wood += Woodchuck.woodchuck_count #wood_count.chuck_count
end

puts "The number of wood chucked by them are " + chucked_wood.to_s

#puts Woodchuck.woodchuck_count


# This is how you can call a Constant to check what it has
# puts Woodchuck::WOODCHUCKS #=> []
# Woodchuck::WOODCHUCKS << "wood"
# puts Woodchuck::WOODCHUCKS #=> ["wood"]

# puts "What is self INSTANCE METHOD"
# puts woodychucky.what_is_self #=> #<Woodchuck:0x007fdbc2972200>


# puts "What is self's class INSTANCE METHOD"
# puts woodychucky.what_is_self.class #=> Woodchuck



# puts "What is self CLASS METHOD"
# puts Woodchuck.what_is_self #=>#=> Woodchuck



# puts "What is self's class CLASS METHOD"
# puts Woodchuck.what_is_self.class #=> Class




