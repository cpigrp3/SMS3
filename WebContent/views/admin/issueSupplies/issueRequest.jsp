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
             <button class="btn btn-primary btn-sm btn-type" id ="btnIssueHome"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
           </div>
           </h5>
    </div>
    <div class="row">
       <div class="col-xs-2">
       </div>
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
                  <button class="btn btn-primary btn-type" id = "btnSaveRequest"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Request</button>
                  <p align = "center" style="color: red;">${message}</p>
               </div><br><br>
             </div>
       </div>
       <div class="col-xs-2">
       </div>
    </div>
  </div>
  </div>
  </body>
</html>
<script>
  try{
    
    function getItemName(){
      var iName = '';
      iName = $('selItemName').down($('selItemName').selectedIndex).innerHTML;
      return iName;
    }
    
    var contextPath = "${pageContext.request.contextPath}"; 
    var msg1='';
    
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
    
    
    function issueHome(){
      new Ajax.Request("${pageContext.request.contextPath}/irserv", {
        method: "POST",
        parameters: {
          action: "issueHome"
        }, 
        onComplete: function(response){
          $('mainDiv').update(response.responseText);
        }
      });
    } 
    
    $('btnIssueHome').observe("click", function(){
      alert('Loading issue supplies maintenance page');
      issueHome();
    });
    
    function saveRequest(){
      new Ajax.Request("${pageContext.request.contextPath}/irserv", {
        method: "POST",
        parameters: {
          action: "saveRequest",            
          itemName: getItemName(),
          supplyId: $F('selItemName'), 
          requestor: $F('txtRequestor'),
          quantity: $F('txtQuantity'),
          deptId: $F('selDeptName'), 
          lastUser: $F('txtRequestor')
        }, 
        onComplete: function(response){
          $('mainDiv').update(response.responseText);
        }
      });
    } 
    
    $('btnSaveRequest').observe("click", function(){
      var emptyFields = checkEmptyFields();
      if (emptyFields ==''){
        if (checkIfNan()=='NaN'){
          alert('Quantity field must contain a number!');
        }else{
          saveRequest();
        }
      }else{
        alert(emptyFields+"must not be empty... ")
      }
    });
  }catch(e){
    alert("issueRequest"+e);
  }
</script>