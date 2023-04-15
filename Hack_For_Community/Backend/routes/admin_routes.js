const express = require('express');
const controller_admin = require('../Controller/admin');
const router = express.Router();

router.get('/dashboard',controller_admin.dashboard);

router.post('/dashboard',controller_admin.dashboard);  // for login

router.get('/dashboard/QRgenerator',controller_admin.QRgenerator);



module.exports = router;