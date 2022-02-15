--
-- Oracle PL/SQL Avançado 
--
-- Seção 10 - Package UTL_MAIL
--
-- Aula 1 - Package UTL_MAIL

-- Package Package UTL_MAIL

-- LInks 

https://oracle-base.com/articles/10g/utl_mail-send-email-from-the-oracle-database

https://oracle-base.com/articles/misc/email-from-oracle-plsql

https://jiri.wordpress.com/2010/03/24/send-emails-using-utl_mail-and-google-gmail-smtp-server/

https://www.morganslibrary.org/reference/pkgs/utl_mail.html

https://www.fabioprado.net/2013/01/enviando-e-mails-com-plsql-em-bancos-de.html

https://www.fabioprado.net/2013/01/enviando-e-mails-com-plsql-em-bancos-de_9.html

http://www.dba-oracle.com/sf_ora_29278_smtp_transient_error_string_bc1.htm

UTL_MAIL Pré-requisitos

-- Conectar como SYS

@C:\app\Emilio\product\18.0.0\dbhomeXE\rdbms\admin\utlmail.sql
@C:\app\Emilio\product\18.0.0\dbhomeXE\rdbms\admin\prvtmail.plb

-- ALTER SYSTEM SET smtp_out_server='smtp.intelligenz.inf.br:25' SCOPE=BOTH;
ALTER SYSTEM SET smtp_out_server='177.185.203.253:25' SCOPE=BOTH;

grant execute on UTL_MAIL to hr, sales;
grant execute on UTL_SMTP to hr, sales;

begin
   dbms_network_acl_admin.create_acl (
        acl => 'grant_acl.xml',
        description => 'Permite enviar e-mail e usar outras packages',
        principal => 'HR', -- observe que o nome do usuário deve estar sempre em UPPERCASE 
        is_grant => TRUE,
        privilege => 'connect' -- este privilégio concedido é que permite que o usuário envie email através do servidor que será especificado no próximo bloco que chama a SP "assign_acl"
        );
  commit;
end; 

-- Concedendo privilégios via ACL

begin 
   dbms_network_acl_admin.assign_acl( 
        acl => 'grant_acl.xml',
        host => 'smtp.intelligenz.inf.br' -- preencha aqui o nome do host do servidor SMTP
        );
   commit;
end; 

begin 
   dbms_network_acl_admin.assign_acl( 
        acl => 'grant_acl.xml',
        host => '177.185.203.253' -- preencha aqui o nome do host do servidor SMTP
        );
   commit;
end; 

-- Utilizando UTL_MAIL

-- Conectar como HR

-- Enviando e-mail

BEGIN
  UTL_MAIL.send(sender     => 'emilio.scudero@intelligenz.inf.br',
                recipients => 'escudero@itarchitect.com.br',
                cc         => NULL,
                bcc        => NULL,
                subject    => 'Assunto do e-mail',
                message    => 'Mensagem do e-mail',
                mime_type  => 'text/plain; charset=iso-8859-1' );
                
END;

-- Enviando e-mail com anexo

BEGIN
  UTL_MAIL.send_attach_varchar2 (
                sender     => 'emilio.scudero@intelligenz.inf.br',
                recipients => 'escudero@itarchitect.com.br',
                cc         => NULL,
                bcc        => NULL,
                subject    => 'Assunto do e-mail',
                message    => 'Mensagem do e-mail',
                mime_type  => 'text/plain; charset=iso-8859-1',
                attachment   => 'The is the contents of the attachment.',
                att_mime_type  => 'text/plain; charset=iso-8859-1',
                att_filename => 'C:\Arquivos\exemplo.txt'    
                );
END;


