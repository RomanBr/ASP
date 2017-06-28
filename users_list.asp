<!DOCTYPE HTML>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>users_list</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<%
dim users,sqlString
sqlString="SELECT * FROM USERS ORDER BY USER_ID"
set users=server.createobject("ADODB.recordset")
users.open sqlString,connection
if session("manager") then 
%>
<CENTER><B>New User </B><IMG CLASS="click" SRC="images/add_icon.gif" ONCLICK='document.location="users_add.asp";'></CENTER>
<BR>
<%  end if  %>

<TABLE ALIGN="center" BORDER="1px" CELLPADDING="3px">
<TR>
<TH>USER ID</TH>
<TH>USER NAME</TH>
<TH>USER PASSWORD</TH>
<TH>USER MANAGER</TH>
<% 
	if session("manager") then 
%>
<TH>&nbsp;</TH>
<TH>&nbsp;</TH>
<%  end if %>
</TR>
<% 
do until users.eof
%>
<TR>
<TD><%=users("USER_ID")%></TD>
<TD><%=users("USER_NAME")%></TD>
<TD><%=users("USER_PASSWORD")%></TD>
<TD><%=users("USER_MANAGER")%></TD>
<% 
	if session("manager") then 
%>
<TD>
<FORM ACTION="users_update.asp" METHOD="post" ID="update_form<%=users("USER_ID")%>">
<INPUT TYPE="hidden" NAME="USER_ID" VALUE="<%=users("USER_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/edit_icon.gif" ONCLICK='document.getElementById("update_form<%=users("USER_ID")%>").submit();'>
</TD>
<TD>
<FORM ACTION="users_delete_execute.asp" METHOD="post" ID="delete_form<%=users("USER_ID")%>">
<INPUT TYPE="hidden" NAME="USER_ID" VALUE="<%=users("USER_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/delete_icon.gif" ONCLICK='if(window.confirm("Are You Sure?")){document.getElementById("delete_form<%=users("USER_ID")%>").submit()};'>
</TD>
<% end if %>
</TR>
<%
users.movenext
loop
%>
</TABLE>
<BR>
<%
users.close
set users=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>