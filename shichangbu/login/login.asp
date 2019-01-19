<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Document</title>
</head>
<body>
	<%@LANGUAGE="VBScript" codepage="65001"%> 
	<%
 	dim username,password
 
	 username=request.form("username")
	 password=request.form("password")
	 set rs=server.createobject("adodb.recordset") 
	 conn = "DBQ=" + server.mappath("Database1.mdb") + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};" 
	 sql="select * from user where user_name='"&username&"'"
	 rs.open sql,conn,1,1
	 if rs.eof then
	  response.write "<script>alert('登录失败');history.back();</script>"
	  response.end
	  else
	    if rs("password")<>password then
	      response.write "<script>alert('登录失败');history.back();</script>"
	      response.end     
	     end if      
	     session("admin")=username
	response.write"<script>alert('登录成功');location.href='1.asp'</script>"
	  end if
	%>
</body>
</html>