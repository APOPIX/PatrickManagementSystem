<%--廖馨婷的门店页面--%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%--加上这一句来处理中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patrick 后台管理系统 1.0 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8"/>

    <%--<link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico"/>--%>
    <!-- Bootstrap -->
    <link href="../assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/vendor/animate/animate.min.css">
    <link type="text/css" rel="stylesheet" media="all" href="../assets/js/vendor/mmenu/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" href="../assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="../assets/css/vendor/bootstrap-checkbox.css">
    <link rel="stylesheet" href="../assets/js/timepicker/bootstrap-timepicker.css">

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
    <script type="text/javascript" src="../js/jquery-1.11.3.js"></script>


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
                                            <a href="categoryAndGoods">
                                                <i class="fa fa-caret-right"></i> 商品信息处理
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
                                                <i class="fa fa-caret-right"></i> 管理人员列表
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

            <section class="tile color transparent-black">


                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>门店</strong> 信息列表</h1>
                    <div class="search">
                        <input type="text" placeholder="Search...">
                    </div>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->

                <!-- tile widget -->
                <div class="tile-widget bg-transparent-black-2">
                    <div class="row">

                        <div class="col-sm-4 col-xs-6">
                            <div class="input-group table-options">
                                <span class="input-group-btn">
        <button class="btn btn-default deleteStore" type="button">删除</button>
        </span>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /tile widget -->


                <!-- tile body -->
                <div class="tile-body nopadding">

                    <table class="table table-bordered table-sortable">
                        <thead>
                        <tr>
                            <th>
                                <div class="checkbox check-transparent">
                                    <input type="checkbox" value="1" id="allchck">
                                    <label for="allchck"></label>
                                </div>
                            </th>
                            <th class="sortable sort-asc">编号</th>
                            <th class="sortable sort-alpha">商店名称</th>
                            <th class="sortable sort-asc">电话</th>
                            <th class="sort-alpha">省</th>
                            <th>市</th>
                            <th>区/县</th>
                            <th>详细街道</th>
                            <%--<th>经度</th>--%>
                            <%--<th>纬度</th>--%>
                            <!--之后可以不罗列经纬度-->
                            <th>简介</th>
                            <th>开门时间</th>
                            <th>关门时间</th>
                            <th>营业状态</th>


                            <%--<th style="width: 30px;"></th>--%>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <c:forEach items="${stores}" var="store">
                            <td>
                                <div class="checkbox check-transparent">
                                    <input type="checkbox" name="chooseStore" value="${store.store_id}"
                                           id="${store.store_id}">
                                    <label for="${store.store_id}" style="width: 16px"></label>
                                </div>
                            </td>

                            <td>${store.store_id}</td>
                            <td>${store.store_name}</td>
                            <td>${store.store_tel}</td>
                            <td>${store.province}</td>
                            <td>${store.city}</td>
                            <td>${store.district}</td>
                            <td>${store.store_address}</td>
                                <%--<td>${store.longitude}</td>--%>
                                <%--<td>${store.latitude}</td>--%>
                            <td>${store.store_introduction}</td>
                            <td>${store.store_start_time}</td>
                            <td>${store.store_close_time}</td>
                            <c:if test="${store.store_status==0}">
                                <td>此店休业</td>
                            </c:if>
                            <c:if test="${store.store_status==1}">
                                <td>此店营业</td>
                            </c:if>
                                <%--<td>${store.store_status}</td>--%>

                            <td><a href="goodsRegistToStore.html?store_id=${store.store_id}"
                                   class="check-toggler checked"></a></td>
                                <%--这里写链接到需要的商品界面的函数--%>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <!-- /tile body -->


                <!-- tile footer -->
                <div class="tile-footer bg-transparent-black-2 rounded-bottom-corners">
                    <div class="row">

                        <div class="col-sm-4 text-center">
                            <small class="inline table-options paging-info">showing 1-3 of 24 items</small>
                        </div>

                        <div class="col-sm-4 text-right sm-center">
                            <ul class="pagination pagination-xs nomargin pagination-custom">
                                <li class="disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a>
                                </li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <!-- /tile footer -->


            </section>

            <!-- /content container -->

            <!-- tile -->
            <section class="tile color transparent-black">


                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>注册</strong>门店</h1>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->

                <!-- tile body -->
                <div class="tile-body">

                    <form class="form-horizontal" role="form" id="storeForm">
                        <%--action="branchStoresTables/addStore.action" method="post"--%>
                        <div style="margin-right: 200px">
                            <div class="form-group">
                                <label for="store_name" class="col-sm-4 control-label">商店名称</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="store_name" name="store_name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="store_tel" class="col-sm-4 control-label">电话</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="store_tel" name="store_tel">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="longitude" class="col-sm-4 control-label">经度</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="longitude" name="longitude">
                                    <span class="help-block">请以“99.5”类似的格式填写，纬度格式相同！</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="latitude" class="col-sm-4 control-label">纬度</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="latitude" name="latitude">
                                    <%--<span class="help-block">请以“99.5”类似的格式填写，纬度格式相同！</span>--%>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="province" class="col-sm-4 control-label">地址</label>

                                <div class="form-inline col-sm-8" style="flex-direction: row">
                                    <select class="selectAddr form-control col-sm-2 " name="province" id="province"
                                            style="color:black">
                                        <option value="" hidden>省份</option>
                                    </select>
                                    <%--<br>--%>
                                    <select class="selectAddr form-control col-sm-2" name="city" id="city"
                                            style="color:black">
                                        <option value="" hidden>城市</option>
                                    </select>
                                    <%--<br>--%>
                                    <select class="selectAddr form-control col-sm-2" name="district" id="district"
                                            style="color:black">
                                        <option value="" hidden>县/区</option>
                                    </select>
                                    <button class="form-control" id="submitPCD">提交</button>
                                </div><!-- /.row -->

                            </div>
                            <div class="form-group">
                                <label for="streetAddress" class="col-sm-4 control-label">详细街道信息</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="streetAddress" rows="3" name="streetAddress"
                                              placeholder="请录入详细街道信息..."></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="store_introduction" class="col-sm-4 control-label">商店简介</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="store_introduction" rows="6"
                                              name="store_introduction"
                                              placeholder="请录入门店简介信息..."></textarea>
                                </div>
                            </div>
                            <%--<div class="form-group">--%>
                            <%--<label for="openTime" class="col-sm-4 control-label">开门时间</label>--%>
                            <%--<div class="col-sm-8">--%>
                            <%--<input type="text" class="form-control" id="openTime"--%>
                            <%--placeholder="请加英文分号“;”作为时间分隔符，以24小时为准">--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <div class="form-group">
                                <label for="timeOpen" class="col-sm-4 control-label">开门时间</label>
                                <div class="col-sm-8">

                                    <div class="nest" id="timeOpen">
                                        <div class="title-alt">
                                            <div class="titleClose">
                                                <a class="gone" href="#timeOpen">
                                                    <span class="entypo-cancel"></span>
                                                </a>
                                            </div>
                                            <div class="titleToggle">
                                                <a class="nav-toggle-alt" href="#time2">
                                                    <span class="entypo-up-open"></span>
                                                </a>
                                            </div>

                                        </div>

                                        <div class="body-nest" id="time2">
                                            <div class="form_center">
                                                <div class="well">
                                                    <div class="input-group bootstrap-timepicker">

                                                        <input id="timepicker2" type="text" class="form-control"
                                                               name="timepicker2">
                                                        <span class="input-group-addon add-on entypo-clock"></span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="timeClose" class="col-sm-4 control-label">关门时间</label>
                                <div class="col-sm-8">

                                    <div class="nest" id="timeClose">
                                        <div class="title-alt">
                                            <div class="titleClose">
                                                <a class="gone" href="#timeClose">
                                                    <span class="entypo-cancel"></span>
                                                </a>
                                            </div>
                                            <div class="titleToggle">
                                                <a class="nav-toggle-alt" href="#time">
                                                    <span class="entypo-up-open"></span>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="body-nest" id="time">
                                            <div class="form_center">
                                                <div class="well">
                                                    <div class="input-group bootstrap-timepicker">

                                                        <input id="timepicker1" type="text" class="form-control"
                                                               name="timepicker1">
                                                        <span class="input-group-addon add-on entypo-clock"></span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-4 control-label">营业状况</label>
                                <div class="col-sm-8">
                                    <div class="radio radio-transparent">
                                        <input type="radio" name="radio" id="optionsRadiosOpen" value="1"
                                               checked>
                                        <%--checked--%>
                                        <label for="optionsRadiosOpen">此店营业</label>
                                    </div>
                                    <div class="radio radio-transparent">
                                        <input type="radio" name="radio" id="optionsRadiosClose" value="0">
                                        <label for="optionsRadiosClose">此店休业</label>
                                    </div>

                                </div>
                            </div>

                        </div>


                        <div class="form-group form-footer">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button class="btn btn-primary" onclick="submitStore()">提交</button>
                                <%--type="submit"--%>
                                <button type="reset" class="btn btn-default">重置</button>
                            </div>
                        </div>

                    </form>

                </div>
                <!-- /tile body -->


            </section>
            <!-- /tile -->

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
<script type="text/javascript" src="../assets/js/colorPicker/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="../assets/js/inputMask/jquery.maskedinput.js"></script>
<script type="text/javascript" src="../assets/js/switch/bootstrap-switch.js"></script>
<script type="text/javascript" src="../assets/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="../assets/js/idealform/jquery.idealforms.js"></script>

