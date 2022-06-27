<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>

    <%@ include file="../include/head.jsp"%>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <%@ include file="../include/main_header.jsp"%>
    <%@ include file="../include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Write Page</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Write Page</li>
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">


                <div class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">글제목 : ${article.title}</h3>
                        </div>
                        <div class="box-body" style="height: 700px">
                            ${article.content}
                        </div>
                        <div class="box-footer">
                            <div class="user-block">
                                <img class="img-circle img-bordered-sm" src="/dist/img/user1-128x128.jpg" alt="user image">
                                <span class="username">
                    <a href="#">${article.writer}</a>
                </span>
                                <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${article.regDate}"/></span>
                            </div>
                        </div>
                        <div class="box-footer">

                            <!--<button type="button" onclick="location.href='${path}/article/listPaging';" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button> -->
                            <form action="${path}/article/listPaging?articleNo=${article.articleNo}" method="get" ><button type="submit"  class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
                                <input type="hidden" name="page" value="${searchCriteria.page}">
                                <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
                                <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
                                <input type="hidden" name="keyword" value="${searchCriteria.keyword}">

                            </form>
                            <div class="pull-right">
                            <!--<button type="button" onclick="location.href='${path}/article/modify?articleNo=${article.articleNo}';" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>-->
                                <form action="${path}/article/modify?articleNo=${article.articleNo}" method="get" ><button type="submit"  class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
                                    <input type="hidden" name="articleNo" value="${article.articleNo}">
                              <!--      <input type="hidden" name="page" value="${criteria.page}">
                                    <input type="hidden" name="perPageNum" value="${criteria.perPageNum}"> -->
                                    <input type="hidden" name="page" value="${searchCriteria.page}">
                                    <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
                                    <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
                                    <input type="hidden" name="keyword" value="${searchCriteria.keyword}">

                                </form>
                                <form action="${path}/article/remove?articleNo=${article.articleNo}" method="post" ><button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
                              <!--      <input type="hidden" name="page" value="${criteria.page}">
                                    <input type="hidden" name="perPageNum" value="${criteria.perPageNum}"> -->
                                    <input type="hidden" name="articleNo" value="${article.articleNo}">
                                    <input type="hidden" name="page" value="${searchCriteria.page}">
                                    <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
                                    <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
                                    <input type="hidden" name="keyword" value="${searchCriteria.keyword}">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
        <div class="p-3">
            <h5>Title</h5>
            <p>Sidebar content</p>
        </div>
    </aside>
    <!-- /.control-sidebar -->

    <%@ include file="../include/main_footer.jsp"%>

</div>
<!-- ./wrapper -->


<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="../include/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../include/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../include/dist/js/adminlte.min.js"></script>

</body>
</html>
