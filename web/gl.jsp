<%@ page import="com.example.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2020/12/6
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  HttpSession session1=request.getSession();String name="",quanxian="";
    User user=(User)session1.getAttribute("user");
    if(user!=null){
        name=user.getName();
        quanxian=user.getQuanxian();
    }
%>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
    </script>
    <META http-equiv=Content-Type content="text/html; charset=GBK">
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/gl",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success: function(data){
                console.log(data);
                for(var i=0;i<data.length;i++){

                    $("#sxy").append("<tr class='p1'>" +
                        "<td class='ss1'><div id='name'>"+data[i].name+"</div></td>" +
                        "<td class='ss2'><div id='username'>"+data[i].username+"</div></td>" +
                        "<td class='ss3'><div id='password'>"+data[i].password+"</div></td>" +
                        "<td class='ss4'><div id='quanxian'>"+data[i].quanxian+"</div></td>" +
                        " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                        "</tr>");
                };
            }
        });
    </script>
    <script type="text/javascript">
        function run(obj){
            var name =$(obj).parents('.sss').parents('.p1').children('td:first-child').children('div:only-child').text();
            var username =$(obj).parents('.sss').parents('.p1').children('td:nth-child(2)').children('div:only-child').text();
            var password= $(obj).parents('.sss').parents('.p1').children('td:nth-child(3)').children('div:only-child').text();
            var quanxian= $(obj).parents('.sss').parents('.p1').children('td:nth-child(4)').children('div:only-child').text();
            alert(name+username+password+quanxian);
            $.ajax({
                url:"${pageContext.request.contextPath}/fire",
                type:"post",
                data:JSON.stringify({name:name,username:username,password:password,quanxian:quanxian}),
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                success:function (data) {
                    if(data.information>0){
                        window.location.replace("${pageContext.request.contextPath}/gl.jsp");
                    }else {
                        alert("该用户有订单不允许删除")
                    }

                }
            })
        }
    </script>
</head>
<body>
  欢迎你,<%= name %>,你是<%= quanxian %>用户<A  href="${pageContext.request.contextPath}/dsgl.jsp">注销</A><br>
  <a href="${pageContext.request.contextPath}/index.jsp">商品管理</a>
<table border="1" align="center" id="sxy">

</table>
</body>
</html>
