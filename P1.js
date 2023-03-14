// get the client
const mysql = require('mysql2');

const twilio = require('twilio');
const accountSid = 'AC0ceb30ccdd68caec63082a3c4d60b7fa'; // Your Account SID from www.twilio.com/console
const authToken = 'a0fdb31e3844e62e79bdfd10569ffd95'; // Your Auth Token from www.twilio.com/console

const client = require('twilio')(accountSid, authToken);

// create the connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password:"8685",
  database: 'bloodbank'
});

var previous_Stock=[]

function CheckStock(){
connection.query(
    'select * from stock',
    function(err, results, fields) {
      //console.log(results); // results contains rows returned by server

     var i=0;
      for( i=0;i<results.length;i++){

      
            // var index=i;
             if(results[i].units<=0){

            connection.query(
               "SELECT * from bloodrequest where bloodgroup= ? AND status != 'completed'  AND  sms='0' or  sms IS NULL" ,
                [results[i].bloodgroup],
                function(err, Data, fields) {
                
                   //console.log(Data);
                  Data.forEach(item=>  {

                       

                        //console.log(Data);
                        client.messages
                        .create({
                          body: 'Currently This Blood Group is Out of Stock',
                          to: '+91'+item.mobileno, // Text this number
                          from: '++15076288803', // From a valid Twilio number
                        })
                        .then((message) =>  {

                            var temp=item;
                            console.log(temp);
                            connection.query(
                                "update  bloodrequest set  sms ='0' where  mobileno=?",
                                [temp.mobileno],

                                function(x,y,z){
                                    console.log(x);
                            }

                            )
                        });
                    })

                   


                }
                 
                
            );
        }

        else{
            connection.query(
                "SELECT * from bloodrequest where bloodgroup= ? AND status = 'completed' AND  sms= '0' or  sms  IS NULL",
                [results[i].bloodgroup],
                function(err, Data, fields) {
                

                   // console.log(Data);
                    

                    
                    Data.forEach(item=>  {

                       

                      //  console.log(Data);
                        client.messages
                        .create({
                          body: 'This Blood Group is avilable',
                          to: '+91'+item.mobileno, // Text this number
                          from: '+15673132227', // From a valid Twilio number
                        })
                        .then((message) =>  {

                            var temp=item;
                            connection.query(
                                "update  bloodrequest set  sms ='0' where  mobileno=?",
                                [temp.mobileno],

                                function(x,y,z){

                                    console.log(x);
                            }
                            )
                        });
                    })

                   


            
        })
        }

    }



    }
  )
};


CheckStock();//...for trail run

// setInterval(function(){

//     CheckStock();

    
// },86400000)




