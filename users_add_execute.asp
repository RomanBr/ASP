<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim users,sqlString
sqlString="USERS" 
set users=server.createobject("ADODB.recordset")
users.open sqlString,connection,2,3
users.addnew
users("USER_NAME").value=request.form("user_name")
users("USER_PASSWORD").value=request.form("user_password")
users("USER_MANAGER").value=request.form("user_manager")
users.update
users.close
set users=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("users_list.asp")
%>