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

    <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico"/>
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
    <%--<script src="../assets/js/minimal.min.js"></script>--%>

    <link href="../assets/css/minimal.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <%--<title>form</title>--%>
    <link href="../css/bootstrap-3.3.4.css" rel="stylesheet">
    <%--<style type="text/css">--%>
    <%--.jq22-header{margin-bottom: 15px;font-family: "Segoe UI", "Lucida Grande", Helvetica, Arial, "Microsoft YaHei", FreeSans, Arimo, "Droid Sans", "wenquanyi micro hei", "Hiragino Sans GB", "Hiragino Sans GB W3", "FontAwesome", sans-serif;}--%>
    <%--.jq22-icon{color: #fff;}--%>
    <%--</style>--%>
    <script src="../js/vue.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">

    <style>
        .upload_warp_img_div_del {
            position: absolute;
            top: 6px;
            width: 16px;
            right: 4px;
        }

        .upload_warp_img_div_top {
            position: absolute;
            top: 0;
            width: 100%;
            height: 30px;
            background-color: rgba(0, 0, 0, 0.4);
            line-height: 30px;
            text-align: left;
            color: #fff;
            font-size: 12px;
            text-indent: 4px;
        }

        .upload_warp_img_div_text {
            white-space: nowrap;
            width: 80%;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .upload_warp_img_div img {
            max-width: 100%;
            max-height: 100%;
            vertical-align: middle;
        }

        .upload_warp_img_div {
            position: relative;
            height: 100px;
            width: 120px;
            border: 1px solid #ccc;
            margin: 0px 30px 10px 0px;
            float: left;
            line-height: 100px;
            display: table-cell;
            text-align: center;
            background-color: #eee;
            cursor: pointer;
        }

        .upload_warp_img {
            border-top: 1px solid #D2D2D2;
            padding: 14px 0 0 14px;
            overflow: hidden
        }

        .upload_warp_text {
            text-align: left;
            margin-bottom: 10px;
            padding-top: 10px;
            text-indent: 14px;
            border-top: 1px solid #ccc;
            font-size: 14px;
            color: #000000;
        }

        .upload_warp_right {
            float: left;
            width: 57%;
            margin-left: 2%;
            height: 100%;
            border: 1px dashed #999;
            border-radius: 4px;
            line-height: 130px;
            color: #999;
        }

        .upload_warp_left img {
            margin-top: 32px;
        }

        .upload_warp_left {
            float: left;
            width: 40%;
            height: 100%;
            border: 1px dashed #999;
            border-radius: 4px;
            cursor: pointer;
        }

        .upload_warp {
            margin: 14px;
            height: 130px;
        }

        .upload {
            border: 1px solid #ccc;
            background-color: #fff;
            /*width: 650px;*/
            box-shadow: 0px 1px 0px #ccc;
            border-radius: 4px;
        }

        .hello {
            /*width: 650px;*/
            /*margin-left: 34%;*/
            text-align: center;
        }
    </style>

    <style type="text/css">
        #table table {
            width: 100%;
            font-size: 14px;
            border: 1px solid #eee
        }

        #table {
            padding: 0 10px;
        }

        table thead th {
            background: #f5f5f5;
            padding: 10px;
            text-align: left;
        }

        table tbody td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #eee;
            border-right: 1px solid #eee;
        }

        table tbody td span {
            margin: 0 10px;
            cursor: pointer;
        }

        .delete {
            color: red;
        }

        .edit {
            color: #008cd5;
        }

        .add {
            border: 1px solid #eee;
            margin: 10px 0;
            padding: 15px;
        }

        input {
            border: 1px solid #ccc;
            padding: 5px;
            border-radius: 3px;
            margin-right: 15px;
        }

        button {
            background: #008cd5;
            border: 0;
            padding: 4px 15px;
            border-radius: 3px;
            color: #fff;
        }

        #mask {
            background: rgba(0, 0, 0, .5);
            width: 100%;
            height: 100%;
            position: fixed;
            z-index: 4;
            top: 0;
            left: 0;
        }

        #mask .mask {
            width: 300px;
            height: 250px;
            background: rgba(255, 255, 255, 1);
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            z-index: 47;
            border-radius: 5px;
        }

        .title {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        .title span {
            float: right;
            cursor: pointer;
        }

        .content .row {
            padding: 10px;
        }

        .content .row input {
            width: 270px;
            margin-bottom: 15px;
        }
    </style>

    <script>
        categoryData = [];
        myCategoryLists = [];
        categoryJson =${categoryJson};
        $(document).ready(function () {

            // categoryJson=JSON.parse(categoryJson);

            for (getfirstCategory in categoryJson) {
                //获取key就是父级类别
                secondCategories = [];
                // console.log("1!" + getfirstCategory);
                for (secondNum in categoryJson[getfirstCategory]) {
                    //获取数组的index
                    for (getsecondCategory in categoryJson[getfirstCategory][secondNum]) {
                        // console.log("2" + getsecondCategory);
                        thirdCategories = [];
                        for (thirdNum in categoryJson[getfirstCategory][secondNum][getsecondCategory]) {
                            getId = thirdNum;
                            getthirdCategory = categoryJson[getfirstCategory][secondNum][getsecondCategory][thirdNum];
                            thirdCategories.push({
                                text: getthirdCategory
                            });
                            myCategoryLists.push({
                                firstCategory: getfirstCategory,
                                secondCategory: getsecondCategory,
                                thirdCategory: getthirdCategory,
                                id: getId
                            })
                        }
                        secondCategories.push({
                            text: getsecondCategory,
                            nodes: thirdCategories
                        });
                    }
                }
                categoryData.push({
                    text: getfirstCategory,
                    nodes: secondCategories
                });
            }
            // console.log(categoryData);
        })
    </script>
    <script>
        my_products_data = [];
        <c:forEach items="${my_products}" var="myproduct">
        my_short_introduction = "${myproduct.product_brief_introduction}";
        my_details = "${myproduct.product_detail}";
        my_products_data.push({
            product_id: "${myproduct.id}",
            product_name: "${myproduct.product_name}",
            first_category: "${myproduct.first_category}",
            second_category: "${myproduct.second_category}",
            third_category: "${myproduct.third_category}",
            unit: "${myproduct.unit}",
            short_introduction: my_short_introduction,
            url1: "${myproduct.pic1_url}",
            url2: "${myproduct.pic2_url}",
            url3: "${myproduct.pic3_url}",
            url4: "${myproduct.pic4_url}",
            product_details: my_details
        });
        console.log(my_products_data);
        </c:forEach>

        // $(function(){
        //     alert("******"+my_products_data.length);
        // });
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
                    <span>商品信息管理.</span></h2>


            </div>
            <!-- /page header -->


            <!-- /content container -->
            <br>
            <br>
            <br>
            <br>
            <!-- 注册商品的表格-->
            <section class="tile color transparent-black">


                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>登记</strong>商品</h1>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->

                <!-- tile body -->
                <div class="tile-body">

                    <form class="form-horizontal">
                        <div style="margin-right: 200px">
                            <%--丁赞涵注释--%>
                            <%--<div class="form-group">--%>
                            <%--<label for="good_id" class="col-sm-4 control-label">商品编号</label>--%>
                            <%--<div class="col-sm-8">--%>
                            <%--<input type="text" class="form-control" id="good_id" name="good_id">--%>
                            <%--</div>--%>
                            <%--</div>--%>

                            <div class="form-group">
                                <label for="good_name" class="col-sm-4 control-label">商品名称</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="good_name" name="good_name">
                                </div>
                            </div>
                            <%--选择框实现选择三种类别，需要插件--%>
                            <%--<div class="jq22-container">--%>

                            <div class="form-group">
                                <label for="good_short_introduction" class="col-sm-4 control-label">商品类别</label>

                                <div class="col-sm-8">
                                    <div class="col-sm-2">
                                        <%--<h2>输入</h2>--%>
                                        <div class="form-group">
                                            <label for="input-select-node" class="sr-only"> </label>
                                            <input type="input" class="form-control" id="input-select-node"
                                                   placeholder="识别类别..." value="搜索类别">
                                        </div>
                                        <%--按照需求不支持多选类别--%>
                                        <%--<div class="checkbox">--%>
                                        <%--<label>--%>
                                        <%--<input type="checkbox" class="checkbox" id="chk-select-multi" value="false">--%>
                                        <%--多选--%>
                                        <%--</label>--%>
                                        <%--</div>--%>
                                        <%--这个silent的作用未知--%>
                                        <%--<div class="checkbox">--%>
                                        <%--<label>--%>
                                        <%--<input type="checkbox" class="checkbox" id="chk-select-silent" value="false">--%>
                                        <%--Silent (No events)--%>
                                        <%--</label>--%>
                                        <%--</div>--%>
                                        <div class="form-group">
                                            <button type="button" class="btn btn-success select-node"
                                                    id="btn-select-node">选择
                                            </button>
                                        </div>
                                        <div class="form-group">
                                            <button type="button" class="btn btn-danger select-node"
                                                    id="btn-unselect-node">取消
                                            </button>
                                        </div>
                                        <%--交换是否进行选择--%>
                                        <%--<div class="form-group">--%>
                                        <%--<button type="button" class="btn btn-primary select-node" id="btn-toggle-selected">Toggle Node</button>--%>
                                        <%--</div>--%>
                                    </div>
                                    <div class="col-sm-4">
                                        <div id="treeview-selectable" class=""></div>
                                    </div>
                                </div>
                                <%--<div class="col-sm-2">--%>
                                <%--<h2>Events</h2>--%>
                                <%--<div id="selectable-output"></div>--%>
                                <%--</div>--%>
                            </div>


                            <div class="form-group">
                                <label for="good_short_introduction" class="col-sm-4 control-label">商品简介</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="good_short_introduction" rows="3"
                                              name="good_short_introduction" placeholder="简要描述本商品"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="good_details" class="col-sm-4 control-label">商品详情</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="good_details" rows="6"
                                              name="good_details" placeholder="本商品的详细规格参数等信息"></textarea>
                                </div>
                            </div>
                            <%--添加上传图片的插件，最多四张图片，少了的话url自己设置为0,然后返回的时候不渲染--%>
                            <div class="form-group">
                                <label for="app" class="col-sm-4 control-label">添加图片</label>
                                <div id="app" class="col-sm-8">
                                    <div class="hello">
                                        <div class="upload">
                                            <div class="upload_warp">
                                                <div class="upload_warp_left" @click="fileClick">
                                                    <img src="../plugin/photo_upload/upload.png">
                                                </div>
                                                <div class="upload_warp_right" @drop="drop($event)"
                                                     @dragenter="dragenter($event)" @dragover="dragover($event)">
                                                    或者将文件拖到此处
                                                </div>
                                            </div>
                                            <div class="upload_warp_text">
                                                选中{{imgList.length}}张文件，共{{bytesToSize(this.size)}}
                                            </div>
                                            <input @change="fileChange($event)" type="file" id="upload_file" multiple
                                                   style="display: none"/>
                                            <div class="upload_warp_img" v-show="imgList.length!=0">
                                                <div class="upload_warp_img_div" v-for="(item,index) of imgList">
                                                    <div class="upload_warp_img_div_top">
                                                        <div class="upload_warp_img_div_text">
                                                            {{item.file.name}}
                                                        </div>
                                                        <img src="../plugin/photo_upload/del.png"
                                                             class="upload_warp_img_div_del" @click="fileDel(index)">
                                                    </div>
                                                    <img :src="item.file.src">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="form-group">--%>
                            <%--<label for="streetAddress" class="col-sm-4 control-label">详细街道信息</label>--%>
                            <%--<div class="col-sm-8">--%>
                            <%--<textarea class="form-control" id="streetAddress" rows="6" name="streetAddress"--%>
                            <%--placeholder="请录入详细街道信息..."></textarea>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--创建时间和修改时间从后端系统获取，然后记录在数据库中，不需要用户自己填写--%>
                            <div class="form-group">
                                <label for="good_unit" class="col-sm-4 control-label">商品单位</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="good_unit"
                                              name="good_unit" placeholder="本商品计量单位"></textarea>
                                </div>
                            </div>


                            <div class="form-group form-footer">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <input onclick="submitProduct()" type="button" value="提交"
                                           class="btn btn-primary"/>
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
                <!-- /tile body -->


            </section>
            <!-- /注册商品的表格 -->
            <br>
            <br>
            <%--显示商品的表格--%>
            <section class="tile color transparent-black">


                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>商品</strong>信息表</h1>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div id="goods_table" style="margin-left: 20px;margin-right: 20px">
                    <template>
                        <i-table :columns="columns" :data="products_data" size="small" height="660" ref="table">
                            <%--<template slot-scope="{ row, index }" slot="action">--%>
                            <%--<Button type="primary" size="small" style="margin-right: 5px" @click="show(index)">View</Button>--%>
                            <%--<Button type="error" size="small" @click="remove(index)">Delete</Button>--%>
                            <%--</template>--%>
                        </i-table>
                        <br>
                        <%--<Button  @click="add">添加</Button>--%>
                        <Button type="primary" size="large" @click="exportData(1)">
                            <Icon type="ios-download-outline"></Icon>
                            Export source data
                        </Button>
                        <Button type="primary" size="large" @click="exportData(2)">
                            <Icon type="ios-download-outline"></Icon>
                            Export sorting and filtered data
                        </Button>
                        <Button type="primary" size="large" @click="exportData(3)">
                            <Icon type="ios-download-outline"></Icon>
                            Export custom data
                        </Button>
                        <br>
                        <br>
                    </template>
                </div>
            </section>
            <%--/显示商品的表格--%>

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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

<%--用于引入和使用树状目录--%>
<%--<script type="text/javascript" src="http://www.jq22.com/jquery/2.1.1/jquery.min.js"></script>--%>
<script type="text/javascript" src="../plugin/bootstrap-treeview/js/bootstrap-treeview.js"></script>
<script type="text/javascript">

    // 用于传送表单
    var formData = new FormData();
    var myfiles = [];
    $(function () {

        var $searchableTree = $('#treeview-searchable').treeview({
            data: categoryData,
        });


        var initSelectableTree = function () {
            return $('#treeview-selectable').treeview({
                data: categoryData,
                multiSelect: $('#chk-select-multi').is(':checked'),
                onNodeSelected: function (event, node) {
                    formData.append("third_category", node.text);
                    $('#selectable-output').prepend('<p>' + node.text + ' was selected</p>');
                },
                onNodeUnselected: function (event, node) {
                    formData.delete("third_category", node.text);
                    $('#selectable-output').prepend('<p>' + node.text + ' was unselected</p>');
                }
            });
        };
        var $selectableTree = initSelectableTree();
        var findSelectableNodes = function () {
            return $selectableTree.treeview('search', [$('#input-select-node').val(), {
                ignoreCase: false,
                exactMatch: false
            }]);
        };
        var selectableNodes = findSelectableNodes();

        $('#chk-select-multi:checkbox').on('change', function () {
            console.log('multi-select change');
            $selectableTree = initSelectableTree();
            selectableNodes = findSelectableNodes();
        });

        // Select/unselect/toggle nodes
        $('#input-select-node').on('keyup', function (e) {
            selectableNodes = findSelectableNodes();
            $('.select-node').prop('disabled', !(selectableNodes.length >= 1));
        });

        $('#btn-select-node.select-node').on('click', function (e) {
            $selectableTree.treeview('selectNode', [selectableNodes, {silent: $('#chk-select-silent').is(':checked')}]);
        });

        $('#btn-unselect-node.select-node').on('click', function (e) {
            $selectableTree.treeview('unselectNode', [selectableNodes, {silent: $('#chk-select-silent').is(':checked')}]);
        });

        $('#btn-toggle-selected.select-node').on('click', function (e) {
            $selectableTree.treeview('toggleNodeSelected', [selectableNodes, {silent: $('#chk-select-silent').is(':checked')}]);
        });

    })
    ;

    <%--用于引入文件上传的vue--%>

    //  import up from  './src/components/Hello'
    var app = new Vue({
        el: '#app',
        data() {
            return {
                imgList: [],
                size: 0
            }
        },
        methods: {
            getList() {
                return this.vue.imgList[0].file;
            },
            fileClick() {
                document.getElementById('upload_file').click(function () {
                })
            },
            fileChange(el) {
                if (!el.target.files[0].size) return;
                this.fileList(el.target);
                el.target.value = ''
            },
            fileList(fileList) {
                let files = fileList.files;
                for (let i = 0; i < files.length; i++) {
                    //判断是否为文件夹
                    if (files[i].type != '') {
                        this.fileAdd(files[i]);
                    } else {
                        //文件夹处理
                        this.folders(fileList.items[i]);
                    }
                }
            },
            //文件夹处理
            folders(files) {
                let _this = this;
                //判断是否为原生file
                if (files.kind) {
                    files = files.webkitGetAsEntry();
                }
                files.createReader().readEntries(function (file) {
                    for (let i = 0; i < file.length; i++) {
                        if (file[i].isFile) {
                            _this.foldersAdd(file[i]);
                        } else {
                            _this.folders(file[i]);
                        }
                    }
                })
            },
            foldersAdd(entry) {
                let _this = this;
                entry.file(function (file) {
                    _this.fileAdd(file)
                })
            },
            fileAdd(file) {
                //总大小
                this.size = this.size + file.size;
                //判断是否为图片文件
                if (file.type.indexOf('image') == -1) {
                    file.src = 'wenjian.png';
                    this.imgList.push({
                        file
                    });

                } else {
                    let reader = new FileReader();
                    reader.vue = this;
                    reader.readAsDataURL(file);
                    reader.onload = function () {
                        file.src = this.result;
                        this.vue.imgList.push({
                            file
                        });
                        myfiles.push(file);
                    }
                }
            },
            fileDel(index) {
                this.size = this.size - this.imgList[index].file.size;//总大小
                this.imgList.splice(index, 1);
                myfiles.reduce(index);
            },
            bytesToSize(bytes) {
                if (bytes === 0) return '0 B';
                let k = 1000, // or 1024
                    sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
                    i = Math.floor(Math.log(bytes) / Math.log(k));
                return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
            },
            dragenter(el) {
                el.stopPropagation();
                el.preventDefault();
            },
            dragover(el) {
                el.stopPropagation();
                el.preventDefault();
            },
            drop(el) {
                el.stopPropagation();
                el.preventDefault();
                this.fileList(el.dataTransfer);
            }
        }
    });

    // 接下来是获取表单信息然后提交的代码
    function submitProduct() {
        // var formData = new FormData();
        //丁赞涵注释
        // formData.append("id", $("#good_id").val());
        formData.append("name", $("#good_name").val());
        formData.append("details", $("#good_details").val());
        formData.append("short_introduction", $("#good_short_introduction").val());
        // alert(myfiles);
        // 获取当前系统时间()
        var myTime = new Date();
        currentDate = myTime.getFullYear() + "-" + myTime.getMonth() + "-" + (myTime.getDay() + 1);
        currentTime = myTime.toLocaleTimeString();
        // alert("current_time:"+currentTime);
        formData.append("current_time", currentTime);
        formData.append("current_date", currentDate);
        formData.append("unit", $("#good_unit").val());

        if (myfiles.length == 0) {
            alert("您未添加任何图片！");
            return;
        } else if (myfiles.length > 4) {
            formData.append("file0", myfiles[0]);
            formData.append("file1", myfiles[1]);
            formData.append("file2", myfiles[2]);
            formData.append("file3", myfiles[3]);
            formData.append("diffPhotos", 4);
        } else {
            for (index = 0; index < myfiles.length; index++) {
                formData.append("file" + index, myfiles[index]);
            }
            for (index = myfiles.length; index <= 4; index++) {
                formData.append("file" + (index - 1), myfiles[0]);
                //都用0号图片代替
            }
            formData.append("diffPhotos", myfiles.length);
        }

        // alert("获取表单信息完成！");

        let xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            let result = xmlhttp.responseText;
            console.log(result);
        }
        xmlhttp.open("post", "categoryAndGoods/addProduct.do", true);
        xmlhttp.send(formData);

        // $.ajax({
        //
        //     url: "categoryAndGoods/addProduct.do",
        //     type: "post",
        //     data: formData,
        //     contentType: false,
        //     dataType: "json",
        //     processType: false,
        //     async:false,
        //     cache:false,
        //     success: function (res) {
        //         console.log(res);
        //     },
        //     error: function (res) {
        //         console.log("更新目录的映射出错了！" + res);
        //     }
        // })
    }

