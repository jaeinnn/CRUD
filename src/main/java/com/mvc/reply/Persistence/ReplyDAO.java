package com.mvc.reply.Persistence;
import com.mvc.commons.paging.Criteria;
import com.mvc.reply.domain.ReplyVO;
import java.util.List;

public interface ReplyDAO {

    List<ReplyVO> list(Integer articleNo) throws Exception;
    void create(ReplyVO replyVO) throws Exception;
    void update(ReplyVO replyVO) throws Exception;
    void delete(Integer replyNo) throws Exception;

    List<ReplyVO> listPaging(Integer articleNo, Criteria criteria) throws Exception;
    int countReply(Integer articleNo) throws Exception;

}
