<!DOCTYPE HTML>
<!-- #INCLUDE FILE="include\logon.inc" -->
<HTML>
<HEAD>
<TITLE>image_add</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="css/style.css">
<SCRIPT SRC="script/script.js"></SCRIPT>
</HEAD>
<BODY>
<!-- #INCLUDE FILE="include\header.inc" -->
<!-- #INCLUDE FILE="include\menu.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<BR>
<FORM ACTION="IMG_add_execute.asp" METHOD="post" NAME="input" ONSUBMIT="return imgTestInput()">
<TABLE ALIGN="center">
<TR>
<TD>Image Name:</TD>
<TD><INPUT TYPE="text" MAXLENGTH="10" NAME="img_name" ID="img_name"></TD>
</TR>

<TR>
<TD>User Image:</TD>
<TD><input id="inputImageToLoad" type="file" onchange="load_Img(this.files);" /><BR/>
	<IMG name = "new_img"></img>
	<input type = "hidden" id = "img_src" name = "img_src" />
</TD>

</TR>
<TR>
<TR>
<TD><INPUT TYPE="submit" VALUE="Add Image"></TD>
<TD><INPUT TYPE="text" CLASS="errorMsg" SIZE="30" ID="errorMsg" READONLY></TD>
</TR>
</TABLE>
</FORM>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<!-- #INCLUDE FILE="include\footer.inc" -->
</BODY>
</HTML>