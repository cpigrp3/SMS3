<html>
<jsp:include page="head.jsp"></jsp:include>

<body>
	<div class="container-fluid"><br>
 	 <div class="panel panel-primary">
   	 <div id="mainDiv">
  		<!-- HEADER  -->
  		<div class="panel-heading">
	 	 <jsp:include page="headerLogin.jsp"></jsp:include>
	 </div>
   	<!-- END OF HEADER  -->
   	<!-- BODY -->
    <div class="panel-body">
      <div class="row">
          <div class="col-xs-8">
            
          </div>
          <div class="col-xs-3">
             <form action="login.php" method="post">
                  <fieldset>
                      <div class="form-group">
                          <input class="form-control" placeholder="Username" name="username" id="txtUsername" type="text" autofocus required>
                      	  
                      </div>
                      <div class="form-group">
                          <input class="form-control" placeholder="Password" name="password" id="txtPassword" type="password" value="" required>
                      </div>
                      
                       
                      <button type="button" name="login" id="btnLogin"  class="btn btn-lg btn-primary btn-block" required>LOG IN TO YOUR ACCOUNT</button>
                 	  <a class = "link" href="#">Forgot password?</a>
             
                  </fieldset>
              </form>
       	   </div>
        	  <div class="col-xs-1"></div>
  	    </div>
  	  </div>
  	  <!-- END OF BODY -->
  	  </div>
  	  <!-- FOOTER -->
		<jsp:include page="footer.jsp"></jsp:include>
 	   <!-- END OF FOOTER -->
 	 </div>
	</div>

</body>
</html>
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";

$("btnLogin").observe("click",login);
function checkSession() {
	new Ajax.Request(contextPath + "/action", {
		method : "POST",
		parameters : {
			action : "checkSession",
			userName : $F("txtUsername"),
			password : $F("txtPassword")
		},
		onComplete : function(response) {
			$("mainDiv").update(response.responseText);
		}
	});
	
}


if ('${chkSession}' != "Y") {
	checkSession();
}

function login()
{
	if($(txtUsername).value == "" || $(txtPassword).value == ""){
		$("txtUsername").clear();
		$("txtPassword").clear();
		swal(
				'Warning!',
				"Please fill up the required field",
				'warning'
		);
		return false;
	}else if($(txtPassword).value.length < 6){
		$("txtUsername").clear();
		$("txtPassword").clear();
		swal(
				'Warning!',
				"Your password must be at least\n6 characters long.\nPlease try again.",
				'warning'
				
		);
           return false;
	}else{
		
	
	var contextPath="${pageContext.request.contextPath}";
	new Ajax.Request(contextPath+'/action', {
		method: 'POST',
		parameters: 
		{
			action:"login",
			userName : $F("txtUsername"),
			password : $F("txtPassword")
	 	},
	 onComplete: function(response){
		$("mainDiv").update(response.responseText);
		swal(
				  'Congratulations!',
				  'You successfully login!',
				  'success'
				)
	  }    
	});
	}
}
//validation
 if ('${loginStat}' == "N") {
	 swal(
			 'Warning!',
			"The Account is inactive. Please contact the Administrator",
			'warning'
		);
} else if ('${loginStat}' == "L"){
	swal(
			'Oops...',
			"You have exceeded the 3 failed login attempt. Account locked.",
			'error'
			
	);
	
}else if ('${loginStat}' == "I"){
	swal(
			'Oops...',
			"Incorrect Username/Password",
			'error'
		);	
}



</script>

