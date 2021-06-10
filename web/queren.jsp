<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2021/5/18
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单确认</title>
</head>
<body>
   <table>
       <C:forEach items="${shopers}" var="cart">
           <tr>
               <td>${cart.name}</td>
               <td><img src="${cart.url}" height="90" width="100"></td>
               <td>x${cart.count}</td>
               <td>￥${cart.discount}</td>
           </tr>
       </C:forEach>
   </table>
   <div>总共${zj.information}<a href="${pageContext.request.contextPath}/afford">去支付</a></div>
</body>
</html>
