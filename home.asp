<!DOCTYPE html>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>home</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<CENTER><H1>Welcome <%=session("user_name")%> - <%=session("manager")%></H1></CENTER>
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>