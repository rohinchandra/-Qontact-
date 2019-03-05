// The main app server

const express = require('express');
const app = express();

const morgan = require('morgan');
const bodyParser = require('body-parser');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

// Provides in console logging of HTTP activity - in short form 
app.use(morgan('dev'));


//
const createRoutes = require('./routes/create.js')
app.use(createRoutes);








app.get('/retrieveContact/:contactId', (req, res)=>{
    res.send('Hello world!' + req.params.contactId)
})

app.post('/retrieve/contact', (req, res)=>{
    res.send('Hello world!' + req.body.contact_id)
})

// Start the express server
app.listen(3000, () =>{
    console.log('Server running on Port 3000!')
});