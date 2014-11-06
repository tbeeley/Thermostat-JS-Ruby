function Thermostat() {
	this.temperature = 20;
	this.powerSavingMode = true
}

Thermostat.prototype.increaseTemperature = function() {
	if(this.temperature < 25) this.temperature += 1;
};

Thermostat.prototype.decreaseTemperature = function() {
	if(this.temperature > 10) this.temperature -= 1;
};