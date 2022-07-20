<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>

    <script src="/plugins/jquery/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
    <!--Handlebar라이브러리 추가-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/dist/css/adminlte.min.css">


    <%--lightbox css--%>
    <link rel="stylesheet" href="/components/lightbox/css/lightbox.css">

    <!-- Bootstrap 4 -->
    <script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/dist/js/adminlte.min.js"></script>


    <style type="text/css">
        .fileDrop {
            width: 100%;
            height: 200px;
            border: 2px dotted #0b58a2;
        }
    </style>


    <script src="/static/js/lib/jquery.cookie/jquery.cookie.js"></script>


    <script id="fileTemplate" type="text/x-handlebars-template">
        <li>
        <span class="mailbox-attachment-icon has-img">
            <img src="{{imgSrc}}" alt="Attachment">
        </span>
            <div class="mailbox-attachment-info">
                <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                    <i class="fa fa-paperclip"></i> {{originalFileName}}
                </a>
                <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
                    <i class="fa fa-fw fa-remove"></i>
                </a>
            </div>
        </li>
    </script>


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
                <!--
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Card title</h5>

                                <p class="card-text">
                                    Some quick example text to build on the card title and make up the bulk of the card's
                                    content.![](../../../../../../../../AppData/Local/Temp/1.png)
                                </p>

                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                            </div>
                        </div>
                    </div>

                </div>
                -->
                <!-- /.row -->

                <div class="col-lg-12">
                    <form role="form" id="writeForm" method="post" action="${path}/article/write">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">게시글 작성</h3>
                            </div>

                            <div class="form-group">
                                <label for="writer">작성자</label>
                                <input class="form-control" id="writer" name="writer">
                            </div>

                            <div class="box-body">
                                <div class="form-group">
                                    <label for="title">제목</label>
                                    <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
                                </div>
                                <div class="form-group">
                                    <label for="content">내용</label>
                                    <textarea class="form-control" id="content" name="content" rows="30"
                                              placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                                </div>

                                <%--첨부파일 영역 추가--%>
                                <div class="form-group">
                                    <div class="fileDrop">
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
                                    </div>
                                </div>
                                <%--첨부파일 영역 추가--%>

                            </div>

                            <div class="box-footer">
                                <ul class="mailbox-attachments clearfix uploadedFileList"></ul>
                            </div>

                            <div class="box-footer">
                                <button type="button" onclick="location.href='${path}/article/list';" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
                                <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
                            </div>
                        </div>
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

<!--
<script src="../include/plugins/jquery/jquery.min.js"></script>
-->
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.js"></script>

<%--lightbox js--%>
<script src="/components/lightbox/js/lightbox.js"></script>

<script type="text/javascript" src="/dist/js/article_file_upload.js"></script>




<script>

    $(document).ready(function () {

    // 게시글 저장 버튼 클릭 이벤트 처리
    $("#writeForm").submit(function (event) {
        event.preventDefault();
        var that = $(this);
        filesSubmit(that);
    });

    // 파일 삭제 버튼 클릭 이벤트
    $(document).on("click", ".delBtn", function (event) {
        event.preventDefault();
        var that = $(this);
        deleteFileWrtPage(that);
    });

    });


</script>


</body>
</html>
