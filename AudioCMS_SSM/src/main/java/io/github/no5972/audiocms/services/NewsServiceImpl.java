package io.github.no5972.audiocms.services;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.audiocms.dao.CategoryDao;
import io.github.no5972.audiocms.dao.HeadlineDao;
import io.github.no5972.audiocms.dao.NewsDao;
import io.github.no5972.audiocms.models.Headline;
import io.github.no5972.audiocms.models.News;
import io.github.no5972.audiocms.othertools.GenerateAudio;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsDao nd;
	
	@Autowired
	private CategoryDao cd;
	
	@Autowired
	private HeadlineDao hd;
	
	@Override
	public List<News> getNewsByCid(int id) {
		// TODO Auto-generated method stub
		return nd.selectNewsByCid(id);
	}

	@Override
	public List<News> getNewsByCidSplitByPages(int page, int pageSize, int cid) {
		// TODO Auto-generated method stub
		Headline headline = hd.selectHeadline();
		List<News> result = nd.selectNewsByCidSplitByPages((page-1)*pageSize, pageSize, cid);
		for(int i = 0 ; i < result.size() ; i++) {
			  result.get(i).setCategoryName(cd.selectCategoryById(result.get(i).getCid()).getName());
			  if (result.get(i).getId() == headline.getValue()) result.get(i).setHeadline(true);
			  System.out.println(result.get(i).getId()+","+headline.getValue()+","+result.get(i).isHeadline());
			  result.get(i).setContent(GenerateAudio.delHTMLTag(result.get(i).getContent()));
		}
		return result;
	}

	@Override
	public List<News> getAllNewsSplitByPages(int page, int pageSize) {
		// TODO Auto-generated method stub
		Headline headline = hd.selectHeadline();
		List<News> result = nd.selectAllNewsSplitByPages((page-1)*pageSize, pageSize);
		for(int i = 0 ; i < result.size() ; i++) {
			  result.get(i).setCategoryName(cd.selectCategoryById(result.get(i).getCid()).getName());
			  if (result.get(i).getId() == headline.getValue()) result.get(i).setHeadline(true);
			  System.out.println(result.get(i).getId()+","+headline.getValue()+","+result.get(i).isHeadline());
			  result.get(i).setContent(GenerateAudio.delHTMLTag(result.get(i).getContent()));
		}
		return result;
	}

	@Override
	public int getNewsPageCountByCid(int cid, int pageSize) {
		// TODO Auto-generated method stub
		return nd.getPageCountByCid(cid, pageSize)+1;
	}

	@Override
	public int getAllNewsPageCount(int pageSize) {
		// TODO Auto-generated method stub
		return nd.getAllPageCount(pageSize)+1;
	}

	@Override
	public void insertNews(String title, String content, int cid) {
		// TODO Auto-generated method stub
		//int resultId = nd.addNews(title, content, cid, new Date());
		News newNews = new News();
		newNews.setTitle(title);
		newNews.setCid(cid);
		newNews.setContent(content);
		newNews.setCreateTime(new Date());
		nd.addNews(newNews);
		GenerateAudio audio = new GenerateAudio(newNews.getId(), content);
		audio.start();
	}

	@Override
	public void deleteNews(int id) {
		// TODO Auto-generated method stub
		nd.deleteNews(id);
	}

	@Override
	public News getNewsById(int id) {
		// TODO Auto-generated method stub
		System.out.println("getNews "+id);
		Headline headline = hd.selectHeadline();
		News result = nd.selectNewsById(id);
    	String u = this.getClass().getClassLoader().getResource("").getPath();
		File isAudioExist = new File(u+"\\..\\..\\Audios\\"+id+".mp3");
		if (!isAudioExist.exists()) {
			GenerateAudio audio = new GenerateAudio(id, result.getContent());
			audio.start();
		}
		if (result.getId()==headline.getValue()) result.setHeadline(true);
		return result;
	}

	@Override
	public void updateNews(int id, String title, int cid, String content) {
		// TODO Auto-generated method stub
		GenerateAudio audio = new GenerateAudio(id, content);
		audio.start();
		nd.updateNews(id, cid, title, content);
	}

	@Override
	public void setHeadline(int id) {
		// TODO Auto-generated method stub
		hd.updateHeadline(id);
	}

	@Override
	public News getHeadlineNews() {
		// TODO Auto-generated method stub
		System.out.println("HEADLINE_TITLE====="+nd.selectNewsById(hd.selectHeadline().getValue()).getTitle());
		return nd.selectNewsById(hd.selectHeadline().getValue());
	}

	@Override
	public List<News> getSearchNewsSplitByPages(int page, int pageSize, String keywords) {
		// TODO Auto-generated method stub
		List<News> result = nd.selectSearchNewsSplitByPages((page-1)*pageSize, pageSize, keywords);
		for(int i = 0 ; i < result.size() ; i++) {
			  result.get(i).setCategoryName(cd.selectCategoryById(result.get(i).getCid()).getName());
			  result.get(i).setContent(GenerateAudio.delHTMLTag(result.get(i).getContent()));
		}
		return result;
	}

	@Override
	public int getSearchNewsPageCount(String keywords, int pageSize) {
		// TODO Auto-generated method stub
		return nd.selectSearchNewsPageCount(keywords, pageSize)+1;
	}

	@Override
	public int getSearchNewsCount(String keywords) {
		// TODO Auto-generated method stub
		return nd.selectSearchNewsCount(keywords);
	}

}
