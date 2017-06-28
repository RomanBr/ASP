<!DOCTYPE HTML>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>IMG_list</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<%
dim IMG,sqlString
sqlString="SELECT * FROM IMG ORDER BY IMG_ID"
set IMG=server.createobject("ADODB.recordset")
IMG.open sqlString,connection
if session("manager") then 
%>
<CENTER><B>New Image</B><IMG CLASS="click" SRC="images/add_icon.gif" ONCLICK='document.location="IMG_add.asp";'></CENTER>
<BR>
<%  end if  %>

<TABLE ALIGN="center" BORDER="1px" CELLPADDING="3px">
<TR>
<TH>Image ID</TH>
<TH>Instrument name</TH>
<TH>Image</TH>
<% 
	if session("manager") then 
%>
<TH>&nbsp;</TH>
<TH>&nbsp;</TH>
<%  end if %>
</TR>
<% 
do until IMG.eof
%>
<TR>
<TD><%=IMG("IMG_ID")%></TD>
<TD><%=IMG("IMG_NAME")%></TD>
<TD><IMG src = "<%=IMG("IMG_Path")%>"></IMG></TD>
<% 
	if session("manager") then 
%>
<TD>
<FORM ACTION="IMG_update.asp" METHOD="post" ID="update_form<%=IMG("IMG_ID")%>">
<INPUT TYPE="hidden" NAME="img_id" VALUE="<%=IMG("IMG_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/edit_icon.gif" ONCLICK='document.getElementById("update_form<%=IMG("IMG_ID")%>").submit();'>
</TD>
<TD>
<FORM ACTION="IMG_delete_execute.asp" METHOD="post" ID="delete_form<%=IMG("IMG_ID")%>">
<INPUT TYPE="hidden" NAME="img_id" VALUE="<%=IMG("IMG_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/delete_icon.gif" ONCLICK='if(window.confirm("Are You Sure?")){document.getElementById("delete_form<%=IMG("IMG_ID")%>").submit()};'>
</TD>
<% end if %>
</TR>
<%
IMG.movenext
loop
%>
</TABLE>
<BR>
<%
IMG.close
set IMG=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>