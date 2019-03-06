var express = require('express');
var app = express();


var bodyParser = require('body-parser');
var multer = require('multer');
var upload = multer(); 
var session = require('express-session');
var cookieParser = require('cookie-parser');
 const {database } = require('./query');
 app.set('view engine', 'ejs');
app.set('views','./views')

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true })); 
app.use(upload.array());
app.use(cookieParser());
app.use(session({secret: "Your secret key"}));

app.use(express.static('assets'))

var mysql = require('mysql');

var connection = mysql.createConnection({
  //properties
  host: 'localhost',
  user: 'root',
  password:'a5f7c674',
  database:'log'

});
connection.connect(function(error){
  if(!!error){
    console.log('Error'+ error);
  }
  else{
    console.log('connected');
  }
});

//////////header//////////////
app.get('/home',function(req,res){
   res.render('home');
});
app.get('/',function(req,res){
   res.render('login');
});
app.get('/about',function(req,res){
   res.render('about');
});
app.get('/services',function(req,res){
   res.render('services');
});
app.get('/pricing',function(req,res){
   res.render('pricing');
});
app.get('/faq',function(req,res){
   res.render('faq');
});
app.get('/contact',function(req,res){
   res.render('contact');
});
app.get('/register',function(req,res){
   res.render('register');
});
app.get('/login',function(req,res){
   res.render('login');
});


//////////////footer////////////////
app.get('/terms',function(req,res){
   res.render('terms');
});
app.get('/privacy',function(req,res){
   res.render('privacy');
});
app.get('/grievance',function(req,res){
   res.render('grievance');
});
app.get('/conduct',function(req,res){
   res.render('conduct');
});
app.get('/csr',function(req,res){
   res.render('csr');
});

//////////////////////date////////////////////////////
var date = new Date();
function createDateAsUTC(date) {
    return new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()));
}
//////////////////////////////////////////////////////

//////////////random/////////////

var randomstring = require("randomstring");
randomstring.generate();
var token = randomstring.generate({
  length: 12,
  charset: 'alphabetic'
});

/////////////////////////////////

app.post('/signup', async function(req,res){
     var postData = req.body;
     // console.log(req.body);
    // console.log(postData);
    var firstname = postData.firstname;
    var lastname = postData.lastname;    
    var email = postData.email;
    console.log(email);
    var password = postData.password;
    var mobile = postData.phone;
     var sql1 = "INSERT INTO users (firstname,lastname,email,password,mobile,date_create) VALUES (?,?,?,?,?,?)";
           await database.query(sql1, [firstname,lastname,email,password,mobile,date]);
   res.redirect('/');
   // res.json({message : "data saved"});
});

app.post('/login',function(req,res){
var email= req.body.email;
  var password = req.body.password;

  sess=req.session;     
    sess.email=req.body.email;
    // console.log(email);
    // console.log(password);
    console.log(sess.email);
    var a =  connection.query("SELECT * FROM users  WHERE email = ?",[email], function (error, results, fields) {
  // console.log(a);
 
  if(email=='admin')
  {
           if(results.length >0){

      if(results[0].password == password){
        if(sess.email=='admin'){
          res.render('login', { title: 'Home' });
        }
        else{
          res.render('log', {title : 'Home'})
        }
      }
      else{
       
        res.send({
          "code":204,
          "success":"Password does not match"
            });
      }
    }
    else{
      res.send({
        "code":204,
        "success":"Email does not exits"
          });
    }

       }

  else
  {
          
           if(results.length >0){
            if(sess.email!==''){
          res.render('home', { title: 'Home' });
              }
              else{
                res.render('login', { title: 'Login' });
              }
    
    }
    else{
      res.send({
        "code":204,
        "success":"Email does not exits"
          });
    }

  
}

});

});



///////////////////////MOBILE RECHARGE API/////////////////////////////////////
app.post('/mobile', async function(req,res){

//   var https = require('https');

sess=req.session
 var phone = req.body.tel;                   ///////////////PASS  BY  POSTMAN/////////////
 var amount = req.body.amount;               ///////////////PASS BY  POSTMAN/////////////
 var postData = req.body;
 var provider = req.body.provider;
 var email = req.body.email;  
 var token = 'e44f9979a08f79b8cb97048cbfb34b22';              ///////////////PASS  POSTMAN/////////////
 var provider = 'airtel';
 // console.log(postData);
 var type =  'Mobile recharge';

// var options = {
//   'method': 'GET',
//   'hostname': 'www.instantpay.in',
//   'path': '/ws/api/serviceproviders?token=b6644fd088052d8e7515b471d267607c&spkey=ATP&format=json',
//   'headers': {
//   }
// };

// var req = https.request(options, function (res) {
//   var chunks = [];

//   res.on("data", function (chunk) {
//     chunks.push(chunk);
//   });

//   res.on("end", function (chunk) {
//     var body = Buffer.concat(chunks);
//     console.log(body.toString());
//   });

//   res.on("error", function (error) {
//     console.error(error);
//   });
// });

// req.end();

//////////////////////////////////////////service provider detail ends/////////////

// var options = {
//   'method': 'GET',
//   'hostname': 'www.instantpay.in',
//   'path': '/ws/api/transaction?format=xml&token=b6644fd088052d8e7515b471d267607c&agentid=2&amount='+amount+'&spkey=ATP&account='+phone+'&mode=VALIDATE',
//   'headers': {
//   }
// };
//  // console.log(options);
// var req = https.request(options, function (res) {
//   var chunks = [];

//   res.on("data", function (chunk) {
//     chunks.push(chunk);
//   });

//   res.on("end", function (chunk) {
//     var body = Buffer.concat(chunks);
//     console.log(body.toString());
//   });

//   res.on("error", function (error) {
//     console.error(error);
//   });
// });

// req.end();

/////////////////////////////////////validation///////////////////////////////
var https = require('https');

var options = {
  'method': 'GET',
  'hostname': 'www.instantpay.in',
  'path': '/ws/api/transaction?format=xml&token='+ token + '&spkey=ATP&agentid=1&amount='+amount+'&account='+phone,
  'headers': {
  }
};

// console.log(options);
var req = https.request(options, function (res) {
  var chunks = [];

  res.on("data", function (chunk) {
    chunks.push(chunk);
  });

  res.on("end", function (chunk) {
    var body = Buffer.concat(chunks);
    console.log(body.toString());
  });

  res.on("error", function (error) {
    console.error(error);
  });
});

req.end();

console.log(phone);
// res.json(data);
 var sql1 = "INSERT INTO recharge (account, amount,type,useremail,date,provider) VALUES (?,?,?,?,?,?)";
           await database.query(sql1, [phone,amount,type,email,date,provider]);
  res.send({message : "recharge is done"});

});
////////////////////////////ENDS////////////////////////////////////////






var server = app.listen(3000, function(){
  console.log('listen to port 3000');
});





