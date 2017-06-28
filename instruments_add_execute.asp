<!-- #INCLUDE FILE="include\logon.inc" -->
<!-- #INCLUDE FILE="include\db_connect.inc" -->
<%
dim instr,sqlString
sqlString="INSTRUMENTS" 
set instr=server.createobject("ADODB.recordset")
instr.open sqlString,connection,2,3
instr.addnew
instr("INSTR_NAME").value=request.form("instr_name")
instr("INSTR_TYPE").value=request.form("instr_type")
instr("INSTR_DESC").value=request.form("instr_desc")
instr.update
instr.close
set instr=nothing
%>
<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
<%
response.Redirect("instruments_list.asp")
%>