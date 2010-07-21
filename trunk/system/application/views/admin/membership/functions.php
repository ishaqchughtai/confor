<style>

.listview
{
	width:300px;
	float:left;
}

.move_panel
{
	width:40px;
	float:left;
	padding:80px 10px 10px 10px;
}

.move_panel button
{
	width:20px;
	padding:5px;
	margin-left:10px;
}

.countLabel 
{
    color:Gray;
    font-style:italic;
}

.storageBox 
{
    display:none;
}

.copiedOption
{
    background-color:#51A60A;
	color:#fff;
}

</style>
<?php 
echo script('jQuery.dualListBox-1.2.min.js'); 


$function_options = array
(
	'table_name' => 'functions',
	'key_field' => 'id',
	'value_field' => 'function_name'
);	

$membership_options = array
(
	'table_name' => 'memberships',
	'key_field' => 'id',
	'value_field' => 'title',
	'order'=>'id ASC'
);	


$this->load->view("admin/membership/menu");
?>
    <script language="javascript" type="text/javascript">
        $(function() {
            $.configureBoxes({ transferMode: 'copy', useFilters: false, useCounters: false, sortBy:'value' });			
			reload_func_mem($('#function_select').val());
			$('#function_select').change(function()
			{
				$('#function_select :selected').each(function(i, selected){ 		
					reload_func_mem($('#function_select').val());
				});	
			});			
        });
		
		function reload_func_mem(functionId)
		{
			$.get(XEMMEX.baseUrl+'membership/mem_of_function_ajax/'+functionId, function(data){
			   //alert("Data Loaded: " + data);
				$("#box2View").html(data);

				$("#box1View option").each(function()
				{
					$(this).removeClass('copiedOption');
				});
				
				$("#box2View option").each(function()				
				{
					var fid = $(this).val();
					$("#box1View option").each(function()
					{
						//$(this).removeClass('copiedOption');
						if ($(this).val()==fid){
							$(this).addClass('copiedOption');
						}
					});
				});				   
			 });			
		}
		
		function save_function()
		{
			var memberships='';
			$("#box2View option").each(function()
			{
				if (memberships=='') {
					memberships += $(this).val();
				} else {
					memberships += ','+$(this).val();
				}
			});		
			var functionId = $('#function_select').val();
			
			$.ajax({
				type: "POST",
				url: XEMMEX.baseUrl+'membership/update_membership_ajax',
				data:{'function_id':functionId, 'memberships':memberships},
				success: function(data){
					if (data==0){
						alert('An error has been occured');
					}else{
						alert('Your function has been saved!');
					}
				}
			});						
		}
    </script>

<form>

<h4>Functions</h4>
<?php echo  form_dropdown('functions', dropdown_data($function_options),1, 'id="function_select" class="short"');?>	
<p>&nbsp;</p>

<div class="listview">
	<h4>Memberships available</h4>
	<?php echo  form_dropdown('memberships', dropdown_data($membership_options),1, 'id="box1View" multiple="multiple" style="height:200px;"');?>	
</div>
<div class="move_panel">	
	<button id="to2" type="button" class="icon_1_right_arrow">&nbsp;</button>
	<button id="to1" type="button" class="icon_1_left_arrow">&nbsp;</button>	
	<button id="allTo2" type="button" class="icon_2_right_arrow">&nbsp;</button>
	<button id="allTo1" type="button" class="icon_2_left_arrow">&nbsp;</button>	
</div>					
<div class="listview">	
	<h4>Memberships in this function</h4>
	<select id="box2View" multiple="multiple" style="height:200px;">
	</select>					
</div>
<div style="width:100%;height:1px;float:left"></div>
<input id="save_btn" name="submit" type="submit" class="submit" value="SAVE" onclick="save_function();return false;" />
<div class="divider"></div>
</form>