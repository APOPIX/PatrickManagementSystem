<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%--加上这一句来处理中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patrick 后台管理系统 1.0 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8"/>

    <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico"/>
    <!-- Bootstrap -->
    <link href="../assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/vendor/animate/animate.min.css">
    <link type="text/css" rel="stylesheet" media="all" href="../assets/js/vendor/mmenu/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" href="../assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="../assets/css/vendor/bootstrap-checkbox.css">

    <%--<link crossorigin="anonymous" media="all" integrity="sha512-UFMpXZiU8/kG0aZl62l3OFZi0gwlVRLYrsamBbXttDRSbDmQk1ZyKj5R11ghzrHB/NaIPBuLauI34mVpsuxx5w==" rel="stylesheet" href="https://github.githubassets.com/assets/frameworks-94eca081886beb7440fa7236f4fd103f.css" />--%>
    <%--<link crossorigin="anonymous" media="all" integrity="sha512-FIEp4ofjNZOwIuaCNdkF6w53h1fjud2bVTkAOnOQOL3+uw98WLUVoh+QIC6gJ/fWDkIeNNwkc/+gyn8NUJiWZw==" rel="stylesheet" href="https://github.githubassets.com/assets/site-2a37b0558327c9981d25e3ed83ae9eec.css" />--%>
    <%--<link crossorigin="anonymous" media="all" integrity="sha512-eqxTRxKT94LInlg/McScBezWtiFHXzx2NUh8bTSXsscsE8e7zxJE3tueMuDN+7DpHHo3ipfX6wnDuoechvkHAA==" rel="stylesheet" href="https://github.githubassets.com/assets/github-6a52a05624a8e37c96244b9669fd07a4.css" />--%>
    <link rel="stylesheet" href="../assets/js/vendor/rickshaw/css/rickshaw.min.css">
    <link rel="stylesheet" href="../assets/js/vendor/morris/css/morris.css">
    <link rel="stylesheet" href="../assets/js/vendor/tabdrop/css/tabdrop.css">
    <link rel="stylesheet" href="../assets/js/vendor/summernote/css/summernote.css">
    <link rel="stylesheet" href="../assets/js/vendor/summernote/css/summernote-bs3.css">
    <link rel="stylesheet" href="../assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="../assets/js/vendor/chosen/css/chosen-bootstrap.css">

    <link href="../assets/css/minimal.css" rel="stylesheet">

    <!--///////Xenia引入弹窗插件的代码-->
    <link href="../css/bootstrap-3.3.4.css" type="text/css" rel="stylesheet" media="all">
    <link href="../css/popup-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../css/mislider.css" rel="stylesheet" type="text/css"/>
    <link href="../css/mislider-custom.css" rel="stylesheet" type="text/css"/>

    <link href="../css/style.css" type="text/css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="../css/main-gallery.css" type="text/css" media="screen"/>  <!-- flexslider-CSS -->
    <link href="../css/font-awesome.css" rel="stylesheet">        <!-- font-awesome icons -->
    <!-- //Custom Theme files -->
    <!-- js -->
    <script src="../js/jquery-2.2.3.min.js"></script>
    <!-- //js -->
    <!-- web-fonts -->
    <%--<link href="http://fonts.googleapis.com/css?family=Frank+Ruhl+Libre:300,400,500,700,900" rel="stylesheet">--%>
    <%--<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">--%>
    <!-- //web-fonts -->

    <%--iview引入--%>
    <!-- import Vue.js -->
    <script src="//vuejs.org/js/vue.min.js"></script>
    <!-- import stylesheet -->
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
    <%--<link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">--%>
    <!-- import iView -->
    <script src="//unpkg.com/iview/dist/iview.min.js"></script>
    <%--//iview引入--%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script>
        // var
        myGoodsAndSector_data = [];
        <c:forEach items="${special_products_list}" var="goodsForSector">
        myGoodsAndSector_data.push({
            record_id: "${goodsForSector.id}",
            sector_name: "${goodsForSector.sector_name}",
            product_id: "${goodsForSector.product_id}",
        });
        </c:forEach>
        mySectors_data = []
        <c:forEach items="${special_sectors_list}" var="sectors">
        mySectors_data.push({
            record_id: "${sectors.id}",
            sector_name: "${sectors.sector_name}",
        });
        </c:forEach>
        myProducts_ids=[]
        <c:forEach items="${products_list}" var="product">
        myProducts_ids.push({
            product_id:"${product.id}"
        })
        </c:forEach>
    </script>
