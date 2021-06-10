<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2020/12/7
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电子商务后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="${pageContext.request.contextPath}/dl" method="post" >
    账号<input type="text" name="username">
    密码<input type="password" name="password">
    <button type="submit">登录</button>
</form>
</body>
</html>
