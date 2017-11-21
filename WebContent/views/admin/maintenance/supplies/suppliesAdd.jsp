<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="panel panel-default">
     <div class="well well-sm">
          <h5><strong>SUPPLIES MAINTENANCE</strong>
          <div class="pull-right">
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
                    <label class="col-sm-4 control-label" for="sm">Supply Type :</label>
                    <div class="col-sm-8">
                       <select id="selSupType" class="form-control">
							<c:forEach var="i" items="${supplyName}">
								<option value="${i.supplyTypeId}">${i.supplyType}</option>
					 		</c:forEach>
						</select>
                    </div>
                  </div>
                  <!-- SUPPLIER ID -->

                  <!-- SUPPLIER TYPE NAME --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Item Name:</label>
                    <div class="col-sm-8">
                      <input type="text" id="txtItemName" name="Item Name" class="form-control">
                    </div>
                  </div>
                  <!-- SUPPLIER TYPE NAME -->

                   <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Item Unit:</label>
                    <div class="col-sm-8">
                      <input type="text" id="txtItemUnit" name="Item Unit" class="form-control">
                    </div>
                  </div>

                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Obselete Tag:</label>
                    <div class="col-sm-">
                      <input type="radio" name="obsTag" id="rdoObsoleteTag1" value="Y" class="custom-control-input">Yes
                &nbsp;&nbsp;&nbsp;
                <input type="radio" name="obsTag" id="rdoObsoleteTag2" value="N" checked="checked" class="custom-control-input">No
                    </div>
                  </div>
          
          <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Location:</label>
                    <div class="col-sm-8">
                      <input type="text" id="txtLocation" class="form-control">
                    </div>
                  </div>

                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Entered Date:</label>
                    <div class="col-sm-8">
                      <input type="text" id="txtEnteredDate" disabled="disabled" class="form-control">
                    </div>
                  </div>

                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Reorder Level:</label>
                    <div class="col-sm-8">
                      <input type="text" id="txtReorderLevel" name="Reorder Level" class="form-control">
                    </div>
                  </div>

                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Remarks:</label>
                    <div class="col-sm-8">
                      <textarea rows="3" cols="30" id="txtRemarks" style="resize: none;" class="form-control"></textarea>
                    </div>
                  </div>

                   <div class="pull-right">
                      <button class="btn btn-primary btn-type" id = "btnSave"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
                   </div><br><br>
                 </div>
           </div>  
         <div class="col-xs-2"></div>
        </div>
  </div>
 </div>
</body>
</html>

<script type="text/javascript">
try{
	
	 $("txtReorderLevel").observe("change", function(){
		 checkNum();
	 });
	
	 var rdoButton = "";
	 function getRdoValue(){
		 $$("input[name='obsTag']").each(function(rdo){
			 if(rdo.checked){
				 rdoButton = rdo.value;
			 }
		 });
	 } 
	 
	 var contextPath = "${pageContext.request.contextPath}";
	 function save(){
		 new Ajax.Request(contextPath + "/supmain", {
			 method : "POST",
			 parameters : {
				 action : "save",
				 supplyTypeId : $F("selSupType"),
				 itemName : $F("txtItemName"),
				 reorderLevel : $F("txtReorderLevel"),
				 itemUnit : $F("txtItemUnit"),
				 remarks : $F("txtRemarks"),
				 obsoleteTag : rdoButton,
				 location : $F("txtLocation")
				   
			 },
			 onComplete : function(response){
				 $("supplyDiv").update(response.responseText);
				 alert("Saved Successfully!");
			 }
		 });
	 }
	 
	 function validateAdd(){
		var emptyFields = false;
		var fields = "";
		 
		$w("txtItemName txtItemUnit txtReorderLevel").each(function(validate){
			if($F(validate) == ""){
				fields = fields + " " + $(validate).name;
				emptyFields = true;
			}
		});
		 
		if(!emptyFields){
			save();
		} else {
			alert("Field/s" + fields + " are required.");
		}
	 }
	 
	 function checkNum(){
		if(isNaN($F("txtReorderLevel"))){
			alert("Please input a valid number in the Reorder Level field.");
			$("txtReorderLevel").clear();
		} 
	 }
	 
	 $("btnSave").observe("click", function(){
		getRdoValue();
		validateAdd();
	 });
	 
	 function cancel(){
		new Ajax.Request(contextPath + "/supmain", {
			 method : "POST",
			 parameters : {
				 action : "cancel"
			 },
			 onComplete : function(response){
				 $("supplyDiv").update(response.responseText);
			 }
		});
	 }
	 
	 $("btnCancel").observe("click", function(){
		 cancel();
	 });
 }catch(e){
	 alert("supplies.jsp" + e);
 }
</script>