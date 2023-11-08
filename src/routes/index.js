const express = require('express');

const testRouter = require('./testRouter');

const router = express.Router();

router.use('/test', testRouter);

router.get('/', (req, res) => {
  res.send('OK');
});

module.exports = router;
