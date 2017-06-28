<!DOCTYPE HTML>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>instr_add</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT SRC="script/script.js"></SCRIPT>
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim inst_type,sqlString
sqlString="SELECT * FROM INSTRUMENT_TYPE ORDER BY INST_TYPE_ID"
set inst_type=server.createobject("ADODB.recordset")
inst_type.open sqlString,connection
%>

<BR>
<FORM ACTION="instruments_add_execute.asp" METHOD="post" NAME="input" ONSUBMIT="if (instr_type.value=='') instr_type.value = sel.options[0].innerHTML; return insrtTestInput();">
<TABLE ALIGN="center">
<TR>
<TD>INSTR Name:</TD>
<TD><INPUT TYPE="text" MAXLENGTH="30" NAME="instr_name" ID="instr_name"></TD>
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
	<INPUT TYPE="hidden" NAME="instr_type" ID="instr_type"></TD>
</TR>
<TR>
<TD>INSTR Descrition:</TD>
<TD><textarea cols = "75" rows = "23" NAME="instr_desc" ID="instr_desc"></textarea></TD>
</TR>
<TR>
<TD><INPUT TYPE="submit" VALUE="Add Instrument"></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" ID="errorMsg" READONLY></TD>
</TR>
</TABLE>
</FORM>
<%
inst_type.close
set inst_type=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>