<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script>

        var articleNo = 1022;

        getReplies();

        function getReplies() {

            $.getJSON("/replies/all/" + articleNo, function (data) {

                console.log(data);

                var str = "";

                $(data).each(function () {
                    str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
                        + "<p class='replyText'>" + this.replyText + "</p>"
                        + "<p class='replyWriter'>" + this.replyWriter + "</p>"
                        + "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
                        + "</li>"
                        + "<hr/>";

                });

                $("#replies").html(str);

            });

        }

    </script>

</head>

<body>


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

</body>

</html>