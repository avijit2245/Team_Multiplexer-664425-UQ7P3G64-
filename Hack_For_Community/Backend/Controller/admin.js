const { response } = require("express");
const mongoose = require("mongoose");
const emergency_services_temp = require("../models/service").emergency_services_temp;
const emergency_services_perm = require("../models/service").emergency_services_perm;
const user = require("../models/user");
const QRdata = require('../models/QRdata');
const donation_request = require('../models/donationRequest');
const post = require('../models/post')



exports.QRgenerator = (req,res,next)=>{
    res.render('../views/admin/QRgenerator.ejs');
}


exports.inventory = (req,res,next)=>{
    QRdata.QRdata.find({currentstep:4}).then((data)=>{
        console.log(data);
        res.render('../views/admin/inventory.ejs',{
            food: data,
        });
        
    })
    
}




exports.dashboard = (req, res, next) => {
    donation_request.donation_request.find({currentstep:1}).then(data => {
                res.render('../views/admin/dashboard.ejs', {
                    food: data,
                });
                //console.log(service);
            }).catch(err => {
                console.log(err);
            })


}

exports.generateQR = (req,res,next)=>{
    console.log(req.body)
    q = new QRdata.QRdata({
        QRid: String(req.body.QRidGene),
        currentstep: 0,
    })
    
    q.save().then(
        (result)=>{
            console.log('saved!!')
            res.json({
                message:"sucess!!",
            })
        }).catch(e=>{
            console.log(e)
        })
}


