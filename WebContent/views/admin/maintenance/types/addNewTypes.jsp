<div id = "addStmFormDiv" >
	<div class="panel panel-default">
     <div class="well well-sm">
          <h5><strong>SUPPLY TYPES MAINTENANCE</strong>
          <div class="pull-right">
          	<button class="btn btn-primary btn-sm btn-type" id = "btnCancelStm" style = "width: 100px;"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
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
                      <input class="form-control" type="text" id="txtSupplyTypeId" disabled = "disabled" value = "${supplyTypeId}">
                    </div>
                  </div>
                  <!-- SUPPLIER ID -->

                  <!-- SUPPLIER TYPE NAME --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Supplier Type Name:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtSupplyTypeName" style = "align: left;" value = "${supplyTypeName}">
                    </div>
                  </div>
                  <!-- SUPPLIER TYPE NAME -->
                  
                   <div class="pull-right">
                      <button class="btn btn-primary btn-type" id ="btnSaveStm"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
                   </div><br><br>
                 </div>
           </div>  
         <div class="col-xs-2"></div>
        </div>
	</div>
  </div>
</div>
<script type = "text/JavaScript">

	try{
		
		$("btnSaveStm").observe("click", validateInput);
		$("btnCancelStm").observe("click", cancelRec);
		$("txtSupplyTypeName").observe("keyup", onchange);
		
		function saveRec(){
			
			new Ajax.Request("${pageContext.request.contextPath}/SupplyTypesMnt", {
				method: "POST",
				parameters : {
					action : "saveNewType",
					supplyTypeName : $F("txtSupplyTypeName")
				},
				onComplete : function(response){
					var res = response.responseText;
					$("addStmFormDiv").update(res);
					$("btnSaveStm").writeAttribute("disabled", "disabled");
 					alert("Supply type added successfully.");  
					
				}
			}); 
			
		}
		
		function validateInput(){
			if($F("txtSupplyTypeName") == ""){
				alert("Please input a name for the supply type.");
			} else{
				validateTypeName();
			}
		}
		
		function validateTypeName(){
			
			new Ajax.Request("${pageContext.request.contextPath}/SupplyTypesMnt", {
				method: "POST",
				parameters : {
					action : "validateTypeName",
					supplyTypeName : $F("txtSupplyTypeName")
				},
				onComplete : function(response){
					var res = response.responseText;

					if (res.include("exists")){
						alert(res);
					}else{
						saveRec();
					}
				}
			});
		}
		
		function cancelRec(){

			new Ajax.Request("${pageContext.request.contextPath}/SupplyTypesMnt", {
				method: "POST",
				parameters : {
					action : "cancelNewType",
				},
				onComplete : function(response){
					var res = response.responseText;
					$("addStmFormDiv").update(res);
					
				}
			}); 
		}
		
		function onchange(){
			$("btnSaveStm").removeAttribute("disabled");
			$("txtSupplyTypeId").value = "";
		}
		
	}catch(e){
		alert("Error in addNewTypes.jsp" + e);
	}
</script>