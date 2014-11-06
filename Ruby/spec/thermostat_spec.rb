require 'thermostat'

describe Thermostat do

    let(:thermostat) { Thermostat.new}

    context 'when initialized' do

        it 'should have a temperature of 20 degrees' do
            expect(thermostat.temperature).to eq 20
        end

        it 'should have a PWS mode on' do
            expect(thermostat.psm_mode).to be false
        end

    end

    context 'maximum temperature' do

        it 'should be 25 degrees with PSM on' do
            thermostat.turn_psm_on
            expect(thermostat.maximum_temperature).to eq 25
        end

        it 'should be 25 degrees with PSM on' do
            expect(thermostat.maximum_temperature).to eq 32
        end
    end

    context 'increasing temperature with PSM off' do

        it 'increases if < 32 degrees' do
            thermostat.increase_temperature
            expect(thermostat.temperature).to eq 21
        end

        it 'does not increase if >= 32 degrees' do
            thermostat.temperature = 32

            thermostat.increase_temperature
            expect(thermostat.temperature).to eq 32
        end

    end

    context 'increasing temperature with PSM on' do

        before(:each) do
            thermostat.turn_psm_on
        end

        it 'increases if < 25 degrees' do
            thermostat.increase_temperature
            expect(thermostat.temperature).to eq 21
        end

        it 'does not increase if >= 25 degrees' do
            thermostat.temperature = 25

            thermostat.increase_temperature
            expect(thermostat.temperature).to eq 25
        end

    end

    context 'decreasing temperature' do

        it 'decreases if > 10 degrees' do
            thermostat.decrease_temperature
            expect(thermostat.temperature).to eq 19
        end

        it 'does not increase if <= 10 degrees' do
            thermostat.temperature = 10

            thermostat.decrease_temperature
            expect(thermostat.temperature).to eq 10
        end
    end

    context 'resetting temperature' do

        it 'resets the temperature to 20 degrees' do
            thermostat.temperature = 15
            thermostat.reset_temperature
            expect(thermostat.temperature).to eq 20
        end

    end

    context 'effciency' do

        it 'should return efficient if temperature is < 18' do
            thermostat.temperature = 17
            expect(thermostat.energy_score).to eq 'efficient'
        end

        it 'should return average if temperature is < 25' do
            thermostat.temperature = 24
            expect(thermostat.energy_score).to eq 'average'
        end

        it 'should return inefficient if temperature is >= 25' do
            thermostat.temperature = 29
            expect(thermostat.energy_score).to eq 'inefficient'
        end

    end

end
