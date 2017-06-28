<!DOCTYPE html>
<!-- #INCLUDE FILE="include\logon.inc" -->
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="Musiqua">
		<meta name="author" content="Roman Braverman">
        <link rel="shortcut icon" href="IMG/Music_Notes.jpg">
		<title>Darbouka</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		
		<link rel="stylesheet" title="Default Style" href="CSS/Main.css">
		<link rel="stylesheet" title="Default Style" href="CSS/Main1.css">
		
	</head>
	<body data-spy="scroll" data-target="#blogMenu" itemscope itemtype="http://schema.org/WebApplication">
		<!-- #INCLUDE FILE="include\db_connect.inc" -->
		<BUTTON ONCLICK = "alert(img[0].src);">GET</BUTTON>		
		<% dim inst,sqlString
		sqlString="SELECT * FROM INSTRUMENTS WHERE INSTR_NAME = '" & Request.QueryString("name") & "'"
		set inst=server.createobject("ADODB.recordset")
		inst.open sqlString,connection %>
		
		<%=inst("INSTR_DESC")%>
		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<%
			inst.close
			set inst=nothing
		%>
		
	<script>
	 <% dim IMG
		sqlString="SELECT * FROM IMG WHERE IMG_NAME = '" & Request.QueryString("name") & "'"
		set IMG=server.createobject("ADODB.recordset")
		IMG.open sqlString,connection %>

	 var img = document.getElementsByTagName("img");
	 img[0].src = "<%=IMG("IMG_Path")%>"
	
	<% IMG.close
		set IMG=nothing
	%>

	</script>
	<!-- #INCLUDE FILE="include\db_disconnect.inc" -->
	</body>
</html>
