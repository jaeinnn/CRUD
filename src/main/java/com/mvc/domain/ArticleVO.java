package com.mvc.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;


@Getter
@Setter
@ToString
public class ArticleVO {

    private Integer articleNo;
    private String title;
    private String content;
    private String writer;
    private Date regDate;
    private int viewCnt;
    private int replyCnt;

    private String[] files;
    private int fileCnt;

    public void setFiles(String[] files) {
        this.files = files;
        setFileCnt(files.length);
    }

    private void setFileCnt(int fileCnt) {
        this.fileCnt = fileCnt;
    }
    
}
