<div class="btn-group-horizontal btn-grp">
   <button type="button" class="btn btn-danger" id="btnSideUser">USER</button>
   <button type="button" class="btn btn-info" id="btnSideTypes">SUPPLY TYPES</button>
   <button type="button" class="btn btn-info" id="btnSideSupplies">SUPPLIES</button>
 </div>
 
<script type="text/javascript">
$("btnSideSupplies").observe("click",clickSupplies);
function clickSupplies()
{
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath+'/action', {
    method: 'POST',
    parameters: 
    {
      action:"supplies"
    },
   onComplete: function(response){
    $("subDiv").update(response.responseText);
    }    
  });
};
$("btnSideUser").observe("click",clickUser);
function clickUser()
{
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath+'/action', {
    method: 'POST',
    parameters: 
    {
      action:"user"
    },
   onComplete: function(response){
    $("subDiv").update(response.responseText);
    }    
  });
};

$("btnSideTypes").observe("click",clickTypes);
function clickTypes()
{
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath+'/action', {
    method: 'POST',
    parameters: 
    {
      action:"types"
    },
   onComplete: function(response){
    $("subDiv").update(response.responseText);
    }    
  });
};
</script>