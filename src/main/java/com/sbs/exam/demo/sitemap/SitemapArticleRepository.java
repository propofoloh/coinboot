package com.sbs.exam.demo.sitemap;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface SitemapArticleRepository {

	@Select("SELECT id FROM ARTICLE")
	static
	List<Integer> selectId() {
		// TODO Auto-generated method stub
		return null;
	}
}
