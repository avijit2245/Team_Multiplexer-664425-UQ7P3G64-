const mongoose = require('mongoose');
const schema = mongoose.Schema;
const ProductSchema = new schema({
    name:{
        type: String,
        require: false
    },
    service:{
        type: String,
        require: false
    },
    lat:{
        type: String,
        require: false
    },
    long:{
        type: String,
        require: false
    },
    availabilty:{
        type: String,
        require: false
    }
})

module.exports=mongoose.model('ngo',ProductSchema);

