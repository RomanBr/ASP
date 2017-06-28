<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim INST_TYPE,sqlString
sqlString="SELECT * FROM INSTRUMENT_TYPE WHERE INST_TYPE_ID=" & request.form("INST_TYPE_ID")
set INST_TYPE=server.createobject("ADODB.recordset")
INST_TYPE.open sqlString,connection,2,3
if not INST_TYPE.eof then
INST_TYPE.delete
INST_TYPE.update
end if
INST_TYPE.close
set INST_TYPE=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("INST_TYPE_list.asp")
%>