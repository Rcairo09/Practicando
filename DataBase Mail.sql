sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO

sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE
GO

-- Create a Database Mail profile  
EXECUTE msdb.dbo.sysmail_add_profile_sp  
    @profile_name = 'Cairo R',  
    @description = 'Administrador SQL SERVER' ;  
GO

-- Grant access to the profile to the DBMailUsers role  
EXECUTE msdb.dbo.sysmail_add_principalprofile_sp  
    @profile_name = 'Cairo R',  
    @principal_name = 'public',  
    @is_default = 1 ;
GO

-- Create a Database Mail account  
EXECUTE msdb.dbo.sysmail_add_account_sp  
    @account_name = 'Cairo R',  
    @description = 'Correo',  
    @email_address = 'cairor22@outlook.com',  
    @display_name = 'Administrador',  
    @mailserver_name = 'smtp-mail.outlook.com',
    @port = 587,
    @enable_ssl = 1,
    @username = 'cairor22@outlook.com',
    @password = 'Rcairo091208' ;  
GO

-- Add the account to the profile  
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp  
    @profile_name = 'Cairo R',  
    @account_name = 'Cairo R',  
    @sequence_number =1 ;  
GO


--PARA ELIMINAR UNA CUENTA
EXECUTE msdb.dbo.sysmail_delete_profileaccount_sp @profile_name = 'Cairo Manuel Rocha'
EXECUTE msdb.dbo.sysmail_delete_principalprofile_sp @profile_name = 'Cairo Manuel Rocha'
EXECUTE msdb.dbo.sysmail_delete_account_sp @account_name = 'Cairo Manuel Rocha'
EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_name = 'Cairo Manuel Rocha'




EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'Cairo R',
     @recipients = 'cairor22@gmail.com',
     @body = 'Esta es una prueba que no esta fallida',
     @subject = 'La prueba no fue inexitosa';
GO

SELECT * FROM msdb.dbo.sysmail_event_log;