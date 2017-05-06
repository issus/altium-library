
CREATE VIEW [dbo].[Interface - Differential Signal]
AS
SELECT TOP (100) PERCENT
  PartId,
  Value,
  Comment,
  MfrPartNo AS [Part Number],
  Manufacturer,
  Description,
  Supplier1 AS [Supplier 1],
  Supplier1PartNo AS [Supplier Part Number 1],
  Supplier2 AS [Supplier 2],
  Supplier2PartNo AS [Supplier Part Number 2],
  Supplier3 AS [Supplier 3],
  Supplier3PartNo AS [Supplier Part Number 3],
  Supplier4 AS [Supplier 4],
  Supplier4PartNo AS [Supplier Part Number 4],
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
  FootprintRef2 AS [Footprint Ref 2],
  FootprintPath2 AS [Footprint Path 2],
  FootprintRef3 AS [Footprint Ref 3],
  FootprintPath3 AS [Footprint Path 3],
  Price,
  Type,
  Series,
  PartStatus AS [Part Status],
  Protocol,
  NumberOfDriversReceivers AS [Number of Drivers/Receivers],
  Duplex,
  ReceiverHysteresis AS [Receiver Hysteresis],
  DataRate AS [Data Rate],
  Voltage AS [Voltage - Supply],

  DevicePackage AS [Device Package],
  TemperatureRange AS [Operating Temperature]
FROM dbo.Components
WHERE (ComponentType = 'INTERFACE')
AND (ComponentSubType = 'TXR')