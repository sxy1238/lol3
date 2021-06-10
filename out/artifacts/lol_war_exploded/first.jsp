<%@ page import="com.example.model.User" %><%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2021/4/14
  Time: 10:07
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>电商首页</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">

    </script>
      <style type="text/css">
          table
          {
              border-collapse: collapse;
              margin: 0 auto;
              text-align: center;
          }
          table td, table th
          {
              border: 1px solid #cad9ea;
              color: #666;
              height: 30px;
          }
          table thead th
          {
              background-color: #CCE8EB;
              width: 100px;
          }
          table tr:nth-child(odd)
          {
              background: #fff;
          }
          table tr:nth-child(even)
          {
              background: #F5FAFA;
          }
      </style>
    <script type="text/javascript">
        var datafood,datanotice,datashop;
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath }/select",
        contentType:"application/json;charset=UTF-8",
        dataType: "JSON",
        success: function(data){
            datafood=data;
          console.log(data);
          $("#sxy").append("<tr>" +
                  "<th data-name='id'>编号</th>" +
                  "<th data-name='name'>名称</th>" +
                  "<th data-name='url'>图片</th>" +
                  "<th data-name='price'>价格</th>" +
                  "<th data-name='discount'>折扣价格</th>" +
                  "<th data-name='count'>库存数量</th>" +
                  "<th data-name='kind'>类型</th>" +
              "<th data-name='action' colspan='4'>操作</th>" +
                  "</tr>")
          for(var i=0;i<data.length;i++){
            $("#sxy").append("<tr class='p1'>" +
                    "<td class='ss1'><div id='id'>"+data[i].id+"</div></td>" +
                    "<td class='ss1'><div id='name'>"+data[i].name+"</div></td>" +
                    "<td class='ss2'><img src="+data[i].url+" height=\"90\" width=\"100\"></td>" +
                    "<td class='ss3'><div id='price'>"+data[i].price+"</div></td>" +
                    "<td class='ss4'><div id='discount'>"+data[i].discount+"</div></td>" +
                    "<td class='ss5'><div id='count'>"+data[i].count+"</div></td>" +
                    "<td class='ss6'><div id='kind'>"+data[i].kind+"</div></td>" +
                " <td class='sss1'><input type=\"button\" onclick=\"jian(this)\" value=\"-\" /></td>" +
                "<td class='ss7'><div id='sum'>"+"0"+"</div></td>" +
                " <td class='sss2'><input type=\"button\" onclick=\"jia(this)\" value=\"+\" /></td>" +
                " <td class='sss3'><input type=\"button\" onclick=\"Addshop(this)\" value=\"加入购物车\" /></td>" +
                    "</tr>");
          };


        }
      });
        $.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath }/showNotice",
          contentType:"application/json;charset=UTF-8",
          dataType: "JSON",
          success: function(data){
            datanotice=data;
            console.log(data);
            $("#sxy2").append("<tr>" +
                    "<th data-name='id'>编号</th>" +
                    "<th data-name='title'>标题</th>" +
                    "<th data-name='date'>日期</th>" +
                "<th data-name='date'>操作</th>" +
                    "</tr>")
            for(var i=0;i<data.length;i++){

              $("#sxy2").append("<tr class='p1'>" +
                      "<td class='ss1'><div id='id'>"+data[i].id+"</div></td>" +
                      "<td class='ss2'><div id='title'>"+data[i].title+"</div></td>" +
                     // "<td class='ss3' ><div id='content'>"+data[i].content+"</div></td>" +
                      "<td class='ss4'><div id='time'>"+data[i].time+"</div></td>" +
                      " <td class='sss'><input type=\"button\" onclick=\"read(this)\" value=\"查看\" /></td>" +
                      "</tr>");
            };
          }
        });
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/showKinds",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success: function(data){
                console.log(data);
                for(var i=0;i<data.length;i++){
                    $("#lol").append("<td class='sss'>" +
                        "<input id='type' type=\"button\" onclick=\"fl(this)\" value='"+data[i].kind+"' />" +
                        "</td>");
                };


            }
        });
    </script>
    <script type="text/javascript">
        function Addshop(obj) {
            var username="<%= name%>"
            if(username==""){
                alert("需要登录才能进行购物车操作")
            }else {
                var id=$(obj).parents(".sss3").parents(".p1").children('td:nth-child(1)').children('div:only-child').text();
                var sum=$(obj).parents(".sss3").parents(".p1").children('td:nth-child(9)').children('div:only-child').text();
                $.ajax({
                    url:"${pageContext.request.contextPath}/Addshop?id="+id+"&sum="+sum,
                    type:"post",
                    contentType:"application/json;charset=UTF-8",
                    dataType:"json",
                    success:function (data) {
                        var flag=0;
                        for (var i=0;i<datashop.length;i++){
                            // console.log("i="+i)
                            if(parseInt(datashop[i].foodid)==parseInt(id)){
                                flag=1;
                                //console.log("flag="+flag)
                                datashop[i].count=datashop[i].count+parseInt(sum);
                            }
                        }
                        $("#car").html('')
                        $("#car").append("<tr>\n" +
                            "      <th>编号</th>\n" +
                            "      <th>名称</th>\n" +
                            "      <th>图片</th>\n" +
                            "      <th>价格</th>\n" +
                            "      <th>数量</th>\n" +
                            "      <th>操作</th>\n" +
                            "      </tr>")
                        for (var i = 0; i < datashop.length; i++) {
                            $("#car").append("<tr class='p1'>" +
                                "<td class='ss1'><div id='id'>" + datashop[i].foodid + "</div></td>" +
                                "<td class='ss1'><div id='name'>" + datashop[i].name + "</div></td>" +
                                "<td class='ss2'><img src=" + datashop[i].url + " height=\"90\" width=\"100\"></td>" +
                                "<td class='ss4'><div id='discount'>" + datashop[i].discount + "</div></td>" +
                                "<td class='ss5'><div id='count'>" + datashop[i].count + "</div></td>" +
                                " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                                "</tr>");

                        }
                        if(flag==0){
                            var s1,s2,s3;
                            for (var i=0;i<datafood.length;i++){
                                if(parseInt(datafood[i].id)==parseInt(id)){
                                    s1=datafood[i].name;
                                    s2=datafood[i].url
                                    s3=datafood[i].discount
                                    var gwc={}
                                    gwc.foodid=id
                                    gwc.name=s1
                                    gwc.url=s2
                                    gwc.discount=s3
                                    gwc.count=sum
                                    datashop.push(gwc)
                                    $("#car").append("<tr class='p1'>" +
                                        "<td class='ss1'><div id='id'>" + datafood[i].id + "</div></td>" +
                                        "<td class='ss1'><div id='name'>" + datafood[i].name + "</div></td>" +
                                        "<td class='ss2'><img src=" + datafood[i].url + " height=\"90\" width=\"100\"></td>" +
                                        "<td class='ss4'><div id='discount'>" + datafood[i].discount + "</div></td>" +
                                        "<td class='ss5'><div id='count'>" + sum + "</div></td>" +
                                        " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                                        "</tr>");
                                }
                            }
                        }

                    }
                })
            }

        }
        function jia(obj) {
            var sum =$(obj).parents(".sss2").parents(".p1").children('td:nth-child(9)').children('div:only-child').text();
            var zs =$(obj).parents(".sss2").parents(".p1").children('td:nth-child(6)').children('div:only-child').text();
            /*if(parseInt(sum)==parseInt(zs)){
                alert("库存不足")
            }else {*/
                // alert(sum)
                var count=parseInt(sum)+1
                //alert(count)
                var sum2=count+""
                $(obj).parents(".sss2").parents(".p1").children('td:nth-child(9)').children('div:only-child').html(sum2)
            /*}*/

        }
        function jian(obj) {
            var sum =$(obj).parents(".sss1").parents(".p1").children('td:nth-child(9)').children('div:only-child').text();
             //alert(sum)
            if(parseInt(sum)==0){
                alert("购买数量不能为负数")
            }else {
                var count=parseInt(sum)-1
                //alert(count)
                var sum2=count+""
                $(obj).parents(".sss1").parents(".p1").children('td:nth-child(9)').children('div:only-child').html(sum2)
            }

        }
      function read(obj) {
          document.getElementById("txt").setAttribute("style","display:block;position: relative;left: 800px\"")
        var id =$(obj).parents('.sss').parents('.p1').children('td:nth-child(1)').children('div:only-child').text();
        for (var i=0;i<datanotice.length;i++){
          if (id==datanotice[i].id){
            $("#text1").html('')
              $("#text1").append(" <textarea name=\"content\" cols=\"20\" rows=\"8\" >"+datanotice[i].content+"</textarea>")
          }
        }
      }
      function fl(obj) {
          var kind=$(obj).val()
          alert(kind)
          $("#sxy").html('')
          $("#sxy").append("<tr>" +
              "<th data-name='id'>编号</th>" +
              "<th data-name='name'>名称</th>" +
              "<th data-name='url'>图片</th>" +
              "<th data-name='price'>价格</th>" +
              "<th data-name='discount'>折扣价格</th>" +
              "<th data-name='count'>库存数量</th>" +
              "<th data-name='kind'>类型</th>" +
              "<th data-name='action' colspan='4'>操作</th>" +
              "</tr>")
          for(var i=0;i<datafood.length;i++){
              if(kind.indexOf(datafood[i].kind)==0&&datafood[i].kind.indexOf(kind)==0){
                  $("#sxy").append("<tr class='p1'>" +
                      "<td class='ss1'><div id='id'>" + datafood[i].id + "</div></td>" +
                      "<td class='ss1'><div id='name'>" + datafood[i].name + "</div></td>" +
                      "<td class='ss2'><img src=" + datafood[i].url + " height=\"90\" width=\"100\"></td>" +
                      "<td class='ss3'><div id='price'>" + datafood[i].price + "</div></td>" +
                      "<td class='ss4'><div id='discount'>" + datafood[i].discount + "</div></td>" +
                      "<td class='ss5'><div id='count'>" + datafood[i].count + "</div></td>" +
                      "<td class='ss6'><div id='kind'>" + datafood[i].kind + "</div></td>" +
                      " <td class='sss1'><input type=\"button\" onclick=\"jian(this)\" value=\"-\" /></td>" +
                      "<td class='ss7'><div id='sum'>"+"0"+"</div></td>" +
                      " <td class='sss2'><input type=\"button\" onclick=\"jia(this)\" value=\"+\" /></td>" +
                      " <td class='sss3'><input type=\"button\" onclick=\"Addshop(this)\" value=\"加入购物车\" /></td>" +
                      "</tr>");
              }
          };

      }
      function way() {
          $("#text1").html('')
          document.getElementById("txt").setAttribute("style","display:none")
      }
      function qx() {
          document.getElementById("shop").setAttribute("style","display:none");
      }
      function shop() {
          $.ajax({
              url:"${pageContext.request.contextPath}/Shop",
              type:"post",
              contentType:"application/json;charset=UTF-8",
              dataType:"json",
              success:function (data) {
                  console.log(data);
                  datashop=data
                 document.getElementById("shop").setAttribute("style","display:block");
                 $("#car").html('')
                  $("#car").append("<tr>\n" +
                      "      <th>编号</th>\n" +
                      "      <th>名称</th>\n" +
                      "      <th>图片</th>\n" +
                      "      <th>价格</th>\n" +
                      "      <th>数量</th>\n" +
                      "      <th>操作</th>\n" +
                      "      </tr>")
                  for (var i = 0; i < data.length; i++) {
                      $("#car").append("<tr class='p1'>" +
                          "<td class='ss1'><div id='id'>" + data[i].foodid + "</div></td>" +
                          "<td class='ss1'><div id='name'>" + data[i].name + "</div></td>" +
                          "<td class='ss2'><img src=" + data[i].url + " height=\"90\" width=\"100\"></td>" +
                          "<td class='ss4'><div id='discount'>" + data[i].discount + "</div></td>" +
                          "<td class='ss5'><div id='count'>" + data[i].count + "</div></td>" +
                          " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                          "</tr>");

                  }
              }
          })
      }
      function qk() {
          $.ajax({
              url:"${pageContext.request.contextPath}/DeleteAll",
              type:"post",
              contentType:"application/json;charset=UTF-8",
              dataType:"json",
              success:function (data) {
                  console.log(data);
                  document.getElementById("shop").setAttribute("style","display:block");
                  $("#car").html('')


              }
          })
      }
      function run(obj) {
          var foodid=$(obj).parents(".sss").parents(".p1").children('td:nth-child(1)').children('div:only-child').text();
          alert(foodid)
          $.ajax({
              url:"${pageContext.request.contextPath}/deleteShop?foodid="+foodid,
              type:"post",
              contentType:"application/json;charset=UTF-8",
              dataType:"json",
              success:function (data) {
                  $("#car").html('')
                  $("#car").append("<tr>\n" +
                      "      <th>编号</th>\n" +
                      "      <th>名称</th>\n" +
                      "      <th>图片</th>\n" +
                      "      <th>价格</th>\n" +
                      "      <th>数量</th>\n" +
                      "      <th>操作</th>\n" +
                      "      </tr>")
                  for (var i=0;i<datashop.length;i++){
                      if(parseInt(data.information)!=parseInt(datashop[i].foodid)){
                          $("#car").append("<tr class='p1'>" +
                              "<td class='ss1'><div id='id'>" + datashop[i].foodid + "</div></td>" +
                              "<td class='ss1'><div id='name'>" + datashop[i].name + "</div></td>" +
                              "<td class='ss2'><img src=" + datashop[i].url + " height=\"90\" width=\"100\"></td>" +
                              "<td class='ss4'><div id='discount'>" + datashop[i].discount + "</div></td>" +
                              "<td class='ss5'><div id='count'>" + datashop[i].count + "</div></td>" +
                              " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /></td>" +
                              "</tr>");
                      }else {
                          datashop.splice(i,1)
                      }

                  }
              }
          })
      }
      function search() {
        var name=document.getElementById("cx").value
        var option=document.getElementById("option").value
        $.ajax({
          url:"${pageContext.request.contextPath}/searchByName?"+option+"="+name,
          type:"post",
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
              console.log(data);
              $("#sxy").html('')
              $("#sxy").append("<tr>" +
                  "<th data-name='id'>编号</th>" +
                  "<th data-name='name'>名称</th>" +
                  "<th data-name='url'>图片</th>" +
                  "<th data-name='price'>价格</th>" +
                  "<th data-name='discount'>折扣价格</th>" +
                  "<th data-name='count'>库存数量</th>" +
                  "<th data-name='kind'>类型</th>" +
                  "<th data-name='action' colspan='4'>操作</th>" +
                  "</tr>")
              for (var i = 0; i < data.length; i++) {

                  $("#sxy").append("<tr class='p1'>" +
                      "<td class='ss1'><div id='id'>" + data[i].id + "</div></td>" +
                      "<td class='ss1'><div id='name'>" + data[i].name + "</div></td>" +
                      "<td class='ss2'><img src=" + data[i].url + " height=\"90\" width=\"100\"></td>" +
                      "<td class='ss3'><div id='price'>" + data[i].price + "</div></td>" +
                      "<td class='ss4'><div id='discount'>" + data[i].discount + "</div></td>" +
                      "<td class='ss5'><div id='count'>" + data[i].count + "</div></td>" +
                      "<td class='ss6'><div id='kind'>" + data[i].kind + "</div></td>" +
                      " <td class='sss1'><input type=\"button\" onclick=\"jian(this)\" value=\"-\" /></td>" +
                      "<td class='ss7'><div id='sum'>"+"0"+"</div></td>" +
                      " <td class='sss2'><input type=\"button\" onclick=\"jia(this)\" value=\"+\" /></td>" +
                      " <td class='sss3'><input type=\"button\" onclick=\"Addshop(this)\" value=\"加入购物车\" /></td>" +
                      "</tr>");

              }
          }
        })
      }

    </script>
  </head>
  <body>
  <div>
      <div>欢迎你,<%= name%><a href="${pageContext.request.contextPath}/person.jsp">用户中心</a></div>
      <div><a href="${pageContext.request.contextPath}/tuichu">注销</a> </div>
      <div><a href="${pageContext.request.contextPath}/login.jsp">登录</a> </div>
  </div>
    <table style="position: relative;right: 30px">
        <tr id="lol" class="lol">

        </tr>
    </table>
   <div align="center" style="position: relative;right: 70px">
     <div>
       <select id="option">
         <option value="name">商品名称</option>
         <option value="kind">类型</option>
       </select>
       <input type="text" id="cx" class="cx">
     </div>
     <div><button  class="search" onclick="search()">查询</button></div>
   </div>
  <table border="0" id="sxy" style="position: relative;right: 10px">

  </table>
   <table border="0" align="right" id="sxy2" style="position: fixed;right: 100px;top: 50px">

   </table>
   <%--<div style="background: aqua;height: 400px;width: 1200px;display: flex" id="first" >

   </div>--%>
   <div style="position: fixed;left: 850px;top: 550px">
       <div style="display: none" id="txt">
           <div id="text1"></div>
           <div ><input type="button" value="取消" onclick="way()"></div>
       </div>
   </div>
  <div style="position: fixed;bottom: 620px"><input type="button" value="购物车" onclick="shop()"></div>

  <div style="position: fixed;bottom: 160px;width: 300px;background: red">
      <div  id="shop" style="display: none">
          <table id="car" >

          </table>
          <div><input type="button" value="取消" onclick="qx()"></div>
          <div><input type="button" value="清空" onclick="qk()"></div>
          <div><a href="${pageContext.request.contextPath}/queren">结算</a> </div>
      </div>

  </div>

  </body>
</html>
