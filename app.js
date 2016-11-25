'use strict';

const http = require('http')
const app = require('express')()
const server = http.createServer(app)
const Promise = require('bluebird')

const api = require('./api')

api();

app.listen(3000)
