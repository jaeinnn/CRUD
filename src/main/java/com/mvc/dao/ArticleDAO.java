package com.mvc.dao;

import com.mvc.commons.paging.Criteria;
import com.mvc.commons.paging.SearchCriteria;
import com.mvc.domain.ArticleVO;

import java.util.List;

public interface ArticleDAO {

    void create(ArticleVO articleVO) throws Exception;
    ArticleVO read(Integer articleNo) throws Exception;
    void update(ArticleVO articleVO) throws Exception;
    void delete(int articleNo) throws Exception;
    List<ArticleVO> listAll() throws Exception;

    List<ArticleVO> listPaging(int page) throws Exception;
    List<ArticleVO> listCriteria(Criteria criteria) throws Exception;

    int countArticles(Criteria criteria) throws Exception;

    List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;
    int countSearchedArticles(SearchCriteria searchCriteria) throws Exception;

    void updateReplyCnt(Integer articleNo, int amount) throws Exception;
    void updateViewCnt(Integer articleNo) throws Exception;

}
