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
dim inst,sqlString
sqlString="SELECT * FROM INSTRUMENTS WHERE INSTR_ID=" & request.form("inst_ID")
set inst=server.createobject("ADODB.recordset")
inst.open sqlString,connection

dim inst_type
sqlString="SELECT * FROM INSTRUMENT_TYPE ORDER BY INST_TYPE_ID"
set inst_type=server.createobject("ADODB.recordset")
inst_type.open sqlString,connection

if not inst.eof then
%>
<FORM ACTION="instruments_update_execute.asp" METHOD="post" NAME="input" ONSUBMIT="if (instr_type.value=='') instr_type.value = sel.options[0].innerHTML; return insrtTestInput();">
<INPUT TYPE="hidden" NAME="inst_ID" VALUE="<%=inst("INSTR_ID")%>">
<TABLE ALIGN="center">
<TR>
<TD>INSTR Name:</TD>
<TD><INPUT TYPE="text" MAXLENGTH="30" NAME="instr_name" ID="instr_name" value = "<%=inst("INSTR_NAME")%>"/></TD>
</TR>
<TD>INSTR Type:</TD>
<TD><select name = "sel" onchange = "instr_type.value = this.options[this.selectedIndex].innerHTML;">
	<%  do until inst_type.eof %>
	<option><%=inst_type("INST_TYPE")%></option>
	<%
		inst_type.movenext
		loop
	%>
	</select>
	<INPUT TYPE="hidden" NAME="instr_type" ID="instr_type" value = '<% =inst("INSTR_TYPE")%>'></TD>
</TR>
<TR>
<TD>INSTR desc:</TD>
<TD><TEXTAREA cols = "75" rows = "25" name = "instr_desc" id = "instr_desc"><%=inst("INSTR_DESC")%></TEXTAREA></TD>
</TR>
<TD><BUTTON ONCLICK="userTestInput();">Update Instrument</BUTTON></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" READONLY ID="errorMsg"></TD>
</TR>
</TABLE>
</FORM>
<%
end if
inst.close
set inst=nothing

inst_type.close
set inst_type=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>