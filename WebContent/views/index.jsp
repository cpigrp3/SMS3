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
                          <input class="form-control" placeholder="Username" name="username" id="txtUsername" type="text" autofocus>
                      </div>
                      <div class="form-group">
                          <input class="form-control" placeholder="Password" name="password" id="txtPassword" type="password" value="">
                      </div>
                      <button type="button" name="login" id="btnLogin" class="btn btn-lg btn-primary btn-block">LOGIN TO YOUR ACCOUNT</button>
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
$("btnLogin").observe("click",login);
function login()
{
	var contextPath="${pageContext.request.contextPath}";
	new Ajax.Request(contextPath+'/action', {
		method: 'POST',
		parameters: 
		{
			action:"login"
	 	},
	 onComplete: function(response){
		$("mainDiv").update(response.responseText);
	  }    
	});
}
</script>
