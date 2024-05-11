# Local Module
```js
var myDataModule = require('./Data.js'); // it is in same folder as your js file
var someData = require('./Data2.js').user;
```
export:
```js
let msg = 'Another external module as a string variable';

module.exports = msg;
```
or
```js
var log = {
            info: function (info) { 
                console.log('Info: ' + info);
            },
            warning:function (warning) { 
                console.log('Warning: ' + warning);
            },
            error:function (error) { 
                console.log('Error: ' + error);
            }
    };

module.exports = log

```
Multi variable export:
```js
let user = {
    username: 'Ilkay',
    email: 'ilkay@msn.com',
    nickname: 'dragon'
};

let userMessage = function(param){
    console.log(`${param} is the best system!`);
}

module.exports.user = user;
module.exports.userMessage = userMessage;
```
Multi function export
```js
const animalName = (name) => {
	console.log(name)
}
const animalSound = (sound) => {
	console.log(sound)
}
//Export these both as JSON
module.exports = {animalName, animalSound, smth:"notsmth"}
```
# http
Core Modules ('http', 'url', 'path', 'fs', 'util')
Simple HTTP server:
```js
var http = require('http');

// //create a server
http.createServer(function(req, res){
    // http header
    res.writeHead(200, {'Content-Type': 'text-html'});
    res.write('<h1>First simple Node server</h1>');
    res.end();
}).listen(9000);
```
or
```js
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write('<h1>Hello World!</h1>');
  res.write('<h3>Hello World!</h3>');
  res.write(req.url);
  res.end();
}).listen(8080);
```
or
```js
var http = require('http');
var fs = require('fs');
http.createServer(function (req, res) {
  fs.readFile('demofile.html', function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    return res.end();
  });
}).listen(8080);
```

to get data:
```js
const https = require('https');

https.get('https://jsonplaceholder.typicode.com/posts', (resp) => {
  let data = '';

  // A chunk of data has been received.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
});
```
# Validator
`npm install validator`
```js
var validator = require('validator'); 
```
# FS
```js
let fs = require('fs');

// Reading a file: Default, asynchronous way
fs.readFile('notes.txt', function(err, data){
    if(err) throw err;
    console.log(data.toString('utf8'));
})

// // Append a data : synchronous way ---------------------------------
var data = '\nAnother row like continue...';
fs.appendFileSync('notes.txt', data, 'utf8');

// // Append a data : Asynchronous way --------------------------------
fs.appendFile('notes.txt', data, 'utf8', function(err){
    if(err) throw err;
    console.log('data is appended successfully')
})

```
# JSON
```js

var jsonData = '{"person": [{"name":"Elmir", "city":"baku"}, {"name":"Arzu", "city":"Shaki"}]}';

var jsonObj = JSON.parse(jsonData);
console.log(jsonObj);
console.log(jsonObj.person[0].name);

var jsonCont = JSON.stringify(jsonObj);
console.log(jsonCont);

// Writing to JSON file: Asynchronous way ----------------------------
fs.writeFile("output.json", jsonCont, "utf8", function(err){
    if(err){
        console.log("error occured when writing to JSON");
        return console.log(err);
    }
    console.log("JSON file has been saved");
}

// Appending new data to existing JSON file --------------------------
// Reading JSON file: Synchronous way --------------------------------
const readData = fs.readFileSync('output.json');
//const jsonData = readData.toString()
const data = JSON.parse(readData)
console.log(data)
// Pushing new record
data.person.push({name: 'narmin', city: 'balakan'});
json = JSON.stringify(data)
fs.writeFileSync('output.json', json);
})
```
# Mysql2
`mysql` is not working properly that is why `mysql2`
```js
var mysql = require('mysql2');

// Creating a connection
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "31051966",
    database: "azerbaijan"
})

// Trying to connect
con.connect(function(err){
    if(err) throw err;
    console.log("conncted to mysql");
})

// SELECT FROM table
con.connect(function(err){
    if(err) throw err;
    con.query("SELECT * FROM regions", function(err, result, fields){
        if(err) throw err;
        console.log(result);
    })
})

// Inserting multiple data into table via array
con.connect(function(err){
    if(err) throw err;
    let arr = [
        ['Buxara', 3455.33, 12435456],
        ['Pendik', 3455.33, 45667565]
    ];
    con.query("INSERT INTO regions(region_name, area, population) VALUES?", [arr], function(err, result, fields){
        if(err) throw err;
        console.log(result);
    })
})
```
# Request
```js
const request = require('request');

request('https://jsonplaceholder.typicode.com/posts', { json: true }, (err, res, body) => {
  if (err) { return console.log(err); }
  console.log(body.url);
  console.log(body);
});
```
# Axios
```js
const axios = require('axios');

axios.get('https://jsonplaceholder.typicode.com/posts')
  .then(response => {
    console.log(response.data.url);
    console.log(response.data);
  })
  .catch(error => {
    console.log(error);
  });
```
# Url
```js
var url = require('url');
var adr = 'http://localhost:8080/default.htm?year=2017&month=february';
var q = url.parse(adr, true);

console.log(q.host); //returns 'localhost:8080'
console.log(q.pathname); //returns '/default.htm'
console.log(q.search); //returns '?year=2017&month=february'

var qdata = q.query; //returns an object: { year: 2017, month: 'february' }
console.log(qdata.month); //returns 'february'
```

