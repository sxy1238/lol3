<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Shoper" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2020/12/6
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%  HttpSession session1=request.getSession();
    List<Shoper> shopers=(List<Shoper>)session1.getAttribute("shopers");

%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购物车</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
    </script>
    <META http-equiv=Content-Type content="text/html; charset=GBK">
</head>
<body>
  <p>购物车</p>
  <table>
      <tr>
      <th>编号</th>
      <th>名称</th>
      <th>图片</th>
      <th>价格</th>
      <th>数量</th>
      </tr>
      <c:forEach items="${shopers}" var="DopName">
          <tr>
              <td>${DopName.foodid}</td>
              <td>${DopName.name}</td>
              <td><img src="${DopName.url}" height="90" width="100"></td>
              <td>${DopName.discount}</td>
              <td>${DopName.count}</td>
          </tr>
      </c:forEach>
  </table>

</body>
</html>