<script type="text/javascript" src="../assets/js/timepicker/bootstrap-timepicker.js"></script>
<script type="text/javascript" src="../assets/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../assets/js/datepicker/clockface.js"></script>
<script type="text/javascript" src="../assets/js/datepicker/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="../assets/js/tag/jquery.tagsinput.js"></script>

<script type="text/javascript">
    $('#datetimepicker1').datetimepicker({
        language: 'pt-BR'
    });
    $('#dp1').datepicker()
    $('#dpYears').datepicker();
    $('#timepicker1').timepicker();
    $('#timepicker2').timepicker();
    $('#t1').clockface();
    $('#t2').clockface({
        format: 'HH:mm',
        trigger: 'manual'
    });

    $('#toggle-btn').click(function (e) {
        e.stopPropagation();
        $('#t2').clockface('toggle');
    });
</script>
<script type="text/javascript">
    $('#datetimepicker1').datetimepicker({
        language: 'pt-BR'
    });
    $('#dp1').datepicker()
    $('#dpYears').datepicker();
    $('#timepicker1').timepicker();
    $('#t1').clockface();
    $('#t2').clockface({
        format: 'HH:mm',
        trigger: 'manual'
    });

    $('#toggle-btn').click(function (e) {
        e.stopPropagation();
        $('#t2').clockface('toggle');
    });
