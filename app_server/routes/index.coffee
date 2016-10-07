express = require('express')
router = express.Router()

### GET home page. ###
homepageController = (req, res) ->
	res.render('index', {title: 'Express'})

router.get('/', homepageController)
