<?php
class Mblog extends Model{
    function Mblog()
    {
        parent::Model();
        $this->load->database();
    }
    function get_all_blog($lg,$offset,$num)
    {
        $this->db->select("
        tblblog.ID,
        tblblog.Date,
        tblblog.Title,
        tblblog.Subject,
        tblblog.Keywords,
        tblblog.Text,
        tblblog.Link,
        tblblog.CountView,
        tblblog.CountComment,          
        tbladmin.Name");
        $this->db->from('tblblog');
        $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
        $this->db->order_by("tblblog.Date", "desc");
        $this->db->where('tblblog.Lang ', $lg); 
        $this->db->limit($num,$offset);
        $query = $this->db->get();
        return $query->result_array();
    }
    function get_blog_by_title($title)
    {
        $this->db->select("
        tblblog.ID,
        tblblog.Date,
        tblblog.Title,
        tblblog.Subject,
        tblblog.Text,
        tblblog.Link,
        tblblog.CountView,
        tblblog.CountComment,
        tblblog.About,          
        tbladmin.Name");
        $this->db->from('tblblog');
        $this->db->where('tblblog.Title',$title);
        $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
        $query = $this->db->get();
        return $query->result_array(); 
    }
    function get_blog_by_title_countview($title)
    {
        $query = $this->db->get_where('tblblog',array('Title'=>$title));
        return $query;
    }
    function get_most_blog($lg)
    {
        $this->db->select("
        tblblog.ID,
        tblblog.Date,
        tblblog.Title,
        tblblog.Subject,
        tblblog.Keywords,
        tblblog.Text,
        tblblog.Link,
        tblblog.CountView,
        tblblog.CountComment,          
        tbladmin.Name");
        $this->db->from('tblblog');
        $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
        $this->db->order_by("tblblog.ID", "desc");
        $this->db->where('tblblog.Lang ', $lg);
        $this->db->limit('1'); 
        $query = $this->db->get();
        return $query->result_array();   
    }
    function get_most_blog_date()
    {
        $this->db->select("
        tblblog.ID,
        tblblog.Title,
        tblblog.Link,
        tblblog.Date,
        tblblog.CountView,
        tblblog.CountComment,
        tbladmin.FirstName");
        $this->db->from('tblblog');
        $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
        $this->db->order_by("tblblog.Date", "desc");
        $this->db->limit(8);
        $query = $this->db->get();
        return $query->result_array();
    }
    function get_most_blog_post($lg)
    {
        $this->db->select("
        tblblog.ID,
        tblblog.Title,
        tblblog.Link,
        tblblog.Date,
        tblblog.CountView,
        tblblog.CountComment,
        tbladmin.FirstName,
        tbladmin.Name");
        $this->db->from('tblblog');
        $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
        $this->db->order_by("tblblog.CountComment", "desc");
        $this->db->where('tblblog.Lang ', $lg); 
        $this->db->limit(8);
        $query = $this->db->get();
        return $query->result_array(); 
    }
    function get_most_blog_view($lg)
    {
        $this->db->select("
        tblblog.ID,
        tblblog.Title,
        tblblog.Link,
        tblblog.Date,
        tblblog.CountView,
        tblblog.CountComment,
        tbladmin.FirstName,
        tbladmin.Name");
        $this->db->from('tblblog');
        $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
        $this->db->order_by("tblblog.CountView", "desc");
        $this->db->where('tblblog.Lang ', $lg);
        $this->db->limit(8);
        $query = $this->db->get();
        return $query->result_array(); 
    }    
    function get_blog_by_id($id)
    {
        $query = $this->db->get_where('tblblog',array('ID'=>$id));
        return $query->result();
    }
    function written($author)
    {
        $this->db->select("
        COUNT(tblblog.Author) as written,
        tbladmin.FirstName");
        $this->db->from('tblblog');
        $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
        $this->db->where('tbladmin.Name',$author);
        $this->db->group_by('tbladmin.Name');
        $query = $this->db->get();
        return $query->result_array();                   
    }
    function edit_blog($id,$Author,$Date,$Title,$Subject,$Keywords,$Text,$Link,$about,$Lang)         
    {
        $data = array(
        'Author'=>$Author,
        'Date'=>$Date,
        'Title'=>$Title,                                          
        'Subject'=>$Subject,
        'Keywords'=>$Keywords,
        'Text'=>$Text,
        'Link'=>$Link,
        'About'=>$about,
        'Lang'=>$Lang       
        );
        $this->db->update('tblblog',$data,array('ID'=>$id));
    }
    function add_blog($Author,$Date,$Title,$Subject,$Keywords,$Text,$Link,$about,$Lang)
    {
        $data = array(
        'Author'=>$Author,
        'Date'=>$Date,
        'Title'=>$Title,                                          
        'Subject'=>$Subject,
        'Keywords'=>$Keywords,
        'Text'=>$Text,
        'Link'=>$Link,
        'CountView'=>0,
        'CountComment'=>0,
        'About'=>$about,
        'Lang'=>$Lang       
        );
        $this->db->insert('tblblog',$data);
        return TRUE; 
    }
    function is_blog_exist($Title)
    {
        try
        {
            $query = $this->db->get_where('tblblog', array('Title' => $Title));
            if($query->num_rows()>0)
            {
                return TRUE;
            }
            return FALSE;
        }
        catch(Exception $e)
        {
            return FALSE;
        }
    }
    function count_view($CountViewed,$title)
    {
        $data = array('CountView'=>$CountViewed);
        $this->db->update('tblblog',$data,array('Title'=>$title));    
    }
    function del_blog($id)
    {
        $this->db->delete('tblblog',array('ID'=>$id));
        $this->db->delete('tblcomment',array('Blog'=>$id));
        return TRUE;        
    }
    function search_blog($lg,$num,$offset,$Keywords)
    {
        try
        {
            $this->db->select("
            tblblog.ID,
            tblblog.Date,
            tblblog.Title,
            tblblog.Subject,
            tblblog.Text,
            tblblog.Link,
            tblblog.CountView,
            tblblog.Keywords,          
            tblblog.CountComment,
            tbladmin.Name");
            $this->db->from('tblblog');
            $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
            $this->db->like('Keywords',$Keywords,'both') ;                    
            $this->db->order_by("tblblog.Date", "desc");
            $this->db->where('tblblog.Lang ', $lg);
            $this->db->limit($num,$offset);
            $query_search = $this->db->get();
            if($query_search)
            {
                return $query_search;

            }
            return 0;            
        }
        catch(Exception $e)
        {
            return 0;
        }
    }    
    function search_blog_by_title($lg,$num,$offset,$Title)
    {
        try
        {
            $this->db->select("
            tblblog.ID,
            tblblog.Date,
            tblblog.Title,
            tblblog.Subject,
            tblblog.Text,
            tblblog.Link,
            tblblog.CountView,
            tblblog.Keywords,          
            tblblog.CountComment,
            tbladmin.Name");
            $this->db->from('tblblog');
            $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
            $this->db->like('Title',$Title,'both') ;                    
            $this->db->order_by("tblblog.Date", "desc");
            $this->db->where('tblblog.Lang ', $lg);
            $this->db->limit($num,$offset);
            $query_search = $this->db->get();
            if($query_search)
            {
                return $query_search;

            }
            return 0;            
        }
        catch(Exception $e)
        {
            return 0;
        }
    }    
    function search_blog_by_date($lg,$num,$offset,$Date)
    {
        try
        {
            $this->db->select("
            tblblog.ID,
            tblblog.Date,
            tblblog.Title,
            tblblog.Subject,
            tblblog.Text,
            tblblog.Link,
            tblblog.CountView,
            tblblog.Keywords,          
            tblblog.CountComment,
            tbladmin.Name");
            $this->db->from('tblblog');
            $this->db->join('tbladmin','tbladmin.ID = tblblog.Author');
            $this->db->where('Date',$Date) ;      
            $this->db->where('tblblog.Lang ', $lg);              
            $this->db->order_by("tblblog.Date", "desc");
            $this->db->limit($num,$offset);
            $query_search = $this->db->get();
            if($query_search)
            {
                return $query_search;

            }
            return 0;            
        }
        catch(Exception $e)
        {
            return 0;
        }
    }
    function count_record($Keywords)
    {
        $this->db->from('tblblog');
        $this->db->where(array('Keywords'=>$Keywords));
        $query = $this->db->count_all_results();
        return $query;
    }    
    function count_record_date($Date)
    {
        $this->db->from('tblblog');
        $this->db->where(array('Date'=>$Date));
        $query = $this->db->count_all_results();
        return $query;
    }    
    function count_record_blog($lg)
    {
        $this->db->from('tblblog');
        $this->db->where(array('Lang'=>$lg));
        $query = $this->db->count_all_results();
        return $query;
    }
    function count_record_blog_title($title)
    {
        $this->db->from('tblblog');
        $this->db->where(array('Title'=>$title));
        $query = $this->db->count_all_results();
        return $query;
    }
    function add_comment($Comment,$Blog,$Date,$Author,$Website,$Email,$Status,$CountComment)
    {        
        $data = array(
        'Comment'=>$Comment,
        'Blog'=>$Blog,
        'Date'=>$Date,                                          
        'Author'=>$Author,
        'Website'=>$Website,
        'Email'=>$Email,
        'Status'=>$Status);      
        $dataBlog = array('CountComment'=>$CountComment); 
        $this->db->update('tblblog',$dataBlog,array('ID'=>$Blog));
        $this->db->insert('tblcomment',$data);
        return TRUE;            
    }
    function show_comment($titletemp)
    {
        $this->db->select("
        tblcomment.ID,
        tblcomment.`Comment`,
        tblcomment.Blog,
        tblcomment.Date,
        tblcomment.Author,
        tblcomment.Website,
        tblcomment.Email,
        tblcomment.Status");
        $this->db->from('tblcomment');
        $this->db->join('tblblog','tblcomment.Blog = tblblog.ID');  
        $this->db->where('tblblog.Title', $titletemp);
        if($this->session->userdata('admin'))
        {
            $query = $this->db->get();
            return $query->result_array();     
        }else
        {
            $this->db->where('tblcomment.Status', 1);
            $query = $this->db->get();
            return $query->result_array(); 
        } 
    }    
    function show_comment_agree()
    {
        $this->db->select("
        tblcomment.ID,
        tblcomment.`Comment`,
        tblcomment.Blog,
        tblcomment.Date,
        tblcomment.Author,
        tblcomment.Website,
        tblcomment.Email,
        tblcomment.Status,
        tblblog.CountComment");
        $this->db->from('tblcomment');
        $this->db->join('tblblog','tblcomment.Blog = tblblog.ID');  
        $this->db->where('tblcomment.Status', 1);
        $query = $this->db->get();
        return $query->result_array(); 
    }
    function show_comment_not_agree()
    {
        $this->db->select("
        tblcomment.ID,
        tblcomment.`Comment`,
        tblcomment.Blog,
        tblcomment.Date,
        tblcomment.Author,
        tblcomment.Website,
        tblcomment.Email,
        tblcomment.Status,
        tblblog.CountComment");
        $this->db->from('tblcomment');
        $this->db->join('tblblog','tblcomment.Blog = tblblog.ID');  
        $this->db->where('tblcomment.Status', 0);
        $query = $this->db->get();
        return $query->result_array(); 
    }
    function update_comment($id,$Status,$CountComment,$idblog)
    {
        $dataBlog = array('CountComment'=>$CountComment); 
        $this->db->update('tblblog',$dataBlog,array('ID'=>$idblog));        
        $data = array('Status'=>$Status);
        $this->db->update('tblcomment',$data,array('ID'=>$id));    
    }   
    function del_comment($id,$CountComment,$idblog)
    {
        $dataBlog = array('CountComment'=>$CountComment); 
        $this->db->update('tblblog',$dataBlog,array('ID'=>$idblog));
        $this->db->delete('tblcomment',array('ID'=>$id));
        //        return TRUE;        
    }
    function count_comment($title)
    {
        $this->db->select("Count(tblcomment.ID) as mycount");
        $this->db->from('tblcomment');
        $this->db->join('tblblog','tblcomment.Blog = tblblog.ID');
        $this->db->where('tblblog.Title',$title);
        $this->db->group_by('tblcomment.Blog');
        $query = $this->db->get();
        return $query->result_array();    
    }
}
/* End of file mblog.php */
/* Location: ./system/application/controllers/mblog.php */
