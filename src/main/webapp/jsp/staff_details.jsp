<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<%--加上这一句来处理中文乱码--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patrick 后台管理系统 1.0 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8"/>

    <%--<link rel="icon" type="image/ico" href="http://tattek.com/minimal/../assets/images/favicon.ico"/>--%>
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


                    </li>


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
                                            <a href="browse_statistics_full.html?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 热度统计
                                            </a>
                                        </li>
                                        <li>
                                            <a href="sales_statistics_full.html?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 销量统计
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
                                            <a href="staff_register.html?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 添加管理人员
                                            </a>
                                        </li>
                                        <li>
                                            <a href="staff_list.html?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 管理人员列表
                                            </a>
                                        </li>
                                        <li>
                                            <a href="user_list.html?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 商城用户列表
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

            <%--主要内容--%>
            <section class="tile color transparent-black">


                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>管理人员 </strong>详细信息</h1>
                </div>
                <!-- /tile header -->

                <!-- tile body -->
                <div class="tile-body">
                    <form method="post" action="staff_update.action">
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <%--账户名更改框--%>
                                <label for="staff_name_update">账户名</label>
                                <input type="text" class="form-control" id="staff_name_update" name="staff_name_update"
                                       value="${staffInfo.staff_name}">
                                    <br>
                                    <br>
                                <%--密码更改框--%>
                                <label for="staff_password_update">密码</label>
                                <input type="text" class="form-control" id="staff_password_update"
                                       name="staff_password_update"
                                       value=${staffInfo.staff_password}>
                            </div>
                            <%--单选框--%>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">更改权限</label>
                                <br>
                                <br>
                                <div class="radio radio-transparent">
                                    <c:if test="${staffInfo.role == 0}">
                                        <input type="radio" name="role_update" id="optionsRadios1" value=0 checked="">
                                    </c:if>
                                    <c:if test="${staffInfo.role != 0}">
                                        <input type="radio" name="role_update" id="optionsRadios1" value=0>
                                    </c:if>
                                    <label for="optionsRadios1">商品管理员</label>
                                </div>
                                <br>
                                <div class="radio radio-transparent">
                                    <c:if test="${staffInfo.role == 1}">
                                        <input type="radio" name="role_update" id="optionsRadios2" value=1 checked="">
                                    </c:if>
                                    <c:if test="${staffInfo.role != 1}">
                                        <input type="radio" name="role_update" id="optionsRadios2" value=1>
                                    </c:if>
                                    <label for="optionsRadios2">订单管理员</label>
                                </div>
                                <br>
                                <div class="radio radio-transparent">
                                    <c:if test="${staffInfo.role == 2}">
                                        <input type="radio" name="role_update" id="optionsRadios3" value=2 checked="">
                                    </c:if>
                                    <c:if test="${staffInfo.role != 2}">
                                        <input type="radio" name="role_update" id="optionsRadios3" value=2>
                                    </c:if>
                                    <label for="optionsRadios3">超级管理员</label>
                                </div>
                            </div>
                            <%--把当前登陆账户的权限传输到后端--%>
                            <input type="hidden" id="role" name="role" value= ${role}>
                            <%--把当前登陆账户的id传输到后端--%>
                            <%--TODO--%>
                            <%--把被更改账户的id传输到后端--%>
                            <input type="hidden" id="staff_id_update" name="staff_id_update"
                                   value= ${staffInfo.staff_id}>
                        </div>
                        <div class="row" align="right" style="margin-right: 20px">
                            <button type="submit" class="btn btn-primary btn-lg margin-bottom-20">更改</button>
                        </div>
                    </form>
                </div>
                <!-- /tile body -->


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
      
