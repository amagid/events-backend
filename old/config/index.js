const logger = require('./logger');
const db = require('./database');

module.exports = {
    init,
    db
}

/**
 * Configuration for Server initialization
 */
function init() {
    logger.config();
}