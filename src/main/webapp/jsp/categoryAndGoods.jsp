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
    <script type="text/javascript" src="../js/jquery-1.11.3.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <title>form</title>
    <link href="../css/bootstrap-3.3.4.css" rel="stylesheet">
    <%--<style type="text/css">--%>
    <%--.jq22-header{margin-bottom: 15px;font-family: "Segoe UI", "Lucida Grande", Helvetica, Arial, "Microsoft YaHei", FreeSans, Arimo, "Droid Sans", "wenquanyi micro hei", "Hiragino Sans GB", "Hiragino Sans GB W3", "FontAwesome", sans-serif;}--%>
    <%--.jq22-icon{color: #fff;}--%>
    <%--</style>--%>
    <script src="../js/vue.min.js"></script>
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
                            <c:if test="${role == 0 || role == 2}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-pencil"></i> 商品管理 <b class="fa fa-plus dropdown-plus"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="branchStoresTables?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 门店表格
                                            </a>
                                        </li>
                                        <li>
                                            <a href="categoryAndGoods?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 商品信息处理
                                            </a>
                                        </li>
                                        <li>
                                            <a href="SpecialSector?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 特殊板块注册
                                            </a>
                                        </li>
                                        <li>
                                            <a href="goodsRegistToStore?role=${role}&current_login_staff_id=${current_login_staff_id}">
                                                <i class="fa fa-caret-right"></i> 门店商品管理
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
                                            <a href="order_list.html?role=${role}&current_login_staff_id=${current_login_staff_id}&key=0">
                                                <i class="fa fa-caret-right"></i> 订单列表
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
                                            <a href="staff_list.html?role=${role}&current_login_staff_id=${current_login_staff_id}&key=0">
                                                <i class="fa fa-caret-right"></i>  管理人员列表
                                            </a>
                                        </li>
                                        <li>
                                            <a href="user_list.html?role=${role}&current_login_staff_id=${current_login_staff_id}&key=0">
                                                <i class="fa fa-caret-right"></i> 商城用户列表
                                            </a>
                                        </li>
                                        <li>
                                            <a href="management_log.html?role=${role}&current_login_staff_id=${current_login_staff_id}&key=0">
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
            <%--vue引入的用作类别划分的可编辑表格--%>
            <section class="tile color transparent-black">
                <div class="tile-header">
                    <h1><strong>注册</strong>类别</h1>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div id="table">
                    <div class="add form-group">
                        <input type="text" v-model="addDetail.firstCategory" name="fistCategory" value=""
                               placeholder="一级类别"/>
                        <input type="text" v-model="addDetail.secondCategory" name="secondCategory" value=""
                               placeholder="二级类别"/>
                        <input type="test" v-model="addDetail.thirdCategory" name="thirdCategory" value=""
                               placeholder="三级类别"/>
                        <button @click="addCategory">新增</button>
                    </div>
                    <table cellpadding="0" cellspacing="0">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>一级类别</th>
                            <th>二级类别</th>
                            <th>三级类别</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody style="color: #ffffff;">
                        <tr v-for="(item,index) in newsList">
                            <td width="5%">{{index+1}}</td>
                            <td width="25%">{{item.firstCategory}}</td>
                            <td width="25%">{{item.secondCategory}}</td>
                            <td width="25%">{{item.thirdCategory}}</td>
                            <td width="20%"><span @click="deletelist(item,index)" class="delete">删除</span><span
                                    class="edit" @click="edit(item)">编辑</span></td>
                        </tr>
                        </tbody>
                    </table>
                    <div id="mask" v-if="editlist">
                        <div class="mask">
                            <div class="title">
                                编辑
                                <span @click="editlist=false">
X
						</span>
                            </div>
                            <div class="content row">
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-1"></div>
                                    <label for="firstCate">一级类别</label>
                                    <input id="firstCate" type="text" v-model="editDetail.firstCategory"
                                           name="fistCategory" value="" placeholder="一级类别"/>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-1"></div>
                                    <label for="secondCate">二级类别</label>
                                    <input id="secondCate" type="text" v-model="editDetail.secondCategory"
                                           name="secondCategory" value="" placeholder="二级类别"/>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-1"></div>
                                    <label for="thirdCate">三级类别</label>
                                    <input id="thirdCate" type="text" v-model="editDetail.thirdCategory"
                                           name="thirdCategory" value="" placeholder="三级类别"/>
                                </div>
                                <br>
                                <div class="col-sm-2"></div>
                                <button @click="update">更新</button>
                                <button @click="editlist=false">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <%--vue引入的用作类别划分的可编辑表格--%>


            <!-- /content container -->
            <br>
            <br>
            <br>
            <br>
            <!-- 注册商品的表格-->
            <section class="tile color transparent-black">


                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>注册</strong>商品</h1>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->

                <!-- tile body -->
                <div class="tile-body">

                    <form class="form-horizontal">
                        <%--<div style="margin-right: 200px">--%>
                            <div class="form-group">
                                <label for="good_id" class="col-sm-4 control-label">商品编号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="good_id" name="good_id">
                                </div>
                            </div>

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
                                            <label for="input-select-node" class="sr-only">搜索类别:</label>
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
                                    <textarea class="form-control" id="good_short_introduction"
                                              name="good_short_introduction" placeholder="简要描述本商品"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="good_details" class="col-sm-4 control-label">商品详情</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="good_details"
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
                                <button onclick="submitProduct()" type="file" class="btn btn-primary">提交</button>
                                <button type="reset" class="btn btn-default">重置</button>
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
            <%--<section class="tile color transparent-black">--%>


            <%--<!-- tile header -->--%>
            <%--<div class="tile-header">--%>
            <%--<h1><strong>商品</strong> 详细信息列表</h1>--%>
            <%--<div class="search">--%>
            <%--<input type="text" placeholder="Search...">--%>
            <%--</div>--%>
            <%--<div class="controls">--%>
            <%--<a href="#" class="refresh"><i class="fa fa-refresh"></i></a>--%>
            <%--<a href="#" class="remove"><i class="fa fa-times"></i></a>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<!-- /tile header -->--%>

            <%--<!-- tile widget -->--%>
            <%--<div class="tile-widget bg-transparent-black-2">--%>
            <%--<div class="row">--%>

            <%--<div class="col-sm-4 col-xs-6">--%>
            <%--<div class="input-group table-options">--%>
            <%--<span class="input-group-btn">--%>
            <%--<button class="btn btn-default addStore" type="button">添加</button>--%>
            <%--</span>--%>
            <%--<span class="input-group-btn">--%>
            <%--<button class="btn btn-default deleteStore" type="button">删除</button>--%>
            <%--</span>--%>
            <%--</div>--%>
            <%--</div>--%>

            <%--<div class="col-sm-8 col-xs-6 text-right">--%>

            <%--<div class="btn-group btn-group-xs table-options">--%>
            <%--<button type="button" class="btn btn-default">Day</button>--%>
            <%--<button type="button" class="btn btn-default">Week</button>--%>
            <%--<button type="button" class="btn btn-default">Month</button>--%>
            <%--</div>--%>

            <%--</div>--%>


            <%--</div>--%>
            <%--</div>--%>
            <%--<!-- /tile widget -->--%>


            <%--<!-- tile body -->--%>
            <%--<div class="tile-body nopadding">--%>

            <%--<table class="table table-bordered table-sortable">--%>
            <%--<thead>--%>
            <%--<tr>--%>
            <%--<th>--%>
            <%--<div class="checkbox check-transparent">--%>
            <%--<input type="checkbox" value="1" id="allchck">--%>
            <%--<label for="allchck"></label>--%>
            <%--</div>--%>
            <%--</th>--%>
            <%--<th class="sortable sort-asc">商品编号</th>--%>
            <%--<th class="sortable sort-alpha">商品名称</th>--%>
            <%--<th class="sortable sort-asc">一级类别</th>--%>
            <%--<th class="sort-alpha">二级类别</th>--%>
            <%--<th class="sort-alpha">三级类别</th>--%>
            <%--<th>简介</th>--%>
            <%--<th>详情</th>--%>
            <%--<th>图片url?都渲染在这里</th>--%>
            <%--&lt;%&ndash;<th>经度</th>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<th>纬度</th>&ndash;%&gt;--%>
            <%--<!--之后可以不罗列经纬度-->--%>
            <%--<th>创建时间</th>--%>
            <%--<th>更改时间</th>--%>
            <%--<th>计量单位</th>--%>


            <%--&lt;%&ndash;<th style="width: 30px;"></th>&ndash;%&gt;--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--&lt;%&ndash;后面的内容解析暂时不改&ndash;%&gt;--%>
            <%--<tr>--%>
            <%--<c:forEach items="${stores}" var="store">--%>
            <%--<td>--%>
            <%--<div class="checkbox check-transparent">--%>
            <%--<input type="checkbox" name="chooseStore" value="${store.store_id}"--%>
            <%--id="${store.store_id}">--%>
            <%--<label for="${store.store_id}" style="width: 16px"></label>--%>
            <%--</div>--%>
            <%--</td>--%>

            <%--<td>${store.store_id}</td>--%>
            <%--<td>${store.store_name}</td>--%>
            <%--<td>${store.store_tel}</td>--%>
            <%--<td>${store.province}</td>--%>
            <%--<td>${store.city}</td>--%>
            <%--<td>${store.district}</td>--%>
            <%--<td>${store.store_address}</td>--%>
            <%--&lt;%&ndash;<td>${store.longitude}</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>${store.latitude}</td>&ndash;%&gt;--%>
            <%--<td>${store.store_introduction}</td>--%>
            <%--<td>${store.store_start_time}</td>--%>
            <%--<td>${store.store_close_time}</td>--%>
            <%--<c:if test="${store.store_status==0}">--%>
            <%--<td>此店休业</td>--%>
            <%--</c:if>--%>
            <%--<c:if test="${store.store_status==1}">--%>
            <%--<td>此店营业</td>--%>
            <%--</c:if>--%>
            <%--&lt;%&ndash;<td>${store.store_status}</td>&ndash;%&gt;--%>

            <%--<td><a href="#" class="check-toggler checked"></a></td>--%>
            <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
            <%--</table>--%>

            <%--</div>--%>
            <%--<!-- /tile body -->--%>


            <%--<!-- tile footer -->--%>
            <%--<div class="tile-footer bg-transparent-black-2 rounded-bottom-corners">--%>
            <%--<div class="row">--%>

            <%--<div class="col-sm-4 text-center">--%>
            <%--<small class="inline table-options paging-info">showing 1-3 of 24 items</small>--%>
            <%--</div>--%>

            <%--<div class="col-sm-4 text-right sm-center">--%>
            <%--<ul class="pagination pagination-xs nomargin pagination-custom">--%>
            <%--<li class="disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a>--%>
            <%--</li>--%>
            <%--<li class="active"><a href="#">1</a></li>--%>
            <%--<li><a href="#">2</a></li>--%>
            <%--<li><a href="#">3</a></li>--%>
            <%--<li><a href="#">4</a></li>--%>
            <%--<li><a href="#">5</a></li>--%>
            <%--<li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>--%>
            <%--</ul>--%>
            <%--</div>--%>

            <%--</div>--%>
            <%--</div>--%>
            <%--<!-- /tile footer -->--%>


            <%--</section>--%>
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
<%--为了实现可编辑框添加的js代码--%>
<script>

    // 目前表格缺少的是向后端传数据和检查是否是合理的级联关系，第一级的响应问题仍然存在
    var app = new Vue({
        el: '#table',
        data: {
            addDetail: {},
            editlist: false,
            editDetail: {},
            newsList: myCategoryLists,
            editid: ''
        },
        mounted() {

        },
        methods: {

            //新增
            addCategory() {
                //这里的思路应该是把this.addDetail传给服务端，然后加载列表this.newsList
                //this.newsList.push(this.addDetail)
                newCategory = {
                    firstCategory: this.addDetail.firstCategory,
                    secondCategory: this.addDetail.secondCategory,
                    thirdCategory: this.addDetail.thirdCategory,
                    id: Math.floor(Math.random() * 1000000 + 1)
                };
                console.log(newCategory.firstCategory);
                this.newsList.push(newCategory);
                $.ajax({
                    type: "POST",
                    url: '/categoryAndGoods/addNewCategory.do',
                    data: JSON.stringify(newCategory),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                        this.addDetail.firstCategory = "";
                        this.addDetail.secondCategory = "";
                        this.addDetail.thirdCategory = "";
                    },
                    error: function (res) {
                        console.log("添加目录的映射出错了！");
                    }

                })
            },
            //删除
            deletelist(item, i) {
                // mydata=this.newsList[i];
                //其实只需要一个参数，i得到list的位置或者item就是该行的内容
                $.ajax({
                    type: "POST",
                    url: '/categoryAndGoods/deleteCategory.do',
                    data: JSON.stringify(item),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("删除目录的映射出错了！");
                    }

                });
                this.newsList.splice(i, 1);
                // 这边可以传id给服务端进行删除  ID = id
                // axios.get('url',{ID:id}).then((res) =>{
                // 			加载列表
                // })
            },
            //编辑
            edit(item) {
                console.log(item)
                this.editDetail = {
                    firstCategory: item.firstCategory,
                    secondCategory: item.secondCategory,
                    thirdCategory: item.thirdCategory,
                    id: item.id,
                }
                this.editlist = true
                this.editid = item.id

            },
            //确认更新
            update() {
                //编辑的话，也是传id去服务端
                //axios.get('url',{ID:id}).then((res) =>{
                //			加载列表
                //})
                var mydata;
                let _this = this
                for (let i = 0; i < _this.newsList.length; i++) {
                    if (_this.newsList[i].id == this.editid) {
                        _this.newsList[i] = {
                            firstCategory: _this.editDetail.firstCategory,
                            secondCategory: _this.editDetail.secondCategory,
                            thirdCategory: _this.editDetail.thirdCategory,
                            id: this.editid
                        }
                        mydata = _this.newsList[i];
                        this.editlist = false
                    }
                }
                $.ajax({
                    type: "POST",
                    url: '/PatrickManagementSystem_war_exploded/categoryAndGoods/updateCategory.do',
                    data: JSON.stringify(mydata),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("更新目录的映射出错了！" + res);
                    }
                })
            }
        }
    })

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


        $(".deleteStore").on('click', function () {
            var options = document.getElementsByName("chooseStore");
            check_vals = [];
            for (var k = 0; k < options.length; k++) {
                if (options[k].checked) {
                    check_vals.push(options[k].value);
                }
            }
            if (check_vals.length == 0) {
                alert("您未选择任何要删除的商品信息！")
            } else {
                console.log(JSON.stringify(check_vals));
            }
            $.ajax({
                url: "categoryAndGoods/deleteGoods.do",
                type: "post",
                data: {idsList: JSON.stringify(check_vals)},
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
        })

    })

