<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2021/5/30
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-1.12.4.js">
    </script>
</head>
<body>
<script src="http://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
<div>
    <input type="button" value="各种类销售报表" onclick="bb2()">
</div>
<div>
    <input type="button" value="单日销售报表" onclick="bb3()">
</div>
<div>
    <input type="button" value="单周销售报表" onclick="bb4()">
</div>
<div>
    <input type="button" value="单月销售报表" onclick="bb5()">
</div>
<div>
    <input type="button" value="单季度销售报表" onclick="bb6()">
</div>
<div>
    <input type="button" value="单年度销售报表" onclick="bb7()">
</div>
<div id="container" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var lol=[];var lol2 = []
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath }/bb",
        contentType:"application/json;charset=UTF-8",
        dataType: "JSON",
        success:function (data) {
            console.log(data)
            lol=data.name
            lol2=data.count
            var options = {
                chart: {
                    type: 'line'                          //指定图表的类型，默认是折线图（line）
                },
                title: {
                    text: '销售报表'                 // 标题
                },
                xAxis: {
                    categories: lol   // x 轴分类
                },
                yAxis: {
                    title: {
                        text: '销售数量'                // y 轴标题
                    }
                },
                series: [{                              // 数据列
                    name: '电商',                        // 数据列名
                    data: lol2                    // 数据
                }]
            };
            var chart = Highcharts.chart('container', options);
        }
    })
    function bb2() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/bb2",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success:function (data) {
                console.log(data)
                lol=data.name
                lol2=data.count
                var options = {
                    chart: {
                        type: 'line'                          //指定图表的类型，默认是折线图（line）
                    },
                    title: {
                        text: '销售报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '销售数量'                // y 轴标题
                        }
                    },
                    series: [{                              // 数据列
                        name: '电商',                        // 数据列名
                        data: lol2                    // 数据
                    }]
                };
                var chart = Highcharts.chart('container', options);
            }
        })
    }
    function bb3() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/bb3",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success:function (data) {
                console.log(data)
                lol=data.name
                lol2=data.count
                var options = {
                    chart: {
                        type: 'line'                          //指定图表的类型，默认是折线图（line）
                    },
                    title: {
                        text: '销售报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '销售数量'                // y 轴标题
                        }
                    },
                    series: [{                              // 数据列
                        name: '电商',                        // 数据列名
                        data: lol2                    // 数据
                    }]
                };
                var chart = Highcharts.chart('container', options);
            }
        })
    }
    function bb4() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/bb4",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success:function (data) {
                console.log(data)
                lol=data.name
                lol2=data.count
                var options = {
                    chart: {
                        type: 'line'                          //指定图表的类型，默认是折线图（line）
                    },
                    title: {
                        text: '销售报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '销售数量'                // y 轴标题
                        }
                    },
                    series: [{                              // 数据列
                        name: '电商',                        // 数据列名
                        data: lol2                    // 数据
                    }]
                };
                var chart = Highcharts.chart('container', options);
            }
        })
    }
    function bb5() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/bb5",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success:function (data) {
                console.log(data)
                lol=data.name
                lol2=data.count
                var options = {
                    chart: {
                        type: 'line'                          //指定图表的类型，默认是折线图（line）
                    },
                    title: {
                        text: '销售报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '销售数量'                // y 轴标题
                        }
                    },
                    series: [{                              // 数据列
                        name: '电商',                        // 数据列名
                        data: lol2                    // 数据
                    }]
                };
                var chart = Highcharts.chart('container', options);
            }
        })
    }
    function bb6() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/bb6",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success:function (data) {
                console.log(data)
                lol=data.name
                lol2=data.count
                var options = {
                    chart: {
                        type: 'line'                          //指定图表的类型，默认是折线图（line）
                    },
                    title: {
                        text: '销售报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '销售数量'                // y 轴标题
                        }
                    },
                    series: [{                              // 数据列
                        name: '电商',                        // 数据列名
                        data: lol2                    // 数据
                    }]
                };
                var chart = Highcharts.chart('container', options);
            }
        })
    }
    function bb7() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/bb7",
            contentType:"application/json;charset=UTF-8",
            dataType: "JSON",
            success:function (data) {
                console.log(data)
                lol=data.name
                lol2=data.count
                var options = {
                    chart: {
                        type: 'line'                          //指定图表的类型，默认是折线图（line）
                    },
                    title: {
                        text: '销售报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '销售数量'                // y 轴标题
                        }
                    },
                    series: [{                              // 数据列
                        name: '电商',                        // 数据列名
                        data: lol2                    // 数据
                    }]
                };
                var chart = Highcharts.chart('container', options);
            }
        })
    }
</script>
</body>
</html>
