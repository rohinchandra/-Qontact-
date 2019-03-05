// refractor code
const express = require('express');
const router = express.Router();
const mysql = require('mysql');

const multer = require('multer');
// Define storage proceedure
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './uploads/');
    },
    filename: function(req,file,cb){
        cb(null, new Date().toISOString() + file.originalname);
    }
});

// limit type of files accepted
const fileFilter = (req, file, cb) => {
    // accept only certain image file types
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png'){
        cb(null, true);
    } else {
        cb(null, false);
    }

}

const upload = multer({
    storage: storage, 
    limits:{
        // only accept files up to 10 MB
        fileSize: 1024 * 1024 * 10
    },
    fileFilter: fileFilter
});

router.post('/create', upload.single('contactImage'), (req,res) => {
   
    if (!req.file){
        console.log("no file received")
    } else {
        console.log('file received')
        
    }
    const contactId = req.body.contact_id;
    const file_location = req.file.path;
    console.log("contactId: " + contactId + ", fileLocation:" + file_location)
    res.send({success: true});
});

router.post('/retrieve/', (req,res) => {
    user_id = req.body.user_id;
    console.log('Trying to query database')
    console.log('user_id: '+user_id)
    getConnection().query('SELECT * FROM user WHERE user_id=?', [user_id], (err,result)=>{
        if (err){
            console.log('error occured')
            res.send({success:false})
        }
        console.log(result)
        res.send(result)
    });

});

// when importing data to amazong remember https://stackoverflow.com/questions/42385099/1273-unknown-collation-utf8mb4-unicode-520-ci

/*
const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'rootroot',
    database: 'qontact'
})

*/

const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'ls-3756a7fc12e05fc72ff7454e214a2ede00a42d0a.c0v6wpdqamcg.us-east-1.rds.amazonaws.com',
    user: 'dbmasteruser',
    password: '!nAodaYv+0r1+|tl[w5axK0ZxBs^j[5N',
    database: 'qontact'
})


function getConnection(){
    return pool
}

module.exports = router;