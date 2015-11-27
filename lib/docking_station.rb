require_relative 'bike'

class DockingStation
	attr_reader :bikes
	attr_accessor :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes = []
	end

	def release_bike
		fail 'No bikes available!' if empty?
		fail 'Bike is broken' if @bikes.last.working == false
		bikes.pop
	end

	def dock(bike)
		fail 'Docking station full!' if full?
		bikes << bike
	end
	def count
		bikes.length
	end

	private
		def full?
			bikes.length >= @capacity
		end

		def empty?
			bikes.empty?
		end
end
