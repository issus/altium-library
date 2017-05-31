CREATE VIEW dbo.[ADC - Programmable]
AS
SELECT        TOP (100) PERCENT PartId, Value, Comment, MfrPartNo AS [Part Number], Manufacturer, Description, Supplier1 AS [Supplier 1], Supplier1PartNo AS [Supplier Part Number 1], FootprintRef AS [Footprint Ref], 
                         FootprintPath AS [Footprint Path], SymbolRef AS [Library Ref], SymbolPath AS [Library Path], ComponentLink1Description, ComponentLink1URL, ComponentLink2Description, ComponentLink2URL, 
                         ComponentLink3Description, ComponentLink3URL, Supplier2 AS [Supplier 2], Supplier2PartNo AS [Supplier Part Number 2], FootprintRef2 AS [Footprint Ref 2], FootprintPath2 AS [Footprint Path 2], 
                         FootprintRef3 AS [Footprint Ref 3], FootprintPath3 AS [Footprint Path 3], Price, Type, DevicePackage AS [Device Package], Series, NumberOfBits AS [Number of Bits], SamplingRate AS [Samping Rate], 
                         NumberOfInputs AS [Number of Inputs], InputType AS [Input Type], DataInterface AS [Data Interface], Configuration, RatioSHADC AS [Ratio - S/H:ADC], NumberADConverters AS [Number of A/D Converters], 
                         Architecture, ReferenceType AS [Reference Type], Voltage AS [Voltage - Supply, Analog], VoltageInput AS [Voltage - Supply, Digital], Features
FROM            dbo.Components
WHERE        (ComponentType = 'ADC') AND (ComponentSubType = 'PROG')
GO
