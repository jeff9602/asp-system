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
      a:hover, a:active { 
      color:orange; 
      text-decoration:display; 
      } 
      #back:hover,
      #back:active{
         color:orange; 
      text-decoration:display; 
      }
      #img{
        display: none;
        cursor:pointer;
      }
      #form1{
        position: absolute;
        left: 80px;
        top: 30px;
      }
      #form2{
        position: absolute;
        left: 380px;
        top: 30px;
      }
  </style>
</head>
<body style="text-align: center;background: rgba(193,210,240,0.2);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#33ffffff,endColorstr=#33ffffff);
    zoom: 1;height:100%;width: 100%;" oncopy="alert('对不起，本网页禁止复制！');return false;"  >
<!--     <div id="back" class="button" style="font-size: 20px;border-radius: 100%;width: 20px;margin-top: 30px;float: left;margin-left: 10px"  onclick="javascript:history.back(-1); " >
      <
    </div> -->
     
    <div style="height:70px;width: 400px; float: left;margin-top: 30px">
          <img src="mouse1.png" alt="" width="30px" style="float: left;margin-top: 0px;margin-left: 10px" id="img" onmouseover="img1();" onmouseout="img2();" onclick="javascript:history.back(-1); ">
          <form action="xinxi2.asp" method="post"  target="frame3"  id="form1">
          <label >
        	<font color="white"> 楼宇投产信息查询 </font>
          <select name="id1" style="background-color:transparent; overflow: hidden;-webkit-appearance:none;color: orange;"> <option value='投产楼宇查询' >投产楼宇查询</option> <option value='未投产楼宇查询'>未投产楼宇查询</option>
          </select>
          <input onclick="click1();" type="submit" class="button" value="查询" style="margin-left: 10px" formtarget="frame3" >
            </label>
          </form>

    </div>
    <div style="height:70px;width: 480px;float: left ;margin-top: 30px">
          <form action="xinxi2.asp" method="post" target="frame3" id="form2" >
        	<font style="margin-left: 50px;color: white">具体楼宇投产情况查询：</font>
          <input type="text" name="id" placeholder="请输入楼宇名称" style="background-color:transparent;display:inline-block;margin-top: -2px;vertical-align:middle;color: orange;" id="text1" >
          <input type="submit" value="搜索" class="button" style="" formtarget="frame3">

          <br>
          <label style="font-size: 12px;margin-left: 40px;color: orange;">支持模糊查询，如：“国际银行中心”可输入“国际银行”</label>
          </form>
    </div>

  <script>
    function click1(){
        var target=document.getElementById('text1');
        //alert ("1");
        target.value="";
       // console.log(target);
    }
    function img1(){

      var img=document.getElementById('img');
      img.src='mouse2.png';
    }
    function img2(){
      var img=document.getElementById('img');
      img.src='mouse1.png';
    }

  </script>
 
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
<div>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" style="text-align:center">
  <tr>
    <td >楼宇/园区名称:</td>
    <td >详细地址:</td>
    <td >是否已投产0411:</td>
    <td >是否已投产(政企通报四季度结果）:</td>
    
 
  </tr>
    <%

do while not rs.eof
%> 
  <tr>
  <td ><a href="check2.asp?id2=<%=rs("楼宇/园区名称")%>"><%=rs("楼宇/园区名称")%></a> </td>
  <td ><%=rs("详细地址")%></td>
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

<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>楼宇/园区名称</td>
    <td>详细地址</td>
    <td>是否已投产0411</td>
    <td>是否已投产(政企通报四季度结果）</td>
    <td>投产时间（厚+薄）</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><a href="check2.asp?id2=<%=rs("楼宇/园区名称")%>"><%=rs("楼宇/园区名称")%></a></td>
    <td><%=rs("详细地址")%></td>
    <td><%=rs("是否已投产0411")%></td>
    <td><%=rs("是否已投产(政企通报四季度结果）")%></td>
    <td><%=rs("投产时间（厚+薄）")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>
<% else %>

<font color="white"> 总计条数：<%=rs2("Expr1000")%> </font>

<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>楼宇/园区名称</td>
    <td>详细地址</td>
    <td>是否已投产0411</td>
    <td>是否已投产(政企通报四季度结果）</td>
    <td>投产时间（厚+薄）</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><a href="check2.asp?id2=<%=rs("楼宇/园区名称")%>"><%=rs("楼宇/园区名称")%></a></td>
    <td><%=rs("详细地址")%></td>
    <td><%=rs("是否已投产0411")%></td>
    <td><%=rs("是否已投产(政企通报四季度结果）")%></td>
    <td><%=rs("投产时间（厚+薄）")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>


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
    <td colspan="7"><%=rs("详细地址")%></td>
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
</body>
</html>