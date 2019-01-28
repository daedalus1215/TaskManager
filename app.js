var express = require('express');
var path = require('path');
var logger = require('morgan');
var bodyParser = require('body-parser');
var redis = require('redis');


// Setup Express server
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// middleware
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));


// Create Redis Client
var client = redis.createClient();
client.on('connect', function () {
    console.log('Redis Server Connected...');
});


// routes
app.get('/', function (req, res) {
    var title = 'Task List';

    client.lrange('tasks', 0, -1, function (err, reply) {
        res.render('index', {
            title: title,
            tasks: reply
        });        
    });

})


// start server
app.listen(3000);
console.log('Server started on port 3000');

module.exports = app;
