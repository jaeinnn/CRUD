package com.mvc.reply.controller;

import com.mvc.commons.paging.Criteria;
import com.mvc.commons.paging.PageMaker;
import com.mvc.reply.domain.ReplyVO;
import com.mvc.reply.service.ReplyService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/replies")
public class ReplyController {

    private final ReplyService replyService;

    @Inject
    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }

    /*
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> m13() {
        System.out.println("컨트롤러 타기... 테스트...");
        String msg = "{\"name\":\"김재인\", \"age\":20}"; //json
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=utf-8");
        System.out.println("변환이 잘 됐을까...?");
        System.out.println(msg);
        return new ResponseEntity<>(msg, headers, HttpStatus.OK);
    }

     */


    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody ReplyVO replyVO) {
        ResponseEntity<String> entity = null;
        try {
            replyService.addReply(replyVO);
            entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }


    @RequestMapping(value = "/all/{articleNo}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyVO>> list(@PathVariable("articleNo") Integer articleNo) {
        ResponseEntity<List<ReplyVO>> entity = null;
   //     HttpHeaders headers = new HttpHeaders();
   //     headers.add("Content-Type", "application/json;charset=utf-8");

        System.out.println("왔니...?");
        try {

            System.out.println("왔으면 대답을 해줘...");
            entity = new ResponseEntity<>(replyService.listReply(articleNo), HttpStatus.OK);

            //System.out.println(replyService.listReply(articleNo));
            System.out.println(entity);


        } catch (Exception e) {
            System.out.println("안왔으면 말구...");
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }


    /*
    @RequestMapping(value = "/all/{articleNo}", method = RequestMethod.GET)
    public ResponseEntity<String> m13() {
        System.out.println("컨트롤러 타기... 테스트...");
        String msg = "{\"name\":\"김재인\", \"age\":20}"; //json
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json;charset=utf-8");
        System.out.println("변환이 잘 됐을까...?");
        System.out.println(msg);
        return new ResponseEntity<>(msg, headers, HttpStatus.OK);
    }

     */



    @RequestMapping(value = "/{replyNo}", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> update(@PathVariable("replyNo") Integer replyNo, @RequestBody ReplyVO replyVO) {
        ResponseEntity<String> entity = null;
        try {
            replyVO.setReplyNo(replyNo);
            replyService.modifyReply(replyVO);
            entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }



    @RequestMapping(value = "/{replyNo}", method = RequestMethod.DELETE)
    public ResponseEntity<String> delete(@PathVariable("replyNo") Integer replyNo) {
        ResponseEntity<String> entity = null;
        try {
            replyService.removeReply(replyNo);
            entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }



    @RequestMapping(value = "/{articleNo}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("articleNo") Integer articleNo,
                                                          @PathVariable("page") Integer page) {

        ResponseEntity<Map<String, Object>> entity = null;

        try {

            Criteria criteria = new Criteria();
            criteria.setPage(page);

            List<ReplyVO> replies = replyService.getRepliesPaging(articleNo, criteria);
            int repliesCount = replyService.countReplies(articleNo);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCriteria(criteria);
            pageMaker.setTotalCount(repliesCount);

            Map<String, Object> map = new HashMap<>();
            map.put("replies", replies);
            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<>(map, HttpStatus.OK);

        } catch (Exception e) {

            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.OK);

        }

        return entity;
    }

}