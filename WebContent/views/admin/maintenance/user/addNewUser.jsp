<div id = "addUserDiv" >
	<div class="panel panel-default">
		<div class="well well-sm">
            <h5><strong><i class="fa fa-1x fa-user fa-fw"></i>ADD NEW USER</strong>
            <div class="pull-right">
            	<button class="btn btn-primary btn-type" id ="btnCancelAddUser"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
             </div>
             </h5>
        </div>
         <div class="row">
           <div class="col-xs-2"></div>
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
                    <label class="col-sm-4 control-label" for="sm">Middle Initial:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtMiddleInitial">
                    </div>
                  </div>
                  <!-- MIDDLE INITITAL --> 

                  <!-- EMAIL ADDRESS --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Email Address:</label>
                    <div class="col-sm-8">
                      <input class="form-control" type="text" id="txtEmail">
                    </div>
                  </div>
                  <!-- EMAIL ADDRESS -->
                  
                  <!-- ACCESS LEVEL -->  
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Access Level:</label>
                    <div class="col-sm-8">
                      <select class="form-control" id="selUserLevel">
                        <option>User</option>
                        <option>Admin</option>
                      </select>
                    </div>
                  </div>
                  <!-- ACCESS LEVEL --> 
				  
				  <!-- ACTIVE TAG --> 
                  <div class="form-group form-group-sm">
                    <label class="col-sm-4 control-label" for="sm">Active Tag:</label>
                    <div class="col-sm-">
                      <input type="radio" name="rdoTag" id="rdoActiveTag1" value="Y" checked="checked" class="custom-control-input">Yes
		                &nbsp;&nbsp;&nbsp;
		                <input type="radio" name="rdoTag" id="rdoActiveTag2" value="N"  class="custom-control-input">No
                    </div>
                  </div>
                  <!-- ACTIVE TAG -->
                  
                   <div class="pull-right">
                      <button class="btn btn-primary btn-type" id = "btnSave"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
                   </div><br><br>
                 </div>
           </div>
           <div class="col-xs-2"></div>
        </div>
	</div>
	</div>
</div>
<script type="text/javascript">
$("btnCancelAddUser").observe("click", cancelAddUser);
function cancelAddUser()
{
	new Ajax.Request("${pageContext.request.contextPath}/servUser", {
		method: "POST",
		parameters : 
		{
			action : "cancelAddUser",
		},
		onComplete : function(response){
			var res = response.responseText;
			$("addUserDiv").update(res);
			
		}
	}); 
}

var rdoButton = "";
function getRdoValue(){
	 $$("input[name='rdoTag']").each(function(rdo){
		 if(rdo.checked){
			 rdoButton = rdo.value;
		 }
	 });
}  


$("btnSave").observe("click", saveNewUser);
function saveNewUser()
{    
	getRdoValue();
    new Ajax.Request("${pageContext.request.contextPath}/servUser", {
       method: "POST",
       parameters : 
       {
          action: "saveNewUser",
          userId:$F("txtUserId"),
	   	  password:$F("txtPassword"),
	   	  firstName:$F("txtFirstName"),
	   	  lastName:$F("txtLastName"),
	   	  middleInitial:$F("txtMiddleInitial"),
	   	  email:$F("txtEmail"),
	   	  active:rdoButton,
	   	  accessLevel:$F("selUserLevel"),
	   	  lastUser:"HR"
       },
       onComplete : function(response){
    	  alert("User added successfully.");
          var res = response.responseText;
          $("stmMainDiv").update(res);
       }
    });
 }
 

</script>