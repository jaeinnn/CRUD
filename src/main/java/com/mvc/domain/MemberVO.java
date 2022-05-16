package com.mvc.domain;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class MemberVO {

    private String userid;
    private String userpw;
    private String username;
    private String email;
    private Date regdate;
    private Date updatedate;

}