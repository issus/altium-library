
![Library Component Count](https://img.shields.io/endpoint?style=for-the-badge&url=https%3A%2F%2Fportal.altiumlibrary.com%2Fapi%2Fdata%2FComponentCount%2FComponents) ![Built for Altium](https://img.shields.io/badge/platform-altium-yellow?style=for-the-badge) [![Website](https://img.shields.io/website?down_color=lightgrey&down_message=offline&label=website&style=for-the-badge&up_color=green&up_message=online&url=https%3A%2F%2Faltiumlibrary.com)](https://altiumlibrary.com) [![Portal](https://img.shields.io/website?down_color=lightgrey&down_message=offline&label=portal&style=for-the-badge&up_color=green&up_message=online&url=https%3A%2F%2Fportal.altiumlibrary.com)](https://portal.altiumlibrary.com)

# Celestial Altium Library
The Celestial Altium Library is a massive, free, open source database library for Altium Designer created by [Altium Industry Expert Mark Harris](https://resources.altium.com/authors/mark-harris). The database is hosted on a dedicated cloud platform built for the library, to ensure you always have the latest components.

The Celestial Altium Library was designed from conception to contain high-quality data, with accurate footprints and exceptional 3D models. It is free to use, and open source. The Celestial Altium Library contains a vast array of components already, and is under active development to expand component coverage.

Build your next project faster, create beautiful schematics and stunning 3D PCBs with the Celestial Altium Library.

Love electronics? Need help with the library? Join us on Discord!

[![Discord](https://img.shields.io/discord/561626546083856405?logo=discord&style=for-the-badge)](https://discord.gg/MEQ5Xe5)

# Database Access
You can register for free access on the [Altium Library Portal](http://portal.altiumlibrary.com/Identity/Account/Login). 

For full instructions, see the [Celestial Library Website](https://altiumlibrary.com/GetStarted).


# Why use an Altium DBLib over an Integrated Library?


The Celestial Altium Library database is cloud-hosted; as new components are added to the library, they are immediately available in Altium. The library's schematic symbols and PCB footprints are hosted in GitHub allowing you to quickly clone the latest library files to your computer if they are needed for the new components.  
  
A database library creates the linkage between a schematic symbol and PCB footprint on your computer, and also provides all of the technical parameters and pricing data for a component. This connection allows the library to contain every real-world capacitor, resistor, and other component types, with relatively few files on your computer.  

Altium Database libraries make you design your schematic with the part you are going to use, rather than a generic schematic symbol/footprint combination. Rather than selecting "RJ45 Jack," you instead choose Amphenol Commercial Products part number RJCSE538001. This component selection is reflected in your Bill of Materials - the entire BOM fills itself out, meaning no more trying to remember exactly what part you intended to put in there was, or what voltage that capacitor was. Even if you are using an ActiveBOM in your project, the library will save you time as you do not need to set component properties after placing each component.  
  
Without the Celestial Altium Library, you might find yourself looking for passive components on supplier websites to find a low-cost option, and then searching for those parts in the Manufacturer Part Search panel in Altium. Once you find the part you want, you can assign the properties to the schematic symbol in your project. With the library, however, you can rapidly sort through thousands of components to narrow down the list of relevant parts and then place the cheapest in-stock option directly into your design - all with Altium. Components added with the library will generate an excellent bill of materials for your project with or without ActiveBOM.  
  
Save time on the design, and significantly reduce errors by placing real-world parts directly from the library.

# Why use the  Library?

## Data

All components in the database contain all relevant technical parameters, allowing you to search/filter within Altium for the part you require. If your design calls for a 1.0uF, 25V 0603 ceramic capacitor, open the 0603 ceramic capacitors list, group by value, then by voltage, and sort by price to find the cheapest option available.

![enter image description here](https://altiumlibrary.com/media/8de9f75f-1d8c-437a-89cf-350c035d0fc8/W83Rmw/Features/wnShbBZP42.gif)

Each component in the database contains a link to supplier pages and a link to the datasheet allowing rapid access to reference materials. As all technical parameters and pricing data is available, your BOM can be populated automatically with all relevant information for purchasing.

### Footprints
Every component has a footprint that matches the manufacturer's recommended footprint, or if a recommendation is not available, an IPC Compliant footprint for the specific package sizing. Only highly standardized passive components utilize generic footprints; all other parts have manufacturer-specific land patterns.

Each footprint features a high quality, dimensionally accurate, correctly colored 3D model. Every 3D model in the library is created from scratch to the manufacturer's drawings. This attention to detail ensures excellent 3D collision checking and eases MCAD integration when designing enclosures and associated parts.  
  
Every part's center position is where a pick and place machine's head should collect the component. For companies running an in house Pick and Place machine, this is very convenient and allows faster machine setup. Your pick and place export list for products built with the Celestial Altium Library contains centers in the correct location.

### Symbols 
Library symbols are standardized as much as possible. This standardization ensures you will find pins where you expect them to be, such as VCC in the top left, GND in the bottom left, user function pins on the right (controllable inputs/outputs). Standard protocols like SPI have the pins in the same order in every part where other library standards don't have a higher priority. All components within a database category have similar pin layouts/groupings where possible. This preciseness makes it extremely easy to read and follow schematics created with the library.  
  
All passive components, such as resistors and capacitors, all have the same size symbol lead span, keeping your schematics tidy.

# Sponsors
[![Cofactr sponsors Altium Library](https://github.com/issus/altium-library/blob/master/images/Cofactr_logo_clover_300px.png?raw=true)](https://www.cofactr.com/)

$100/mo Sponsor: [Cofactr’s](https://www.cofactr.com/) **procurement** tools, **inventory** management, and automated **kitting** get you to manufacturing faster and easier than ever.

# Contributing
Want to contribute? Great!
Join us on Discord and let the community know what you can do, we'll find something for you!

## License
The library does not follow a specific open-source license. The Celestial Altium license is simple:

-   You may use this library commercially in contract work, products for sale, or any other commercial project not related to selling footprints/symbols/3D models.
-   You may not charge anyone for the footprints, 3D models, or schematic symbols contained in this library.
-   You should give your clients a copy of this library, and you must attribute the source back to this website.
-   You may not claim credit for the work in this library unless you have contributed it yourself.

----

[//]: # (These are reference links)