</script>
<%--渲染商品表格所用的iview插件--%>
<%--引入iview--%>
<script src="//vuejs.org/js/vue.min.js"></script>
<!-- import stylesheet -->
<link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
<!-- import iView -->
<script src="//unpkg.com/iview/dist/iview.min.js"></script>
<script>
    var app2 = new Vue({
        el: '#goods_table',

        data() {
            return {
                columns: [
                    {
                        "title": "商品编号",
                        "key": "product_id",
                        "fixed": "left",
                        "width": 150
                    }, {
                        "title": "商品名称",
                        "key": "product_name",
                        "sortable": true,
                        "width": 200,
                        "fixed": "left"
                    },
                    {
                        "title": "一级类别",
                        "key": "first_category",
                        "sortable": true,
                        "width": 150
                    }, {
                        "title": "二级类别",
                        "key": "second_category",
                        "sortable": true,
                        "width": 150
                    }, {
                        "title": "三级类别",
                        "key": "third_category",
                        "sortable": true,
                        "width": 150
                    }, {
                        "title": "单位",
                        "key": "unit",
                        "width": 100
                    }, {
                        "title": "简介",
                        "key": "short_introduction",
                        "width": 250
                    }, {
                        "title": "详细信息",
                        "key": "product_details",
                        "sortable": true,
                        "width": 500
                    }, {
                        title: '商品图片',
                        key: 'product_pic1',
                        width: 150,
                        render: (h, params) => {
                            return h('img', {
                                attrs: {
                                    src: params.row.url1, style: 'width:100px;border-radius:2px'
                                }
                            })
                        }
                    }, {
                        title: '商品图片',
                        key: 'product_pic2',
                        width: 150,
                        render: (h, params) => {
                            return h('img', {
                                attrs: {
                                    src: params.row.url2, style: 'width:100px;border-radius:2px'
                                }
                            })
                        }
                    }, {
                        title: '商品图片',
                        key: 'product_pic3',
                        width: 150,
                        render: (h, params) => {
                            return h('img', {
                                attrs: {
                                    src: params.row.url3, style: 'width:100px;border-radius:2px'
                                }
                            })
                        }
                    }, {
                        title: '商品图片',
                        key: 'product_pic4',
                        width: 150,
                        render: (h, params) => {
                            return h('img', {
                                attrs: {
                                    src: params.row.url4, style: 'width:100px;border-radius:2px'
                                }
                            })
                        }
                    }, {
                        title: '操作',
                        key: 'action',
                        fixed: 'right',
                        slot: 'action',
                        width: 120,
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [
                                h('Button', {
                                    props: {
                                        type: 'primary',
                                        size: 'small'
                                    },
                                    style: {
                                        width: '80px'
                                    },
                                    on: {
                                        click: () => {
                                            this.show(params.index)
                                        }
                                    }
                                }, 'View'),
                                h('Button', {
                                    props: {
                                        type: 'error',
                                        size: 'small'
                                    },
                                    style: {
                                        marginTop:'5px',
                                        width: '80px'
                                    },
                                    on: {
                                        click: () => {
                                            this.remove(params.index)
                                        }
                                    }
                                }, 'Delete')
                            ]);
                        }
                    }
                ],
                products_data: my_products_data,
            }
        },
        methods: {
            exportData(type) {
                if (type === 1) {
                    this.$refs.table.exportCsv({
                        filename: 'The original data'
                    });
                } else if (type === 2) {
                    this.$refs.table.exportCsv({
                        filename: 'Sorting and filtering data',
                        original: false
                    });
                } else if (type === 3) {
                    this.$refs.table.exportCsv({
                        filename: 'Custom data',
                        columns: this.columns.filter((col, index) => index < 4),
                        data: this.products_data.filter((data, index) => index < 4)
                    });
                }
            },

            show(index) {
                this.$Modal.info(
                    {
                        title: '商品信息',
                        content: "商品编号："+this.products_data[index].product_id+"<br>商品名称："+this.products_data[index].product_name+"<br>商品类别："+this.products_data[index].first_category+" "+this.products_data[index].second_category+" "+this.products_data[index].third_category+"<br>单位："+this.products_data[index].unit+"<br>详细信息："+this.products_data[index].product_details
                    })
            },
            remove(index) {
                test = this.products_data[index];
                this.products_data.splice(index, 1);
                $.ajax({
                    type: "POST",
                    url: '/categoryAndGoods/deleteProduct.do',
                    data: JSON.stringify(test),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("删除门店信息出错了！");
                    }

                })

            },
        }
    });
</script>

<%--/////////////////////////////////////////////////////Xenia/////////////////////////////--%>
</body>

</html>

