USE [msdb]
GO
EXEC msdb.dbo.sp_add_alert @name = N'JobStatus_DBA',
        @message_id=0,
        @severity=10,
        @enabled=1,
        @delay_between_responses=1800,
        @include_event_description_in=1,
        @notification_message=N'Job failed on Production System (SQLMirror)',
        @event_description_keyword='Job Failed'
GO
