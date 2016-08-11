
/**
 * Module dependencies
 */

var express = require('express'),
    bodyParser = require('body-parser'),
    methodOverride = require('method-override'),
    routes = require('./app/routes'),
    http = require('http'),
    path = require('path'),
    morgan = require('morgan');

var app = module.exports = express();

/**
 * Configuration
 */
// all environments
app.set('port', process.env.PORT || 3001);
app.set('views', __dirname + '/app/views');
app.set('view engine', 'pug');
app.use(morgan('dev'));
app.use(bodyParser.json());
app.use(methodOverride());
app.use(express.static(path.join(__dirname, 'app/public')));

var env = process.env.NODE_ENV || 'development';

/**
 * Routes
 */
// serve index and view partials
app.get('/', routes.index);
app.get('/partials/:name', routes.partials);

// redirect all others to the index (HTML5 history)
app.get('*', routes.index);

/**
 * Start Server
 */
http.createServer(app).listen(app.get('port'), function () {
  console.log('Express server listening on port ' + app.get('port'));
});
