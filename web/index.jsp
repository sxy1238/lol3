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
    <title>商品管理</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
    </script>
    <script type="text/javascript">
        var datafood;
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath }/select",
        contentType:"application/json;charset=UTF-8",
        dataType: "JSON",
        success: function(data){
            datafood=data;
          console.log(data);
          $("#sxy").append("<tr>" +
              "<th></th>" +
                  "<th data-name='id'>编号</th>" +
                  "<th data-name='name'>名称</th>" +
                  "<th data-name='url'>图片</th>" +
                  "<th data-name='price'>价格</th>" +
                  "<th data-name='discount'>折扣价格</th>" +
                  "<th data-name='count'>库存数量</th>" +
                  "<th data-name='kind'>类型</th>" +
                  "<th data-name='action'>操作</th>" +
                  "</tr>")
          for(var i=0;i<data.length;i++){

            $("#sxy").append("<tr class='p1'>" +
                    "<td class='ss7'><input type='checkbox' value="+data[i].id+"></td>" +
                    "<td class='ss1'><div id='id'>"+data[i].id+"</div></td>" +
                    "<td class='ss1'><div id='name'>"+data[i].name+"</div></td>" +
                    "<td class='ss2'><img src="+data[i].url+" height=\"90\" width=\"100\"></td>" +
                    "<td class='ss3'><div id='price'>"+data[i].price+"</div></td>" +
                    "<td class='ss4'><div id='discount'>"+data[i].discount+"</div></td>" +
                    "<td class='ss5'><div id='count'>"+data[i].count+"</div></td>" +
                    "<td class='ss6'><div id='kind'>"+data[i].kind+"</div></td>" +
                    " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /><input type=\"button\" onclick=\"update(this)\" value=\"修改\" /></td>" +
                    "</tr>");
          };
        }
      });
    </script>
    <script type="text/javascript">
        function cancel() {

            $(".edit").hide();
        }
        function cancel2() {
          $(".cancel").hide();
        }
        function update2(obj) {
            var id=document.getElementById("e_id").value
            var name=document.getElementById("e_name").value
            var url=document.getElementById("e_url").value
            var price=document.getElementById("e_price").value
            var discount=document.getElementById("e_discount").value
            var count=document.getElementById("e_count").value
            var kind=document.getElementById("e_kind").value
            alert(id+name+url+price+discount+count+kind)
          $.ajax({
            url:"${pageContext.request.contextPath}/updateById",
            type:"post",
            data:JSON.stringify({id:id,name:name,url:url,price:price,discount:discount,count:count,kind:kind}),
            contentType:"application/json;charset=UTF-8",
            dataType:"json",
            success:function (data) {
              if(data.information<=0){
                 alert("修改失败")
              }else {
                location.href ="${pageContext.request.contextPath}/index.jsp";
              }
            }
          })
        }
      function run(obj){
        var id =$(obj).parents('.sss').parents('.p1').children('td:nth-child(2)').children('div:only-child').text();
        var name =$(obj).parents('.sss').parents('.p1').children('td:nth-child(3)').children('div:only-child').text();
        alert(id);
        $.ajax({
          url:"${pageContext.request.contextPath}/delete2?id="+id+"&&name="+name,
          type:"post",
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {

            if(parseInt(data.information)==1){
              location.href ="${pageContext.request.contextPath}/index.jsp";
            }else {
              alert(data.information)
            }
          }
        })
      }
      function update(obj){
          var id =$(obj).parents('.sss').parents('.p1').children('td:nth-child(2)').children('div:only-child').text();
          alert(id);
          for (var i = 0; i < datafood.length; i++) {
              if (id==datafood[i].id){
                  document.getElementById("e_id").setAttribute("value",datafood[i].id)
                  document.getElementById("e_name").setAttribute("value",datafood[i].name)
                  document.getElementById("e_url").setAttribute("value",datafood[i].url)
                  document.getElementById("e_price").setAttribute("value",datafood[i].price)
                  document.getElementById("e_discount").setAttribute("value",datafood[i].discount)
                  document.getElementById("e_count").setAttribute("value",datafood[i].count)
                  document.getElementById("e_kind").setAttribute("value",datafood[i].kind)
              }
          }
          document.getElementById("edit").setAttribute("style","display:block")
      }
      function play2(obj) {
        document.getElementById("add").setAttribute("style","display:block")
      }
      function jump() {
        location.href="${pageContext.request.contextPath}/kind.jsp";
      }
        function jump2() {
          location.href="${pageContext.request.contextPath}/order.jsp";
        }
        function jump3() {
          location.href="${pageContext.request.contextPath}/gl.jsp";
        }
        function jump4() {
          location.href="${pageContext.request.contextPath}/bb.jsp";
        }
        function jump5() {
          location.href="${pageContext.request.contextPath}/kc.jsp";
        }
    </script>
    <script type="text/javascript">
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
          url:"${pageContext.request.contextPath}/delete?id="+id,
          type:"post",

          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            location.href ="${pageContext.request.contextPath}/index.jsp";
          }
        })
      }
      function search() {
        var name=document.getElementById("cx").value
        var option=document.getElementById("option").value

        alert(option+"的值是"+name)
        $.ajax({
          url:"${pageContext.request.contextPath}/searchByName?"+option+"="+name,
          type:"post",
          contentType:"application/json;charset=UTF-8",
          dataType:"json",
          success:function (data) {
            console.log(data);
            $("#sxy").html('')
            $("#sxy").append("<tr>" +
                    "<th></th>" +
                    "<th data-name='id'>编号</th>" +
                    "<th data-name='name'>名称</th>" +
                    "<th data-name='url'>图片</th>" +
                    "<th data-name='price'>价格</th>" +
                    "<th data-name='discount'>折扣价格</th>" +
                    "<th data-name='count'>库存数量</th>" +
                    "<th data-name='kind'>类型</th>" +
                    "<th data-name='action'>操作</th>" +
                    "</tr>")
            for(var i=0;i<data.length;i++){

              $("#sxy").append("<tr class='p1'>" +
                      "<td class='ss7'><input type='checkbox' value="+data[i].id+"></td>" +
                      "<td class='ss1'><div id='id'>"+data[i].id+"</div></td>" +
                      "<td class='ss1'><div id='name'>"+data[i].name+"</div></td>" +
                      "<td class='ss2'><img src="+data[i].url+" height=\"90\" width=\"100\"></td>" +
                      "<td class='ss3'><div id='price'>"+data[i].price+"</div></td>" +
                      "<td class='ss4'><div id='discount'>"+data[i].discount+"</div></td>" +
                      "<td class='ss5'><div id='count'>"+data[i].count+"</div></td>" +
                      "<td class='ss6'><div id='kind'>"+data[i].kind+"</div></td>" +
                      " <td class='sss'><input type=\"button\" onclick=\"run(this)\" value=\"删除\" /><input type=\"button\" onclick=\"update(this)\" value=\"修改\" /></td>" +
                      "</tr>");
            };
          }
        })
      }
    </script>
  </head>
  <body>
  <div>
    <input type="button" value="类型管理" onclick="jump()">
  </div>
  <div>
    <input type="button" value="订单管理" onclick="jump2()">
  </div>
  <div>
    <input type="button" value="用户管理" onclick="jump3()">
  </div>
  <div>
    <input type="button" value="销售报表" onclick="jump4()">
  </div>
  <div>
    <input type="button" value="库存报表" onclick="jump5()">
  </div>
   <div align="center">
     <div>
       <select id="option">
         <option value="name">商品名称</option>
         <option value="kind">类型</option>
       </select>
       <input type="text" id="cx" class="cx">
     </div>
     <div><button  class="search" onclick="search()">查询</button></div>
   </div>
  <table border="1" align="center" id="sxy">

  </table>
  <div id="edit" class="edit" style="display: none">
      <div class="edit-bg"></div>
     <div class="edit-center">
       <div class="edit-title">商品信息编辑</div>
       <p><span>编号:</span><input id="e_id" type="text" name="id"> </p>
       <p><span>名称:</span><input id="e_name" type="text" name="name"> </p>
       <p><span>图片:</span><input id="e_url" type="text" name="url" > </p>
       <p><span>价格:</span><input id="e_price" type="text" name="price"> </p>
       <p><span>折扣价格:</span><input id="e_discount" type="text" name="discount"> </p>
       <p><span>库存数量:</span><input id="e_count" type="text" name="count"> </p>
       <p><span>类型:</span><input id="e_kind" type="text" name="kind"> </p>
       <p class="lol"><button class="edit-save" onclick="update2()">提交</button>
       <button class="edit-cancel" onclick="cancel()">取消</button> </p>
     </div>
  </div>
  <br>
  <br>
  <div align="center"><input type="button" onclick="play()" value="删除" ></div>
  <div align="center"><input type="button" onclick="play2()" value="添加商品" ></div>
  <br>
  <br>
  <br>
  <div class="add" id="add" style="display: none">
    <form action="${pageContext.request.contextPath}/AddFood" method="post" enctype="multipart/form-data">
      商品名称：<input type="text" name="name">
      商品图片：<input type="file" name="url" multiple="multiple">
      商品价格:<input type="text" name="price">
      折扣价格:<input type="text" name="discount">
      库存数量:<input type="text" name="count">
      商品类型:<input type="text" name="kind"><br>
      <button type="submit" >提交</button>
    </form>
    <div><button class="cancel" onclick="cancel2()">取消</button></div>
  </div>
   <form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
     选择文件：<input id="file" type="file" name="file" multiple="multiple" />
     <input type="submit" value="上传" />
   </form>
  </body>
</html>
