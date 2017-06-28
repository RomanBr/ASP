<!DOCTYPE html>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>users_update</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT SRC="script/script.js"></SCRIPT>
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<%
dim users,sqlString
sqlString="SELECT * FROM USERS WHERE USER_ID=" & request.form("USER_ID")
set users=server.createobject("ADODB.recordset")
users.open sqlString,connection
if not users.eof then
%>
<FORM ACTION="users_update_execute.asp" METHOD="post" NAME="input" ONSUBMIT="return userTestInput()">
<TABLE ALIGN="center">
<TR>
<TD>User Id:</TD>
<TD><INPUT TYPE="text" MAXLENGTH="9" NAME="user_id" ID="user_id" VALUE="<%=users("USER_ID")%>" READONLY></TD>
</TR>
<TR>
<TD>User Name:</TD>
<TD><INPUT TYPE="text" MAXLENGTH="20" NAME="user_name" ID="user_name" VALUE="<%=users("USER_NAME")%>"></TD>
</TR>

<TR>
<TD>User Psssword:</TD>
<TD><INPUT TYPE="password" MAXLENGTH="8" NAME="user_password" ID="user_password" VALUE="<%=users("USER_PASSWORD")%>"></TD>
</TR>
<TR>
<TD>User Manager:</TD>
<%
if users("USER_MANAGER") then
%>
<TD>No <INPUT TYPE="radio" NAME="user_manager" VALUE="false"> Yes <INPUT TYPE="radio" NAME="user_manager" VALUE="true" CHECKED></TD>
<%
else
%>
<TD>No <INPUT TYPE="radio" NAME="user_manager" VALUE="false" CHECKED> Yes <INPUT TYPE="radio" NAME="user_manager" VALUE="true"></TD>
<%
end if
%>
</TR>
<TR>
<TD><BUTTON ONCLICK="userTestInput();">Update User</BUTTON></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" READONLY ID="errorMsg"></TD>
</TR>
</TABLE>
</FORM>
<%
end if
users.close
set users=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>