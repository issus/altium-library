# Celestial Altium Library

An exceptional, open source database library for Altium, currently supporting MSSQL and SQL Azure as the backend for easy use within teams, and no data corruption unlike MS Access.

Current part count in live database: 20,350 in over 510 packages.

This library has been built for high quality data, with high quality footprints and high quality 3D models.

# Why use an Altium DBLib over an Integrated Library?

Altium Database libraries make you design your schematic with the part you are going to use, rather than a generic part with the same footprint. Rather than selecting "RJ45 Jack" you instead select Amphenol Commercial Products part number RJCSE538001. This is now reflected in your BOM completely, the entire BOM fills itself out, meaning no more trying to remember exactly what part you actually meant to put in there was, or what voltage that capacitor was.

Prior to using a DBLib, it would often take me half a day to fill out the bill of materials. I'd have to find each resistor on the supplier's website, list it down with the supplier's part number, manufacturer, manufacturer name, etc... Now I just generate the BOM in the output job, and everything is done. No more trying to remember "was that 33uF cap 25V or 50v?", or finding out after the fact that no, that capacitor isn't available as a 47uF 50V variant in that package, despite the fact you were sure it was!

Basically: You save time on the design, and you greatly reduce errors occurring from specifying a part you didn't actually use (who hasn't accidentally specified a right angle connector variant when it was really vertical on the board - oops?)

# The Library
### Why use this library over something like Ultra Librarian?
Ultra librarian doesn't have high quality 3d models or parametrics. If all you need is basic footprint, Ultra librarian is what you want. If you want something open source, ultra high quality parts and with all the data fields you desire.. then you'll probably really like this library.

If you're integrating your electronic design into a housing or designing injection moulded cases for it - you need accurate 3d models or your mechanical engineers will spend a lot of time making sure the case fits your design files.

### Data
All parts in the database are matched with every relevant parameter that Digi-Key carry for the part, so you can search/filter within Altium for the part you require. If you are looking for low Rds(on) N-Ch fets, just add the Rds(on) column to the Altium library window and sort by it.

Every part has a link to the part on Digi-key, and has a link to the datasheet for the part for ease of design. Both the Digi-Key part number, price, and manufacturer name/part number are stored, now your BOM will be completely filled out automatically.

### Footprints
Every part has a footprint created to match it's manufacturers recommended footprint by the manufacturer, or lacking that, an IPC Compliant footprint for the manufacturers specific package sizing. There are no generic footprints within this library, everything is manufacturer specific. 

Every footprint must have a high quality, dimensionally accurate, accurately coloured 3d model. For complex parts (connectors like modular jacks), the manufacturers model is preferred however is always fully coloured and checked for accuracy against their drawings and modified as required.  I've found issues with the accuracy of the manufacturer issued model from most models, where they do not match the datasheet - every instance has been checked with the manufacturer and many have re-issued their 3d models because of these checks.

Basic parts (TSSOP/SOP/Resistors etc) I have created every model from scratch in SolidWorks, if the manufacturers dimensions vary from the JEDEC standard, they receive their own version of the 3d model (see SOT-23-3..) For ultra basic parts with no features (QFN/DFN), a black basic Altium 3D extrusion is used of the correct size.

Every part's centre position is where the Pick and place head should grab the part. For companies running their own Pick and Place machine, this is very convenient compared to centres at pin 1/centre of pads - your pick and place export list now has centres in the correct location.

Every part has all it's surface mount footprints added, whether I use them or not. PDIP footprints do not exist, except for connectors. All passives are available in 0201, 0402, 0603, 0805 and 1206, sometimes also 1210 footprints at the least.

### Symbols 

Every symbol in the library is somewhat standardised as to where pins are located, such as VCC in the top left, GND in the bottom left, user function pins on the right (controllable inputs/outputs). Standard protocols like SPI have the pins in the same order in every part - however manufacturer datasheet labeling is kept (DOUT rather than MISO for example) to make it easier to reference the datasheet. All components within a database category should have similar if not identical layouts/pin groupings where possible. This makes it much easier to switch out components.

All passive components, such as resistors and capacitors all have the same size component span, keeping your schematics tidy.

# What components are contained in the library?
There are currently over 20000 parts in the library, this number sounds quite large but when you consider you need every value of resistor in 1%, 0.5%, 0.25%, 0.1% and 0.05%, in 0201, 0402, 0603, 0805 and 1206... you're now looking at over 5000 resistors.

Only SMT parts are in the library, except connectors, buttons and displays which have a mixture.

I am somewhat picky about manufacturers. You'll find a lot of the main stays of electronics components that can be sourced anywhere in the world, like NXP, TI, ON Semi, JST, Microchip, RFMD, Allegro, Laird, Epson, Intersil, TE, TDK, Samsung, FCI, etc. There are currently parts from over 100 manufacturers in the database. I typically would have the cheapest parts from each category on Digi-Key that I have parts from, as well as parts of specific interest (fastest, lowest resistance, largest values, smallest values, etc) to ensure a broad range of components. If I need a component for a consulting job, I will typically add it and about 10 others from the category.

*However*, that's not to say there are not a lot of component types in the database. 

