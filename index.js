var http = require("http");
const fs = require('fs');

// Server configuration
const hostname = '127.0.0.1';
const port = 3000;

fs.readFile('./index.html', function (err, html) {
    if (err) {
        throw err;
    }
    const server = http.createServer(function(request, response) {
        response.writeHeader(200, {"Content-Type": "text/html"});
        response.write(html);
        response.end();
    }).listen(port, hostname, () => {
        // Console
        console.log(`Server running at http://${hostname}:${port}/`);
    });
});



// http.createServer(function(request, response) {
//   response.writeHead(200, {"Content-Type": "text/plain"});
//   response.read("Hello World");
//   response.end();
// }).listen(80);
