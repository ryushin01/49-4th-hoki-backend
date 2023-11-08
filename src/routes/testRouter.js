const express = require('express');

const { imageUploader } = require('../middlewares/imageUploader');

const router = express.Router();

router.post('/', imageUploader.array('image', 5), async (req, res) => {
  if (req.files.length > 0) {
    const imageUrls = req.files.map((file) => file.location);
    const combinedOutput = imageUrls.reduce(
      (result, imageUrl) =>
        result + `<img url="${imageUrl}" text="Image Description">`,
      '',
    );

    const responseData = {
      messages: combinedOutput,
    };
    res.json(responseData);
  } else {
    res.status(400).json({ error: 'No file uploaded' });
  }
});

module.exports = router;
