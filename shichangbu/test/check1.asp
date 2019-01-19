<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>查询</title>
	<style>
  *{margin:0;padding:0;}
  table, table  td { border:1px solid black; }
  table{border-collapse:collapse;color: black}
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
  color: black;
  }
  a:hover, 
  a:active { 
  color:orange; 
  text-decoration:display; 
  } 

	</style>
</head>
<body style="text-align: center;background: rgba(193,210,240,0.2);" oncopy="alert('对不起，本网页禁止复制！');return false;"  >
<div style="height:40px;width: 760px;margin: 0 auto;position:fixed ;; ">
<!-- <input type="submit"  onclick="javascript:history.back(-1);" value="<" class="button" style="font-size: 20px;border-radius: 100%;"> -->
<div id="back" class="button" style="font-size: 20px;border-radius: 100%;width: 20px"  onclick="javascript:history.back(-1); " ><</div>
<form action="xinxi.asp" method="post" style="">
	<label style="  font-size: 20px;">
  <a style="color: white" >基础信息查询</a>
  <select name="id1" style="background-color:transparent; overflow: hidden;-webkit-appearance:none; color: orange; " > <option value='楼宇名称' >楼宇名称</option> <option value='集团名称'>集团名称</option>  <option value='楼宇经理'>楼宇经理</option> <option value='客户经理'>客户经理</option> </select> 
	<input type="text" name="id" style="background-color:transparent;display:inline-block;margin-top: -2px;vertical-align:middle;color: orange;" >
	<input type="submit" value="搜索" class="button" style="font-size: 16px" formtarget="frame3">
	</label><br>
  <label style="font-size: 10px;color: orange;">支持模糊查询，如：“国际银行中心”可输入“国际银行”</label>
</form>
<hr width="1000px">
</div>
<div style="width: 100%;height:60px "></div>



<!-- 查询部分 -->
<%@LANGUAGE="VBScript" codepage="65001"%> 
<!--#include file="conn.asp"--> 
<% 
set rs=server.createobject("adodb.recordset") 
set rs2=server.createobject("adodb.recordset") 
set rs3=server.createobject("adodb.recordset") 
set rs4=server.createobject("adodb.recordset") 
dim id 
dim id1
id=request.form("id")
if id <>"" then 
id=request.form("id")
else
id=request.querystring("id5")
end if
id1=request.form("id1")
if id1<>"" then
id1=request.form("id1")
else
id1=request.querystring("id1")
end if
id2=request.querystring("id")
id3=request.querystring("id3")
id4=request.querystring("id4")
if id2<>"" then 
sql="select * from 楼宇 where 楼宇名称 = '"&id2&"' " 

rs.open sql,conn,1,1 

else
if id3<>"" then

sql="select * from 集团 where 集团名称 = '"&id3&"' order by 集团名称 "
<!-- Response.Write("你好！" &sql& "！<br />") -->
rs.open sql,conn,1,1 

else

if id4<>"" then

sql="select * from 集团 where 集团名称 = '"&id4&"' order by 集团名称 "
rs2.open sql,conn,1,1 
else


If id1<>"" Then
if id1="客户经理" Then
sql="select * from 集团 where "&id1&" like '%"&id&"%' " 
rs.open sql,conn,1,1 
sql2="select count(*) from 集团 where "&id1&" like '%"&id&"%' " 
rs2.open sql2,conn,1,1 
else
if id1="楼宇经理" then
sql="select * from 楼宇 where "&id1&" like '%"&id&"%' " 
rs.open sql,conn,1,1 
sql2="select count(*) from 楼宇 where "&id1&" like '%"&id&"%' " 
rs2.open sql2,conn,1,1 

else
if id1="集团名称" Then
sql="select * from 集团 where 集团名称 like '%"&id&"%' order by 集团名称"
rs.open sql,conn,1,1 

else
sql="select  * from 楼宇 where "&id1&" like '%"&id&"%' order by 楼宇名称 " 
<!-- Response.Write("你好！" &sql& "！<br />") 
sql2="select count(*) from 楼宇 where "&id1&" like '%"&id&"%' " 
rs2.open sql2,conn,1,1 
rs.open sql,conn,1,1 
end if
end if
end if
End If
End If
End If
End If
%> 
<!-- 显示部分 -->

<% If id1<>"" Then %>
<% if id1="集团名称" then%>

<%
rs.PageSize = 500 
pagecount=rs.PageCount

page=int(request("page"))

If page < 1 Then 
page = 1
end if
If Request("page")="" Then
page=1
end if
rs.AbsolutePage = page 
%>


<!-- 能查两个表 -->

