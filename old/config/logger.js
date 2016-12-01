const winston = require('winston');
require('winston-daily-rotate-file');

module.exports = {
    config
}

function config() {
    const transport = new winston.transports.DailyRotateFile({
        filename: './logs/log',
        datePattern: 'yyyy-MM-dd.',
        prepend: true,
        level: process.env.ENV === 'development' ? 'debug' : 'info'
    });

    global.logger = new (winston.Logger)({
        transports: [
            transport,
            new (winston.transports.Console)()
        ]
    });
}