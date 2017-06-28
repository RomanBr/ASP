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
dim inst,sqlString
sqlString="SELECT * FROM INSTRUMENTS ORDER BY INSTR_TYPE"
set inst=server.createobject("ADODB.recordset")
inst.open sqlString,connection
if session("manager") then 
%>
<CENTER><B>New Instrument</B><IMG CLASS="click" SRC="images/add_icon.gif" ONCLICK='document.location="instruments_add.asp";'></CENTER>
<BR>
<%  end if  %>

<TABLE ALIGN="center" BORDER="1px" CELLPADDING="3px">
<TR>
<TH>Inst ID</TH>
<TH>Inst name</TH>
<TH>Inst type</TH>
<TH>Inst description</TH>
<% 
	if session("manager") then 
%>
<TH>&nbsp;</TH>
<TH>&nbsp;</TH>
<%  end if %>
</TR>
<% 
do until inst.eof
%>
<TR>
<TD><%=inst("INSTR_ID")%></TD>
<TD><%=inst("INSTR_NAME")%></TD>
<TD><%=inst("INSTR_TYPE")%></TD>
<TD><TEXTAREA cols = "75" rows = "25"><%=inst("INSTR_DESC")%></TEXTAREA></TD>
<% 
	if session("manager") then 
%>
<TD>
<FORM ACTION="instruments_update.asp" METHOD="post" ID="update_form<%=inst("INSTR_ID")%>">
<INPUT TYPE="hidden" NAME="inst_ID" VALUE="<%=inst("INSTR_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/edit_icon.gif" ONCLICK='document.getElementById("update_form<%=inst("INSTR_ID")%>").submit();'>
</TD>
<TD>
<FORM ACTION="inst_delete_execute.asp" METHOD="post" ID="delete_form<%=inst("INSTR_ID")%>">
<INPUT TYPE="hidden" NAME="inst_ID" VALUE="<%=inst("INSTR_ID")%>">
</FORM>
<IMG CLASS="click" SRC="images/delete_icon.gif" ONCLICK='if(window.confirm("Are You Sure?")){document.getElementById("delete_form<%=inst("INSTR_ID")%>").submit()};'>
</TD>
<% end if %>
</TR>
<%
inst.movenext
loop
%>
</TABLE>
<BR>
<%
inst.close
set inst=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>