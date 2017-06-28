<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>default</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT TYPE="text/javascript" SRC="script/script.js"></SCRIPT>
</HEAD>
<BODY>

<!-- #INCLUDE FILE="include\header.inc" -->

<BR>
<FORM ACTION="logon_execute.asp" METHOD="post" ONSUBMIT="return userTestLogon();">
<TABLE>
<TR>
<TD>ID:</TD><TD><INPUT TYPE="text" MAXLENGTH="9" NAME="user_id" ID="user_id"></TD>
</TR>
<TR>
<TD>Password:</TD><TD><INPUT TYPE="password" MAXLENGTH="8" NAME="user_password" ID="user_password"></TD>
</TR>
<TR>
<TD><INPUT TYPE="submit" VALUE="Logon"></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" ID="errorMsg" READONLY></TD>
</TR>
</TABLE>
</FORM>

<!-- #INCLUDE FILE="include\footer.inc" -->

</BODY>
</HTML>