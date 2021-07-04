import { io_send } from './ioclient.js';
actuators = {armed:false, lights:0.0, sensor_interval:500, sensitivity:100, vertical:0.0, port:0.0, starboard:0.0}

export function actuators_send()
{
    io_send(actuators);
}

export function actuators_set(key, value)
{
    actuators[key] = value;
}

export function actuators_get(key)
{
    return actuators[key];
}