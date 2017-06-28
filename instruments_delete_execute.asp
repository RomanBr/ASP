<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim users,sqlString
sqlString="SELECT * FROM USERS WHERE USER_ID=" & request.form("user_id")
set users=server.createobject("ADODB.recordset")
users.open sqlString,connection,2,3
if not users.eof then
users.delete
users.update
end if
users.close
set users=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
server.transfer("users_list.asp")
%>