</script>
<script>
    $(document).ready(function () {

        //check all checkboxes
        $('table thead input[type="checkbox"]').change(function () {
            $(this).parents('table').find('tbody input[type="checkbox"]').prop('checked', $(this).prop('checked'));
        });

        // sortable table
        $('.table.table-sortable th.sortable').click(function () {
            var o = $(this).hasClass('sort-asc') ? 'sort-desc' : 'sort-asc';
            $(this).parents('table').find('th.sortable').removeClass('sort-asc').removeClass('sort-desc');
            $(this).addClass(o);
        });


        //chosen select input
        $(".chosen-select").chosen({disable_search_threshold: 10});

        //响应表单操作的方法
        // $(".methodAction").on('click', function () {
        //     // var option=document.getElementsByClassName(".methodsChoice");
        //     var option = $(".methodsChoice").val();
        //     //0删除，1是添加
        // })
        $(".deleteStore").on('click', function () {
            var options = document.getElementsByName("chooseStore");
            check_vals = [];
            for (var k = 0; k < options.length; k++) {
                if (options[k].checked) {
                    check_vals.push(options[k].value);
                }
            }
            if (check_vals.length == 0) {
                alert("您未选择任何要删除的门店信息！")
            } else {
                console.log(JSON.stringify(check_vals));
            }
            $.ajax({
                url: "branchStoresTables/deleteStore.do",
                type: "post",
                data: {idsList: JSON.stringify(check_vals)},
                // contentType:"application/json;charset=UTF-8",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        console.log("success");
                    } else {
                        console.log("没有数据");
                    }
                }
            })

        })


        //check toggling
        $('.check-toggler').on('click', function () {
            $(this).toggleClass('checked');
        });
        // submitStore(){
        //     type="submit"
        // }

    })

