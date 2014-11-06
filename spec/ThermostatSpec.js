describe("Thermostat", function() {
  var thermostat;

  beforeEach(function() {
    thermostat = new Thermostat;
  });

  it("should initialize at 20 degrees", function() {
    expect(thermostat.temperature).toEqual(20)
  });

  describe('increasing the temperature', function() {
  
    it("increase if < 25 degrees", function() {
      thermostat.increaseTemperature()
      expect(thermostat.temperature).toEqual(21)
    });
  
  });
});
