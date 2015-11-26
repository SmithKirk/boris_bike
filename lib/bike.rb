class Bike
	attr_reader :working
	attr_writer :working

	def working
		@working
	end

	def working= (working)
		@working = working
	end

	def report
		@working = false
	end




# attr_writer :report
# attr_reader :reported
#
# def working?
# 	if @reported = true
# 		false
# 	else
# 		true
# 	end
# end
#
# 	def report
# 		working= false
# 	end
#
# 	def reported= reported
# 		@reported = reported
# 	end

end
