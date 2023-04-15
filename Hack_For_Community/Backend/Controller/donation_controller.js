const mongoose = require("mongoose");
const donationRequest = require('../models/donationRequest')
const QRdata = require('../models/QRdata')
const posts = require('../models/post')
const d_cal=require('../routes/d_calculation')
var admin = require("firebase-admin");
const ngo=require('../models/service')
const user=require('../models/user')





exports.createdonation = (req,res,next)=>{
    const now = new Date();
    const options = { timeZone: 'Asia/Kolkata', hour12: true, hour: '2-digit', minute: '2-digit' };
    const formattedTime = now.toLocaleTimeString('en-US', options);
    donation_request = new donationRequest.donation_request({
        donorname: req.body.donorName,
        donortoken: req.body.donortoken,
        phone:req.body.phoneNumber,
        address:req.body.address,
        email:req.body.email,
        food:req.body.food,
        quantity:req.body.quantity,
        bestbefore:req.body.bestbefore,
        selectedngo:req.body.selectedNGO,
        assigned:false,
        time_1: String(formattedTime),
        currentstep: 1,
    })
    
    donation_request.save().then(
        (result)=>{
            console.log('saved!!')
            res.status(201).json({
                message:"sucess!!",
            })
        }
    ).then(()=>{
        donationRequest.donation_request.find(
            {donortoken: req.body.donortoken}
        ).then((result)=>{
            console.log(result[0])
            let message = {
                notification:{
                    title: "Donation call made successfully.",
                    body: "We will notify you when volunteer accepts your request"
                },
                data:{
                    step:"1",
                    time_1: String(result[0].time_1),
                    donationid : String(result[0]._id),
                },
                token: req.body.donortoken,
            };
    
            FCM.send(message,function(err, response){
                if (err) {
                    console.log("Something has gone wrong!");
                } else {
                    console.log("Successfully sent with response: ", response);
                }
            }); 

        })
    }).catch(
        (err)=>{
            console.log(err);
        }
    )
}




exports.getdonationrequestlist = (req,res,next)=>{
    //console.log(req.body)
    donationRequest.donation_request.find({assigned:false}).then(
        (data)=>{
            //console.log(data);
            res.status(202).send({
                'data':data,
            });
        }
    ).catch(
        (err)=>{
            console.log(err)
        }
    ) 
    
}

let lat1,long1,lat2,long2
function getUser(req,res,next){
    User =new user.User({
        lat:res.body.lat,
        long:res.body.long
    })
    User.save().then((result)=>{
        console.log('saved!!')
        res.status(201).json({
            message:"sucess!!",
        })
    }).then(()=>{
        lat1=res.body.lat,
        long1=res.body.long
    })
}

function getNgo(req,res,next){
    Ngo=new ngo.Ngo({
        name:req.body.name,
        service:req.body.service,
        lat:req.body.lat,
        long:req.body.long,
        availability:req.body.availability
    })
    Ngo.save().then((result)=>{
        console.log('saved!!')
        res.status(201).json({
            message:"sucess!!",
        })
    }).then(()=>{
        lat2=req.body.lat,
        long2=req.body.long
    })
}

exports.getdistance=(req,res,next)=>{
    d_cal(lat1,long1,lat2,long2)
}


exports.acceptdonationrequest = (req,res,next)=>{
    console.log(req.body)

    const now = new Date();
    const options = { timeZone: 'Asia/Kolkata', hour12: true, hour: '2-digit', minute: '2-digit' };
    const formattedTime = now.toLocaleTimeString('en-US', options);

    donationRequest.donation_request.find(
            {_id: req.body.donationRequestID}
        ).then((data)=>{
            //var token = data.donortoken;
            console.log(data[0].donortoken);
            
            let message = {
                notification:{
                    title: "Donation call accepted",
                    body: req.body.volunteerName + " is on its way"
                },
                data:{
                    donationid: String(req.body.donationRequestID),
                    step:"2",
                    time_1: String(data[0].time_1),
                    time_2: String(formattedTime),
                    volunteername:req.body.volunteerName,
                    //orderid:"12345",
                    //date: "22/22/22"
                },
                token: data[0].donortoken,
            };
    
            FCM.send(message,function(err, response){
                if (err) {
                    console.log("Something has gone wrong!");
                } else {
                    console.log("Successfully sent with response: ", response);
                }
            }); 

        }
    )
    donationRequest.donation_request.updateOne(
        {_id: req.body.donationRequestID },
        { volunteername:req.body.volunteerName,
        volunteerid: req.body.volunteerid,
        assigned:true ,
        currentstep:2,
        time_2: String(formattedTime)
    }).then(
            (data)=>{
                console.log('updated');
                res.status(203).json({
                data:"accepted",
            })
        }).catch((err)=>{
            console.log(err);
    
    });
    
}





exports.getqrdata = (req,res,next)=>{
    console.log(req.body)

    QRdata.QRdata.find({"QRid" :req.body.qr_id }).then((result)=>{
        if(result.length>0){
            if(result[0].currentstep== 0){
                result[0].currentstep=2;
            }
            res.status(200).json({
                data: result,
            })

        }else{
            res.status(201).json({
                    "notfound": "yes",
                })
                return;
            }
        }).catch((err)=>{
                console.log(err)
            })
}


exports.getdonationdetailforqr = (req,res,next)=>{
    //console.log(req.body)
    donationRequest.donation_request.find({_id :req.body._id }).then((result)=>{
                //console.log(result)
                res.status(200).json({
                    data: result,
                })
            }).catch((err)=>{
                console.log(err)
            })
}



