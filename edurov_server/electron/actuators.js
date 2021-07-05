const { io_send } = require('./ioclient.js');
actuators = {armed:false, lights:0.0, sensor_interval:500, sensitivity:100, vertical:0.0, port:0.0, starboard:0.0}

function actuators_send()
{
    io_send(actuators);
}

function actuators_set(key, value)
{
    actuators[key] = value;
}

function actuators_get(key)
{
    return actuators[key];
}

module.exports = { actuators_send, actuators_set, actuators_get }