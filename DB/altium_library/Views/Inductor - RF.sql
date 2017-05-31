CREATE VIEW dbo.[Inductor - RF]
AS
SELECT        PartId, Value, Comment, MfrPartNo AS [Part Number], Manufacturer, Description, Supplier1 AS [Supplier 1], Supplier1PartNo AS [Supplier Part Number 1], FootprintRef AS [Footprint Ref], 
                         FootprintPath AS [Footprint Path], SymbolRef AS [Library Ref], SymbolPath AS [Library Path], ComponentLink1Description, ComponentLink1URL, ComponentLink2Description, ComponentLink2URL, 
                         ComponentLink3Description, ComponentLink3URL, TemperatureRange, TemperatureCoefficient, Dielectric, Tolerance, Supplier2 AS [Supplier 2], Supplier2PartNo AS [Supplier Part Number 2], 
                         FootprintRef2 AS [Footprint Ref 2], FootprintPath2 AS [Footprint Path 2], FootprintRef3 AS [Footprint Ref 3], FootprintPath3 AS [Footprint Path 3], Price, Type, QatFrequency AS [Q at Frequency], 
                         DevicePackage AS [Device Package], DCResistance AS [DC Resistance], Shielding
FROM            dbo.Components
WHERE        (ComponentType = 'IND') AND (ComponentSubType = 'RF')
GO
