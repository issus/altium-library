CREATE TABLE [dbo].[DefaultMappings] (
    [MappingId]       INT           IDENTITY (1, 1) NOT NULL,
    [SupplierField]   NVARCHAR (50) NOT NULL,
    [InsertParameter] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_DefaultMappings] PRIMARY KEY CLUSTERED ([MappingId] ASC)
);

