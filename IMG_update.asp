<!DOCTYPE HTML>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>image_update</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT SRC="script/script.js"></SCRIPT>
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<%
dim IMG,sqlString
sqlString="SELECT * FROM IMG WHERE IMG_ID = "  & request.form("img_id")
set IMG=server.createobject("ADODB.recordset")
IMG.open sqlString,connection
%>
<FORM ACTION="IMG_update_execute.asp" METHOD="post" NAME="input" ONSUBMIT="return imgTestInput()">
<input type = "hidden" name = "img_id" value = "<% =request.form("img_id") %>" />
<TABLE ALIGN="center">
<TR>
<TD>Image Name:</TD>
<TD><INPUT TYPE="text" MAXLENGTH="20" NAME="img_name" ID="img_name" value = "<%=IMG("IMG_NAME")%>"></TD>
</TR>

<TR>
<TD>Image:</TD>
<TD><input id="inputImageToLoad" type="file" onchange="load_Img(this.files);" /><BR/>
	<IMG name = "new_img" src = "<%=IMG("IMG_Path")%>"></img>
	<input type = "hidden" id = "img_src" name = "img_src" value = "<%=IMG("IMG_Path")%>" />
</TD>

</TR>
<TR>
<TR>
<TD>
<!--<INPUT TYPE="button" VALUE="Click" onclick = "alert(img_id.value);">-->
<INPUT TYPE="submit" VALUE="Update Image"></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" ID="errorMsg" READONLY></TD>
</TR>
</TABLE>
</FORM>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>