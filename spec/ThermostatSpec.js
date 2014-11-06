describe("Thermostat", function() {
  var thermostat;

  beforeEach(function() {
    thermostat = new Thermostat;
  });

  it("should initialize at 20 degrees", function() {
    expect(thermostat.temperature).toEqual(20)
  });

  it('should initialize with PSM on', function() {
    expect(thermostat.powerSavingMode).toBe(true) 
  });

  describe('increasing the temperature', function() {
  
    it("increase if < 25 degrees", function() {
      thermostat.increaseTemperature()
      expect(thermostat.temperature).toEqual(21)
    });

    it("does not increase if temperature is >= 25 degrees", function() {
      thermostat.temperature = 25;

      thermostat.increaseTemperature()
      expect(thermostat.temperature).toEqual(25)
    });

    it("decrease if > 10 degrees", function() {
      thermostat.decreaseTemperature()
      expect(thermostat.temperature).toEqual(19)
    });

    it("does not decrease if <= 10 degrees", function() {
      thermostat.temperature = 10
      thermostat.decreaseTemperature()
      expect(thermostat.temperature).toEqual(10)
    });
  
  });
});
