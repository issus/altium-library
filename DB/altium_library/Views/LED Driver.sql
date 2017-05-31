

CREATE VIEW [dbo].[LED Driver]
AS
SELECT        PartId, 
Value, 
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
Supplier2 AS [Supplier 2], 
Supplier2PartNo AS [Supplier Part Number 2], 
FootprintRef2 AS [Footprint Ref 2], 
FootprintPath2 AS [Footprint Path 2], 
FootprintRef3 AS [Footprint Ref 3], 
FootprintPath3 AS [Footprint Path 3], 
DevicePackage AS [Device Package],
Price, 
Type, 
Series,
Applications,
TemperatureRange AS [Operating Temperature],
Topology,
InternalSwitches AS [Internal Switch(s)],
NumberOfOutputs AS [Number Of Outputs],
VoltageInputMin AS [Voltage - Supply (Min)],
VoltageInputMax AS [Voltage - Supply (Max)],
VoltageOutput AS [Voltage - Output],
CurrentOutput AS [Current Output / Channel],
Frequency


FROM            dbo.Components
WHERE        (ComponentType = 'LEDDRV')