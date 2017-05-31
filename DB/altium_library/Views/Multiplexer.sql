


CREATE VIEW [dbo].[Multiplexer]
AS
SELECT        TOP (100) PERCENT PartId,
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
	TemperatureRange AS [Operating Temperature],
	DevicePackage AS [Device Package],
	MountingType AS [Mounting Type],

	SwitchCircuit AS [Switch Circuit],
	MultiplexerDemultiplexerCircuit AS [Multiplexer/Demultiplexer Circuit],
	NumberOfPorts AS [Number of Circuits],
	OnStateResistance AS [On-State Resistance (max)],
	ChannelToChannelMatching AS [Channel-to-Channel Matching (Ron)],
	VoltageInput AS [Voltage - Supply, Single (V+)],
	VoltageSupplyDual AS [Voltage - Supply, Dual (V)],
	SwitchTime AS [Switch Time (Ton, Toff) (Max)],
	Bandwidth AS [-3db Bandwidth],
	ChannelCapacitance AS [Channel Capacitance (CS(off), CD(off))],
	ChannelLeakage AS [Current - Leakage (IS(off)) (Max)]
FROM            dbo.Components
WHERE        (ComponentType = 'MUX')


