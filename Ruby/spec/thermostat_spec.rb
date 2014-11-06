require 'thermostat'

describe Thermostat do

    let(:thermostat) { Thermostat.new}

    context 'when initialized' do

        it 'should have a temperature of 20 degrees' do
            expect(thermostat.temperature).to eq 20
        end

        it 'should have a PWS mode on' do
            expect(thermostat.psm_mode).to be true
        end

    end

    context 'maximum temperature' do

        it 'should be 25 degrees with PSM on' do
            expect(thermostat.maximum_temperature).to eq 25
        end

        it 'should be 25 degrees with PSM on' do
            thermostat.turn_psm_off
            expect(thermostat.maximum_temperature).to eq 32
        end
    end

    context 'increasing temperature with PSM off' do

        before(:each) do
            thermostat.turn_psm_off
        end

        it 'increases if < 32 degrees' do
            thermostat.temperature = 27

            thermostat.increase_temperature
            expect(thermostat.temperature).to eq 28
        end

        it 'does not increase if >= 32 degrees' do
            thermostat.temperature = 32

            thermostat.increase_temperature
            expect(thermostat.temperature).to eq 32
        end

    end

    context 'increasing temperature with PSM on' do

    end

    context 'decreasing temperature with PSM off' do

    end

    context 'decreasing temperature with PSM on' do

    end

end

#     it("does not increase if temperature is >= 32 degrees", function() {
#       thermostat.temperature = 32;

#       thermostat.increaseTemperature()
#       expect(thermostat.temperature).toEqual(32)
#     });

#   });

#   describe('PSM on', function() {

#     it("increases if < 25 degrees", function() {
#       thermostat.increaseTemperature()
#       expect(thermostat.temperature).toEqual(21)
#     });

#     it("does not increase if temperature is >= 25 degrees", function() {
#       thermostat.temperature = 25;

#       thermostat.increaseTemperature()
#       expect(thermostat.temperature).toEqual(25)
#     });

#   });

# });

# describe('decreasing the temperature', function() {

#   describe('PSM off', function() {

#     beforeEach(function() {
#       thermostat.powerSavingMode = false;
#     })

#   });

#   describe('PSM on', function() {

#     it("decreases if > 10 degrees", function() {
#       thermostat.decreaseTemperature()
#       expect(thermostat.temperature).toEqual(19)
#     });

#     it("does not decrease if <= 10 degrees", function() {
#       thermostat.temperature = 10;

#       thermostat.decreaseTemperature()
#       expect(thermostat.temperature).toEqual(10)
#     });

#   });

# });
