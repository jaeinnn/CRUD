package com.mvc.dao;

import com.mvc.dto.ArticleDTO;

import java.util.List;

public interface ArticleDAO {

    void create(ArticleDTO articleDTO) throws Exception;
    ArticleDTO read(int articleNo) throws Exception;
    void update(ArticleDTO articleDTO) throws Exception;
    void delete(int articleNo) throws Exception;
    List<ArticleDTO> listAll() throws Exception;
}
