

CREATE VIEW [dbo].[Connector - Backplane]
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
	Supplier2 AS [Supplier 3],
	Supplier2PartNo AS [Supplier Part Number 3],
	Supplier2 AS [Supplier 4],
	Supplier2PartNo AS [Supplier Part Number 4],
	FootprintRef2 AS [Footprint Ref 2],
	FootprintPath2 AS [Footprint Path 2],
	FootprintRef3 AS [Footprint Ref 3],
	FootprintPath3 AS [Footprint Path 3],
	Price,
	Type,
	PartStatus AS [Part Status],

	Series,
	NumberOfPositions AS [Number Of Positions],
	Pitch,
	NumberOfLevels AS [Number Of Rows],
	Style,
	MountingType AS [Mounting Type],
	Termination,
	Features,
	ContactFinish AS [Contact Finish]
FROM            dbo.Components
WHERE        (ComponentType = 'CONN') AND (ComponentSubType = 'BPLANE')