const express = require('express');

const controller = require('../Controller/donation_controller')

const router = express.Router();



router.post('/createdonation',controller.createdonation);


router.get('/getdonationrequestlist',controller.getdonationrequestlist);

router.post('/acceptrequest',controller.acceptdonationrequest);

router.post('/getqrdata',controller.getqrdata);

router.post('/getdonationdetailforqr',controller.getdonationdetailforqr)

router.post('/updateQRstep_3',controller.updateQRstep_3)





module.exports=router;