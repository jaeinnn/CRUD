package com.mvc.upload.service;

import com.mvc.upload.Persistence.ArticleFileDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ArticleFileServiceImpl implements ArticleFileService {

    private final ArticleFileDAO articleFileDAO;

    @Inject
    public ArticleFileServiceImpl(ArticleFileDAO articleFileDAO) {
        this.articleFileDAO = articleFileDAO;
    }

    // 첨부파일 목록
    @Override
    public List<String> getArticleFiles(Integer articleNo) throws Exception {
        return articleFileDAO.getArticleFiles(articleNo);
    }
}
