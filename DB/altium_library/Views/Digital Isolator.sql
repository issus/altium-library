
CREATE VIEW [dbo].[Digital Isolator]
AS
SELECT  PartId, 
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
Price, 
Type, 
DevicePackage AS [Device Package], 
TemperatureRange AS [Operating Temperature],

Technology,
IsolatedPower AS [Isolated Power],
NumberOfOutputs AS [Number of Channels],
Inputs AS [Inputs - Side 1/Side2],
ChannelType AS [Channel Type],
VoltageIsolation AS [Voltage - Isolation],
CommonModeTransientImmunity AS [Common Mode Transient Immunity (Min)],
DataRate AS [Data Rate],
PropagationDelay AS [Propagation Delay tpLH/tpHL (Max)],
PulseWidthDistortion AS [Pulse Width Distortion (Max)],
RiseFallTime AS [Rise / Fall Time (Typ)],
Voltage AS [Voltage - Supply]


FROM            dbo.Components
WHERE        (ComponentType = 'ISO') AND (ComponentSubType = 'DIG')
