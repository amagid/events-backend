'use strict';

const http = require('http');
const app = require('express')();
const server = http.createServer(app);
const Promise = require('bluebird');
const api = require('./api');
const config = require('./config');
const sync = require('./models/sync');

// Do basic config stuff, like set up logger
config.init();

// Sync database models
sync();

app.listen(3000);
