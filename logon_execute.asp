<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
session("logon")=false
session("user_name")=""
dim users,sqlString
sqlString="SELECT * FROM USERS WHERE USER_ID=" & request.form("user_id") 
set users=server.createobject("ADODB.recordset")
users.open sqlString,connection
if not users.eof then
'User Found, compare password
if request.form("user_password") = users("USER_PASSWORD") then
session("logon")=true
session("user_name") = users("USER_NAME")
session("manager") = users("USER_MANAGER") 
if users("USER_MANAGER") then server.transfer("home.asp")
if NOT users("USER_MANAGER") then response.Redirect("default_client.asp")
end if
end if
users.close
set users=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("default.asp")
%>