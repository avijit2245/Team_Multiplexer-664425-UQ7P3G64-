const mongoose = require('mongoose');
const schema = mongoose.Schema;

const UserSchema =new schema({
    lat:{
        type:String,
        require: true
    },
    long:{
        type:String,
        require: true
    }
})

module.exports = mongoose.model('user',UserSchema);
