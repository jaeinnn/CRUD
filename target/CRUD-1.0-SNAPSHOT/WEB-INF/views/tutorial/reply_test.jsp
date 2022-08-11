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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>


    <script>

        <%--
        $(document).ready(function(){

            console.log("왜 안나오지?");

            var articleNo = 1022;
            $.getJSON("/replies/all/" + articleNo, function (data) {
                console.log(data);
                console.log("왜 안나와?ㅠㅠ");
            }).done(function(){
                    console.log("요청이 성공하였습니다.");
            }).fail(function(){
                    console.log("알수없는 에러가 발생하였습니다.");
            }).always(function(){
                    console.log("응답이 완료하였습니다.");
                });
        });
        --%>

        var articleNo = 1022;

        // 댓글 목록 호출
        getReplies();

        // 댓글 목록 출력 함수
        function getReplies() {

            $.getJSON("/replies/all/" + articleNo, function (data) {

                console.log(data);

                var str = "";

                $(data).each(function () {
                    str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
                        +   "<p class='replyText'>" + this.replyText + "</p>"
                        +   "<p class='replyWriter'>" + this.replyWriter + "</p>"
                        +   "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                        + "</li>"
                        + "<hr/>";

                });

                $("#replies").html(str);

            });

            }

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

            <section class="content container-fluid">
                <div class="col-lg-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">댓글 작성</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label for="newReplyText">댓글 내용</label>
                                <input class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label for="newReplyWriter">댓글 작성자</label>
                                <input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력해주세요">
                            </div>

                            <div class="col-sm-2">
                                <button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 저장</button>
                            </div>

                        </div>
                        <div class="box-footer">
                            <ul id="replies">

                            </ul>
                        </div>
                        <div class="box-footer">
                            <div class="text-center">
                                <ul class="pagination pagination-sm no-margin">

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modifyModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">댓글 수정창</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="replyNo">댓글 번호</label>
                                    <input class="form-control" id="replyNo" name="replyNo" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="replyText">댓글 내용</label>
                                    <input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                                </div>
                                <div class="form-group">
                                    <label for="replyWriter">댓글 작성자</label>
                                    <input class="form-control" id="replyWriter" name="replyWriter" readonly>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-success modalModBtn">수정</button>
                                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>

            </section>


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

<script>

    $("#replies").on("click", ".replyLi button", function () {
        var reply = $(this).parent();

        var replyNo = reply.attr("data-replyNo");
        var replyText = reply.find(".replyText").text();
        var replyWriter = reply.find(".replyWriter").text();

        $("#replyNo").val(replyNo);
        $("#replyText").val(replyText);
        $("#replyWriter").val(replyWriter);

    });


</script>

</body>
</html>
