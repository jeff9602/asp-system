<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
    <style>
  table, table  td { border:1px solid white; }
  table{border-collapse:collapse;color: white}
  table td{empty-cells:show;}
  .button{
        background-color: transparent;
        border: 1px solid;
        text-align: center;
        cursor: pointer;
        color: white;
        border-radius: 5px; 
  }
  a{
  text-decoration:none;
  color: white;
  }
  a:hover, a:active { 
  color:orange; 
  text-decoration:display; 
  } 
  </style>
</head>
<body style="text-align: center;background: rgba(193,210,240,0.5)" oncopy="alert('对不起，本网页禁止复制！');return false;"  >
<div style="height:40px;width: 760px;position: relative;margin: 0 auto; ">
<form action="check3.asp" method="post" style="margin-top: 40px">
	<label >
  <font color="white"> 楼宇内集团情况查询 </font>
	<input type="text" name="id" placeholder="请输入楼宇名称" style="background-color:transparent;display:inline-block;margin-top: -2px;vertical-align:middle;color: orange" >
	<input type="submit" value="搜索" class="button">
	</label>
  <br>
  <label style="font-size: 10px;color: orange;">支持模糊查询，如：“国际银行中心”可输入“国际银行”
  </label>
</form>
</div>
<hr>
<!-- 查询部分 -->

	<%@LANGUAGE="VBScript" codepage="65001"%> 
<!--#include file="conn.asp"--> 
<% 
set rs=server.createobject("adodb.recordset") 
set rs2=server.createobject("adodb.recordset") 
dim id 
dim id1
id=request.form("id")
id1=request.form("id1")
id2=request.querystring("id2")
if id2<>"" then 
sql="select * from 集团 where 楼宇名称 = '"&id2&"' " 
rs.open sql,conn,1,1 
sql2="select count(*) from 集团 where 楼宇名称 = '"&id2&"' "
rs2.open sql2,conn,1,1 

else

If id<>"" Then

sql="select * from(Select * FROM 集团 Where 集团名称 in (select min(集团名称) from 集团 group by 楼宇名称)) where 楼宇名称 like '%"&id&"%' order by 楼宇名称 " 
rs.open sql,conn,1,1 
sql2="select count(*) from 集团 where 楼宇名称 like '%"&id&"%' "
rs2.open sql2,conn,1,1 

End If
End If

%> 

<!-- 显示部分 -->

<% If id<>"" Then %>



<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
  
    <td>楼宇名称</td>
    <td>楼宇地址</td>
   
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
   
    <td><a href="check3.asp?id2=<%=rs("楼宇名称")%>"><%=rs("楼宇名称")%></a></td>
    <td><%=rs("楼宇地址")%></td>
   
  </tr>
  <%
rs.movenext
loop
%>
</table>

<% end if %>
<% If id2<>"" Then %>

<a style="color: white">总计条数：<%=rs2("Expr1000")%></a>

<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>集团名称</td>
    <td>集团编码</td>
    <td>楼宇名称</td>
    <td>楼宇地址</td>
    <td>楼层及门牌</td>
       <td>联系人</td>
    <td>联系电话</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><%=rs("集团名称")%></td>
    <td><%=rs("集团编码")%></td>
    <td><%=rs("楼宇名称")%></td>
    <td><%=rs("楼宇地址")%></td>
    <td><%=rs("楼层及门牌")%></td>
        <td><%=rs("联系人")%></td>
    <td><%=rs("联系电话")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>

<% end if %>
</body>
</html>