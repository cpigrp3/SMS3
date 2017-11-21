<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="panel-body">
		<div class="panel panel-default">
		<div class="well well-sm">
            <h5><strong>ISSUE SUPPLIES</strong>
            <div class="pull-right">
               <button class="btn btn-primary btn-sm btn-type" id="btnAddStock"><i class="fa fa-1x fa-plus fa-fw"></i>&nbsp;Issue Request</button>
               <button class="btn btn-primary btn-sm btn-type" id ="btnCancel"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
             </div>
             </h5>
        </div>
       	<div class="row">
	       <div class="col-xs-2"></div>
	       <div class="col-xs-6">
	          <div class="form-horizontal">
	           <div align="center">
	              <input type="text" class="form-control" id="txtStockId" style="display: none" />
	              <!-- ITEM NAME -->  
	              <div class="form-group form-group-sm">
	                <label class="col-sm-4 control-label" for="sm">Item Name:</label>
	                <div class="col-sm-8">
	                  <select id="selItemName" class="form-control">
	                    <c:forEach var="i" items="${itemNameList}">
	                      <option value="${i.supplyId}">${i.itemName}</option>
	                    </c:forEach>
	                  </select>
	                </div>
	              </div>
	              <!-- ITEM NAME -->  


	               <!-- USER ID -->
	               <div class="form-group form-group-sm">
	                <label class="col-sm-4 control-label" for="sm">Quantity:</label>
	                <div class="col-sm-8">
	                  <input type="text" id="txtQuantity" class="form-control">
	                </div>
	              </div>
	              <!-- USER ID -->

	              <!-- PASSWORD --> 
	              <div class="form-group form-group-sm">
	                <label class="col-sm-4 control-label" for="sm">Requested By:</label>
	                <div class="col-sm-8">
	                  <input type="text" id="txtRequestor" disabled="disabled" value="${lastUser}" class="form-control">
	                </div>
	              </div>
	              <!-- PASSWORD --> 

	              <!-- FIRSTNAME --> 
	              <div class="form-group form-group-sm">
	                <label class="col-sm-4 control-label" for="sm">Department Name:</label>
	                <div class="col-sm-8">
	                  <select id="selDeptName" class="form-control">
	                    <c:forEach var="e" items="${deptNameList}">
	                      <option value="${e.deptId}">${e.deptName}</option>
	                    </c:forEach>
	                  </select>
	                </div>
	              </div>
	              <!-- FIRSTNAME --> 

	              <!-- LASTNAME --> 
	              <div class="form-group form-group-sm">
	                <label class="col-sm-4 control-label" for="sm">Issue Date:</label>
	                <div class="col-sm-8">
	                  <input type="text" id="txtIssueDate" disabled="disabled" value="${dateToday}" class="form-control">
	                </div>
	              </div>
	              <!-- LASTNAME --> 
	               <div class="pull-right">
	                  <input type="hidden"  value="Issue Request" style="width: 150px;">
	                  <button class="btn btn-primary btn-type" id = "btnIssueReq"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Issue Request</button>
	                  <button class="btn btn-primary btn-type" id = "btnSave"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
	                  <p align = "center" style="color: red;">${message}</p>
	               </div><br><br>
	             </div>
	       </div>
	       <div class="col-xs-2">
	       </div>
	    </div>
	  </div> 	
        </div>
        <div class="panel panel-default">
    <div class="well well-sm">
      <h5><strong>LIST OF ISSUED SUPPLIES</strong></h5>
    </div>
    <div class="row">
           <div class="col-xs-12">
            <div align="center"><br>
                <div class="form-group form-group-sm">
                   <label class="col-sm-2 control-label" for="sm" style = "text-align: right;"><i class="fa fa-1x fa-search fa-fw"></i>Search</label>
                    <div class="col-sm-4">
                       <input class="form-control" type="text" id="txtSearch" placeholder = "Search..">
                    </div>
                </div><br>
                <div id="stmTblDiv" align="center"  class="pre-scrollable" style="height: 400px;">
                  <table class="table-hover table-bordered"
                    style="margin: 15px 0px 0px 0px; width: 1200px;">

                    <tr class="tblheader">
                      <th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width:  70px; text-align: center;">Issue Id</th>
							<th align="center" style="width:  0px; visibility: hidden; "></th>
							<th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width: 150px; text-align: center;">Item Name</th>
							<th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width:  70px; text-align: center;">Quantity</th>
							<th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width: 150px; text-align: center;">Requested By</th>
							<th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width: 150px; text-align: center;">Department Name</th>
							<th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width: 150px; text-align: center;">Issue Date</th>
							<th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width: 150px; text-align: center;">Last Updated By</th>
							<th align="center" style="font-size: 15px; background-color: #36bec9; color: #eeeeee; padding-top: 5px; padding-bottom: 5px; width: 150px; text-align: center;">Last Update</th>
                    </tr>
                    <c:forEach var="x" items="${issuedSuppliesList}">
                      <tr class="stocksRec" id="${x.issuedId}">
                      	<td align ="center" style="font-size: 12px;"><input type="button" class="btn-link" id= "rec${x.issuedId}" value="${x.issuedId}" > </td>
						<td align ="center" style="visibility: hidden; width: 0px"><input id="sI" type="hidden" value="${x.supplyId}"></td>
						<td align ="center" style="font-size: 12px;">${x.itemName}</td>
						<td align ="center" style="font-size: 12px;">${x.quantity}</td>
						<td align ="center" style="font-size: 12px;">${x.requestor}</td>
						<td align ="center" style="font-size: 12px;">${x.deptName}</td>
						<td align ="center" style="font-size: 12px;"><fmt:formatDate pattern="MM/dd/yyyy" value="${x.issueDate}"/></td>
						<td align ="center" style="font-size: 12px;">${x.lastUser}</td>
						<td align ="center" style="font-size: 12px;"><fmt:formatDate pattern="MM/dd/yyyy" value="${x.lastUpdate}"/></td>
                      </tr>
                    </c:forEach>
                  </table>
                </div>
               </div>
            </div>
          </div>
	</div>
    </div>
	
	</body>
