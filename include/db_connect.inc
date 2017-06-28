<%
dim connection,connectionString
connectionString="provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & server.mappath("db\project.mdb")
set connection=server.createobject("ADODB.connection")
connection.open connectionString
%>
