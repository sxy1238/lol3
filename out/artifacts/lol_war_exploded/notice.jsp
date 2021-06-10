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
    <title>公告管理</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
    </script>
    <script type="text/javascript">
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath }/showNotice",
        contentType:"application/json;charset=UTF-8",
        dataType: "JSON",
        success: function(data){
          console.log(data);
          $("#sxy").append("<tr>" +
              "<th></th>" +
                  "<th data-name='id'>编号</th>" +
                  "<th data-name='title'>标题</th>" +
                  "<th data-name='content'>内容</th>" +
                  "<th data-name='date'>日期</th>" +
              "<th data-name='action'>操作</th>" +
                  "</tr>")
          for(var i=0;i<data.length;i++){

            $("#sxy").append("<tr class='p1'>" +
                    "<td class='ss7'><input type='checkbox' value="+data[i].id+"></td>" +
                    "<td class='ss1'><div id='id'>"+data[i].id+"</div></td>" +
                    "<td class='ss2'><div id='title'>"+data[i].title+"</div></td>" +
                    "<td class='ss3'><div id='content'>"+data[i].content+"</div></td>" +
                    "<td class='ss4'><div id='time'>"+data[i].time+"</div></td>" +
                    " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                    "</tr>");
          };
        }
      });
    </script>
    <script type="text/javascript">
      function play2(obj) {
        document.getElementById("add").setAttribute("style","display:block")
      }
      function cancel2() {
        $(".add").hide();
      }
      function back() {
        location.href ="${pageContext.request.contextPath}/order.jsp";
      }
      function play(){
        var option = $("input:checkbox:checked");
        var id = "";
        var boo=true;
        for (var i = 0, len = option.length; i < len; i++) {
          if (boo) {
            boo=false;

            id += option[i].value;
          }
          else
            id += ","+option[i].value;
        }
        console.log(id)
        $.ajax({
          url:"${pageContext.request.contextPath}/delete3?id="+id,
          type:"post",

          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            location.href ="${pageContext.request.contextPath}/notice.jsp";
          }
        })
      }
      function run(obj){
        var id =$(obj).parents('.sss').parents('.p1').children('td:nth-child(2)').children('div:only-child').text();
        alert(id);
        $.ajax({
          url:"${pageContext.request.contextPath}/deleteNotice?id="+id,
          type:"post",
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            if(data.information==0){
              alert("删除失败")
            }else {
              location.href="${pageContext.request.contextPath}/notice.jsp";
            }
          }
        })
      }

    </script>
  </head>
  <body>
  <div>
    <input type="button" value="返回" onclick="back()">
  </div>
  <table border="1" align="center" id="sxy">

  </table>
  <br>
  <div align="center"><input type="button" onclick="play()" value="删除" ></div>
  <div align="center"><input type="button" onclick="play2()" value="发布公告" ></div>
  <br>
  <br>
  <br>
  <div class="add" id="add" style="display: none">
    <form action="${pageContext.request.contextPath}/AddNotice" method="post">
      标题：<input type="text" name="title">
      内容：<input type="text" name="content">
      <button type="submit" >提交</button>
    </form>
    <div><button class="cancel" onclick="cancel2()">取消</button></div>
  </div>
  </body>
</html>
