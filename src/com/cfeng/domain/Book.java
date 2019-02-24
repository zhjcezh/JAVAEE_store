package com.cfeng.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter@ToString
public class Book {
    private Integer book_id;
    private String book_title;
    private String book_content;
    private double book_price;
    private Integer book_num;
    private Category category;
    private String book_pic;
}
