const Sequelize = require('sequelize');
const config = require('../config');

module.exports = () => {
    const sequelize = new Sequelize(config.db.name, config.db.user, config.db.password, {
        host: config.db.host,
        dialect: 'mysql',
        pool: {
            max: 5,
            min: 0,
            idle: 10000
        }
    });

    sequelize.authenticate()
        .then(() => {
            logger.info('Connected to Database.');
        })
        .catch(error => {
            logger.error(`Connection to Database Failed. Reason: ${error}`);
        });
}