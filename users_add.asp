<!DOCTYPE HTML>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>users_add</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT SRC="script/script.js"></SCRIPT>
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<FORM ACTION="users_add_execute.asp" METHOD="post" NAME="input" ONSUBMIT="return userTestInput()">
<TABLE ALIGN="center">
<TR>
<TD>User Name:</TD>
<TD><INPUT TYPE="text" MAXLENGTH="10" NAME="user_name" ID="user_name"></TD>
</TR>

<TR>
<TD>User Password:</TD>
<TD><INPUT TYPE="password" MAXLENGTH="8" NAME="user_password" ID="user_password"></TD>
</TR>
<TR>
<TD>User Manager:</TD>
<TD>No <INPUT TYPE="radio" NAME="user_manager" VALUE="false" CHECKED> Yes <INPUT TYPE="radio" NAME="user_manager" VALUE="true"></TD>
</TR>
<TR>
<TD><INPUT TYPE="submit" VALUE="Add User"></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" ID="errorMsg" READONLY></TD>
</TR>
</TABLE>
</FORM>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>