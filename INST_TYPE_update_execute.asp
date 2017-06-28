<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim inst_type,sqlString
sqlString="SELECT * FROM INSTRUMENT_TYPE WHERE INST_TYPE_ID=" & request.form("INST_TYPE_ID") 
set inst_type=server.createobject("ADODB.recordset")
inst_type.open sqlString,connection,2,3
if not inst_type.eof then
inst_type("INST_TYPE").value=request.form("inst_type")
inst_type("INST_TYPE_DESC").value=request.form("inst_type_desc")
inst_type.update
end if
inst_type.close
set inst_type=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("inst_type_list.asp")
%>