package com.maple.demo.service.web.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maple.demo.bean.web.Article;
import com.maple.demo.mapper.web.ArticleMapper;
import com.maple.demo.service.web.IArticleService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 网站管理-文章表 服务实现类
 * </p>
 *
 * @author ZhangFZ
 * @since 2020-10-13
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {

}