<table width="100%" border="1" cellspacing="0" cellpadding="5">
 	<tr style="position:fixed;margin-top: 70px">
 	<td> 集团名称：</td> 
   <td> 集团编码：</td>
    <td>楼宇名称：</td> 
  <td>楼层及门牌：</td>
 	</tr>

<%
for i=0 to rs.PageSize-1
if rs.bof or rs.eof then

exit for 
else
%>

  <tr style="position: relative; margin-top: 200px">
  <td><a href="check1.asp?id3=<%=rs("集团名称")%>"> <%=rs("集团名称")%></a></td>
   <td> <%=rs("集团编码")%></td>
    <td> <%=rs("楼宇名称")%></td>
<td colspan="3"> <%=rs("楼层及门牌")%></td>
  </tr>

<%
end if 
rs.movenext
next
%>

 </table>


<%if page=1 then %>
<% if page=pagecount then%>
<p style="text-align: center">
<a href="check1.asp?page=1&id1=集团名称&id5=<%=id%>">首页</a><font color="white">|</font>
<font>前一页</font><font color="white">|</font>
<font>后一页</font><font color="white">|</font>
<a href="check1.asp?page=<%=pagecount%>&id1=集团名称&id5=<%=id%>">末页</a>
<a style="float: right;"><%=page%>/<%=pagecount%></a>
</p>
<%else%>
<p style="text-align: center">
<a href="check1.asp?page=1&id1=集团名称&id5=<%=id%>">首页</a><font color="white">|</font>
<font>前一页</font><font color="white">|</font>
<a href="check1.asp?page=<%=page+1%>&id1=集团名称&id5=<%=id%>">后一页</a><font color="white">|</font>
<a href="check1.asp?page=<%=pagecount%>&id1=集团名称&id5=<%=id%>">末页</a>
<a style="float: right;"><%=page%>/<%=pagecount%></a>
</p>
<%end if%>
<%else%>
<% if page=pagecount then%>
<p style="text-align: center">
<a href="check1.asp?page=1&id1=集团名称&id5=<%=id%>">首页</a><font color="white">|</font>
<a href="check1.asp?page=<%=page-1%>&id1=集团名称&id5=<%=id%>">前一页</a><font color="white">|</font>
<font>后一页</font><font color="white">|</font>
<a href="check1.asp?page=<%=pagecount%>&id1=集团名称&id5=<%=id%>">末页</a>
<a style="float: right;"><%=page%>/<%=pagecount%></a>
</p>
<%else%>
<p style="text-align: center">
<a href="check1.asp?page=1&id1=集团名称&id5=<%=id%>">首页</a><font color="white">|</font>
<a href="check1.asp?page=<%=page-1%>&id1=集团名称&id5=<%=id%>">前一页</a><font color="white">|</font>
<a href="check1.asp?page=<%=page+1%>&id1=集团名称&id5=<%=id%>">后一页</a><font color="white">|</font>
<a href="check1.asp?page=<%=pagecount%>&id1=集团名称&id5=<%=id%>">末页</a>
<a style="float: right;"><%=page%>/<%=pagecount%></a>
</p>
<%end if %>
<%end if %>
<% else %>
<% if id1="楼宇经理" then%>

<a style="color: white">总计条数：<%=rs2("Expr1000")%></a>

<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>楼宇名称</td>
    <td>楼宇地址</td>
    <td>楼宇经理</td>
    <td>联系方式</td>
    <td>工单号</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><%=rs("楼宇名称")%></td>
    <td><%=rs("楼宇地址")%></td>
    <td><%=rs("楼宇经理")%></td>
    <td><%=rs("联系方式")%></td>
    <td><%=rs("工单号")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>




<% else %>
<% if id1="客户经理" then%>

<a style="color: white">总计条数：<%=rs2("Expr1000")%></a>

<table width="100%"  cellspacing="0" cellpadding="5">
  <tr>
    <td>集团名称</td>
    <td>楼宇名称</td>
    <td>客户经理</td>
    <td>团队</td>
    <td>楼层及门牌</td>
    <td>状态</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><%=rs("集团名称")%></td>
    <td><%=rs("楼宇名称")%></td>
    <td><%=rs("客户经理")%></td>
    <td><%=rs("团队")%></td>
    <td><%=rs("楼层及门牌")%></td>
    <td><%=rs("状态")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>




<% else %>

<% if rs2("Expr1000")>0  then %>
<div>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" style="text-align:center">
  <tr>
    <td >楼宇名称:</td>
    <td >楼宇编码:</td>
    <td >楼宇地址:</td>
    <td >楼宇经理:</td>
    <td >潜在商机:</td>
     
   
  </tr>
    <%

do while not rs.eof
%> 
  <tr>
  <td ><a href="check1.asp?id=<%=rs("楼宇名称")%>"><%=rs("楼宇名称")%></a></td>
    <td ><%=rs("楼宇编码")%></td>
    <td ><%=rs("楼宇地址")%></td>
    <td ><%=rs("楼宇经理")%></td>
    <td><%=rs("潜在商机")%> </td>
  </tr>
    <%