</head>
<body class="bg-1">


<!-- Preloader -->
<div class="mask">
    <div id="loader"></div>
</div>
<!--/Preloader -->

<!-- Wrap all page content here -->
<div id="wrap">


    <!-- Make page fluid -->
    <div class="row">


        <!-- Fixed navbar -->
        <div class="navbar navbar-default navbar-fixed-top navbar-transparent-black mm-fixed-top" role="navigation"
             id="navbar">

            <%--左上角--%>
            <!-- Branding -->
            <div class="navbar-header col-md-2">
                <a class="navbar-brand" href="">
                    <strong>Patrick</strong>后台管理系统
                </a>
                <div class="sidebar-collapse">
                    <a href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
            </div>
            <!-- Branding end -->


            <!-- .nav-collapse -->
            <div class="navbar-collapse">

                <!-- Page refresh -->
                <ul class="nav navbar-nav refresh">
                    <li class="divided">
                        <a href="#" class="page-refresh"><i class="fa fa-refresh"></i></a>
                    </li>
                </ul>
                <!-- /Page refresh -->


                <!-- Quick Actions -->
                <ul class="nav navbar-nav quick-actions">


                </ul>
                <!-- /Quick Actions -->


                <!-- Sidebar -->
                <ul class="nav navbar-nav side-nav" id="sidebar">

                    <li class="collapsed-content">
                        <ul>
                            <li class="search"><!-- Collapsed search pasting here at 768px --></li>
                        </ul>
                    </li>

                    <li class="navigation" id="navigation">
                        <a href="#" class="sidebar-toggle" data-toggle="#navigation">Navigation <i
                                class="fa fa-angle-up"></i></a>

                        <ul class="menu">

                            <li class="active">
                                <a href="/">
                                    <i class="fa fa-desktop"></i> 登录
                                </a>
                            </li>
                            <%--一级菜单栏--%>
                            <c:if test="${sessionScope.get('role') == 0 || sessionScope.get('role') == 2}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-pencil"></i> 商品管理 <b class="fa fa-plus dropdown-plus"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="branchStoresTables">
                                                <i class="fa fa-caret-right"></i> 门店表格
                                            </a>
                                        </li>
                                        <li>
                                            <a href="categoryOnly">
                                                <i class="fa fa-caret-right"></i> 类别信息
                                            </a>
                                        </li>
                                        <li>
                                            <a href="categoryAndGoods">
                                                <i class="fa fa-caret-right"></i> 商品信息
                                            </a>
                                        </li>
                                        <li>
                                            <a href="SpecialSector">
                                                <i class="fa fa-caret-right"></i> 特殊板块注册
                                            </a>
                                        </li>
                                        <li>
                                            <a href="goodsRegistToStore">
                                                <i class="fa fa-caret-right"></i> 门店商品管理
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>

                            <c:if test="${sessionScope.get('role') == 1 || sessionScope.get('role') == 2}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-pencil"></i> 订单管理 <b class="fa fa-plus dropdown-plus"></b>
                                    </a>
                                    <ul class="dropdown-menu">

                                        <li>
                                            <a href="order_list.html?key=0">
                                                <i class="fa fa-caret-right"></i> 订单列表
                                            </a>
                                        </li>
                                        <li>
                                            <a href="browse_statistics_full.html">
                                                <i class="fa fa-caret-right"></i> 热度统计
                                            </a>
                                        </li>
                                        <li>
                                            <a href="sales_statistics_full.html">
                                                <i class="fa fa-caret-right"></i> 销量统计
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>

                            <c:if test="${sessionScope.get('role') == 2}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-pencil"></i> 人员管理 <b class="fa fa-plus dropdown-plus"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="staff_register.html">
                                                <i class="fa fa-caret-right"></i> 添加管理人员
                                            </a>
                                        </li>
                                        <li>
                                            <a href="staff_list.html?key=0">
                                                <i class="fa fa-caret-right"></i>  管理人员列表
                                            </a>
                                        </li>
                                        <li>
                                            <a href="user_list.html?key=0">
                                                <i class="fa fa-caret-right"></i> 商城用户列表
                                            </a>
                                        </li>
                                        <li>
                                            <a href="management_log.html?key=0">
                                                <i class="fa fa-caret-right"></i> 历史操作记录
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>

                        </ul>
                    </li>
                </ul>
                <!-- Sidebar end -->


            </div>
            <!--/.nav-collapse -->


        </div>
        <!-- Fixed navbar end -->


        <!-- Page content -->
        <div id="content" class="col-md-12">


            <!-- page header -->
            <div class="pageheader">


                <h2><i class="fa fa-tachometer"></i> 派氏乐鲜生活馆
                    <span>后台管理系统.</span></h2>


            </div>
            <!-- /page header -->


            <!-- content main container -->
            <%--用于加载弹出框的--%>
            <!-- Modal1 -->
            <%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog">--%>
            <%--<div class="modal-dialog">--%>
            <%--<!-- Modal content-->--%>
            <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
            <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
            <%--<img src="images/2.jpg" alt=" " class="img-responsive">--%>
            <%--<h5>Donec lobortis pharetra dolor</h5>--%>
            <%--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, rds which don't look even slightly believable..</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <!-- //Modal1 -->
            <%--/用于加载弹出框的--%>

            <div class="featured-section" id="work">
                <section class="tile color transparent-black">
                    <div class="container">
                        <p class="sub-text">特殊活动板块</p>
                        <h3 class="title-w3">近期营销活动</h3>
                        <div class="content-bottom-in">
                            <ul id="flexiselDemo1">
                                <li>
                                    <div class="project-fur">
                                        <a href="#" data-toggle="modal" data-target="#myModal"><img
                                                class="img-responsive" src="images/p1.jpg" alt=""/> </a>
                                        <div class="fur">
                                            <h4>春节促销</h4>

                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="project-fur">
                                        <a href="#" data-toggle="modal" data-target="#myModal"><img
                                                class="img-responsive" src="images/p2.jpg" alt=""/> </a>
                                        <div class="fur">
                                            <h4>女神节特惠</h4>

                                        </div>

                                    </div>
                                </li>

                                <li>
                                    <div class="project-fur">
                                        <a href="#" data-toggle="modal" data-target="#myModal"><img
                                                class="img-responsive" src="images/p3.jpg" alt=""/> </a>
                                        <div class="fur">
                                            <h4>甜品品牌日</h4>

                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="project-fur">
                                        <a href="#" data-toggle="modal" data-target="#myModal"><img
                                                class="img-responsive" src="images/p4.jpg" alt=""/> </a>
                                        <div class="fur">
                                            <h4>怡宝品牌日</h4>

                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="project-fur">
                                        <a href="#" data-toggle="modal" data-target="#myModal"><img
                                                class="img-responsive" src="images/p5.jpg" alt=""/> </a>
                                        <div class="fur">
                                            <h4>乐活生鲜</h4>

                                        </div>

                                    </div>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <%--style="background: rgba(cd,91,9E,0.5)"--%>
                    <br><br><br><br>
                </section>
            </div>
            <div>
                <%--用于装注册到特殊板块的表格的--%>
                <section class="tile color transparent-black">
                    <div id="app">


                        <template>
                            <Divider>
                                <div style="color:#ffffff;font-size: large">特殊版块注册表</div>
                            </Divider>
                            <div style="margin-left: 20px;margin-right: 20px">
                                <i-table :columns="columns" :data="data">
                                    <template slot-scope="{ row, index }" slot="sector_name">
                                        <Input type="text" v-model="editSector_name" v-if="editIndex === index"/>
                                        <span v-else>{{ row.sector_name }}</span>
                                    </template>

                                    <%--<template slot-scope="{ row, index }" slot="product_id">--%>
                                    <%--<Input type="text" v-model="editProduct_id" v-if="editIndex === index" />--%>
                                    <%--<span v-else>{{ row.product_id }}</span>--%>
                                    <%--</template>--%>

                                    <template slot-scope="{ row, index }" slot="action">
                                        <div v-if="editIndex === index">
                                            <Button @click="handleSave(index)">更改</Button>
                                            <Button @click="handleAdd(index)">保存</Button>
                                            <Button @click="editIndex = -1">取消</Button>
                                            <Button type="error" style="color:#EE0000" @click="remove(index)">删除
                                            </Button>

                                        </div>
                                        <div v-else>
                                            <Button @click="handleEdit(row, index)">操作</Button>
                                        </div>
                                    </template>

                                </i-table>
                            </div>
                            <Divider>
                                <Button @click="addRow">添加新的数据</Button>
                            </Divider>
                        </template>
                    </div>

                </section>
                <section class="tile color transparent-black">
                    <!-- tile header -->
                    <div class="tile-header">
                        <h1><strong>特殊板块</strong>商品添加</h1>
                        <div class="controls">
                            <a href="SpecialSector" class="refresh"><i class="fa fa-refresh"></i></a>
                            <a href="SpecialSector" class="remove"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                        <div id="app2">
                           <div style="margin-left: 20px;margin-right:20px">
                               <template>
                                   <Row>
                                       <Col span="12" style="padding-right:10px">
                                       <%--可搜索匹配板块--%>
                                       <Select v-model="chooseSector_name" filterable >
                                           <Option v-for="item in sector_data" :value="item.sector_name" :key="item.record_id">{{ item.sector_name }}</Option>
                                       </Select>
                                       </Col>
                                       <Col span="12">
                                       <%--多选罗列商品--%>
                                       <Select v-model="chooseProducts_ids" multiple style="width:260px">
                                           <Option v-for="item in products_data" :value="item.product_id" :key="item.product_id">{{ item.product_id }}</Option>
                                       </Select>
                                       </Col>
                                       <Button  @click="addPSRecords">添加</Button>
                                   </Row>
                               </template>
                           </div>
                        </div>
                </section>
            </div>
            <!-- /.container -->
            <%--模块和商品对应的表格--%>
            <section class="tile color transparent-black">
                <div id="app3">
                    <template>
                        <Divider>
                            <div style="color:#ffffff;font-size: large">特殊版块注册表</div>
                        </Divider>
                        <div style="margin-left: 20px;margin-right: 20px">
                            <i-table :columns="columns" :data="data">
                                <template slot-scope="{ row, index }" slot="sector_name">
                                    <Input type="text" v-model="editSector_name" v-if="editIndex === index"/>
                                    <span v-else>{{ row.sector_name }}</span>
                                </template>

                                <template slot-scope="{ row, index }" slot="product_id">
                                <Input type="text" v-model="editProduct_id" v-if="editIndex === index" />
                                <span v-else>{{ row.product_id }}</span>
                                </template>

                                <template slot-scope="{ row, index }" slot="action">
                                    <div v-if="editIndex === index">
                                        <Button type="error" style="color:#EE0000" @click="remove(index)">删除
                                        </Button>
                                    </div>
                                    <div v-else>
                                        <Button @click="handleEdit(row, index)">操作</Button>
                                    </div>
                                </template>

                            </i-table>
                        </div>
                        <Divider>
                        </Divider>
                    </template>
                </div>

            </section>
            <%--/模块和商品对应的表格--%>
            <!-- /content container -->


        </div>
        <!-- Page content end -->


    </div>
    <!-- Make page fluid-->


