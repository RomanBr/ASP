<%
dim countries,sqlStringCountries
sqlStringCountries="SELECT * FROM COUNTRIES ORDER BY COUNTRY_NAME"
set countries=server.createobject("ADODB.recordset")
countries.open sqlStringCountries,connection
do until countries.eof
if countries("COUNTRY_ID")=selected_country then
%>
<OPTION VALUE="<%=countries("COUNTRY_ID")%>" SELECTED><%=countries("COUNTRY_NAME")%></OPTION>
<%
else
%>
<OPTION VALUE="<%=countries("COUNTRY_ID")%>"><%=countries("COUNTRY_NAME")%></OPTION>
<%
end if
countries.movenext
loop
countries.close
set countries=nothing
%>