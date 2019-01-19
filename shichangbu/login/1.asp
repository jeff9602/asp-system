<!DOCTYPE html>
<html lang="en">
	<head >
		<meta charset="utf-8">
		<title>1</title>
	</head>
<body>
	<div>登陆成功</div>
	<%Response.Write(Session("admin"))%>
	<% if Session("admin")<>"" Then %>
	<p>存在</p> 
	<% else%>
	<p>不</p>
	<% end if %>
</body>
</html>