</div>
<!-- Wrap all page content end -->


<section class="videocontent" id="video"></section>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../assets/js/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../assets/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="../assets/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="../assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="../assets/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="../assets/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
<script type="text/javascript" src="../assets/js/vendor/videobackground/jquery.videobackground.js"></script>
<script type="text/javascript" src="../assets/js/vendor/blockui/jquery.blockUI.js"></script>

<script src="../assets/js/vendor/flot/jquery.flot.min.js"></script>
<script src="../assets/js/vendor/flot/jquery.flot.time.min.js"></script>
<script src="../assets/js/vendor/flot/jquery.flot.selection.min.js"></script>
<script src="../assets/js/vendor/flot/jquery.flot.animator.min.js"></script>
<script src="../assets/js/vendor/flot/jquery.flot.orderBars.js"></script>
<script src="../assets/js/vendor/easypiechart/jquery.easypiechart.min.js"></script>

<script src="../assets/js/vendor/rickshaw/raphael-min.js"></script>
<script src="../assets/js/vendor/rickshaw/d3.v2.js"></script>
<script src="../assets/js/vendor/rickshaw/rickshaw.min.js"></script>

<script src="../assets/js/vendor/morris/morris.min.js"></script>

<script src="../assets/js/vendor/tabdrop/bootstrap-tabdrop.min.js"></script>

