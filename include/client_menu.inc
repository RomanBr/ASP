		<% dim inst_type,sqlString
		sqlString="SELECT * FROM INSTRUMENT_TYPE"
		set inst_type=server.createobject("ADODB.recordset")
		inst_type.open sqlString,connection %>

		<nav  class="navbar navbar-inverse navbar-fixed-top" role="navigation" title = "Navigation menu">
			<div class="navbar-header" title = "Hide/Show content menu">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="javascript:void(0);" onclick = "hideshowBlogMenu();">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
				</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active" title = "Home"><a href="Home.asp" target = "iframe">
						<span class="glyphicon glyphicon-home"> Home</span></a>
					</li>
					<% do until inst_type.eof %>
					<li class="dropdown" title = "<%=inst_type("INST_TYPE")%> instruments">
						<a class="dropdown-toggle" data-toggle="dropdown" "javascript:void(0);"><%=inst_type("INST_TYPE")%>
						<span class="caret"></span></a>
						<ul class="dropdown-menu">
						
						<% dim inst
						sqlString="SELECT * FROM INSTRUMENTS WHERE INSTR_TYPE = '" + inst_type("INST_TYPE") + "'"
						set inst=server.createobject("ADODB.recordset")
						inst.open sqlString,connection 
						do until inst.eof %>
						
						<li title = '<%=inst("INSTR_NAME")%>'>
						<a href='instr_show.asp?name=<%=inst("INSTR_NAME")%>' target = "iframe" onclick = '<% session("instr") = inst("INSTR_NAME") %>' ><%=inst("INSTR_NAME")%>
						</a></li>
						
						<% inst.movenext
						loop
						inst.close
						set inst=nothing %>
						
						</ul>
					</li>

					<% inst_type.movenext
					   loop
					   inst_type.close
						set inst_type=nothing 
					%>
					<li class="active" title = "About"><a href="About.asp" target = "iframe">About</a></li>
					<li class="active" title = "Log off"><a href="logoff_execute.asp">Log off</a></li>
				</ul>
			</div>
		</nav>
