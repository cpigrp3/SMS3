<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="userMaintenanceDiv">
  <div class="panel panel-default">
    <div class="well well-sm">
            <h5><strong>USER MAINTENANCE</strong>
            <div class="pull-right">
              <button class="btn btn-primary btn-sm btn-type" id ="btnAddUser"><i class="fa fa-1x fa-plus fa-fw"></i>&nbsp;Add New</button>
                <button class="btn btn-primary btn-sm btn-type" id ="btnCancel"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
             </div>
             </h5>
        </div>
         <div class="row">
           <div class="col-xs-2">
           </div>
           <div class="col-xs-6">
              <div class="form-horizontal">
               <div align="center">
                   <!-- USER ID -->
                   <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">User ID:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtUserId">
                    </div>
                  </div>
                  <!-- USER ID -->

                  <!-- PASSWORD --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Password:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtPassword">
                    </div>
                  </div>
                  <!-- PASSWORD --> 

                  <!-- FIRSTNAME --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">First Name:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtFirstName">
                    </div>
                  </div>
                  <!-- FIRSTNAME --> 

                  <!-- LASTNAME --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Last Name:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtLastName">
                    </div>
                  </div>
                  <!-- LASTNAME --> 

                  <!-- MIDDLE INITIAL --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Middle Initial</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtMiddleInitial">
                    </div>
                  </div>
                  <!-- MIDDLE INITITAL --> 

                  <!-- EMAIL ADDRESS --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Email Address</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtEmail">
                    </div>
                  </div>
                  <!-- EMAIL ADDRESS --> 

                  <!-- ACTIVE TAG --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Active Tag</label>
                    <div class="col-sm-2">
                      <label class="col-sm-3 control-label" for="sm">YES</label>
                      <div class="col-sm-3">
                        <input type="radio" id="rdoTag" value="Y">
                      </div>
                      <label class="col-sm-3 control-label" for="sm">NO</label>
                      <div class="col-sm-3">
                        
                      </div>
                    </div>
                  </div>
                  <!-- ACTIVE TAG -->

                  <!-- ACCESS LEVEL -->  
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Access Level</label>
                    <div class="col-sm-4">
                      <select class="form-control">
                        <option>User</option>
                        <option>Admin</option>
                      </select>
                    </div>
                  </div>
                  <!-- ACCESS LEVEL --> 

                   <div class="pull-right">
                      <button class="btn btn-primary btn-type" id = "btnSave"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
                   </div><br><br>
                 </div>
           </div>
           <div class="col-xs-2">
           </div>
        </div>
  </div>
  </div>
</div>
 <div class="panel panel-default">
    <div class="well well-sm">
      <h5><strong>LIST OF USERS</strong></h5>
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
          </div>
</div>

<script type="text/javascript">
 try{
   var contextPath = "${pageContext.request.contextPath}";
   
   function addNew(){
     new Ajax.Request(contextPath + "/servUser", {
       method : "POST",
       parameters : {
         action : "addNewUser"
         
       },
       onComplete : function(response){
         $("userMaintenanceDiv").update(response.responseText);
       }
     });
   }
   
   $("btnAddUser").observe("click", function(){
     addNew();
   });
   

 }catch(e){
   alert("supplies.jsp" + e);
 }
</script>