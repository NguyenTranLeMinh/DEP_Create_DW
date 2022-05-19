USE [Asm1_DEP302x]
GO

-- Check sa has owner_sid permissions, if not then change db owner.
IF (select SUSER_SNAME(owner_sid) from sys.databases WHERE NAME='Asm1_DEP302x') <> 'sa'
BEGIN
   EXEC sp_changedbowner 'sa'
END
GO
 
-- Check Asm1_DEP302x is not already CDC enabled, if not then enable CDC for the database
if (select is_cdc_enabled from sys.databases WHERE NAME='Asm1_DEP302x') = 'false'
BEGIN
   EXEC sys.sp_cdc_enable_db
END
GO
 
-- Check [dbo].[Raw_Data] is not already CDC enabled, if not then enable CDC for the table
if (select is_tracked_by_cdc from sys.tables WHERE SCHEMA_NAME(schema_id)='dbo' and  NAME = 'Raw_Data') = 'false'
BEGIN
EXEC sys.sp_cdc_enable_table
   @source_schema = N'dbo',
   @source_name   = N'Raw_Data',
   @role_name     = NULL,
   @supports_net_changes = 1
END
GO