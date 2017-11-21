
<html>
	<body>
		<h1>Error</h1>
		${message}
		<br><br>
		<input type="button" id="btnHome" value="HOME">
	</body>
</html>
<script>

		function home(){
			var contextPath = "${pageContext.request.contextPath}";
			new Ajax.Request(contextPath+"/irserv", {
				method: "POST", 
				parameters: {
					action: "cancel"
				}, 
				onComplete: function(response){
					$('mainDiv').update(response.responseText);
				}
			});
		}
		
		$('btnHome').observe("click",home);
	
</script>