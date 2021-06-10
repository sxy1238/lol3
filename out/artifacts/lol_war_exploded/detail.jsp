<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2021/5/25
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="0" width="90%">
        <tr>
            <th>商品名称</th>
            <th>商品图片</th>
            <th>商品数量</th>
            <th>商品价格</th>
        </tr>
        <c:forEach items="${shopers}" var="info">
            <tr align="center">
                <td>${info.name}</td>
                <td><img src="${info.url}" width="100" height="90"></td>
                <td>${info.count}</td>
                <td>${info.discount}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
