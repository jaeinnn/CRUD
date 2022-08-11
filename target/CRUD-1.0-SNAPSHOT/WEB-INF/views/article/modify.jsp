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
                    <form role="form" id="writeForm" method="post" action="${path}/article/modify">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">게시글 작성</h3>
                            </div>
                            <div class="box-body">
                                <input type="hidden" name="articleNo" value="${article.articleNo}">
                                <div class="form-group">
                                    <label for="title">제목</label>
                                    <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" value="${article.title}">
                                </div>
                                <div class="form-group">
                                    <label for="content">내용</label>
                                    <textarea class="form-control" id="content" name="content" rows="30"
                                              placeholder="내용을 입력해주세요" style="resize: none;">${article.content}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="writer">작성자</label>
                                    <input class="form-control" id="writer" name="writer" value="${article.writer}" readonly>
                                </div>
                            </div>
                            <div class="box-footer">
                              <!--<button type="button" onclick="location.href='${path}/article/listPaging';" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button> -->
                                <div class="pull-right">
                                    <input type="hidden" name="articleNo" value="${article.articleNo}">
                                    <input type="hidden" name="page" value="${searchCriteria.page}">
                                    <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
                                    <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
                                    <input type="hidden" name="keyword" value="${searchCriteria.keyword}">
                                    <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <form action="${path}/article/listPaging" method="get" ><button type="submit"  class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
                        <input type="hidden" name="articleNo" value="${article.articleNo}">
                        <input type="hidden" name="page" value="${searchCriteria.page}">
                        <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
                        <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
                        <input type="hidden" name="keyword" value="${searchCriteria.keyword}">
                    </form>

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
