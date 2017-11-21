<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="supplyDiv">
    <div class="panel panel-default">
     <div class="well well-sm">
          <h5><strong>SUPPLIES MAINTENANCE</strong>
          <div class="pull-right">
            <button class="btn btn-primary btn-sm btn-type" id ="btnAddNew"><i class="fa fa-1x fa-plus fa-fw"></i>&nbsp;Add New</button>
            <button class="btn btn-primary btn-sm btn-type" id ="btnCancelHome"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
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
                        <select id="selSupType" disabled="disabled" class="form-control">
                          <option></option>
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
                      <button class="btn btn-primary btn-type" id = "btnUpdate"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
                   </div><br><br>
                 </div>
           </div>  
         <div class="col-xs-2"></div>
        </div><br><br>
  </div>
 </div>
 <div class="panel panel-default">
     <div class="well well-sm">
          <h5><strong>LIST OF SUPPLIES</strong></h5>
      </div>
     <div class="row">
       <div class="col-xs-1"></div>
       <div class="col-xs-8">
        <div align="center"><br>
            <div class="form-group form-group-sm">
               <label class="col-sm-2 control-label" for="sm" style = "text-align: right;"><i class="fa fa-1x fa-search fa-fw"></i>Search</label>
                <div class="col-sm-4">
                   <input class="form-control" type="text" id="txtSearch" placeholder = "Search..">
                </div>
            </div><br>
            <div id="stmTblDiv" align = "center" class = "pre-scrollable" style="height: 300px;"> 
               <table class = "table-hover table-bordered" style = "width: 805px;">
                  <tr>
                    <th align="center">Supply Id</th>
                    <th align="center">Supply Type</th>
                    <th align="center">Item Name</th>
                    <th align="center">Item Unit</th>
                    <th align="center">Obsolete Tag</th>
                    <th align="center">Location</th>
                    <th align="center">Reorder Level</th>
                    <th align="center">Actual Count</th>
                    <th align="center">Remarks</th>
                    <th align="center">Entry Date</th>
                    <th align="center">Last Updated By</th>
                    <th align="center">Last Update</th>
                  </tr>
                  <c:forEach var="e" items="${supplyList}">
                    <tr class="rowList" id="${e.supplyId}">
                      <td align="center"><input type="button" class="btn-link" value="${e.supplyId}" id="rec${e.supplyId}"></td>
                      <td align="center">${e.supplyType}</td>
                      <td align="center">${e.itemName}</td>
                      <td align="center">${e.itemUnit}</td>
                      <td align="center">${e.obsoleteTag}</td>
                      <td align="center">${e.location}</td>
                      <td align="center">${e.reorderLevel}</td>
                      <td align="center">${e.actualCount}</td>
                      <td align="center">${e.remarks}</td>
                      <td align="center"><fmt:formatDate pattern="dd/MM/yy" value="${e.dateAdded}" /></td>
                      <td align="center">${e.lastUser}</td>
                      <td align="center"><fmt:formatDate pattern="dd/MM/yy" value="${e.lastUpdate}" /></td>
                    </tr>
                  </c:forEach>
               </table>
            </div>
           </div>
        </div>
        <div class="col-xs-1"></div>
     </div>
   </div>
  </div>
</body>
</html>

<script type="text/javascript">
 try{
   $("btnUpdate").setAttribute("disabled", "disabled");
   onClick();
   
   $("txtSearch").observe("keyup", function(){
     search();
   });
   
   function search(){
     var found = "";
     
     $$(".rowList").each(function(s){
       $(s.id).writeAttribute("style", "");
       
       for (var i = 0; i <= 11; i++) {
         if (i == 0){
           if($(s.id).id.include($F("txtSearch"))){
             found = "Y";
             break;
           }
         } else {
           if(s.down("td", i).innerHTML.toLowerCase().include($F("txtSearch").toLowerCase())){
             found = "Y";
             break;
           } else {
             found = "N";
           }
         }
       } 
       
       if(found == "N"){
         $(s.id).writeAttribute("style", "display:none");
       }
       
     });
   }
   
   function validateUpdate(){
    var emptyFields = false;
    var fields = "";
     
    $w("txtItemName txtItemUnit txtReorderLevel").each(function(validate){
      if($F(validate) == ""){
        fields = fields + " " + $(validate).name;
        emptyFields = true;
      }
    });
       
    if(!emptyFields){
      update();
    } else {
      alert("Field/s" + fields + " are required.");
    }
   }
   
   $("txtReorderLevel").observe("change", function(){
      checkNum();
   });
   
   function checkNum(){
    if(isNaN($F("txtReorderLevel"))){
      alert("Please input a valid number in the Reorder Level field.");
      $("txtReorderLevel").clear();
    }
   }
  
   var contextPath = "${pageContext.request.contextPath}";
   function addNew(){
     new Ajax.Request(contextPath + "/supmain", {
       method : "POST",
       parameters : {
         action : "addNew"
         
       },
       onComplete : function(response){
         $("supplyDiv").update(response.responseText);
       }
     });
   }
   
   $("btnAddNew").observe("click", function(){
     addNew();
   });
   
   function cancel(){
     new Ajax.Request(contextPath + "/supmain", {
       method : "POST",
       parameters : {
         action : "cancelHome"
       },
       onComplete : function(response){
         $("supplyDiv").update(response.responseText);
       }
     });
   }
   
   $("btnCancelHome").observe("click", function(){
     cancel();
   });
   
   var id;
   function onClick(){
     $$(".rowList").each(function(list){
      $("rec" + list.id).observe("click", function(){
        id = $F("rec" + list.id);
        $("selSupType").down().innerHTML = list.down(2).innerHTML;
        $("txtItemName").value = list.down(3).innerHTML;
        $("txtItemUnit").value = list.down(4).innerHTML;
         
        $$("input[name='obsTag']").each(function(rdo){
          if(rdo.value == list.down(5).innerHTML){
             rdo.checked = true;
          }
        });
               
        $("txtLocation").value = list.down(6).innerHTML;
        $("txtReorderLevel").value = list.down(7).innerHTML;
        $("txtRemarks").value = list.down(9).innerHTML;
        $("txtEnteredDate").value = list.down(10).innerHTML;
        $("btnUpdate").removeAttribute("disabled");
        $("btnAddNew").writeAttribute("disabled", "disabled");
      });
     });
    }
   
    var rdoButton = "";
    function getRdoValue(){
      $$("input[name='obsTag']").each(function(rdo){
        if(rdo.checked){
         rdoButton = rdo.value;
        }
      });
    } 
    
    function update(){
      new Ajax.Request(contextPath + "/supmain", {
        method : "POST", 
        parameters : {
          action : "update",
          supplyId : id,
          itemName : $F("txtItemName"),
          itemUnit : $F("txtItemUnit"),
          obsoleteTag : rdoButton,
          location : $F("txtLocation"),
          reorderLevel : $F("txtReorderLevel"),
          remarks : $F("txtRemarks")
        },
          onComplete : function(response){
            $("supplyDiv").update(response.responseText);
            alert("Updated Successfully!");
        }
      });
    }
    
    $("btnUpdate").observe("click", function(){
      getRdoValue();
      validateUpdate();
    });
 }catch(e){
   alert("supplies.jsp" + e);
 }
</script>