</script>


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
    var myfiles=[];
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
            getList(){
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
        formData.append("id", $("#good_id").val());
        formData.append("name", $("#good_name").val());
        formData.append("details", $("#good_details").val());
        formData.append("short_introduction", $("#good_short_introduction").val());
        alert(myfiles);
        // 获取当前系统时间()
        var myTime = new Date();
        currentTime = myTime.getFullYear() + "-" + myTime.getMonth() + "-" + (myTime.getDay() + 1) + " " + myTime.toLocaleTimeString().substring(2, myTime.toLocaleTimeString().length);
        // alert("current_time:"+currentTime);
        formData.append("current_time:",currentTime);
        formData.append("unit", $("#good_unit").val());

        // if($('#upload_file')[0].files.length>=4)
        // {
        //     formData.append("file0",$('#upload_file')[0].files[0]);
        //     formData.append("file1",$('#upload_file')[0].files[1]);
        //     formData.append("file2",$('#upload_file')[0].files[2]);
        //     formData.append("file3",$('#upload_file')[0].files[3]);
        // }else {
        //     for(index=0;index<$('#upload_file')[0].files.length;index++){
        //         formData.append("file"+index,$('#upload_file')[0].files[index]);
        //     }
        // }
        formData.append("files",myfiles);

       alert("获取表单信息完成！");

        $.ajax({

            url: "categoryAndGoods/addProduct.do",
            type: "post",
            data: formData,
            contentType: false,
            dataType: "json",
            processType: false,
            async:false,
            cache:false,
            success: function (res) {
                console.log(res);
            },
            error: function (res) {
                console.log("更新目录的映射出错了！" + res);
            }
        })
    }

</script>
<%--/////////////////////////////////////////////////////Xenia/////////////////////////////--%>
</body>

</html>

