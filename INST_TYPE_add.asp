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
<FORM ACTION="INST_TYPE_add_execute.asp" METHOD="post" NAME="input" ONSUBMIT="return userTestInput()">
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
	<input type = "hidden" id = "inst_type" name = "inst_type" value = "Wind"/>
</TR>
<TR>
<TD>Inst type description</TD>
<TD><textarea cols = "75" rows = "10" name = "inst_type_desc" id = "inst_type_desc"></textarea></TD>
</TR>
<TR>
<TD><INPUT TYPE="submit" VALUE="Add Inst. type"></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" ID="errorMsg" READONLY></TD>
</TR>
</TABLE>
</FORM>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>