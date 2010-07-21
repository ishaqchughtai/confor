<?php
class MSystem extends Model{
	var $_default_video_settings = array(
		'num_per_page_video' => 7,
		'num_per_page_conf' => 7,
		'num_per_page_blog' => 7,
		'order_conf_field' => 'date',
		'order_video_field' => 'date',
		'order_blog_field' => 'date',
		'order_conf_sort' => 'desc',
		'order_video_sort' => 'desc',
		'order_blog_sort' => 'desc',		
		'site_off' => 0
	);	
	
	function MSystem(){
		parent::Model();
		$this->load->database();
	}
		
	function get_setting()
	{
		$this->db->limit(1);
		$query = $this->db->get('system_settings');
		if ($query->num_rows()<1) 
		{
			return $this->_default_video_settings;
		}
		else 
		{
			return $query->row_array();			
		}			
	}
	
	function save($data)
	{
		$this->db->where('id', 1);
		$this->db->update('system_settings', $data);			
	}
	
	function list_fields($table_name)
	{
		$fields = $this->db->list_fields($table_name);
		$options = array();
		foreach ($fields as $field)
		{
			$options[$field] = $field;
		}		
		return $options;
	}
	
}
?>
