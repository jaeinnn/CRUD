package com.mvc.reply.service;

import com.mvc.commons.paging.Criteria;
import com.mvc.dao.ArticleDAO;
import com.mvc.reply.Persistence.ReplyDAO;
import com.mvc.reply.domain.ReplyVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {

    private final ReplyDAO replyDAO;
    private final ArticleDAO articleDAO;

    @Inject
    public ReplyServiceImpl(ReplyDAO replyDAO, ArticleDAO articleDAO) {
        this.replyDAO = replyDAO;
        this.articleDAO = articleDAO;
    }

    @Override
    public List<ReplyVO> listReply(Integer articleNo) throws Exception {
        return replyDAO.list(articleNo);
    }

    // 댓글 등록
    @Transactional // 트랜잭션 처리
    @Override
    public void addReply(ReplyVO replyVO) throws Exception {
        replyDAO.create(replyVO); // 댓글 등록
        articleDAO.updateReplyCnt(replyVO.getArticleNo(), 1); // 댓글 갯수 증가
    }

    @Override
    public void modifyReply(ReplyVO replyVO) throws Exception {
        replyDAO.update(replyVO);
    }

    // 댓글 삭제
    @Transactional // 트랜잭션 처리
    @Override
    public void removeReply(Integer replyNo) throws Exception {
        int articleNo = replyDAO.getArticleNo(replyNo); // 댓글의 게시물 번호 조회
        replyDAO.delete(replyNo); // 댓글 삭제
        articleDAO.updateReplyCnt(articleNo, -1); // 댓글 갯수 감소
    }

    @Override
    public List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception {
        return replyDAO.listPaging(articleNo, criteria);
    }

    @Override
    public int countReplies(Integer articleNo) throws Exception {
        return replyDAO.countReply(articleNo);
    }
}
