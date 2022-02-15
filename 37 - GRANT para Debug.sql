-- Grant privilégios para DEBUG
GRANT DEBUG CONNECT SESSION, DEBUG ANY PROCEDURE TO HR

-- Grant JDWP
BEGIN
    DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
    (
    host => '127.0.0.1',
    lower_port => null,
    upper_port => null,
    ace => xs$ace_type(privilege_list => xs$name_list('jdwp'),
    principal_name => 'hr',
    principal_type => xs_acl.ptype_db)
    );
END;