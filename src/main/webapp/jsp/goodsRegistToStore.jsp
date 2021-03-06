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
    <link href="../css/style.css">

    <%--&lt;%&ndash;用于添加iview的资源链接&ndash;%&gt;--%>
    <%--<link rel="stylesheet" type="text/css" href="css/iview.css">--%>
    <%--<script type="text/javascript" src="js/vue.min.js"></script>--%>
    <%--<script type="text/javascript" src="js/iview.min.js"></script>--%>
    <!-- import Vue.js -->
    <script src="//vuejs.org/js/vue.min.js"></script>
    <!-- import stylesheet -->
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
    <!-- import iView -->
    <script src="//unpkg.com/iview/dist/iview.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <%--在头部给全局的表格信息赋值--%>
    <script>
        // var
        myGoodsAndStores_data = [];
        <c:forEach items="${products_by_stores_list}" var="goodsbystore">
        myGoodsAndStores_data.push({
            record_id: "${goodsbystore.id}",
            store_id: "${goodsbystore.store_id}",
            product_id: "${goodsbystore.product_id}",
            inventory: "${goodsbystore.inventory}",
            original_price: "${goodsbystore.original_price}",
            discount: "${goodsbystore.discount}",
            product_status: "${goodsbystore.product_status}"
        });
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

        <!-- Fixed navbar end -->


        <!-- Page content -->
        <div id="content" class="col-md-12">


            <!-- page header -->
            <div class="pageheader">


                <h2><i class="fa fa-tachometer"></i> 派氏乐鲜生活馆
                    <span>门店商品注册.</span></h2>


            </div>
            <!-- /page header -->


            <!-- content main container -->

            <br>
            <br>
            <section class="tile color transparent-black">
                <div class="main">
                    <br>
                    <h3 class="title-w3" style="color: #FFFFFF">门店注册商品信息</h3>
                    <br> <br>
                    <div id="app2">

                        <div>
                            <div style="margin-left: 30px;margin-right: 20px">
                                <i-table :columns="columns" :data="data" height="660">
                                    <div slot-scope="{ row, index }" slot="store_id">
                                        <Input type="text" v-model="editStore_id" v-if="editIndex === index"/>
                                        <span v-else>{{ row.store_id }}</span>
                                    </div>

                                    <div slot-scope="{ row, index }" slot="product_id">
                                        <Input type="text" v-model="editProduct_id" v-if="editIndex === index"/>
                                        <span v-else>{{ row.product_id }}</span>
                                    </div>

                                    <div slot-scope="{ row, index }" slot="inventory">
                                        <Input type="text" v-model="editInventory" v-if="editIndex === index"/>
                                        <span v-else>{{ row.inventory }}</span>
                                    </div>

                                    <div slot-scope="{ row, index }" slot="original_price">
                                        <Input type="text" v-model="editOriginal_price" v-if="editIndex === index"/>
                                        <span v-else>{{ row.original_price }}</span>
                                    </div>
                                    <div slot-scope="{ row, index }" slot="discount">
                                        <Input type="text" v-model="editDiscount" v-if="editIndex === index"/>
                                        <span v-else>{{ row.discount }}</span>
                                    </div>
                                    <div slot-scope="{ row, index }" slot="product_status">
                                        <Input type="text" v-model="editProduct_status" v-if="editIndex === index"/>
                                        <span v-else>{{ row.product_status }}</span>
                                    </div>

                                    <div slot-scope="{ row, index }" slot="action">
                                        <div v-if="editIndex === index">
                                            <i-button @click="handleSave(index)">更改</i-button>
                                            <i-button @click="handleAdd(index)">保存</i-button>
                                            <i-button @click="editIndex = -1">取消</i-button>
                                            <i-button type="error" style="color:#EE0000" @click="remove(index)">删除
                                            </i-button>

                                        </div>
                                        <div v-else>
                                            <i-button @click="handleEdit(row, index)">操作</i-button>
                                        </div>
                                    </div>

                                </i-table>

                            </div>
                            <Divider>
                                <i-button @click="addRow">添加新的数据</i-button>
                            </Divider>
                        </div>
                    </div>


                    <%--结束注册商品的页面--%>
                </div>
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

<%--/////////////////////////////////////////////////////Xenia/////////////////////////////--%>

