<div class="panel panel-primary">
   <!-- HEADER -->
   <div class="panel-heading">
   	 <img alt="" src="image/cpi_logo.png" style="height:60px;width:170px;">
     <button class="btn btn-info navbar-menu-btn" id="btnHome"><i class="fa fa-3x fa-home fa-fw"></i><br></button>
     <button class="btn btn-info navbar-menu-btn" id="btnMaintenance"><i class="fa fa-2x fa-cogs fa-fw"></i><br>MAINTENANCE</button>
     <button class="btn btn-info navbar-menu-btn" id="btnSupplies">
     <i class="fa fa-2x fa-archive fa-fw"></i><br>ISSUE SUPPLIES</button>
     <button class="btn btn-info navbar-menu-btn" id="btnStocks"><i class="fa fa-2x fa-archive fa-fw"></i><i class="fa fa-2x fa-archive fa-fw"></i><i class="fa fa-2x fa-archive fa-fw"></i><br>ADD STOCKS</button>
     <button class="btn btn-info navbar-menu-btn" id="btnReports">
     <i class="fa fa-2x fa-file-text fa-fw"></i><br>REPORTS</button>
     <div class="pull-right"><br>
       <div class="dropdown">
         <button class="btn btn-danger dropdown-toggle" type="button" data-toggle="dropdown">
         <i class="fa fa-1x fa-user fa-fw"></i>&nbsp;${Username}
         <span class="caret"></span></button>
         <ul class="dropdown-menu">
           <li id="logout"><a href=""><i class="fa fa-1x fa-signout fa-fw"></i>Logout</a></li>
         </ul>
       </div> 
     </div>
   </div>
 <!-- END OF HEADER -->
</div>
<script type="text/javascript">
$("btnHome").observe("click",clickHome);
$("btnMaintenance").observe("click",clickMaintenance);
$("btnSupplies").observe("click",clickSupplies);
$("btnStocks").observe("click",clickStock);
function clickHome()
{
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath+'/action', {
    method: 'POST',
    parameters: 
    {
      action:"home"
    },
   onComplete: function(response){
    $("mainDiv").update(response.responseText);
    }    
  });
}
function clickMaintenance()
{
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath+'/action', {
    method: 'POST',
    parameters: 
    {
      action:"maintenance"
    },
   onComplete: function(response){
    $("mainDiv").update(response.responseText);
    }    
  });
}
function clickSupplies()
{
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath+'/action', {
    method: 'POST',
    parameters: 
    {
      action:"issue"
    },
   onComplete: function(response){
    $("mainDiv").update(response.responseText);
    }    
  });
}
function clickStock()
{
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath + '/stocks', {
		method : 'POST',
		parameters : {
			action : "goinsert",
			returnScreen: "home"
		},
		onComplete : function(response) {
			$("mainDiv").update(response.responseText);
		}
	}); 
}
if('${Userlevel}' == "U"){
	$("btnMaintenance").writeAttribute("style", "display:none");
	$("btnReports").writeAttribute("style", "display:none");
}
 $("logout").observe("click", function(e){
	 
		 delSession();

	/*  e.preventDefault()
	    swal({
			title : "",
			text : "Are you sure you want to logout?",
	        type : "warning",
	        showCancelButton: true,
	        confirmButtonText: "Yes",
	   },
	function(isConfirm){
	  if (isConfirm) {
		  window.location="views/index.jsp";
	    alert("Press Yes");
	  } else {
		    alert("Cancelled");
	  }
	 }) */
 });
 
 function delSession() {
		new Ajax.Request("${pageContext.request.contextPath}/action", {
			method : "GET",
			parameters : {
				action : "delSession"
			},
			onComplete : function(response) {
				$("mainDiv").update(response.responseText);
				
			}
		});
		
	} 
 

</script>