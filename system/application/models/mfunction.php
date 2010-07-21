<?php
class Mfunction extends Model{
	function Mfunction(){
		parent::Model();
		$this->load->database();
	}

    function empty_membership($function_id)
    {
		$this->db->where('function_id', $function_id);
		$this->db->delete('membership_functions');
    }	
	
	function add_membership_to_function($function_id, $memberships)
	{	
		$this->empty_membership($function_id);
		if (!$memberships) return TRUE;
		//$sql = "INSERT membership_functions(function_id,membership_id) select ?, memberships.id from memberships where memberships.id in (?)";
		//$binds = array($function_id, $memberships);
		$sql = "INSERT membership_functions(function_id,membership_id) select ".$function_id.", memberships.id from memberships where memberships.id in (".$memberships.")";
		if ($this->db->query($sql)) 
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	
	function get_memberships_of_function($function_id)
	{
		$this->db->select('membership_functions.membership_id, memberships.title');
		$this->db->where('membership_functions.function_id', $function_id);	
		$this->db->from('membership_functions');
		$this->db->join('memberships','memberships.id = membership_functions.membership_id');
		$query = $this->db->get();
		if ($query->num_rows()>0) 
		{
			$out = '';
			foreach ($query->result() as $item)
			{
				$out.= '<option value="'.$item->membership_id.'">';
				$out.= $item->title.'</option>';
			}
			return $out;
		}
		else 
		{
			return '0';			
		}			
	}
	
}
?>
