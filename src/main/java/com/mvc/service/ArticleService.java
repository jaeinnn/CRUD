package com.mvc.service;

import com.mvc.commons.paging.Criteria;
import com.mvc.commons.paging.SearchCriteria;
import com.mvc.domain.ArticleVO;

import java.util.List;

public interface ArticleService {

    void create(ArticleVO articleVO) throws Exception;
    ArticleVO read(Integer articleNO) throws Exception;
    void update(ArticleVO articleVO) throws Exception;
    void delete(Integer articleNo) throws Exception;
    List<ArticleVO> listAll() throws Exception;

    List<ArticleVO> listCriteria(Criteria criteria) throws Exception;

    int countArticles(Criteria criteria) throws Exception;

    List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;
    int countSearchedArticles(SearchCriteria searchCriteria) throws Exception;



}
