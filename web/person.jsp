<%@ page import="com.example.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2021/5/25
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  HttpSession session1=request.getSession();String name="";
    User user=(User)session1.getAttribute("user");
    if(user!=null){
        name=user.getName();
    }
%>
<html>
<head>
    <title>个人中心</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">

    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/showOrder2",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success:function (data) {
                $("#person").append("<tr>"+
                    "<th data-name='orderid'>订单编号</th>" +
                    "<th data-name='money'>订单金额</th>" +
                    "<th data-name='time'>订单日期</th>" +
                    "<th data-name='condition'>订单状态</th>" +
                    "<th data-name='action'>详情</th>" +
                    "/<tr>"
                )
                for (var i=0;i<data.length;i++){
                    if(data[i].condition==="未付款"){
                           $("#person").append("<tr class='p1'>"+
                               "<td class='ss2'><div id='orderid' align='center'>"+data[i].orderid+"</div></td>" +
                               "<td class='ss3'><div id='money' align='center'>"+data[i].money+"</div></td>" +
                               "<td class='ss4'><div id='time' align='center'>"+data[i].time+"</div></td>" +
                               "<td class='ss5'><div id='condition' align='center' class='ss6'>"+data[i].condition+"<a href='#' onclick='zf(this)'>去支付</a></div></td>" +
                               " <td class='sss' align='center'><input type=\"button\" onclick=\"read(this)\" value=\"详情\" /></td>" +
                                   "/<tr>"
                           )
                    }else {
                        $("#person").append("<tr class='p1'>"+
                            "<td class='ss2'><div id='orderid' align='center'>"+data[i].orderid+"</div></td>" +
                            "<td class='ss3'><div id='money' align='center'>"+data[i].money+"</div></td>" +
                            "<td class='ss4'><div id='time' align='center'>"+data[i].time+"</div></td>" +
                            "<td class='ss5'><div id='condition' align='center'>"+data[i].condition+"</div></td>" +
                            " <td class='sss' align='center'><input  type=\"button\" onclick=\"read(this)\" value=\"详情\" /></td>" +
                            "/<tr>"
                        )
                    }
                }
            }
        })
        function zf(obj) {
            var orderid = $(obj).parents('.ss6').parents('.ss5').parents('.p1').children('td:nth-child(1)').children('div:only-child').text();
            location.href="${pageContext.request.contextPath }/zhifu2?orderid="+orderid;
        }
        function read(obj) {
            var orderid = $(obj).parents('.sss').parents('.p1').children('td:nth-child(1)').children('div:only-child').text();
            location.href="${pageContext.request.contextPath }/ReadOrder2?orderid="+orderid;
        }
    </script>
</head>
<body>
欢迎你,<%= name%>
   <table border="0" id="person" width="90%">

   </table>
</body>
</html>
