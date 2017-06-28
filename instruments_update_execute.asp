<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim inst,sqlString
sqlString="SELECT * FROM INSTRUMENTS WHERE INSTR_ID=" & request.form("inst_ID") 
set inst=server.createobject("ADODB.recordset")
inst.open sqlString,connection,2,3
if not inst.eof then
inst("INSTR_NAME").value=request.form("instr_name")
inst("INSTR_TYPE").value=request.form("instr_type")
inst("INSTR_DESC").value=request.form("instr_desc")
inst.update
end if
inst.close
set inst=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("instruments_list.asp")
%>