rs.movenext
loop
%>
</table>

</div>
<% end if %>
<% end if %>
<% end if %>

<% End If %>
<% End If %>

<% if id2<>"" then  %>

<div>
  <table width="100%" border="1" cellspacing="0" cellpadding="5" style="text-align:center">
  <tr>
    <td colspan="2">楼宇编码:</td>
    <td colspan="2"><%=rs("楼宇编码")%></td>
    <td colspan="3">楼宇名称:</td>
    <td width="15%"><%=rs("楼宇名称")%></td>
  </tr>
  <tr>
    <td width="16%">楼宇地址:</td>
    <td colspan="7"><%=rs("楼宇地址")%></td>
  </tr>
  <tr>
    <td height="68">楼宇经理:</td>
    <td colspan="2"><%=rs("楼宇经理")%></td>
    <td colspan="2">竞争情况:</td>
    <td width="9%"><%=rs("竞争情况")%></td>
    <td width="17%">是否排他:</td>
    <td><%=rs("是否排他")%></td>
  </tr>
  <tr>
    <td height="65">是否单体楼:</td>
    <td colspan="2"><%=rs("是否单体楼")%></td>
    <td colspan="2">是否军产:</td>
    <td><%=rs("是否军产")%></td>
    <td>楼内客户数:</td>
    <td><%=rs("楼内客户数")%></td>
  </tr>
  <tr>
    <td height="50">流量:</td>
    <td colspan="2"><%=rs("流量")%></td>
    <td colspan="2">ARPU:</td>
    <td><%=rs("ARPU")%> </td>
    <td>MOU:</td>
    <td><%=rs("MOU")%></td>
  </tr>
  <tr>
    <td height="50" colspan="2">预覆盖情况:</td>
    <td colspan="2"><%=rs("预覆盖情况")%></td>
    <td colspan="3">是否达标楼宇:</td>
    <td><%=rs("是否达标楼宇")%></td>
  </tr>
  <tr>
    <td height="50" colspan="2">产出情况:</td>
    <td colspan="2"><%=rs("产出情况")%></td>
    <td colspan="3">潜在商机:</td>
    <td><%=rs("潜在商机")%> </td>
  </tr>
</table>

</div>

<%end if%>

<% if id3<>"" then  %>
 <table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
  <td> 集团名称：</td> 
  <td> <%=rs("集团名称")%></td>
  <td> 集团编码：</td>
   <td> <%=rs("集团编码")%></td>
  </tr>
  <tr>
<td>楼层及门牌：</td>
<td colspan="1"> <%=rs("楼层及门牌")%></td>
  <td> 客户经理：</td>
   <td> <%=rs("客户经理")%></td>
  </tr>
    <tr>
  <td>联系人：</td> 
  <td> <%=rs("联系人")%></td>
  <td> 联系电话：</td>
   <td> <%=rs("联系电话")%></td>
  </tr>
      <tr>
  <td>行业：</td> 
  <td> <%=rs("行业")%></td>
  <td> 状态：</td>
   <td> <%=rs("状态")%></td>
  </tr>
        <tr>
  <td>楼宇名称：</td> 
  <td colspan="3"> <%=rs("楼宇名称")%></td>

  </tr>
    <tr>
<td>楼宇地址：</td>
<td colspan="3"> <%=rs("楼宇地址")%></td>
  </tr>
 </table>

<%end if%>

<% if id4<>"" then  %>
<table width="100%"  cellspacing="0" cellpadding="5">
  <tr>
  <td> 集团名称：</td> 
  <td> <%=rs2("集团名称")%></td>
  <td> 集团编码：</td>
   <td> <%=rs2("集团编码")%></td>
  </tr>
  <tr>
<td>楼层及门牌：</td>
<td colspan="3"> <%=rs2("楼层及门牌")%></td>
  </tr>
    <tr>
  <td>联系人：</td> 
  <td> <%=rs2("联系人")%></td>
  <td> 联系电话：</td>
   <td> <%=rs2("联系电话")%></td>
  </tr>
      <tr>
  <td>行业：</td> 
  <td> <%=rs2("行业")%></td>
  <td> 状态：</td>
   <td> <%=rs2("状态")%></td>
  </tr>
        <tr>
  <td>楼宇名称：</td> 
  <td> <%=rs2("楼宇名称")%></td>
  <td> 楼宇经理：</td>
   <td> </td>
  </tr>
    <tr>
<td>楼宇地址：</td>
<td colspan="3"> <%=rs2("楼宇地址")%></td>
  </tr>
 </table>

<% end if %>
</body>
</html>