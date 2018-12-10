package io.github.no5972.audiocms.dao;

import org.apache.ibatis.annotations.Param;

import io.github.no5972.audiocms.models.Headline;

public interface HeadlineDao {
	public Headline selectHeadline();
	public void updateHeadline(@Param("id")int id);
}
