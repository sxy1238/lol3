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
    <title>商品类型管理</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
    </script>
    <script type="text/javascript">
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath }/showKinds",
        contentType:"application/json;charset=UTF-8",
        dataType: "JSON",
        success: function(data){
          console.log(data);
          $("#sxy").append("<tr>" +
                  "<th data-name='id'>编号</th>" +
                  "<th data-name='kind'>类型</th>" +
                  "<th data-name='action'>操作</th>" +
                  "</tr>")
          for(var i=0;i<data.length;i++){

            $("#sxy").append("<tr class='p1'>" +
                    "<td class='ss1'><div id='id'>"+data[i].id+"</div></td>" +
                    "<td class='ss2'><div id='kind'>"+data[i].kind+"</div></td>" +
                    " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                    "</tr>");
          };
        }
      });
    </script>
    <script type="text/javascript">
      function run(obj){
        var id =$(obj).parents('.sss').parents('.p1').children('td:first-child').children('div:only-child').text();
        var kind =$(obj).parents('.sss').parents('.p1').children('td:nth-child(2)').children('div:only-child').text();
        alert(id+kind);
        $.ajax({
          url:"${pageContext.request.contextPath}/deleteKind",
          type:"post",
          data:JSON.stringify({id:id,kind:kind}),
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            if(data.information==0){
              alert("删除失败")
            }else {
              location.href="${pageContext.request.contextPath}/kind.jsp";
            }

          }
        })
      }
      function back() {
        location.href="${pageContext.request.contextPath}/index.jsp";
      }
      function search() {
        var kind=document.getElementById("cx").value
        alert(kind)
        $.ajax({
          url:"${pageContext.request.contextPath}/searchByKind?kind="+kind,
          type:"post",
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            $("#sxy").html('')
            $("#sxy").append("<tr>" +
                    "<th data-name='id'>编号</th>" +
                    "<th data-name='kind'>类型</th>" +
                    "<th data-name='action'>操作</th>" +
                    "</tr>")
            for(var i=0;i<data.length;i++){

              $("#sxy").append("<tr class='p1'>" +
                      "<td class='ss1'><div id='id'>"+data[i].id+"</div></td>" +
                      "<td class='ss2'><div id='kind'>"+data[i].kind+"</div></td>" +
                      " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                      "</tr>");
            };
          }
        })
      }
    </script>
  </head>
  <body>
  <div>
    <input type="button" value="返回" onclick="back()">
  </div>
  <div align="center">
    <div><input type="text" id="cx" class="cx"></div>
    <div><button  class="search" onclick="search()">查询</button></div>
  </div>
  <table border="1" align="center" id="sxy">

  </table>
  <div align="center">
    <form action="${pageContext.request.contextPath}/AddKind" method="post">
      类型:<input type="text" name="kind">
      <button>添加类型</button>
    </form>
  </div>

  </body>
</html>
