<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim IMG,sqlString
sqlString="IMG" 
set IMG=server.createobject("ADODB.recordset")
IMG.open sqlString,connection,2,3
IMG.addnew
IMG("IMG_NAME").value=request.form("img_name")
IMG("IMG_Path").value=request.form("img_src")
IMG.update
IMG.close
set IMG=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("IMG_list.asp")
%>