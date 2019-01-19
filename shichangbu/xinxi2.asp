<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <style>
    table, table  td { border:1px solid white; }
    table{border-collapse:collapse;color:white}
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
    a:hover, a:active { 
    color:orange; 
    text-decoration:display; 
    } 


  </style>
</head>
<body style="text-align: center;background: rgba(193,210,240,0.2);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#33ffffff,endColorstr=#33ffffff);
    zoom: 1;height:100%;width: 100%;" oncopy="alert('对不起，本网页禁止复制！');return false;"  >

  <div style="width: 900px;height: 500px;text-align: center;">
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
    sql="select * from 投产 where `楼宇/园区名称` = '"&id2&"' " 
    rs.open sql,conn,1,1 


    else
    If id<>"" Then

    sql="select * from 投产 where `楼宇/园区名称` like '%"&id&"%' " 
    rs.open sql,conn,1,1 
    sql2="select count(*) from 投产 where `楼宇/园区名称` like '%"&id&"%' " 
    rs2.open sql2,conn,1,1 

    else
    If id1<>"" Then

    if id1="投产楼宇查询" Then
    sql="select * from 投产 where `投产时间（厚+薄）` is not null" 
    rs.open sql,conn,1,1 
    sql2="select count(*)  from 投产 where `投产时间（厚+薄）` is not null " 
    rs2.open sql2,conn,1,1 
    else
    sql="select * from 投产 where `投产时间（厚+薄）` is  null " 
    <!-- Response.Write("你好！" &sql& "！<br />") 
    sql2="select count(*)  from 投产 where `投产时间（厚+薄）` is  null " 
    rs2.open sql2,conn,1,1 
    rs.open sql,conn,1,1 
    end if
    end if
    End If
    End If
%> 

<!-- 显示部分 -->

<% If id<>"" Then %>
<% if rs2("Expr1000")>0  then %>
      <a style="color: white">总计条数：<%=rs2("Expr1000")%></a>
      <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
        <tr>
        <td >楼宇/园区名称:</td>
        <td >详细地址:</td>
        <td >是否已投产0411:</td>
        <td >是否已投产(政企通报四季度结果）:</td>
      </tr>
      </table>
      <div  style="width: 900px ;height:420px;overflow :auto">
      <table style="width: 883px;table-layout: fixed;">
        <%
        do while not rs.eof
        %> 
      <tr>
      <td ><a href="xinxi2.asp?id2=<%=rs("楼宇/园区名称")%>" onclick="fun1();"><%=rs("楼宇/园区名称")%></a> </td>
      <td ><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("详细地址")%>" target="_Blank"><%=rs("详细地址")%></a></td>
      <td ><%=rs("是否已投产0411")%></td>
      <td ><%=rs("是否已投产(政企通报四季度结果）")%></td>
      </tr>
      <%
      rs.movenext
      loop
      %>
      </table>
      </div>


<% end if %>
<% else %>
<% If id1<>"" Then %>
<% if id1="投产楼宇查询" Then%>

    <font color="white"> 总计条数：<%=rs2("Expr1000")%> </font>

     <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
      <tr>
        <td>楼宇/园区名称</td>
        <td>详细地址</td>
        <td>是否已投产0411</td>
        <td>是否已投产(政企通报四季度结果）</td>
        <td>投产时间（厚+薄）</td>
      </tr>
        </table>
      <div  style="width: 900px ;height:420px;overflow :auto">
      <table style="width: 883px;table-layout: fixed;">
      <%
    do while not rs.eof
    %> 
      <tr>
        <td><a href="xinxi2.asp?id2=<%=rs("楼宇/园区名称")%>" onclick="fun1();"><%=rs("楼宇/园区名称")%></a></td>
        <td><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("详细地址")%>" target="_Blank"><%=rs("详细地址")%></a></td>
        <td><%=rs("是否已投产0411")%></td>
        <td><%=rs("是否已投产(政企通报四季度结果）")%></td>
        <td><%=rs("投产时间（厚+薄）")%></td>
      </tr>
      <%
    rs.movenext
    loop
    %>
    </table>
    </div>
<% else %>

    <font color="white"> 总计条数：<%=rs2("Expr1000")%> </font>

     <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
      <tr>
        <td>楼宇/园区名称</td>
        <td>详细地址</td>
        <td>是否已投产0411</td>
        <td>是否已投产(政企通报四季度结果）</td>
        <td>投产时间（厚+薄）</td>
      </tr>
          </table>
      <div  style="width: 900px ;height:420px;overflow :auto">
      <table style="width: 883px;table-layout: fixed;">
      <%
    do while not rs.eof
    %> 
      <tr>
        <td><a href="xinxi2.asp?id2=<%=rs("楼宇/园区名称")%>" onclick="fun1();"><%=rs("楼宇/园区名称")%></a></td>
        <td><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("详细地址")%>" target="_Blank"><%=rs("详细地址")%></a></td>
        <td><%=rs("是否已投产0411")%></td>
        <td><%=rs("是否已投产(政企通报四季度结果）")%></td>
        <td><%=rs("投产时间（厚+薄）")%></td>
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

<% If id2<>"" Then %>
    <div>
    <table width="100%" border="1" cellspacing="0" cellpadding="5" style="text-align:center">
      <tr>
        <td colspan="2">楼宇/园区名称:</td>
        <td colspan="2"><%=rs("楼宇/园区名称")%></td>
        <td colspan="3">团队:</td>
        <td width="15%"><%=rs("团队")%></td>
      </tr>
      <tr>
        <td width="16%">详细地址:</td>
        <td colspan="7"><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("详细地址")%>" target="_Blank"><%=rs("详细地址")%></a></td>
      </tr>
      <tr>

        <td colspan="1">是否已投产0411:</td>
        <td width="10%"><%=rs("是否已投产0411")%></td>
        <td width="20%"colspan="2">是否已投产(政企通报四季度结果）:</td>
        <td colspan="1"><%=rs("是否已投产(政企通报四季度结果）")%></td>
         <td colspan="2">投产时间（厚+薄）:</td>
        <td width="20%"><%=rs("投产时间（厚+薄）")%></td>
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