</html>
<script>
	try{
		onClick();
		
		var contextPath = "${pageContext.request.contextPath}";	
		var msg1='';
		var issID;
		
		function getItemName(){
			var iName = '';
			iName = $('selItemName').down($('selItemName').selectedIndex).innerHTML;
			return iName;
		}
		
		function checkIfNan(){
			var msg = '';
			if(isNaN($('txtQuantity').value)){
				 msg = 'NaN';
			}
			return msg;
		}
		
		function checkEmptyFields(){
			var emptyFields = '';
			if ($('txtQuantity').value==""){
				emptyFields='Quantity field ';
			}
			return emptyFields;
		}
		
		function cancel(){
			new Ajax.Request(contextPath+"/irserv",{
				method: "POST", 
				parameters: {
					action: "cancel"
				}, 
				onComplete : function(response){
					$('mainDiv').update(response.responseText);
				}
			});
		}
		
		function issueRequest(){
			new Ajax.Request(contextPath+"/irserv", {
				method: "POST",
				parameters: {
					action: "issueRequest",
					itemName: getItemName(),
					supplyId: $F('selItemName'), 
					requestor: $F('txtRequestor'),
					quantity: $F('txtQuantity'),
					deptId: $F('selDeptName') 
				}, 
				onComplete: function(response){
					$('mainDiv').update(response.responseText);
				}
			});
		} 
		$('btnIssueReq').observe("click", issueRequest);

		
		$('btnCancel').observe("click", function(){
			alert('Loading home page.');
			cancel();
		});
		
		function searchRecords(){
			var found = '';
			$$('.rowList').each(function(tr){
				$(tr.id).writeAttribute("style", "");
				
				for(var i=0; i<9; i++){
					if(i==0){
						if($(tr.id).id.include($F('txtSearch'))){
							found = 'Y';
							break;
						}
					}else{
						if(tr.down("td", i).innerHTML.toLowerCase().include($F('txtSearch').toLowerCase())){
							found = 'Y';
							break;
						}else{
							found = 'N';
						}
					}
				}
				
				if (found =='N'){
					$(tr.id).writeAttribute("style", "display: none");
				}
			});
		}
		
		$('txtSearch').observe("keyup", function(){
			searchRecords();
		});
		
		
		function onClick(){
			$$('.rowList').each(function(tr){
				$('rec'+tr.id).observe("click", function (){
					issID = $F('rec'+tr.id);
					$('selItemName').down().innerHTML = tr.down(4).innerHTML;
					$('sI').value = tr.down(2).down().value;
					$('txtQuantity').value = tr.down(5).innerHTML;
					$('txtRequestor').value = tr.down(6).innerHTML;
					$('selDeptName').down().innerHTML = tr.down(7).innerHTML;
					$('txtIssueDate').value = tr.down(8).innerHTML;
					changeState();
				});
			});
			
		}
		
		function changeState(){
			$('btnSave').removeAttribute("disabled");
			$('btnIssueReq').setAttribute("disabled", "disabled");
			$('selItemName').writeAttribute("disabled", "disabled");
		}
		
		function updateRequest(){
			new Ajax.Request(contextPath+"/irserv", {
				method: "POST",
				parameters: {
					action: "updateRecord",
					itemName: getItemName(),
					issueId: issID,
					supplyId: $('sI').value,
					quantity: $F('txtQuantity')
				}, 
				onComplete: function(response){
					$('mainDiv').update(response.responseText);
				}
			});
		}
		
		$('btnSave').observe("click", function(){
			alert('Update successful!!!');
			updateRequest();
		});
		
	}catch(e){
		alert('issueSupplies.jsp'+e);
	}
</script>