<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim IMG,sqlString
sqlString="SELECT * FROM IMG WHERE IMG_ID=" & request.form("img_id")
set IMG=server.createobject("ADODB.recordset")
IMG.open sqlString,connection,2,3
if not IMG.eof then
IMG.delete
IMG.update
end if
IMG.close
set IMG=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("IMG_list.asp")
%>