<%--响应表格的函数--%>


<%--响应表格可编辑的函数--%>

<%--引入iView和Vue--%>
<link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
<script type="text/javascript" src="../js/vue.min.js"></script>
<script type="text/javascript" src="http://unpkg.com/iview/dist/iview.min.js"></script>
<%--<script>--%>
<script>
    var vue2 = new Vue({
        el: '#app2',
        data() {
            return {
                columns: [
                    {
                        type: 'index',
                        width: 60,
                        align: 'center'
                    },
                    {
                        title: '商店编号',
                        key: 'store_id',
                        sortable: true,
                        slot: 'store_id',
                    },
                    {
                        title: '产品编号',
                        key: 'product_id',
                        sortable: true,
                        slot: 'product_id',

                    }
                    ,
                    {
                        title: '库存',
                        key:
                            'inventory',
                        slot:
                            'inventory',
                        sortable:
                            true,
                    }
                    ,
                    {
                        title: '原价',
                        key:
                            'original_price',
                        slot:
                            'original_price',
                        sortable:
                            true
                    }
                    ,
                    {
                        title: '折扣',
                        key:
                            'discount',
                        sortable:
                            true,
                        slot:
                            'discount',

                    }
                    ,
                    {
                        title: '产品状态',
                        key:
                            'product_status',
                        slot:
                            'product_status',
                        sortable:
                            true
                    }
                    ,
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
                data: myGoodsAndStores_data,
                editIndex: -1,  // 当前聚焦的输入框的行数
                editStore_id: '',  // 第一列输入框，当然聚焦的输入框的输入内容，与 data 分离避免重构的闪烁
                editProduct_id: '',  // 第二列输入框
                editInventory: '',  // 第三列输入框
                editOriginal_price: '',  // 第四列输入框
                editDiscount: '',
                editProduct_status: '',
                record_id: '',
            }
        },
        methods: {
            handleEdit(row, index) {
                this.record_id = row.record_id;
                this.editStore_id = row.store_id;
                this.editProduct_id = row.product_id;
                this.editInventory = row.inventory;
                this.editOriginal_price = row.original_price;
                this.editDiscount = row.discount;
                this.editProduct_status = row.product_status;
                this.editIndex = index;
            },
            handleSave(index) {
                this.data[index].store_id = this.editStore_id;
                this.data[index].product_id = this.editProduct_id;
                this.data[index].inventory = this.editInventory;
                this.data[index].original_price = this.editOriginal_price;
                this.data[index].discount = this.editDiscount;
                this.data[index].product_status = this.editProduct_status;
                this.data[index].record_id = this.record_id;
                this.editIndex = -1;
                test = this.data[index];
                $.ajax({
                    type: "POST",
                    url: '/goodsRegistToStore/updateProductsFromStores.do',
                    data: JSON.stringify(test),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("更新商品到门店的信息出错了！");
                    }

                })
            },
            remove(index) {
                test = this.data[index];
                this.data.splice(index, 1);
                $.ajax({
                    type: "POST",
                    url: '/goodsRegistToStore/removeProductsFromStores.do',
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
            // /** 添加行 */
            addRow() {
                this.data.push({
                    store_id: '',
                    product_id: '',
                    inventory: '',
                    original_price: '',
                    discount: '',
                    product_status: ''
                });
            },
            handleAdd(index) {
                this.data[index].store_id = this.editStore_id;
                this.data[index].product_id = this.editProduct_id;
                this.data[index].inventory = this.editInventory;
                this.data[index].original_price = this.editOriginal_price;
                this.data[index].discount = this.editDiscount;
                this.data[index].product_status = this.editProduct_status;
                // this.data[index].record_id = this.record_id;
                this.editIndex = -1;
                test = this.data[index];
                $.ajax({
                    type: "POST",
                    url: '/goodsRegistToStore/addProductsFromStores.do',
                    data: JSON.stringify(test),
                    contentType: "application/json;charset=UTF-8",
                    dataType: "json",
                    success: function (res) {
                        console.log(res);
                    },
                    error: function (res) {
                        console.log("添加商品到门店的信息出错了！");
                    }

                })
            },
        }
    })
</script>
<%--/////////////////////////////////////////////////////Xenia/////////////////////////////--%>

</body>
</html>
      
