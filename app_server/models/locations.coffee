mongoose = require('mongoose')
locationsSchema = new(mongoose.Schema)( 
	name: String,
	address: String,
	rating: {type: Number, "default" : 0, min: 0, max: 5},
	facilities: [String],
	coords: {type: [Number], index: '2dsphere'}
	#longitude latitude in this exact order
)


