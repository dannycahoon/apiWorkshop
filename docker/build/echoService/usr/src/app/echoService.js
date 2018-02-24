/* echoService.js
     Simple "echo" nodejs service.
   Usage:
     node server.js <port> <listenAddr>
   Author:
     Robert Wunderlich
*/
var express = require('express');
var app = express();
var port = 8888
var bodyParser = require('body-parser');

var bodyResponse = {};


/* Accepting any type and assuming it is application/json, otherwise the caller
   is forced to pass the content-type.
*/
app.use(bodyParser.json({ type: '*/*' }));
app.use(function(req, res, next) {
  bodyResponse.method = req.method;
  bodyResponse.resource = req.path;
  bodyResponse.query = req.query;
  bodyResponse.cookies = req.cookies;
  bodyResponse.headers = req.headers;
  bodyResponse.body = req.body;
  next();
  });

// Just echo anything
app.all('*', function(req, res, next) {
  res.statusCode = 200;
  res.json(bodyResponse);
});
//Creating the server process
app.listen(port);
console.log('Listening on port ' + port);
