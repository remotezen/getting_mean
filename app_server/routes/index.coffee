express = require('express')
router = express.Router()
ctrlLocations = require('../controllers/locations')
ctrlOthers = require('../controllers/others')

### GET home page. ###
homepageController = (req, res) ->
	res.render('index', {title: 'Express'})

router.get('/', ctrlLocations.homelist)
router.get('/location', ctrlLocations.locationInfo)
router.get('/location/review/new', ctrlLocations.addReview)
router.get('/about', ctrlOthers.about)
module.exports = router

