var path = require("path");

var server = require("elm-expressway/lib/server");
var socket = require("elm-expressway/lib/socket");

var basePath = path.resolve(process.cwd());
var filename = path.resolve(basePath, "Elm", "Server.elm");

var elmSocketConfig = {
  filename: filename,
  basePath: basePath,
  portDefaults: {
    receiveInput: {id:"server", x:0, y:0}
  },

  onConnection: onConnection
};

var elmSocket = socket(elmSocketConfig);

elmSocket(server);

server.listen(8000, "0.0.0.0");

function onConnection(elmServer) {
  return function(connection) {
    elmServer.ports.sendState.subscribe(function(state) {
      connection.write(state);
    });

    connection.on("data", function(input) {
      elmServer.ports.receiveInput.send(JSON.parse(input));
    });

    connection.on("close", function() { });
  };
}