# Examples
### http url fs to serve any file in folder
```js
var http = require('http');
var url = require('url');
var fs = require('fs');

http.createServer(function (req, res) {
  var q = url.parse(req.url, true);
  var filename = "." + q.pathname;
  fs.readFile(filename, function(err, data) {
    if (err) {
      res.writeHead(404, {'Content-Type': 'text/html'});
      return res.end("404 Not Found");
    } 
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    return res.end();
  });
}).listen(8080);
```
### http fs axios
```js
let fs = require('fs');
let http = require('http');
const axios = require('axios');

const api = 'https://jsonplaceholder.typicode.com/users'

filename = "data.txt"

var newData = []
axios.get(api).then(response => {
  newData = response.data.filter(user => user.name > 'G').map(user => {
    return {"name":user.name, "phone":user.phone};
  });
  console.log(newData)
  fs.writeFileSync(filename, JSON.stringify(newData), 'utf8');
})

const readData = fs.readFileSync(filename);
const data = JSON.parse(readData.toString())


http.createServer((req,res) => {
  res.writeHead(200, { 'Content-Type':'text/html'});
  res.write("<h1>Some Data</h1>");
  data.forEach(user => {
    res.write(`<h2>${user.name}</h2>`);
    res.write(`<p>${user.phone}</p>`);
  })
  res.end();
}).listen(8080);
```
# pulling data from API
```js
let fs = require('fs');
let http = require('http');
const axios = require('axios');

let jsonData = ''; 
const allData = [];

axios.get('http://universities.hipolabs.com/search?country=United+States')
  .then(response => {
    const alldata = response.data;  //to console object type data
    alldata.forEach(element => {
        //console.log(element.name);
        jsonData += `<p>${element.name}</p>`;
        allData.push(element.name);  // just to define length of array later
    });
  })
  .catch(error => {
    console.log(error);
  });

// step-2 : displaying data on WEB Server
http.createServer( (req, res) => {
    // http header
    res.writeHead(200, {'Content-Type': 'text-html'});
    res.write('<h1> Pulling JSON data </h1>');
    // get length of array
    res.write(`<h3> List of Universities in USA: ${allData.length} </h3>`)
    res.write(jsonData);
    res.end();
}).listen(9000, console.log('listening to port 9000'));
```

```js
axios.get('http://universities.hipolabs.com/search?country=United+States')
.then(response => {
     console.log(response.data);  //to console object type data
     // step-2 : stringifing data and writing in json file
     jsonData = JSON.stringify(response.data);  //to stringify object data to json
     fs.writeFileSync('usa-universities.json', jsonData);  // it is already written!
   })
   .catch(error => {
     console.log(error);
   });
```

```js
// step-1: Reading JSON file
const readData = fs.readFileSync('currencies.json');
const fileData = readData.toString();
const data = JSON.parse(fileData);
//console.log(data);

// step-2: Iterating JSON object
convertedData = '';
for (const [key, value] of Object.entries(data)) {
    convertedData += ` <h3> ${key}. ${value.name} </h3> `;
}

// step-3: Creating HTTP server and displaying JSON data from file
http.createServer(function(req, res){
    // http header
    res.writeHead(200, {'Content-Type': 'text-html'});
    res.write('<h1> World currencies </h1>');
    res.write(convertedData);
    res.end();
}).listen(9000, console.log('server is running on port: 9000'));
```