<script src="../assets/js/vendor/summernote/summernote.min.js"></script>

<script src="../assets/js/vendor/chosen/chosen.jquery.min.js"></script>

<script src="../assets/js/minimal.min.js"></script>

<%--/////////////////////////////////////////////////////Xenia/////////////////////////////--%>

<script src="../js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 4
        $("#slider4").responsiveSlides({
            auto: true,
            pager: true,
            nav: false,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
</script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 4
        $("#slider3").responsiveSlides({
            auto: true,
            pager: false,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
</script>

<!-- js -->
<script src="../js/main.js"></script>
<!-- search-jQuery -->
<!-- pop-up-box -->
<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box -->
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });
    });
</script>

<!-- Map-JavaScript -->
<!---<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
<script type="text/javascript">
    google.maps.event.addDomListener(window, 'load', init);
    function init() {
        var mapOptions = {
            zoom: 11,
            center: new google.maps.LatLng(40.6700, -73.9400),
            styles: [{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]
        };
        var mapElement = document.getElementById('map');
        var map = new google.maps.Map(mapElement, mapOptions);
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(40.6700, -73.9400),
            map: map,
        });
    }
</script>--->
<!-- stats -->
<script src="../js/jquery.waypoints.min.js"></script>
<script src="../js/jquery.countup.js"></script>
<script>
    $('.counter').countUp();
