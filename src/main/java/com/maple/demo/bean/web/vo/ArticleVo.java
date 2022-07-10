package com.maple.demo.bean.web.vo;

import com.maple.demo.bean.web.Article;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class ArticleVo extends Article {

    List<Long> idList;

    String content;

}
