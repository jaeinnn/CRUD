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
                            <h3 class="box-title">게시글 목록</h3>
                        </div>
                        <div class="box-body">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <th style="width: 30px">#</th>
                                    <th>제목</th>
                                    <th style="width: 100px">작성자</th>
                                    <th style="width: 150px">작성시간</th>
                                    <th style="width: 60px">조회</th>
                                </tr>
                                <c:forEach items="${articles}" var="article">
                                    <tr>
                                        <td>${article.articleNo}</td>
                                        <td><a href="${path}/article/read?articleNo=${article.articleNo}">${article.title}</a></td>
                                        <td>${article.writer}</td>
                                        <td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a HH:mm"/></td>
                                        <td><span class="badge bg-red">${article.viewCnt}</span></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer">
                            <div class="pull-right">
                                <button type="button" onclick="location.href='${path}/article/write';" class="btn btn-success btn-flat" id="writeBtn">
                                    <i class="fa fa-pencil"></i> 글쓰기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!--
    <div class="box-footer">
        <div class="text-center">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li><a href="${path}/article/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>
                </c:if>
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                    <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                        <a href="${path}/article/listPaging?page=${idx}">${idx}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                    <li><a href="${path}/article/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
                </c:if>
            </ul>
        </div>
    </div>
-->
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
