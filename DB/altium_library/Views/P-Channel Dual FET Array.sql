CREATE VIEW dbo.[P-Channel Dual FET Array]
AS
SELECT        TOP (100) PERCENT PartId, Value, Comment, MfrPartNo AS [Part Number], Manufacturer, Description, Supplier1 AS [Supplier 1], Supplier1PartNo AS [Supplier Part Number 1], FootprintRef AS [Footprint Ref], 
                         FootprintPath AS [Footprint Path], SymbolRef AS [Library Ref], SymbolPath AS [Library Path], ComponentLink1Description, ComponentLink1URL, ComponentLink2Description, ComponentLink2URL, 
                         ComponentLink3Description, ComponentLink3URL, Supplier2 AS [Supplier 2], Supplier2PartNo AS [Supplier Part Number 2], FootprintRef2 AS [Footprint Ref 2], FootprintPath2 AS [Footprint Path 2], 
                         FootprintRef3 AS [Footprint Ref 3], FootprintPath3 AS [Footprint Path 3], Price, Type, DevicePackage AS [Device Package], RdsOnMax AS [Rds On (Max) at Id, Vgs], VgsthMax AS [Vgs(th) (Max) at Id], 
                         GateCharge AS [Gate Charge (Qg)], InputCapacitance AS [Input Capacitance (Ciss) at Vds], PowerMax AS [Power - Max], DrainToSourceVoltage AS [Drain to Source Voltage (Vdss)], Features, 
                         CurrentRating AS [Current Continuous Drain]
FROM            dbo.Components
WHERE        (ComponentType = 'FET') AND (ComponentSubType = 'PCH-DUAL')
GO
