<html>
<jsp:include page="../head.jsp"></jsp:include>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="panel-body">
      <div class="row">
          <div class="col-xs-8">
          	<div class="btn-group-vertical btn-grp">
              <button type="button" id="btnIssueSupplies" class="btn btn-info">SUPPLIES</button>
              <button type="button" id="btnHomeStock" class="btn btn-info">STOCKS</button>
              <button type="button" id="btn_reports" class="btn btn-info">REPORTS</button>
            </div>
          </div>
          <div class="col-xs-3">
          </div>
          <div class="col-xs-1"></div>
      </div>
    </div>
</body>
</html>

<script type="text/javascript">
function supplies(){
	var contextPath = "${pageContext.request.contextPath}";
	new Ajax.Request(contextPath+"/irserv",{
		method: "POST",
		parameters: {
			action: "issueSupplies"
		},
		onComplete: function(response){
			$('mainDiv').update(response.responseText);
		}
	});
}
$('btnIssueSupplies').observe("click", function(){
	alert('Loading Issue Supplies Maintenance Page');
	supplies();
});

function goStocks()
{	 
  var contextPath="${pageContext.request.contextPath}";
  new Ajax.Request(contextPath+'/action', {
    method: 'POST',
    parameters: 
    {
      action:"stock"
    },
   onComplete: function(response){
    $("mainDiv").update(response.responseText);
    }    
  });
}
$("btnHomeStock").observe("click",goStocks);



if('${Userlevel}' == "U"){
		$("btn_maintenance").writeAttribute("style", "display:none");
		$("btn_reports").writeAttribute("style", "display:none");
	}


	/* alert('${Username}'); */
</script>