<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim inst_type,sqlString
sqlString="INSTRUMENT_TYPE" 
set inst_type=server.createobject("ADODB.recordset")
inst_type.open sqlString,connection,2,3
inst_type.addnew
inst_type("INST_TYPE").value=request.form("inst_type")
inst_type("INST_TYPE_DESC").value=request.form("inst_type_desc")
inst_type.update
inst_type.close
set inst_type=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("INST_TYPE_list.asp")
%>