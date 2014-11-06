describe("Thermostat", function() {
  var thermostat;

  beforeEach(function() {
    thermostat = new Thermostat;
  });

  describe('initialization', function(){

    it("should initialize at 20 degrees", function() {
      expect(thermostat.temperature).toEqual(20)
    });

    it('should initialize with PSM on', function() {
      expect(thermostat.powerSavingMode).toBe(true) 
    });
    
  });

  describe('maximum temperature', function(){

    it("is 25 degrees with PSM on", function() {
      expect(thermostat.maximumTemperature()).toEqual(25)
    });

    it('is 32 degrees with PSM off', function() {
      thermostat.powerSavingMode = false;
      expect(thermostat.maximumTemperature()).toEqual(32) 
    });
    
  });

  describe('increasing the temperature', function() {

    describe('PSM off', function() {

      beforeEach(function() {
        thermostat.powerSavingMode = false;
      }) 

      it("increases if < 32 degrees", function() {
        thermostat.temperature = 25

        thermostat.increaseTemperature()
        expect(thermostat.temperature).toEqual(26)
      });

      it("does not increase if temperature is >= 32 degrees", function() {
        thermostat.temperature = 32;

        thermostat.increaseTemperature()
        expect(thermostat.temperature).toEqual(32)
      });

    });
  
    describe('PSM on', function() {

      it("increases if < 25 degrees", function() {
        thermostat.increaseTemperature()
        expect(thermostat.temperature).toEqual(21)
      });

      it("does not increase if temperature is >= 25 degrees", function() {
        thermostat.temperature = 25;

        thermostat.increaseTemperature()
        expect(thermostat.temperature).toEqual(25)
      });

    });

  });

  describe('decreasing the temperature', function() {  

    describe('PSM off', function() {

      beforeEach(function() {
        thermostat.powerSavingMode = false;
      }) 

    });

    describe('PSM on', function() {

      it("decreases if > 10 degrees", function() {
        thermostat.decreaseTemperature()
        expect(thermostat.temperature).toEqual(19)
      });

      it("does not decrease if <= 10 degrees", function() {
        thermostat.temperature = 10;

        thermostat.decreaseTemperature()
        expect(thermostat.temperature).toEqual(10)
      });

    });

  });

  describe('reseting the temperature', function(){

    it('resets the temperature to 20', function(){
      thermostat.temperature = 22

      thermostat.resetTemperature()
      expect(thermostat.temperature).toEqual(20)
    });

  });
  
});
