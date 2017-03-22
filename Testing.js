/**
 * Created by colinthompson on 2017-03-14.
 */

// Import Modules
var http = require("http");

const HOSTNAME = "127.0.0.1";
const PORT = 8081 //For simplicity for now. Need root access for 80.


http.createServer(function(request, response) {
    response.writeHead(200, {'Content-Type' : 'text/plain'});
    response.end('Hello World\n')


}).listen(PORT);

console.log("Server running at http://" + HOSTNAME + ":" + PORT);
