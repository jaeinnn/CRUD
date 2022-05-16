package com.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;


@Getter
@Setter
public class ArticleVO {

    private Integer articleNo;
    private String title;
    private String content;
    private String writer;
    private Date regDate;
    private int viewCnt;
    
}
