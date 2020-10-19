require('dotenv').config();

const http = require('http');
const hostname = '127.0.0.1';
const port = 3300;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Boop');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

const blizzard = require('blizzard.js').initialize({
    key: process.env.BLIZZARD_CLIENT_ID,
    secret: process.env.BLIZZARD_CLIENT_SECRET,
    origin: 'eu',
    locale: 'en_EU'
  });
  
  async function example () {
    try {
      await blizzard.getApplicationToken()
        .then(response => {
          blizzard.defaults.token = response.data.access_token
          console.log(response.data.access_token);
        });
      const item = await blizzard.wow.item({ id: 168185 });
      console.log(item)
    } catch (err) {
      console.error(err);
    }
  }
  
  example();