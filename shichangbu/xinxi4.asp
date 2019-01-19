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
    td a{
      color:  #68c2f9;
    }
    a:hover, 
    a:active { 
    color:orange;
    text-decoration:display; 
    } 
  </style>
</head>
<body style="text-align: center;background: rgba(193,210,240,0.2);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#33ffffff,endColorstr=#33ffffff);
        zoom: 1;height:100%;width: 100%;" oncopy="alert('对不起，本网页禁止复制！');return false;" >


  <div style="width: 900px;height: 500px;text-align: center;">

<%@LANGUAGE="VBScript" codepage="65001"%> 
<!--#include file="conn.asp"--> 
<!-- 查询部分 -->
<% 
    set rs=server.createobject("adodb.recordset") 
    set rs2=server.createobject("adodb.recordset") 
    dim id 
    dim id1
    id=request.form("id")
    id1=request.form("id1")
    id2=request.form("id2")
    id4=request.form("id3")
    id3=request.querystring("id")
    if id3<>"" then 
    sql="select * from 楼宇 where 楼宇名称 = '"&id3&"' " 
    rs.open sql,conn,1,1 
    else
    if id1="请选择楼宇类型" then

    sql="select * from 楼宇 where 楼内客户数 "&id2&" "&id&" order by 楼内客户数 desc" 
    rs.open sql,conn,1,1 
    sql2="select count(*)  from 楼宇 where 楼内客户数 "&id2&" "&id&" " 
    rs2.open sql2,conn,1,1 

    else
    if id1="1" Then
    sql="select * from 楼宇 where 是否达标楼宇='1' and 楼内客户数 "&id2&" "&id&" order by 楼内客户数 desc " 
    rs.open sql,conn,1,1 
    sql2="select count(*) from 楼宇 where 是否达标楼宇='1' and 楼内客户数 "&id2&" "&id&"" 
    rs2.open sql2,conn,1,1 
    else
    if id4="all" Then
    sql="select * from 楼宇 where 是否达标楼宇<>'1' and 楼内客户数 "&id2&" "&id&" order by 楼内客户数 desc " 
    sql2="select count(*)  from  楼宇 where 是否达标楼宇<>'1' and 楼内客户数 "&id2&" "&id&" " 
    <!-- Response.Write("你好！" &sql& "！<br />") -->
    rs2.open sql2,conn,1,1 
    rs.open sql,conn,1,1 
    else
    sql="select * from 楼宇 where 是否达标楼宇='"&id4&"' and 楼内客户数 "&id2&" "&id&" order by 楼内客户数 desc " 
    sql2="select count(*)  from  楼宇 where 是否达标楼宇='"&id4&"' and 楼内客户数 "&id2&" "&id&"  " 
    <!-- Response.Write("你好！" &sql& "！<br />") -->
    rs2.open sql2,conn,1,1 
    rs.open sql,conn,1,1 
    end If
    
    End If
    End If
    End If
%> 

<!-- 显示部分 -->

<% if id1="请选择楼宇类型" then %>

    <a style="color: white">总计条数：<%=rs2("Expr1000")%></a>

     <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
      <tr>
        <td>楼宇名称</td>
        <td>是否达标楼宇</td>
        <td>楼宇地址</td>
        <td>楼宇编码</td>
        <td>楼内客户数</td>
        <td>楼宇经理</td>
      </tr>
        </table>
      <div  style="width: 900px ;height:440px;overflow :auto">
      <table style="width: 883px;table-layout: fixed;">
    <%
    do while not rs.eof
    %> 
      <tr>
        <td><a href="xinxi4.asp?id=<%=rs("楼宇名称")%>" onclick="fun1();"><%=rs("楼宇名称")%></a></td>
        <td><%=rs("是否达标楼宇")%></td>
        <td><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("楼宇地址")%>" target="_Blank"><%=rs("楼宇地址")%></a></td>
        <td><%=rs("楼宇编码")%></td>
        <td><%=rs("楼内客户数")%></td>
        <td><%=rs("楼宇经理")%></td>
      </tr>
      <%
    rs.movenext
    loop
    %>
    </table>
    </div>


<% else %>

<% if id1="1" Then %>
    <a style="color: white">总计条数：<%=rs2("Expr1000")%></a>


    <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
      <tr>
        <td>楼宇名称</td>
        <td>是否达标楼宇</td>
        <td>楼宇地址</td>
        <td>楼宇编码</td>
        <td>楼内客户数</td>
        <td>楼宇经理</td>
      </tr>
        </table>
      <div  style="width: 900px ;height:440px;overflow :auto">
      <table style="width: 883px;table-layout: fixed;">
      <%
    do while not rs.eof
    %> 
      <tr>
        <td><a href="xinxi4.asp?id=<%=rs("楼宇名称")%>" onclick="fun1();"><%=rs("楼宇名称")%></a></td>
        <td><%=rs("是否达标楼宇")%></td>
        <td><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("楼宇地址")%>" target="_Blank"><%=rs("楼宇地址")%></a></td>
        <td><%=rs("楼宇编码")%></td>
        <td><%=rs("楼内客户数")%></td>
        <td><%=rs("楼宇经理")%></td>
      </tr>
    <%
    rs.movenext
    loop
    %>
    </table>
    </div>



<% else %>
<% if id<>"" then%>
<a style="color: white">总计条数：<%=rs2("Expr1000")%></a>


    <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
      <tr>
        <td>楼宇名称</td>
        <td>是否达标楼宇</td>
        <td>楼宇地址</td>
        <td>楼宇编码</td>
        <td>楼内客户数</td>
        <td>楼宇经理</td>
      </tr>
        </table>
      <div  style="width: 900px ;height:440px;overflow :auto">
      <table style="width: 883px;table-layout: fixed;">
      <%
    do while not rs.eof
    %> 
      <tr>
        <td><a href="xinxi4.asp?id=<%=rs("楼宇名称")%>" onclick="fun1();"><%=rs("楼宇名称")%></a></td>
        <td><%=rs("是否达标楼宇")%></td>
        <td><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("楼宇地址")%>" target="_Blank"><%=rs("楼宇地址")%></a></td>
        <td><%=rs("楼宇编码")%></td>
        <td><%=rs("楼内客户数")%></td>
        <td><%=rs("楼宇经理")%></td>
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

<%if id3<>"" then %>
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
        <td colspan="7"><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("楼宇地址")%>" target="_Blank"><%=rs("楼宇地址")%></a></td>
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

<% end if %>
  </div>
<script>
//控制另外一个iframe
  function fun1(){
       // var img=document.getElementById('img');
       // img.style.display="inline-block";
      var oDoc=top.parent.document;
      var f2=oDoc.getElementById('frame2');
      var img=f2.contentWindow.document.getElementById('img')
      //var img1=oDoc.getElementById("img1");
      //var oAnotherFrame=oDoc.frames["1"];
      // var oAnotherFrame=oDoc.frames.1;
      //img1.style.width="200px";
      
      // var img2=oAnotherFrame.document.getElementById("img2");
      img.style.display="inline-block"; 
    
  }
</script>

</body>
</html>