</script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script type="text/javascript" src="../js/data.js"></script>
<script type="text/javascript">
    var storeObj = {
        storeName: "",
        storeTel: "",
        storeLongitude: 0.0,
        storeLatitude: 0.0,
        province: "",
        city: "",
        district: "",
        streetAddr: "",
        introduction: "",
        openTime: "",
        closeTime: "",
        status: ""

    };
    provinceName = "";
    cityName = "";
    districtName = "";

    var province = $("#province");
    var city = $("#city");
    var district = $("#district");

    //初始化省份下拉选择框选项
    $(function () {
        console.log("I am ready");
        //遍历对象,data为data.js中的对象
        data.forEach(function (value, index) {
            var provinceName = value.name;//省份名
            province.append("<option value='" + index + "'>" + provinceName + "</option>");
        });
    });
    //省份下拉框切换事件,加载城市下拉框值
    province.change(function () {
        //先清除城市区县两个下拉框的选项
        $("#city option:not(:first)").remove();
        $("#district option:not(:first)").remove();
        var cityList = data[province.val()].city;
        cityList.forEach(function (value, index) {
            var cityName = value.name;//城市名
            city.append("<option value='" + index + "'>" + cityName + "</option>");
        });
    });
    //城市下拉框切换事件,加载区县下拉框值
    city.change(function () {
        $("#district option:not(:first)").remove();
        var cityList = data[province.val()].city;
        var districtList = cityList[city.val()].area;
        districtList.forEach(function (value, index) {
            district.append("<option value='" + index + "'>" + value + "</option>");
        });
    });

    $("#submitPCD").click(function () {
        var provinceVal = province.val();
        var cityVal = city.val();
        var districtVal = district.val();
        console.log("I am activated!");

        if (provinceVal == '') {
            alert("请选择省份");
            return false;
        }
        if (cityVal == '') {
            alert("请选择城市");
            return false;
        }
        if (districtVal == '') {
            alert("请选择区县");
            return false;
        }
        //获取省市区选中的值的文本
        provinceName = $("#province option:selected").text();
        cityName = $("#city option:selected").text();
        districtName = $("#district option:selected").text();
        alert("您选择的是:" + provinceName + cityName + districtName);
    });

    function submitStore() {
        storeObj.storeName = $("#store_name").val();
        storeObj.storeTel = $("#store_tel").val();
        storeObj.storeLongitude = parseFloat($(" #longitude").val());
        storeObj.storeLatitude = parseFloat($("#latitude").val());
        storeObj.streetAddr = $("#streetAddress").val();
        storeObj.introduction = $("#store_introduction").val();
        storeObj.openTime = $("#timepicker2").val();
        storeObj.closeTime = $("#timepicker1").val();
        storeObj.status = parseInt($("input[type='radio']:checked").val());
        storeObj.province = $("#province option:selected").text();
        storeObj.city = $("#city option:selected").text();
        storeObj.district = $("#district option:selected").text();
        alert(storeObj.closeTime, storeObj.storeLatitude);

        //检查录入的东西是否为空
        for (key in storeObj) {
            console.log(storeObj[key]);
            if (storeObj[key] == "") {
                alert(key + " 不允许是空！");
                return;
            }
        }
        console.log(JSON.stringify(storeObj));
        $.ajax({
            url: "branchStoresTables/addStore.do",
            type: "post",
            data: JSON.stringify(storeObj),
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            success: function (result) {
                if (result) {
                    console.log(result);
                } else {
                    console.log("提交失败");
                }
            }
        })


    }

</script>

<%--/////////////////////////////////////////////////////Xenia/////////////////////////////--%>

</body>

</html>
      
