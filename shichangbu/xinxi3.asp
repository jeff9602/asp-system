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
      color: #68c2f9;
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
     <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
      <tr>
      
        <td>楼宇名称</td>
        <td>楼宇地址</td>
       
      </tr>
      </table>
      <div  style="width: 900px ;height:450px;overflow :auto">
      <table style="width: 883px;table-layout: fixed;">
      <%
      do while not rs.eof
      %> 
      <tr>
       
        <td><a href="xinxi3.asp?id2=<%=rs("楼宇名称")%>" onclick="fun1();"><%=rs("楼宇名称")%></a></td>
        <td><a href="http://map.baidu.com/?newmap=1&ie=utf-8&s=s%26wd%3D<%=rs("楼宇地址")%>" target="_Blank"><%=rs("楼宇地址")%></a></td>
       
      </tr>
      <%
      rs.movenext
      loop
      %>
      </table>
      </div>

<% end if %>
<% If id2<>"" Then %>

    <a style="color: white">总计条数：<%=rs2("Expr1000")%></a>

    <table  border="1" cellspacing="0" cellpadding="5" style="text-align:center;width:883px;table-layout: fixed;">
        <tr>
        <td>楼宇名称</td>
        <td>集团名称</td>
        <td>集团编码</td>
        <td>联系人</td>
        <td>联系电话</td>
        <td>楼层及门牌</td>
        <td>客户经理</td>
        </tr>
    </table>
    <div  style="width: 900px ;height:430px;overflow :auto">
    <table style="width: 883px;table-layout: fixed;"> 
      <%
      do while not rs.eof
      %> 
        <tr>
        <td><%=rs("楼宇名称")%></td>
        <td><a href="xinxi.asp?id3=<%=rs("集团名称")%>" style="color: " onclick="fun1();"> <%=rs("集团名称")%></a></td>
        <td><%=rs("集团编码")%></td>
        <td><%=rs("联系人")%></td>
        <td><%=rs("联系电话")%></td>
        <td><%=rs("楼层及门牌")%></td>
        <td><%=rs("客户经理")%></td>
        </tr>
      <%
      rs.movenext
      loop
      %>
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