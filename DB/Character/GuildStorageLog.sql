USE [Character]
GO
/****** Object:  StoredProcedure [dbo].[usp_getGuildStorageLog2]    Script Date: 01/24/2018 00:21:06 ******/
DROP PROCEDURE [dbo].[usp_getGuildStorageLog2]
GO
/****** Object:  StoredProcedure [dbo].[usp_insertGuildStorageLog]    Script Date: 01/24/2018 00:21:06 ******/
DROP PROCEDURE [dbo].[usp_insertGuildStorageLog]
GO
/****** Object:  Table [dbo].[GuildStorageLog]    Script Date: 01/24/2018 00:21:05 ******/
DROP TABLE [dbo].[GuildStorageLog]
GO
/****** Object:  Table [dbo].[GuildStorageLog]    Script Date: 01/24/2018 00:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuildStorageLog](
	[Idx] [bigint] IDENTITY(1,1) NOT NULL,
	[GID] [int] NOT NULL,
	[Name] [varchar](24) NOT NULL,
	[GDID] [int] NOT NULL,
	[ItemID] [smallint] NOT NULL,
	[Count] [int] NOT NULL,
	[Action] [bit] NOT NULL,
	[RefiningLevel] [int] NOT NULL,
	[SerialNum] [bigint] NOT NULL,
	[IsIdentified] [bit] NOT NULL,
	[ItemType] [smallint] NOT NULL,
	[Slot1] [smallint] NOT NULL,
	[Slot2] [smallint] NOT NULL,
	[Slot3] [smallint] NOT NULL,
	[Slot4] [smallint] NOT NULL,
	[RegDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GuildStorageLog] PRIMARY KEY CLUSTERED 
(
	[Idx] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_insertGuildStorageLog]    Script Date: 01/24/2018 00:21:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_insertGuildStorageLog]
	@GID				int,
	@Name				varchar(24),
	@GDID				int,
	@ItemID				smallint,
	@Count				int,
	@Action				bit,
	@RefiningLevel		int,
	@SerialNum			bigint,
	@IsIdentified		bit,
	@ItemType			smallint,
	@Slot1				smallint,
	@Slot2				smallint,
	@Slot3				smallint,
	@Slot4				smallint,
	@LogTM				int
AS
SET NOCOUNT ON
DELETE FROM [GuildStorageLog] WHERE RegDate < CONVERT(varchar(30), GETDATE() -93, 112)
INSERT INTO [GuildStorageLog]
VALUES
(
	@GID,
	@Name,
	@GDID,
	@ItemID,
	@Count,
	@Action,
	@RefiningLevel,
	@SerialNum,
	@IsIdentified,
	@ItemType,
	@Slot1,
	@Slot2,
	@Slot3,
	@Slot4,
	DATEADD(S, @LogTM, DATEADD(S, DATEDIFF(S, GETUTCDATE(), GETDATE()), '19700101'))
)
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_getGuildStorageLog2]    Script Date: 01/24/2018 00:21:06 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getGuildStorageLog2]
	@GDID				int,
	@RecentIdx			int
AS
SET NOCOUNT ON
IF 0 = @RecentIdx
	BEGIN
		SELECT TOP 100 [Idx], [Name], [ItemID], [Count], [Action], [RefiningLevel], [IsIdentified], [ItemType], [Slot1], [Slot2], [Slot3], [Slot4], CONVERT(VARCHAR(24), [RegDate], 20), [GID]
		FROM [GuildStorageLog] WITH(NOLOCK) WHERE [GDID] = @GDID ORDER BY [Idx] DESC
	END
ELSE
	BEGIN
		SELECT TOP 100 [Idx], [Name], [ItemID], [Count], [Action], [RefiningLevel], [IsIdentified], [ItemType], [Slot1], [Slot2], [Slot3], [Slot4], CONVERT(VARCHAR(24), [RegDate], 20), [GID]
		FROM
		(
			SELECT TOP 10 [Idx], [Name], [ItemID], [Count], [Action], [RefiningLevel], [IsIdentified], [ItemType], [Slot1], [Slot2], [Slot3], [Slot4], [RegDate], [GID]
			FROM [GuildStorageLog] WITH(NOLOCK) WHERE [GDID] = @GDID AND [Idx] > @RecentIdx ORDER BY [Idx] ASC
		)V ORDER BY [Idx] DESC
	END
SET NOCOUNT OFF
GO
