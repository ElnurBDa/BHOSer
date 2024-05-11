# Install it and start
`npm i express hbs`
```js
const path = require('path');
const express = require('express');
const hbs = require('hbs') // or ejs 

const app = express();
```
# Routes
```js
app.get('', (req, res) => {
    res.send(`<h1>Welcome to Express</h1>
              <h4>Features of Express Server</h4>
              <p>All supplementary text will go here!</p>
    `)
})

app.get('/about', (req, res) => {
    res.send('About me')
})

app.get('/help', (req, res) => {
    res.send([{name: "Emiliano"}, {name: "Mafioza"}])
})

app.get('/weather', (req, res) => {
    res.send({ location: 'Baku', temperature: '28C', condition: 'sunny' })
})
```
# Folders
```js
console.log(__dirname)  //complete path to folder
console.log(__filename) //complete path to file name

const publicDir = path.join(__dirname, '../public')
// Customize Express: Tell express to serve up the PUBLIC directory
app.use(express.static(publicDir))
```
Now you can delete routes and create `about.html`, `help.html` files in public folder, and other files that can be viewed publicly 
# Template engine
ejs or hbs
```js
app.set('view engine', 'hbs')
// create 'VIEWS' folder on root, to store all 'hbs' files there
// removing static html files from public folder
// to tell express to work with 'hbs' templates we have to create a route
/*
app.get('', (req, res) => {
    res.render('index')
})
*/
// Rendering multiple dynamic variables
app.get('', (req, res) => {
    // we send to parameteres like an object
    res.render('index', {
        title: 'Simple App using hbs templates',
        name: 'author by, Mahammad Sharifov'
    })
})

app.get('/about', (req, res) => {
    res.render('about', {
        title: 'About me',
        name: 'Mahammad Sharif'
    })
})

app.get('/help', (req, res) => {
    res.render('help', {
        title: 'Help Page',
        name: 'Mahammad Sharif',
        helpText: 'Help: some helpfull text'
    })
})

// rendering objects, array of objects
app.get('/objdata', (req, res) => {
    // Example-2
    const projects = { "members" : [
        {name: "Leonell Messi", team: "Argentina"},
        {name: "Zlatan Ibrahimovich", team: "Sweden"},
        {name: "Roberto Baggio", team: "Italy"} ]
    }
    // Example-1
    // let projects = {
    //     name: 'Attila',
    //     skills: ['Data Mining', 'BlockChain Dev', 'Web Development']
    // }
    res.render('objdata', {projects: projects} )
})

// rendering json files
let fs = require('fs');
app.get('/jsonfile', (req, res) => {
    const filePath = './public/json/currencies.json';
    fs.readFile(filePath, 'utf-8', (err, data)=>{
        if (err){ 
            console.log("Error in file reading..", err.message);
        }
        const currencies = JSON.parse(data);
        res.render('jsonfile', {currencies: currencies});
    })
})

// rendering API data
const getApi = require('./getApi');
app.get('/apidata', (req, res) => {
    getApi()
    .then( response => {
        res.render('apidata', { apiData: response });
    })
})

```

adding partials as layout
```js
const partialsPath = path.join(__dirname, '../views/partials')
hbs.registerPartials(partialsPath)
```
# The end
```js
app.listen(3000, () => {
    console.log('server is running on port: 3000')
})
```
# HBS
we pass into it some variables from app.js and as a layout we use header and footer
```html
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="../css/skeleton.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        {{>header}}

        <h1>{{ title }}</h1>
        <p>Created by {{ name }}</p>
        <img src="../img/newazerbaijan.jpg">

        <table>
            {{#each apiData}}
                <tr>
                    <th>{{this.name}}</th>
                    <td>{{this.web_pages}}</td>
                </tr>
            {{/each}}
        </table>
        <table>
            {{#each currencies}}
                <tr>
                    <th> {{@key}} <th>
                    <td> {{this.name}} </td>
                </tr>
            {{/each}}
        </table>
        {{>footer}}
    </body>
</html>
```

footer.js
```html
<hr>
<p>Copyright, @ myCompany 2020</p>
```