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
      a:hover, 
      a:active { 
      color:orange;
      text-decoration:display; 
      } 
      #back:hover,
      #back:active{
         color:orange; 
      text-decoration:display; 
      }
      #select2{
        display:none;
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
  </style>
</head>
<body style="text-align: center;background: rgba(193,210,240,0.2);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#33ffffff,endColorstr=#33ffffff);
    zoom: 1;height:100%;width: 100%;" oncopy="alert('对不起，本网页禁止复制！');return false;" >
 <!--  <div id="back" class="button" style="font-size: 20px;border-radius: 100%;width: 20px;margin-top: 30px;float: left;margin-left: 10px"  onclick="javascript:history.back(-1); " ><</div> -->
  
  <div style="height:70px;width: 750px; float: left;margin-top: 30px ">
    <img src="mouse1.png" alt="" width="30px" style="float: left;margin-top: 0px;margin-left: 10px" id="img" onmouseover="img1();" onmouseout="img2();" onclick="javascript:history.back(-1); ">
    <form action="xinxi4.asp" method="post"  target="frame3" id="form1">

    <font color="white" style="margin-left: 40px"> 是否达标楼宇 :</font>
    <select name="id1" id="select" style="background-color:transparent; overflow: hidden;-webkit-appearance:none;color: orange" onchange="chang()"> 
    <option value='请选择楼宇类型'>请选择楼宇类型</option>
    <option value='1' >达标楼宇</option> 
    <option value='未达标楼宇'>未达标楼宇</option>
    </select>
    <select name="id3" id="select2" style="background-color:transparent; overflow: hidden;-webkit-appearance:none;color: orange;margin-left: -3px;margin-top: -4px;vertical-align:middle;" > 
    <option value='all'>请选择类型</option>
    <option value='0' >0</option> 
    <option value='非目标'>非目标</option>
    </select>
 
   
   
    <font  style="margin-left: 95px;color: white" id="font">楼内客户数</font></select> 
    <select name="id2" style="background-color:transparent; overflow: hidden;-webkit-appearance:none;color: orange" > 
    <option value='=' >=</option> 
    <option value='>'>></option> 
    <option value='<'><</option> 
    <option value='>=' selected="selected">>=</option>
    <option value='<='><=</option>
    </select><input type="number" name="id" placeholder="请输入数量" required="required" value="0" style="background-color:transparent;display:inline-block;margin-top: -2px;vertical-align:middle;color: orange" >
    <input type="submit" value="搜索" class="button" formtarget="frame3">
    </form>
  </div>

<script>
  function chang(){
    var myselect=document.getElementById('select');
    var index=myselect.selectedIndex;
    var value =myselect.options[index].value;
    var select2=document.getElementById('select2');
    var font=document.getElementById('font');
    // alert(value);
    // console.log(index);
    if(value=="未达标楼宇"){
        //console.log(value);
        select2.style.display='inline-block';
        font.style.marginLeft='0px';
    }else{
        select2.style.display='none';
        font.style.marginLeft='95px';
    }
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
id2=request.form("id2")
id3=request.querystring("id")
if id3<>"" then 
sql="select * from 楼宇 where 楼宇名称 = '"&id3&"' " 

rs.open sql,conn,1,1 
else


If id<>"" Then

sql="select * from 楼宇 where 楼内客户数 "&id2&" "&id&" order by 楼内客户数 desc" 
rs.open sql,conn,1,1 
sql2="select count(*)  from 楼宇 where 楼内客户数 "&id2&" "&id&" " 
rs2.open sql2,conn,1,1 


else
If id1<>"" Then

if id1="1" Then
sql="select * from 楼宇 where 是否达标楼宇='1'" 
rs.open sql,conn,1,1 
sql2="select count(*) from 楼宇 where 是否达标楼宇='1' " 
rs2.open sql2,conn,1,1 
else
sql="select * from 楼宇 where 是否达标楼宇<>'1' " 
sql2="select count(*)  from  楼宇 where 是否达标楼宇<>'1' " 
rs2.open sql2,conn,1,1 
rs.open sql,conn,1,1 
end if
end if
End If
End If
%> 

<!-- 显示部分 -->

<% If id<>"" Then %>

<a style="color: white">总计条数：<%=rs2("Expr1000")%></a>

<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>楼宇名称</td>
    <td>楼宇地址</td>
    <td>楼宇编码</td>
    <td>楼内客户数</td>
    <td>楼宇经理</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><a href="check4.asp?id=<%=rs("楼宇名称")%>"><%=rs("楼宇名称")%></a></td>
    <td><%=rs("楼宇地址")%></td>
    <td><%=rs("楼宇编码")%></td>
    <td><%=rs("楼内客户数")%></td>
    <td><%=rs("楼宇经理")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>


<% else %>
<% If id1<>"" Then %>
<% if id1="1" Then %>
<a style="color: white">总计条数：<%=rs2("Expr1000")%></a>


<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>楼宇名称</td>
    <td>楼宇地址</td>
    <td>楼宇编码</td>
    <td>是否达标楼宇</td>
    <td>楼宇经理</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><a href="check4.asp?id=<%=rs("楼宇名称")%>"><%=rs("楼宇名称")%></a></td>
    <td><%=rs("楼宇地址")%></td>
    <td><%=rs("楼宇编码")%></td>
    <td><%=rs("是否达标楼宇")%></td>
    <td><%=rs("楼宇经理")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>



<% else %>

<a style="color: white">总计条数：<%=rs2("Expr1000")%></a>


<table width="100%" border="1" cellspacing="0" cellpadding="5">
  <tr>
    <td>楼宇名称</td>
    <td>楼宇地址</td>
    <td>楼宇编码</td>
    <td>是否达标楼宇</td>
    <td>楼宇经理</td>
  </tr>
  <%

do while not rs.eof
%> 
  <tr>
    <td><a href="check4.asp?id=<%=rs("楼宇名称")%>"><%=rs("楼宇名称")%></a></td>
    <td><%=rs("楼宇地址")%></td>
    <td><%=rs("楼宇编码")%></td>
    <td><%=rs("是否达标楼宇")%></td>
    <td><%=rs("楼宇经理")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>


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

<% end if %>

</body>
</html>