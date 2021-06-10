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
    <input type="button" value="各种类库存报表" onclick="kc2()">
</div>
<div>
    <input type="button" value="本日库存报表" onclick="kc3()">
</div>
<div>
    <input type="button" value="本周库存报表" onclick="kc4()">
</div>
<div>
    <input type="button" value="本月库存报表" onclick="kc5()">
</div>
<div>
    <input type="button" value="本季度库存报表" onclick="kc6()">
</div>
<div id="container" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    var lol=[];var lol2 = []
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath }/kc",
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
                    text: '库存报表'                 // 标题
                },
                xAxis: {
                    categories: lol   // x 轴分类
                },
                yAxis: {
                    title: {
                        text: '库存数量'                // y 轴标题
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
    function kc2() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/kc2",
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
                        text: '库存报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '库存数量'                // y 轴标题
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
    function kc3() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/kc3",
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
                        text: '库存报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '库存数量'                // y 轴标题
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
    function kc4() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/kc4",
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
                        text: '库存报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '库存数量'                // y 轴标题
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
    function kc5() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/kc5",
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
                        text: '库存报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '库存数量'                // y 轴标题
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
    function kc6() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath }/kc6",
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
                        text: '库存报表'                 // 标题
                    },
                    xAxis: {
                        categories: lol   // x 轴分类
                    },
                    yAxis: {
                        title: {
                            text: '库存数量'                // y 轴标题
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
