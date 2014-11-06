Thermostat: JS and Ruby
===============
A smart thermostat program, built in Javascript and Ruby

![Image](/assets/nest_pic.png)


Specification:

Thermostat starts at 20 degrees
- You can increase the temp with the up button
- You can decrease the temp with the down button
- The minimum temperature is 10 degrees
- If power saving mode is on, the maximum temperature is 25 degrees
- If power saving mode is off, the maximum temperature is 32 degrees Power saving mode is default
- You can reset the temperature to 20 by hitting the reset button
- The thermostat colours the display based on energy usage - < 18 is green, < 25 is yellow, otherwise red

Technologies Used

- Javascript
- Ruby 2.0.0
- Jasmine
- Rspec

How to set it up

git clone git@github.com:tbeeley
cd Thermostat

How to test it:

Javascript:
- cd Javascript
- Open /lib/jasmine/SpecRunner.html in the browser.

Ruby:
- cd Ruby
- rspec



