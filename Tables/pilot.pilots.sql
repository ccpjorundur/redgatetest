CREATE TABLE [pilot].[pilots]
(
[pilotID] [int] NOT NULL IDENTITY(1, 1),
[pilotName] [nvarchar] (200) COLLATE Latin1_General_CI_AI NOT NULL,
[createDate] [datetime2] (0) NOT NULL CONSTRAINT [DF__pilots__createDa__1CF15040] DEFAULT (getutcdate()),
[logonDate] [datetime2] (0) NULL,
[logoffDate] [datetime2] (0) NULL,
[logonCount] [int] NOT NULL CONSTRAINT [DF__pilots__logonCou__1DE57479] DEFAULT ((0)),
[logonSeconds] [int] NOT NULL CONSTRAINT [DF__pilots__logonSec__1ED998B2] DEFAULT ((0)),
[visk] [money] NOT NULL CONSTRAINT [DF__pilots__visk__1FCDBCEB] DEFAULT ((0)),
[userID] [int] NULL
) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [pilots_IX_logonCount] ON [pilot].[pilots] ([logonCount]) ON [PRIMARY]

GO
ALTER TABLE [pilot].[pilots] ADD CONSTRAINT [pilots_PK] PRIMARY KEY CLUSTERED  ([pilotID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [pilots_UQ_Name] ON [pilot].[pilots] ([pilotName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [pilots_IX_User] ON [pilot].[pilots] ([userID]) ON [PRIMARY]
GO
GRANT SELECT ON  [pilot].[pilots] TO [zzp_service]
GO