</script>
<!-- //stats -->

<!-- //Map-JavaScript -->
<script src="../js/mislider.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(function ($) {
        var slider = $('.mis-stage').miSlider({
            //  The height of the stage in px. Options: false or positive integer. false = height is calculated using maximum slide heights. Default: false
            stageHeight: 320,
            //  Number of slides visible at one time. Options: false or positive integer. false = Fit as many as possible.  Default: 1
            slidesOnStage: false,
            //  The location of the current slide on the stage. Options: 'left', 'right', 'center'. Defualt: 'left'
            slidePosition: 'center',
            //  The slide to start on. Options: 'beg', 'mid', 'end' or slide number starting at 1 - '1','2','3', etc. Defualt: 'beg'
            slideStart: 'mid',
            //  The relative percentage scaling factor of the current slide - other slides are scaled down. Options: positive number 100 or higher. 100 = No scaling. Defualt: 100
            slideScaling: 150,
            //  The vertical offset of the slide center as a percentage of slide height. Options:  positive or negative number. Neg value = up. Pos value = down. 0 = No offset. Default: 0
            offsetV: -5,
            //  Center slide contents vertically - Boolean. Default: false
            centerV: true,
            //  Opacity of the prev and next button navigation when not transitioning. Options: Number between 0 and 1. 0 (transparent) - 1 (opaque). Default: .5
            navButtonsOpacity: 1,
        });
    });
</script>

<script type="text/javascript">
    $(window).load(function () {
        $("#flexiselDemo1").flexisel({
            visibleItems: 3,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 640,
                    visibleItems: 2
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 2
                }
            }
        });

    });
</script>
<script type="text/javascript" src="../js/jquery.flexisel.js"></script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
        });
    });
</script>
<!-- start-smoth-scrolling -->
<script src="../js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>


