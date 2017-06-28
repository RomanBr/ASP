<%
if not session("logon") then
server.transfer("default.asp")
end if
%>