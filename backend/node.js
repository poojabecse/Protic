// index.js
const express = require('express');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());

app.get('/send-name', (req, res) => {
  res.json({ message: 'Hello PoojaM developer! / testing....' });
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
