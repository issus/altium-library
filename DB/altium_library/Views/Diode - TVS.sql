
CREATE VIEW [dbo].[Diode - TVS]
AS
SELECT        
PartId, 
Comment, 
MfrPartNo AS [Part Number], 
Manufacturer, 
Description, 
Supplier1 AS [Supplier 1], 
Supplier1PartNo AS [Supplier Part Number 1], 
FootprintRef AS [Footprint Ref], 
FootprintPath AS [Footprint Path], 
SymbolRef AS [Library Ref], 
SymbolPath AS [Library Path], 
ComponentLink1Description, 
ComponentLink1URL, 
ComponentLink2Description, 
ComponentLink2URL, 
ComponentLink3Description, 
ComponentLink3URL, 
TemperatureRange AS [Operating Temperature], 
Supplier2 AS [Supplier 2], 
Supplier2PartNo AS [Supplier Part Number 2], 
FootprintRef2 AS [Footprint Ref 2], 
FootprintPath2 AS [Footprint Path 2],
FootprintRef3 AS [Footprint Ref 3], 
FootprintPath3 AS [Footprint Path 3], 
Price, 
Type, 
DevicePackage AS [Device Package], 

UnidirectionalChannels AS [Unidirectional Channels],
BidirectionalChannels AS [Bidirectional Channels],
PowerPeakPulse AS [Power - Peak Pulse], 
CurrentPulsePeak AS [Current - Peak Pulse], 
VoltageClamping AS [Voltage (Clamping)], 
VoltageBreakdown AS [Voltage (Breakdown)], 
VoltageReverseStandoff AS [Voltage (Reverse Standoff)],
CapacitanceAtFrequency AS [Capacitance @ Frequency]

FROM            dbo.Components
WHERE        (ComponentType = 'DIO') AND (ComponentSubType = 'TVS')

GO
