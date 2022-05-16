package com.mvc.service;

import com.mvc.dao.ArticleDAO;
import com.mvc.domain.ArticleVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{

    private final ArticleDAO articleDAO;

    @Inject
    public ArticleServiceImpl(ArticleDAO articleDAO) {
        this.articleDAO = articleDAO;
    }


    @Override
    public void create(ArticleVO articleVO) throws Exception {
        articleDAO.create(articleVO);
    }

    @Override
    public ArticleVO read(Integer articleNO) throws Exception {
        return articleDAO.read(articleNO);
    }

    @Override
    public void update(ArticleVO articleVO) throws Exception {
        articleDAO.update(articleVO);
    }

    @Override
    public void delete(Integer articleNo) throws Exception {
        articleDAO.delete(articleNo);
    }

    @Override
    public List<ArticleVO> listAll() throws Exception {
        return articleDAO.listAll();
    }
}
