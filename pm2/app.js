var http     = require('http')
  , httpServ = http.createServer()
  , mosca    = require('mosca');

var ascoltatore = {
  //using ascoltatore
  type: 'mongo',
  url: 'mongodb://10.25.143.50:27017/mqtt',
  pubsubCollection: 'ascoltatori',
  mongo: {}
};
var ascoltatore2 = {
  //using ascoltatore
  type: 'redis',
  redis: require("redis"),
  host:"60.205.1.68",
  return_buffers:true,
  port:6379
};
var setting={

backend: ascoltatore,
 
}
var  server = new mosca.Server(setting);

server.on('clientConnected', function(client) {
    console.log('client connected');
    console.log(client.id);
});

// fired when a message is received
server.on('published', function(packet, client) {
  console.log('Published', packet.payload);
});

server.on('ready', setup);

// fired when the mqtt server is ready
function setup() {
  console.log('Mosca server is up and running');
}


server.attachHttpServer(httpServ);

httpServ.listen(3000);