<%--引入iView和Vue--%>
<link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
<script type="text/javascript" src="../js/vue.min.js"></script>
<script type="text/javascript" src="http://unpkg.com/iview/dist/iview.min.js"></script>
<script>
    var vue = new Vue({
        el: '#app',
        data() {
            return {
                columns: [
                    {
                        type: 'index',
                        width: 50,
                        align: 'center'
                    },
                    {
                        title: '活动板块名称',
                        key: 'sector_name',
                        width:720,
                        sortable: true,
                        slot: 'sector_name',
                    },
                    {
                        title: '操作',
                        key:
                            'action',
                        slot:
                            'action',
                        width:
                            250,
                        align:
                            'center',
                    }
                ],
                data: mySectors_data,
                editIndex: -1,  // 当前聚焦的输入框的行数
                editSector_name: '',  // 第一列输入框，当然聚焦的输入框的输入内容，与 data 分离避免重构的闪烁
                record_id: '',
            }
        },
        methods: {
            handleEdit(row, index) {
                this.record_id = row.record_id;
                this.editSector_name = row.sector_name;
                this.editIndex = index;
            },
            handleSave(index) {

                this.data[index].sector_name = this.editSector_name;
                this.data[index].record_id = this.record_id;
                this.editIndex = -1;
                test = this.data[index];
                $.ajax({
                    type: "POST",
                    url: '/SpecialSector/updateSector.do',
                    data: JSON.stringify(test),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("更新特殊版块的信息出错了！");
                    }

                })
            },
            remove(index) {
                test = this.data[index];
                this.data.splice(index, 1);
                $.ajax({
                    type: "POST",
                    url: '/SpecialSector/deleteSector.do',
                    data: JSON.stringify(test),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("删除特殊版块的信息出错了！");
                    }

                })
            },
            // /** 添加行 */
            addRow() {
                this.data.push({
                    store_sector: '',
                });
            },
            handleAdd(index) {
                this.data[index].sector_name = this.editSector_name;
                this.data[index].product_id = this.editProduct_id;
                this.editIndex = -1;
                test = this.data[index];
                // console.log(this.data[index].sector_name );
                $.ajax({
                    type: "POST",
                    url: '/SpecialSector/addSector.do',
                    data: JSON.stringify(test),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("添加特殊版块的信息出错了！");
                    }

                })
            },
        }
    })
</script>
<script>
    var vue2=new Vue({
        el: '#app2',
        data() {
            return {
                columns: [],
                sector_data:mySectors_data,
                products_data:myProducts_ids,
                chooseSector_name:'',
                chooseProducts_ids:[],
            }
        },
        methods:{
            addPSRecords(){
                myPSRecords=[];
                for(product_id in this.chooseProducts_ids){
                    myPSRecords.push({
                        sector_name:this.chooseSector_name,
                        product_id:product_id
                    });
                    // console.log(JSON.stringify(myPSRecords));
                }
                $.ajax({
                    type: "POST",
                    url: '/SpecialSector/addPSRecords.do',
                    data:{psRecords:JSON.stringify(myPSRecords)},
                    // contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("添加特殊版块和商品的信息集合出错了！");
                    }
                })
            }
        }
    })
</script>
<script>
    var vue = new Vue({
        el: '#app3',
        data() {
            return {
                columns: [
                    {
                        type: 'index',
                        width: 50,
                        align: 'center'
                    },
                    {
                        title: '活动板块名称',
                        key: 'sector_name',
                        sortable: true,
                        slot: 'sector_name',
                    },
                    {
                        title: '商品编号',
                        key: 'product_id',
                        sortable: true,
                        slot: 'product_id',
                    },
                    {
                        title: '操作',
                        key:
                            'action',
                        slot:
                            'action',
                        width:
                            250,
                        align:
                            'center',
                    }
                ],
                data: myGoodsAndSector_data,
                editIndex: -1,  // 当前聚焦的输入框的行数
                editSector_name: '',  // 第一列输入框，当然聚焦的输入框的输入内容，与 data 分离避免重构的闪烁
                editProduct_id:'',
                record_id: '',
            }
        },
        methods: {
            handleEdit(row, index) {
                this.record_id = row.record_id;
                this.editSector_name = row.sector_name;
                this.editProduct_id=row.product_id;
                this.editIndex = index;
            },
            remove(index) {
                this.editIndex = -1;
                test = this.data[index];
                this.data.splice(index, 1);
                $.ajax({
                    type: "POST",
                    url: '/SpecialSector/removeProductsForSector.do',
                    data: JSON.stringify(test),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("删除特殊版块的信息出错了！");
                    }

                })
            },
        }
    })
</script>
<%--/////////////////////////////////////////////////////Xenia/////////////////////////////--%>

</body>
</html>
      
