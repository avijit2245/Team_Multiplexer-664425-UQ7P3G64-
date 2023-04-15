
var user=require('../models/user')

var ngo=require('../models/service')


function calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371; // Radius of the Earth in km
    const dlat = deg2rad(lat2 - lat1);
    const dlon = deg2rad(lon2 - lon1);
    const a = Math.sin(dlat / 2) * Math.sin(dlat / 2) +
        Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
        Math.sin(dlon / 2) * Math.sin(dlon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    const distance = R * c;
    return distance;
}

// Function to convert degrees to radians
function deg2rad(deg) {
    return deg * (Math.PI / 180);
}


// Find nearest hospital
let nearestHospital = null;
let nearestDistance = Infinity; // Initialize with a large value

for (const hospital of hospitalDB) {
    const hospitalLatitude = hospital.latitude;
    const hospitalLongitude = hospital.longitude;
    const distance = calculateDistance(userLatitude, userLongitude, hospitalLatitude, hospitalLongitude);
    if (distance < nearestDistance) {
        nearestDistance = distance;
        nearestHospital = hospital;
    }
}

if (nearestHospital) {
    console.log("Nearest hospital code: ", nearestHospital.code);
    console.log("Distance: ", nearestDistance, " km");
} else {
    console.log("No hospitals found in the database.");
}

module.exports=d_cal
