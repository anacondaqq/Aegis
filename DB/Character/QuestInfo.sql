USE [Character]
GO
/****** Object:  StoredProcedure [dbo].[usp_update_quest]    Script Date: 01/28/2018 03:10:38 ******/
DROP PROCEDURE [dbo].[usp_update_quest]
GO
/****** Object:  StoredProcedure [dbo].[usp_erase_quest]    Script Date: 01/28/2018 03:10:38 ******/
DROP PROCEDURE [dbo].[usp_erase_quest]
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_quest]    Script Date: 01/28/2018 03:10:38 ******/
DROP PROCEDURE [dbo].[usp_insert_quest]
GO
/****** Object:  StoredProcedure [dbo].[usp_insertNewQuest]    Script Date: 01/28/2018 03:10:38 ******/
DROP PROCEDURE [dbo].[usp_insertNewQuest]
GO
/****** Object:  StoredProcedure [dbo].[usp_selectQuest]    Script Date: 01/28/2018 03:10:38 ******/
DROP PROCEDURE [dbo].[usp_selectQuest]
GO
/****** Object:  Table [dbo].[QuestInfo]    Script Date: 01/28/2018 03:10:38 ******/
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_complete]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_activ]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_hunt_1_mob_id]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_hunt_1_count]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_hunt_2_mob_id]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_hunt_2_count]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_hunt_3_mob_id]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_hunt_3_count]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_mission_time]
GO
ALTER TABLE [dbo].[QuestInfo] DROP CONSTRAINT [DF_QuestInfo_ReceiveTime]
GO
DROP TABLE [dbo].[QuestInfo]
GO
/****** Object:  Table [dbo].[QuestInfo]    Script Date: 01/28/2018 03:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestInfo](
	[GID] [int] NOT NULL,
	[QID] [int] NOT NULL,
	[complete] [bit] NOT NULL CONSTRAINT [DF_QuestInfo_complete]  DEFAULT (0),
	[activ] [bit] NOT NULL CONSTRAINT [DF_QuestInfo_activ]  DEFAULT (1),
	[hunt_1_mob_id] [int] NULL CONSTRAINT [DF_QuestInfo_hunt_1_mob_id]  DEFAULT (0),
	[hunt_1_count] [smallint] NULL CONSTRAINT [DF_QuestInfo_hunt_1_count]  DEFAULT (0),
	[hunt_2_mob_id] [int] NULL CONSTRAINT [DF_QuestInfo_hunt_2_mob_id]  DEFAULT (0),
	[hunt_2_count] [smallint] NULL CONSTRAINT [DF_QuestInfo_hunt_2_count]  DEFAULT (0),
	[hunt_3_mob_id] [int] NULL CONSTRAINT [DF_QuestInfo_hunt_3_mob_id]  DEFAULT (0),
	[hunt_3_count] [smallint] NULL CONSTRAINT [DF_QuestInfo_hunt_3_count]  DEFAULT (0),
	[mission_time] [datetime] NULL CONSTRAINT [DF_QuestInfo_mission_time]  DEFAULT (0),
	[ReceiveTime] [datetime] NOT NULL CONSTRAINT [DF_QuestInfo_ReceiveTime]  DEFAULT (getdate()),
	[CompleteTime] [datetime] NULL,
 CONSTRAINT [PK_QuestInfo] PRIMARY KEY CLUSTERED 
(
	[GID] ASC,
	[QID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_selectQuest]    Script Date: 01/28/2018 03:10:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_selectQuest]
	@gid			int
AS
BEGIN
SET NOCOUNT ON
SELECT qid, complete, activ, hunt_1_mob_id, hunt_1_count, hunt_2_mob_id, hunt_2_count, hunt_3_mob_id, hunt_3_count, mission_time FROM QuestInfo WHERE gid=@gid
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertNewQuest]    Script Date: 01/28/2018 03:10:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_insertNewQuest]
	@gid 		INT,
	@qid 		INT,
	@complete 	INT,
	@activ		INT,
	@hm_1_id	INT,
	@hm_1_count	INT,
	@hm_2_id	INT,
	@hm_2_count	INT,
	@hm_3_id	INT,
	@hm_3_count	INT,
	@mission_time 	DATETIME
	
as
set nocount on
	insert into Questinfo(GID, QID, complete, activ, 
			hunt_1_mob_id, hunt_1_count, 
			hunt_2_mob_id, hunt_2_count, 
			hunt_3_mob_id, hunt_3_count,
			 mission_time, 
			ReceiveTime, CompleteTime
	)
	
	values(	@gid,	@qid,	@complete,	@activ,
		@hm_1_id,	@hm_1_count,
		@hm_2_id,	@hm_2_count,
		@hm_3_id,	@hm_3_count,
		@mission_time, GetDate(), GetDate()
	)

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_quest]    Script Date: 01/28/2018 03:10:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_insert_quest]
	@gid			int,
	@qid			int,  
	@activ			int,  
	@complete		int,  
	@hm_1_id		int,  
	@hm_1_count		int,  
	@hm_2_id		int,  
	@hm_2_count		int,  
	@hm_3_id		int,  
	@hm_3_count		int,  
	@mission_time		datetime
AS
BEGIN
SET NOCOUNT ON
INSERT INTO QuestInfo(GID, QID, complete, activ, hunt_1_mob_id, hunt_1_count, hunt_2_mob_id, hunt_2_count, hunt_3_mob_id, hunt_3_count, mission_time, ReceiveTime)
VALUES(@gid, @qid, @complete, @activ, @hm_1_id, @hm_1_count, @hm_2_id, @hm_2_count, @hm_3_id, @hm_3_count, @mission_time, getdate())
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_erase_quest]    Script Date: 01/28/2018 03:10:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[usp_erase_quest]
	@gid			int,
	@qid			int
AS
BEGIN
SET NOCOUNT ON
DELETE FROM QuestInfo WHERE gid=@gid AND qid=@qid
SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[usp_update_quest]    Script Date: 01/28/2018 03:10:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_update_quest]
	@gid			int,
	@qid			int,
	@complete		bit,
	@activ			bit,
	@hm_1_id		int,
	@hm_1_count		int,
	@hm_2_id		int,
	@hm_2_count		int,
	@hm_3_id		int,
	@hm_3_count		int,
	@mission_time		datetime
AS
BEGIN
SET NOCOUNT ON
DECLARE @count int
SET @count = 0
SELECT @count = count(*) FROM QuestInfo WHERE gid=@gid AND qid=@qid
IF (@count < 1)
	BEGIN
		EXEC usp_insert_quest @gid, @qid, @complete, @activ, @hm_1_id, @hm_1_count, @hm_2_id, @hm_2_count, @hm_3_id, @hm_3_count, @mission_time
	END
ELSE
	BEGIN
		IF @complete = 0
			BEGIN
				UPDATE QuestInfo SET complete=0, activ=@activ, hunt_1_mob_id=@hm_1_id, hunt_1_count=@hm_1_count, hunt_2_mob_id=@hm_2_id, hunt_2_count=@hm_2_count, hunt_3_mob_id=@hm_3_id, hunt_3_count=@hm_3_count, mission_time=@mission_time
				WHERE gid=@gid and qid=@qid
			END
		ELSE
			BEGIN
				UPDATE QuestInfo SET complete=1, activ=@activ, hunt_1_mob_id=@hm_1_id, hunt_1_count=@hm_1_count, hunt_2_mob_id=@hm_2_id, hunt_2_count=@hm_2_count, hunt_3_mob_id=@hm_3_id, hunt_3_count=@hm_3_count, mission_time=@mission_time, CompleteTime=getdate()
				WHERE gid=@gid AND qid=@qid
			END
		END
SET NOCOUNT OFF
END

GRANT EXEC ON usp_selectQuest TO Character
GO
