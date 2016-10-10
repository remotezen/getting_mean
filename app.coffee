express = require('express')
path = require('path')
favicon = require('serve-favicon')
logger = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
require './app_server/models/db'
routes = require('./app_server/routes/index')
# var users = require('./app_server/routes/users');
app = express()
# view engine setup
app.set 'views', path.join(__dirname, 'app_server', 'views')
app.set 'view engine', 'pug'
# uncomment after placing your favicon in /public
#app.use(favicon(__dirname + '/public/favicon.ico'));
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: false)
app.use cookieParser()
app.use express.static(path.join(__dirname, 'public'))
app.use '/', routes
app.use('/css', express.static(__dirname + '/node_modules/bootstrap/dist/css'))
app.use('/js', express.static(__dirname + '/node_modules/jquery/dist'))
app.use('/js', express.static(__dirname + '/node_modules/bootstrap/dist/js'))
app.use('/fonts', express.static(__dirname + '/node_modules/bootstrap/fonts'))
# app.use('/users', users);
# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err
  return
# error handlers
# development error handler
# will print stacktrace
if app.get('env') == 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
      message: err.message
      error: err
    return
# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: {}
  return
module.exports = app
