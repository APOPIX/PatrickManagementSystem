<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%--加上这一句来处理中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patrick 后台管理系统 1.0 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8"/>

    <%--<link rel="icon" type="image/ico" href="http://tattek.com/minimal/../../assets/images/favicon.ico"/>--%>
    <!-- Bootstrap -->
    <link href="../assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/vendor/animate/animate.min.css">
    <link type="text/css" rel="stylesheet" media="all" href="../assets/js/vendor/mmenu/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" href="../assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="../assets/css/vendor/bootstrap-checkbox.css">

    <%--<link crossorigin="anonymous" media="all" integrity="sha512-UFMpXZiU8/kG0aZl62l3OFZi0gwlVRLYrsamBbXttDRSbDmQk1ZyKj5R11ghzrHB/NaIPBuLauI34mVpsuxx5w==" rel="stylesheet" href="https://github.github../assets.com/../assets/frameworks-94eca081886beb7440fa7236f4fd103f.css" />--%>
    <%--<link crossorigin="anonymous" media="all" integrity="sha512-FIEp4ofjNZOwIuaCNdkF6w53h1fjud2bVTkAOnOQOL3+uw98WLUVoh+QIC6gJ/fWDkIeNNwkc/+gyn8NUJiWZw==" rel="stylesheet" href="https://github.github../assets.com/../assets/site-2a37b0558327c9981d25e3ed83ae9eec.css" />--%>
    <%--<link crossorigin="anonymous" media="all" integrity="sha512-eqxTRxKT94LInlg/McScBezWtiFHXzx2NUh8bTSXsscsE8e7zxJE3tueMuDN+7DpHHo3ipfX6wnDuoechvkHAA==" rel="stylesheet" href="https://github.github../assets.com/../assets/github-6a52a05624a8e37c96244b9669fd07a4.css" />--%>
    <link rel="stylesheet" href="../assets/js/vendor/rickshaw/css/rickshaw.min.css">
    <link rel="stylesheet" href="../assets/js/vendor/morris/css/morris.css">
    <link rel="stylesheet" href="../assets/js/vendor/tabdrop/css/tabdrop.css">
    <link rel="stylesheet" href="../assets/js/vendor/summernote/css/summernote.css">
    <link rel="stylesheet" href="../assets/js/vendor/summernote/css/summernote-bs3.css">
    <link rel="stylesheet" href="../assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="../assets/js/vendor/chosen/css/chosen-bootstrap.css">

    <link href="../assets/css/minimal.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <%--引入iView--%>
    <!-- import Vue.js -->
    <script src="//vuejs.org/js/vue.min.js"></script>
    <!-- import stylesheet -->
    <link rel="stylesheet" href="//unpkg.com/iview/dist/styles/iview.css">
    <!-- import iView -->
    <script src="//unpkg.com/iview/dist/iview.min.js"></script>
    <%--给data[]赋值--%>
    <script>
        var data = [];
        //处理后端传来的staffList
        <c:forEach items="${staffList}" var="staff">
        data.push({
                staff_name: "${staff.staff_name}",
                staff_id: "${staff.staff_id}",
                role: "${staff.role}"
            }
        );
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
                                <a href="">
                                    <i class="fa fa-desktop"></i> 登录
                                </a>
                            </li>
                            <%--一级菜单栏--%>
                            <c:if test="${role == 0 || role == 2}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-pencil"></i> 商品管理 <b class="fa fa-plus dropdown-plus"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="productmanage.html">
                                                <i class="fa fa-caret-right"></i> 商品管理子功能1
                                            </a>
                                        </li>
                                        <li>
                                            <a href="productmanage.html">
                                                <i class="fa fa-caret-right"></i> 商品管理子功能2
                                            </a>
                                        </li>
                                        <li>
                                            <a href="productmanage.html">
                                                <i class="fa fa-caret-right"></i> 商品管理子功能3
                                            </a>
                                        </li>
                                        <li>
                                            <a href="productmanage.html">
                                                <i class="fa fa-caret-right"></i> 商品管理子功能4
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>

                            <c:if test="${role == 1 || role == 2}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-pencil"></i> 订单管理 <b class="fa fa-plus dropdown-plus"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="ordermanage.html">
                                                <i class="fa fa-caret-right"></i> 订单管理子功能1
                                            </a>
                                        </li>
                                        <li>
                                            <a href="ordermanage.html">
                                                <i class="fa fa-caret-right"></i> 订单管理子功能2
                                            </a>
                                        </li>
                                        <li>
                                            <a href="ordermanage.html">
                                                <i class="fa fa-caret-right"></i> 订单管理子功能3
                                            </a>
                                        </li>
                                        <li>
                                            <a href="ordermanage.html">
                                                <i class="fa fa-caret-right"></i> 订单管理子功能4
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>

                            <c:if test="${role == 2}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-pencil"></i> 人员管理 <b class="fa fa-plus dropdown-plus"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="staff_register.html?role=${role}">
                                                <i class="fa fa-caret-right"></i> 添加管理人员
                                            </a>
                                        </li>
                                        <li>
                                            <a href="staff_info_management.html?role=${role}">
                                                <i class="fa fa-caret-right"></i> 人员信息管理
                                            </a>
                                        </li>
                                        <li>
                                            <a href="staffmanage.html">
                                                <i class="fa fa-caret-right"></i> 人员管理子功能3
                                            </a>
                                        </li>
                                        <li>
                                            <a href="staffmanage.html">
                                                <i class="fa fa-caret-right"></i> 人员管理子功能4
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
            <br>
            <%--主要内容--%>

            <section class="tile color transparent-black">
                <!-- tile header -->
                <div class="tile-header bg-transparent-black-2">
                    <h1><strong>后台管理人员</strong> 信息列表</h1>
                    <div class="search">
                        <input type="text" placeholder="Search...">
                    </div>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->

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
                            <th class="sortable sort-alpha">员工名称</th>
                            <th>权限级别</th>


                            <%--<th style="width: 30px;"></th>--%>
                        </tr>
                        </thead>
                        <tbody>

                        <tr>
                            <c:forEach items="${staffList}" var="staff">
                            <td>
                                    <%--选择工作人员的复选框--%>
                                <div class="checkbox check-transparent">
                                    <input type="checkbox" name="chooseStaff" value="${staff.staff_id}"
                                           id="${staff.staff_id}">
                                    <label for="${staff.staff_id}" style="width: 16px"></label>
                                </div>
                            </td>

                            <td>${staff.staff_id}</td>
                            <td>${staff.staff_name}</td>
                            <c:if test="${staff.role==0}">
                                <td>商品管理员</td>
                            </c:if>
                            <c:if test="${staff.role==1}">
                                <td>订单管理员</td>
                            </c:if>
                            <c:if test="${staff.role==2}">
                                <td>超级管理员</td>
                            </c:if>
                            <td><a href="#" class="check-toggler checked"></a></td>
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

</body>
</html>

