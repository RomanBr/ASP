<%
dim towns,sqlStringTowns
sqlStringTowns="SELECT * FROM TOWNS INNER JOIN COUNTRIES ON TOWNS.TOWN_COUNTRY_ID=COUNTRIES.COUNTRY_ID ORDER BY TOWN_NAME,COUNTRY_NAME"
set towns=server.createobject("ADODB.recordset")
towns.open sqlStringTowns,connection
do until towns.eof
town_description=towns("TOWN_NAME") & " / " & towns("COUNTRY_NAME")
if towns("TOWN_ID")=selected_town then
%>
<OPTION VALUE="<%=towns("TOWN_ID")%>" SELECTED><%=town_description%></OPTION>
<%
else
%>
<OPTION VALUE="<%=towns("TOWN_ID")%>"><%=town_description%></OPTION>
<%
end if
towns.movenext
loop
towns.close
set towns=nothing
%>