##### Currently there are database views for:

 - ADC - Programmable
 - Audio - Amplifier
 - Battery Holder
 - Button - Push
 - Button - Slide
 - Button - Tactile
 - Capacitor - Aluminium
 - Capacitor - Aluminium Polymer
 - Capacitor - Ceramic
 - Capacitor - RF
 - Capacitor - Tantalum
 - Capacitor - Tantalum Polymer
 - Charger
 - Chip LED
 - Connector - Card Edge
 - Connector - Dev Board
 - Connector - Modular
 - Connector - Modular w/Magnetics
 - Connector - Rectangular
 - Connector - RF
 - Connector - SD
 - Connector - Terminal Block
 - Connector - USB
 - Digital Isolator
 - Digital to Analogue Converter
 - Diode - Rectifier
 - Diode - TVS
 - Ferrite Chip
 - Gate Driver
 - Inductor - Power
 - Inductor - RF
 - Interface - CAN
 - Interface - Ethernet
 - Interface - RS485
 - LCD Display - Graphic
 - LED Driver
 - Light Pipe
 - MCU - ARM
 - MCU - AVR
 - Memory - EEPROM
 - Memory - FLASH
 - Motor Driver - Controller
 - Motor Driver - Stepper
 - Mounting Bracket
 - Multiplexer
 - N-Channel Dual FET Array
 - N-Channel FET
 - Optoisolators
 - Oscillator - Crystal
 - Oscillator - MEMS
 - Oscillator - TCXO
 - Oscillator - VCTCXO
 - Oscillator - XO
 - P-Channel Dual FET Array
 - P-Channel FET
 - Power Module
 - Reset Supervisor
 - Resistor - Chip
 - Resistor - Current Sense
 - Resistor - Potentiometer
 - RF Amplifier
 - RF Attenuator
 - RF Detector
 - RF Filter
 - RF Module
 - RF Switch
 - Sensor - Current
 - Sensor - Magnetic
 - Sensor - Motion
 - Sensor - Pressure
 - Sensor - Temperature
 - Sensor - Thermocouple
 - Test Point
 - Thermistor - NTC
 - Video
 - Voltage Reference
 - Voltage Regulator - Linear
 - Voltage Regulator - Switchmode


##### Currently on my ToDo list:
 - STM32F series (STM32F4, STM32F3, STM32F0)
 - Si Labs Gecko series
 - AVR-ATMEGA/XMEGA (ultra low priority)
 - Video Filters
 - Video Sync Separators
 - Current Sensors (more of)
 - Dual Row Headers
 - Larger Terminal Blocks (5/5.08mm pitch)
 - Capacitance to Digital Converters
 - More LPC series of M0/M3/M4 (LPC4337)
 - Opto-isolators
 - RF Filters
 - RF SoC (EZR32WG, CC2640, nRF5)
 - RGB LEDS
 
It will likely be months before I make a significant dent on this list, adding a single microcontroller with all of its package variants can take several hours. The good news is that the more footprints I add, the more I find a manufacturers footprint already exists in the database.

# Don't want to setup your own local MSSQL database?
My development database is hosted on Microsoft Azure, and can be accessed from anywhere. If you'd like read-only access to it, please contact me - markh@rris.com.au. Many organisations and universities now have access!

# Contributing

Want to contribute? Great!

I'd really like to find someone with some free time and ASP.Net MVC experience to help me build out a management interface, please contact me - markh@rris.com.au.

To contribute parts:
Please ensure your 3d models are completely accurate to the manufacturer's specifications. Do not submit parts with 3d models that are not sourced from the manufacturer, or that you have not created yourself from the manufacturers drawing. Parts sourced from the manufacturer should be correctly coloured in, most manufacturers give you colourless or very oddly coloured models (Hirose and JST especially.)

Standard colours:
- Black: SolidWorks [Plastics -> Medium Gloss -> Black Medium Gloss Plastic] R:26 G:26 B:26
- Tin/Lead/other "silver" plating: SolidWorks [Metal -> Zinc -> Polished Zinc] R:204 G:206 B:204
- Gold: SolidWorks [Metal -> Gold -> Polished Gold] R:255 G:206 B:127
- White: SolidWorks [Plastics -> Medium Gloss -> White Medium Gloss Plastic] R:255 G:255 B:255

The only time you should need to stray from these colours is for LEDS. Use SolidWorks Medium Gloss plastics for these colours.
- Red: R177 B25 G25
- Green: R73 G169 B84
- Blue: R2 G61 B210
- Yellow: R255 G239 B35

If you cannot colour your 3D model, do not submit it, ask someone (me?) to colour it for you. 

All models should have fillets, drafts and features as the real device would. If you can see it in the manufacturers drawing, it should be in the model. If you can see it in a photo or render on Digi-Keys site, it should be in the model. This library should only contain high quality parts.

All footprints should match the specific parts manufacturer drawing, either as their recommended land pattern, or if that does not exist, then the generated IPC Compliant footprint that Altium made. Please ensure pin 1 is clear marked - a single dot to mark pin 1 is not clear enough, it can be easily lost on high density boards. Check what other similar parts have.

Symbols should be laid out with pins in logical groups, not as they appear on the package or in their pin order. Do not use generic symbols for specialised parts. If an ISO/ANSI standard symbol exists for a type of component (transistor for example), use it.


## Altium License

I have been asked several times if I have a legal Altium license - yes I do, my Altium user profile is here (must login to view):
https://userprofile.live.altium.com/#user/8CB7EA47-E042-494B-9BD2-69373453C04E

The profile is pretty empty, because Altium don't bother with bug fixes so I don't bother reporting them (existing DBLib issues have been around for 5+ years).

License
----

You may use this library commercially in commercial designs, however you may not charge your clients for component design time if you are just going to use a part from this library. You may not charge anyone for the footprints, 3d models or schematic symbols contained in this library. You may give you clients a copy of this library, as long as you attribute the source back to this GitHub Repository. You may not claim credit for the work in this library unless you have contributed it yourself, you must give attribution where it is due.


[//]: # (These are reference links)


