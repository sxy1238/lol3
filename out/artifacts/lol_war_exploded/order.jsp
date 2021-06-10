<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2021/4/14
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单管理</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
    </script>
    <script type="text/javascript">
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath }/showOrder",
        contentType:"application/json;charset=UTF-8",
        dataType: "JSON",
        success: function(data){
          console.log(data);
          $("#sxy").append("<tr>" +
                  "<th data-name='userid'>用户ID</th>" +
                  "<th data-name='orderid'>订单ID</th>" +
                  "<th data-name='money'>总金额</th>" +
                  "<th data-name='time'>下单时间</th>" +
                  "<th data-name='condition'>订单状态</th>" +
              "<th data-name='action'>操作</th>" +
                  "</tr>")
          for(var i=0;i<data.length;i++){

            $("#sxy").append("<tr class='p1'>" +
                    "<td class='ss1'><div id='userid'>"+data[i].userid+"</div></td>" +
                    "<td class='ss2'><div id='orderid'>"+data[i].orderid+"</div></td>" +
                    "<td class='ss3'><div id='money'>"+data[i].money+"</div></td>" +
                    "<td class='ss4'><div id='time'>"+data[i].time+"</div></td>" +
                    "<td class='ss5'><div id='condition'>"+data[i].condition+"</div></td>" +
                    " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /><input type=\"button\" onclick=\"read(this)\" value=\"查看\" /></td>" +
                    "</tr>");
          };
        }
      });
    </script>
    <script type="text/javascript">
      function play2(obj) {
        document.getElementById("add").setAttribute("style","display:block")
      }
      function jump() {
        location.href="${pageContext.request.contextPath}/notice.jsp";
      }
      function jump2() {
        location.href="${pageContext.request.contextPath}/index.jsp";
      }
      function cancel2() {
        $(".add").hide();
      }
      function run(obj){
        var orderid =$(obj).parents('.sss').parents('.p1').children('td:nth-child(2)').children('div:only-child').text();
        var condition =$(obj).parents('.sss').parents('.p1').children('td:nth-child(5)').children('div:only-child').text();
        alert(id+condition);
        $.ajax({
          url:"${pageContext.request.contextPath}/deleteOrder",
          type:"post",
          data:JSON.stringify({orderid:orderid,condition:condition}),
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            if(data.information==0){
              alert("删除失败,只有未付款的订单才能删除")
            }else {
              location.href="${pageContext.request.contextPath}/order.jsp";
            }
          }
        })
      }
      function read(obj){

        var orderid =$(obj).parents('.sss').parents('.p1').children('td:nth-child(2)').children('div:only-child').text();
        $.ajax({
          url:"${pageContext.request.contextPath}/ReadOrder?orderid="+orderid,
          type:"post",
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            $("#sxy").html('')
            $("#sxy").append("<tr>" +
                    "<th data-name='id'>编号</th>" +
                    "<th data-name='foodid'>商品ID</th>" +
                    "<th data-name='count'>数量</th>" +
                    "<th data-name='price'>单价</th>" +
                    "</tr>")
            for(var i=0;i<data.length;i++){

              $("#sxy").append("<tr class='p1'>" +
                      "<td class='ss0'><div id='id'>"+data[i].id+"</div></td>" +
                      "<td class='ss1'><div id='foodid'>"+data[i].foodid+"</div></td>" +
                      "<td class='ss2'><div id='count'>"+data[i].count+"</div></td>" +
                      "<td class='ss2'><div id='price'>"+data[i].price+"</div></td>" +
                      "</tr>");
            };
          }
        })
      }
      function search() {
        var name=document.getElementById("cx").value
        var option=document.getElementById("option").value

        alert(option+"的值是"+name)
        $.ajax({
          url:"${pageContext.request.contextPath}/searchBy?"+option+"="+name,
          type:"post",
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            $("#sxy").html('')
            $("#sxy").append("<tr>" +
                    "<th data-name='userid'>用户ID</th>" +
                    "<th data-name='orderid'>订单ID</th>" +
                    "<th data-name='money'>总金额</th>" +
                    "<th data-name='time'>下单时间</th>" +
                    "<th data-name='condition'>订单状态</th>" +
                    "<th data-name='action'>操作</th>" +
                    "</tr>")
            for(var i=0;i<data.length;i++){

              $("#sxy").append("<tr class='p1'>" +
                      "<td class='ss1'><div id='userid'>"+data[i].userid+"</div></td>" +
                      "<td class='ss2'><div id='orderid'>"+data[i].orderid+"</div></td>" +
                      "<td class='ss3'><div id='money'>"+data[i].money+"</div></td>" +
                      "<td class='ss4'><div id='time'>"+data[i].time+"</div></td>" +
                      "<td class='ss5'><div id='condition'>"+data[i].condition+"</div></td>" +
                      " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /><input type=\"button\" onclick=\"read(this)\" value=\"查看\" /></td>" +
                      "</tr>");
            };
          }
        })
      }
    </script>
  </head>
  <body>
  <div>
    <input type="button" value="公告管理" onclick="jump()">
  </div>
  <div>
    <input type="button" value="商品管理" onclick="jump2()">
  </div>
  <div align="center">
    <div>
      <select id="option">
        <option value="userid">用户ID</option>
        <option value="money">总金额</option>
        <option value="time">下单日期</option>
        <option value="condition">订单状态</option>
      </select>
      <input type="text" id="cx" class="cx">
    </div>
    <div><button  class="search" onclick="search()">查询</button></div>
  </div>
  <table border="1" align="center" id="sxy">

  </table>
  </body>
</html>
