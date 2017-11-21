<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id ="stmMainDiv">
	<div class="panel panel-default">
     <div class="well well-sm">
          <h5><strong>SUPPLY TYPES MAINTENANCE</strong>
          <div class="pull-right">
          	<button class="btn btn-primary btn-sm btn-type" id ="btnAdd"><i class="fa fa-1x fa-plus fa-fw"></i>&nbsp;Add New</button>
          	<button class="btn btn-primary btn-sm btn-type" id ="btnCancel"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
           </div>
           </h5>
      </div>
      <div class="row">
         <div class="col-xs-2"></div>
         <div class="col-xs-6">
              <div class="form-horizontal">
               <div align="center">
                   <!-- SUPPLIER ID -->
                   <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Supplier Type ID:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtSupplyTypeId" disabled="disabled">
                    </div>
                  </div>
                  <!-- SUPPLIER ID -->

                  <!-- SUPPLIER TYPE NAME --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Supplier Type Name:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtSupplyTypeName" style = "align: left;">
                    </div>
                  </div>
                  <!-- SUPPLIER TYPE NAME -->
                  
                   <div class="pull-right">
                      <button class="btn btn-primary btn-type" id = "btnSave"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
                   </div><br><br>
                 </div>
           </div>  
         <div class="col-xs-2"></div>
        </div>
	</div>
  </div>
  <div class="panel panel-default">
  	 <div class="well well-sm">
          <h5><strong>LIST OF SUPPLY TYPES</strong></h5>
      </div>
     <div class="row">
           <div class="col-xs-2"></div>
           <div class="col-xs-8">
            <div align="center"><br>
                <div class="form-group form-group-sm">
                   <label class="col-sm-2 control-label" for="sm" style = "text-align: right;"><i class="fa fa-1x fa-search fa-fw"></i>Search</label>
                    <div class="col-sm-4">
                       <input class="form-control" type="text" id="txtSearch" placeholder = "Search..">
                    </div>
                </div><br>
                <div id="stmTblDiv" align = "center" class = "pre-scrollable" style="height: 300px;"> 
                   <table class = "table-hover table-bordered" style = "width: 750px;">
                      <tr>
                         <th><h6><strong><center>USER ID</center></strong></h6></th>
                         <th>Supply Type Name</th>
                         <th>Entry Date</th>
                         <th>Last Updated By</th>
                         <th>Last Update</th>
                      </tr>
                      <c:forEach var = "x" items = "${supplyTypesList}">
                         <tr class = "stmRec" id = "${x.id}">
                            <td><input type = "button" value = "${x.id}" class = "btn-link" id = "rec${x.id}"/></td>
                            <td>${x.name}</td>
                            <td class = "align-right">${x.entryDate}</td>
                            <td>${x.lastUser}</td>
                            <td class= "align-right">${x.lastUpdate}</td>
                         </tr>
                      </c:forEach>
                   </table>
                </div>
               </div>
            </div>
            <div class="col-xs-2"></div>
      </div><br><br>
</div>
</div>
</body>
</html>
<script type = "text/JavaScript">
	try{ 
		clickId();
		
		$("btnAdd").observe("click", addRec); 
		$("btnSave").observe("click", validate);
		$("btnCancel").observe("click", cancel);
		$("txtSearch").observe("keyup", search);  

		function addRec(){
			
			new Ajax.Request("${pageContext.request.contextPath}/SupplyTypesMnt", {
				method: "POST",
				parameters : {
					action: "add"
				},
				onComplete : function(response){
					var res = response.responseText;
					$("stmMainDiv").update(res);
				}
			});
		}
	
		function updateRec(){
			
			new Ajax.Request("${pageContext.request.contextPath}/SupplyTypesMnt", {
				method: "POST",
				parameters : {
					action : "update",
					supplyTypeId : $F("txtSupplyTypeId"),
					supplyTypeName : $F("txtSupplyTypeName")
				},
				onComplete : function(response){
					var res = response.responseText;
					alert("Record updated successfully");
					$("stmMainDiv").update(res);
				}
			});
		}
		
		function cancel(){
			$("txtSupplyTypeId").value = "";
			$("txtSupplyTypeName").value = "";
		}
		
		function validate(){
			
			if ($F(txtSupplyTypeId) == "" || $F(txtSupplyTypeName) == ""){
				alert("Please select a record first to update.");
			}else{
				updateRec();
			}
		}
		
		function search(){
			
			var match = ""; 
			
			$$(".stmRec").each(function(x){
				$(x.id).writeAttribute("style", "");
				
				for(var i = 0; i <= 4 ; i++){
					
					if (i == 0 ){
						if($(x.id).id.include($F("txtSearch"))){
							match = "Y";
							break;
						}
					}else{
						if (x.down("td", i).innerHTML.toLowerCase().include($F("txtSearch").toLowerCase())){
							match = "Y";
							break;
						}else{
							match = "N";
						}	
					}					
				}
				
				if (match == "N"){
					$(x.id).writeAttribute("style", "display:none;");
				}
			});
		} 
		
		function clickId(){
			
			$$(".stmRec").each(function(y){
				$("rec" + y.id).observe("click", function(){
					$("txtSupplyTypeId").value = y.id;
					$("txtSupplyTypeName").value = y.down("td",1).innerHTML;
				});
			});
		}
	
	}catch(e){
		alert("Error in types.jsp " + e);
	}  
	
</script>