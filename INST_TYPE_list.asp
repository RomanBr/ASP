<!DOCTYPE HTML>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>inst_type_list</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<%
dim inst_type,sqlString
sqlString="SELECT * FROM INSTRUMENT_TYPE ORDER BY INST_TYPE_ID"
set inst_type=server.createobject("ADODB.recordset")
inst_type.open sqlString,connection
if session("manager") then 
%>
<CENTER><B>New Inst. type </B><IMG CLASS="click" SRC="images/add_icon.gif" ONCLICK='document.location="inst_type_add.asp";'></CENTER>
<BR>
<%  end if  %>

<TABLE ALIGN="center" BORDER="1px" CELLPADDING="3px">
<TR>
<TH>INST_TYPE ID</TH>
<TH>INST. TYPE</TH>
<TH>INST_TYPE Description</TH>
<% 
	if session("manager") then 
%>
<TH>&nbsp;</TH>
<TH>&nbsp;</TH>
<%  end if %>
</TR>
<% 
do until inst_type.eof
%>
<TR>
<TD><%=inst_type("INST_TYPE_ID")%></TD>
<TD><%=inst_type("INST_TYPE")%></TD>
<TD><%=inst_type("INST_TYPE_DESC")%></TD>
<% 
	if session("manager") then 
%>
<TD>
<FORM ACTION="INST_TYPE_update.asp" METHOD="post" ID="update_form<%=inst_type("INST_TYPE_ID")%>">
<INPUT TYPE="hidden" NAME="INST_TYPE_ID" VALUE="<%=inst_type("INST_TYPE_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/edit_icon.gif" ONCLICK='document.getElementById("update_form<%=inst_type("INST_TYPE_ID")%>").submit();'>
</TD>
<TD>
<FORM ACTION="INST_TYPE_delete_execute.asp" METHOD="post" ID="delete_form<%=inst_type("INST_TYPE_ID")%>">
<INPUT TYPE="hidden" NAME="INST_TYPE_ID" VALUE="<%=inst_type("INST_TYPE_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/delete_icon.gif" ONCLICK='if(window.confirm("Are You Sure?")){document.getElementById("delete_form<%=inst_type("INST_TYPE_ID")%>").submit()};'>
</TD>
<% end if %>
</TR>
<%
inst_type.movenext
loop
%>
</TABLE>
<BR>
<%
inst_type.close
set inst_type=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>