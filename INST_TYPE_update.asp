<!DOCTYPE html>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>inst_type_update</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT SRC="script/script.js"></SCRIPT>
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<%
dim inst_type,sqlString
sqlString="SELECT * FROM INSTRUMENT_TYPE WHERE INST_TYPE_ID=" & request.form("INST_TYPE_ID")
set inst_type=server.createobject("ADODB.recordset")
inst_type.open sqlString,connection
if not inst_type.eof then
%>
<FORM ACTION="inst_type_update_execute.asp" METHOD="post" NAME="input" ONSUBMIT="return userTestInput()">
<input type = "hidden" name = "INST_TYPE_ID" value = "<% =request.form("INST_TYPE_ID") %>" />
<TABLE ALIGN="center">
<TR>
<TD>Inst. Type</TD>
<TD><select onchange = "inst_type.value = this.options[this.selectedIndex].innerHTML;">
		<option>Wind</option>	
		<option>Brass</option>
		<option>String Bowed</option>	
		<option>String Plucked</option>	
		<option>Percussion</option>	
		<option>Keyboard</option>
		<option>Others</option>	
	</select>
	<input type = "hidden" id = "inst_type" name = "inst_type" value = "<% =inst_type("INST_TYPE")%>"/>
</TR>
<TD>Inst type description</TD>
<TD><textarea cols = "75" rows = "10" name = "inst_type_desc" id = "inst_type_desc"><% =inst_type("INST_TYPE_DESC")%></textarea></TD>
</TR>

<TR>
<TD><BUTTON ONCLICK="userTestInput();">Update Inst. type</BUTTON></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" READONLY ID="errorMsg"></TD>
</TR>
</TABLE>
</FORM>
<%
end if
inst_type.close
set inst_type=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>