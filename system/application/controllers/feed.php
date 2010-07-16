<?php
/**
 * Feed Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	RSS
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
 
class Feed extends Frontend_controller 
{

	function Feed()
	{
		parent::Frontend_controller();
		$this->load->helper('xml');
		$this->load->model('MRss');
	}	
	
	function video()
	{
		 $data['feed_name'] = __("CF_rss_video_name");	 
		 $data['feed_url'] = site_url('feed/video');
		 $data['page_description'] = __("CF_rss_recent_videos");
		 $data['page_language'] = $this->_data['lang'];		 
		 
		 $category = $this->uri->segment(3);
		 if (! $category) $category=0;
		 $data['videos'] = $this->MRss->get_video_rss(10, $this->_data['lang'],$category);
		 if ($category>0) 
		 {
			$video_cate = $this->MRss->get_category_name($category, $this->_data['lang']);
			if ($video_cate!=FALSE) $data['video_cate'] = $video_cate;		 
		 }		 
		 header("Content-Type: application/rss+xml");
		 $this->load->view('home/rss_video', $data); 		
	}
	
	function blog()
	{
		 $data['feed_name'] = __("CF_rss_blog_name");
		 $data['feed_url'] = site_url('feed/blog').'.rss';
		 $data['page_description'] = __("CF_rss_recent_blogs");
		 $data['page_language'] = $this->_data['lang'];
		 
		 $data['blogs'] = $this->MRss->get_blog_rss(10, $this->_data['lang']);
		 header("Content-Type: application/rss+xml");
		 $this->load->view('home/rss_blog', $data); 
	}	
	
}