USE [Character]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteGuildStorage]    Script Date: 01/24/2018 00:27:58 ******/
DROP PROCEDURE [dbo].[usp_DeleteGuildStorage]
GO
/****** Object:  StoredProcedure [dbo].[usp_getguildstore]    Script Date: 01/24/2018 00:27:58 ******/
DROP PROCEDURE [dbo].[usp_getguildstore]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetGuildStorePermGID]    Script Date: 01/24/2018 00:27:58 ******/
DROP PROCEDURE [dbo].[usp_GetGuildStorePermGID]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertGuild]    Script Date: 01/24/2018 00:27:58 ******/
DROP PROCEDURE [dbo].[usp_InsertGuild]
GO
/****** Object:  StoredProcedure [dbo].[usp_updateguildstore]    Script Date: 01/24/2018 00:27:58 ******/
DROP PROCEDURE [dbo].[usp_updateguildstore]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateGuildStorePermGID2]    Script Date: 01/24/2018 00:27:58 ******/
DROP PROCEDURE [dbo].[usp_UpdateGuildStorePermGID2]
GO
/****** Object:  StoredProcedure [dbo].[usp_zsvr_boot]    Script Date: 01/24/2018 00:27:58 ******/
DROP PROCEDURE [dbo].[usp_zsvr_boot]
GO
/****** Object:  Table [dbo].[GuildStore]    Script Date: 01/24/2018 00:27:56 ******/
DROP TABLE [dbo].[GuildStore]
GO
/****** Object:  Table [dbo].[GuildStore]    Script Date: 01/24/2018 00:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildStore](
	[GDID] [int] NOT NULL,
	[StoreItem] [varbinary](max) NULL,
	[PermGID] [int] NOT NULL,
	[ZSID] [int] NULL,
 CONSTRAINT [PK_GuildStore] PRIMARY KEY CLUSTERED 
(
	[GDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_zsvr_boot]    Script Date: 01/24/2018 00:27:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_zsvr_boot]
	@ZSID				int
AS
SET NOCOUNT ON
UPDATE [GuildStore] SET [PermGID] = 0, [ZSID] = 0 WHERE [ZSID] = @ZSID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateGuildStorePermGID2]    Script Date: 01/24/2018 00:27:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateGuildStorePermGID2]
	@GDID				int,
	@GID				int = 0,
	@ZSID				int = 0
AS
SET NOCOUNT ON
IF EXISTS(SELECT [StoreItem] FROM [GuildStore] WHERE [GDID] = @GDID)
	BEGIN
		UPDATE [GuildStore] SET [PermGID] = @GID, [ZSID] = @ZSID WHERE [GDID] = @GDID
	END
ELSE
	BEGIN
		INSERT INTO [GuildStore]
		(
			[GDID],
			[StoreItem],
			[PermGID],
			[ZSID]
		)
		VALUES
		(
			@GDID,
			NULL,
			@GID,
			@ZSID
		)
	END
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_updateguildstore]    Script Date: 01/24/2018 00:27:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_updateguildstore]
	@GDID				int,
	@Data				varbinary(MAX) = NULL
AS
SET NOCOUNT ON
IF EXISTS(SELECT [StoreItem] FROM [GuildStore] WHERE [GDID] = @GDID)
	BEGIN
		UPDATE [GuildStore] SET [StoreItem] = @Data WHERE [GDID] = @GDID
	END
ELSE
	BEGIN
		INSERT INTO [GuildStore]
		(
			[GDID],
			[StoreItem]
		)
		VALUES
		(
			@GDID,
			@Data
		)
	END
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertGuild]    Script Date: 01/24/2018 00:27:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertGuild]
	@Name				varchar(24),
	@MName				varchar(24)
AS
SET NOCOUNT ON
IF EXISTS(SELECT [GDID] FROM [GuildInfoDB] WITH(NOLOCK) WHERE [Name] = @Name)
	BEGIN
		SELECT -1
		RETURN
	END
	
DECLARE @GDID INT = 0

INSERT INTO [GuildInfoDB]
(
	[Name],
	[MName]
)
VALUES
(
	@Name,
	@MName
)
SELECT @GDID = @@IDENTITY

IF 0 < @GDID
	BEGIN
		DELETE FROM [GuildMInfo] WHERE [GDID] = @GDID
		DELETE FROM [GuildMPosition] WHERE [GDID] = @GDID
		DELETE FROM [GuildAllyInfo] WHERE [GDID] = @GDID
		DELETE FROM [GuildBanishInfo] WHERE [GDID] = @GDID
		DELETE FROM [GuildNotice] WHERE [GDID] = @GDID
		DELETE FROM [GuildSkill] WHERE [GDID] = @GDID
		DELETE FROM [GuildStorageLog] WHERE [GDID] = @GDID
		DELETE FROM [GuildStore] WHERE [GDID] = @GDID
	END

SELECT @GDID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_GetGuildStorePermGID]    Script Date: 01/24/2018 00:27:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetGuildStorePermGID]
	@GDID				int
AS
SET NOCOUNT ON
SELECT [PermGID] FROM [GuildStore] WHERE [GDID] = @GDID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_getguildstore]    Script Date: 01/24/2018 00:27:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getguildstore]
	@GDID				int
AS
SET NOCOUNT ON
SELECT [StoreItem] FROM [GuildStore] WHERE [GDID] = @GDID
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteGuildStorage]    Script Date: 01/24/2018 00:27:58 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteGuildStorage]
	@GDID				int
AS
SET NOCOUNT ON
DELETE FROM [GuildStore] WHERE [GDID] = @GDID
DELETE FROM [GuildStorageLog] WHERE [GDID] = @GDID
SET NOCOUNT OFF
GO
