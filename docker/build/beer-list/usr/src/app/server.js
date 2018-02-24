var express = require("express");
var logfmt = require("logfmt");
const seats = require("./seats.json");
const beers = require("./beers.json");

var app = express();

// Read Environment Parameters
var port = Number(process.env.PORT || 8080);

app.use(logfmt.requestLogger());

app.get('/seats', function(req, res) {
  res.setHeader('Content-Type', 'application/json');
  res.send(JSON.stringify(seats));
});

app.get('/beers', function(req, res) {
  res.setHeader('Content-Type', 'application/json');
  res.send(JSON.stringify(beers));
});

app.listen(port, function() {
  console.log("Listening on " + port);
});
