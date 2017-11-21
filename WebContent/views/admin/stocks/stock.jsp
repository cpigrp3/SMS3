<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="panel-body">
		<div class="panel panel-default">
			<div class="well well-sm">
		        <h5><strong>STOCKS</strong>
		        <div class="pull-right">
		           <button class="btn btn-primary btn-sm btn-type" id="btnAddStock"><i class="fa fa-1x fa-plus fa-fw"></i>&nbsp;Add Stocks</button>
		           <button class="btn btn-primary btn-sm btn-type" id ="btnCancel"><i class="fa fa-1x fa-close fa-fw"></i>&nbsp;Cancel</button>
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
			           <input type="text" class="form-control" id="txtStockId" style="display: none" />
			            <label class="col-sm-4 control-label" for="sm">Item Name:</label>
			            <div class="col-sm-8">
			            	<select id="selItemName" class="form-control" name="itemName" disabled="disabled">
								<option></option>
								<c:forEach var="i" items="${itemList}">
									<option value="${i.suppId}"><c:out
											value="${i.itemName}" /></option>
								</c:forEach>
							</select>
			            </div>
			           </div>
			           <!-- USER ID -->

			           <!-- USER ID -->
			           <div class="form-group form-group-sm">
			            <label class="col-sm-4 control-label" for="sm">Quantity:</label>
			            <div class="col-sm-8">
			              <input type="text" id="txtQuantity" class="form-control">
			            </div>
			           </div>
			           <!-- USER ID -->

			           <!-- USER ID -->
			           <div class="form-group form-group-sm">
			            <label class="col-sm-4 control-label" for="sm">Reference Number:</label>
			            <div class="col-sm-8">
			              <td><input type="text" class="form-control" id="txtReference" /></td>
			            </div>
			           </div>
			           <!-- USER ID -->

			           <!-- USER ID -->
			           <div class="form-group form-group-sm">
			            <label class="col-sm-4 control-label" for="sm">Date Added:</label>
			            <div class="col-sm-8">
			              <input type="date" class="form-control" id="txtDateAdded" />
			            </div>
			           </div>
			           <!-- USER ID -->

			           <!-- USER ID -->
			           <div class="form-group form-group-sm">
			            <label class="col-sm-4 control-label" for="sm">Purchase Date:</label>
			            <div class="col-sm-8">
			              <input type="date" class="form-control" id="txtPurchase" />
			            </div>
			           </div>
			           <!-- USER ID -->
			           
			           <div class="pull-right">
	                      <button class="btn btn-primary btn-type" id = "btnSave"><i class="fa fa-1x fa-save fa-fw"></i>&nbsp;Save</button>
	                   </div>
		           </div>
	           </div><br><br>
	        </div>
	        <div class="col-xs-2"></div>
			</div>
		</div>
	</div>
	
	<div class="panel-body" id="stmTblDiv">
		<div class="panel panel-default">
			<div class="well well-sm">
		        <h5><strong>LIST OF STOCKS</strong></h5>
		    </div>
		    <div class="row">
           <div class="col-xs-12">
           <table>
				<tr id="trSearch"> 
				    <td style="width: 50px;"></td>
					<td><b><i class="fa fa-1x fa-search fa-fw"></i>Search :</b>&nbsp;</td>
					<td><input type="text" class="form-control" id="txtSearch"
						placeholder="Search.." /></td>
				</tr>
			</table>
            <div align="center">
               <div  align="center"  class="pre-scrollable" style="height: 400px;">
				<table class="table-hover table-bordered" style="margin: 15px 0px 0px 0px; width: 1200px;">

						<tr class="tblheader">
							<th width="100px" align="center">Stock ID</th>
							<th width="200px" align="center">Item Name</th>
							<th width="50px" align="center">Qty</th>
							<th width="150px" align="center">Reference No.</th>
							<th width="150px" align="center">Date Added</th>
							<th width="150px" align="center">Purchase Date</th>
							<th width="150px" align="center">Last Updated By</th>
							<th width="150px" align="center">Last Update</th>
						</tr>
						<c:forEach var="x" items="${stocksList}">
							<tr class="stocksRec" id="${x.stockId}">
								<td><input type="button" value="${x.stockId}"
									class="btnStmId btn-link" id="rec${x.stockId}" /></td>
								<td class="align-left">${x.itemName}</td>
								<td class="align-right">${x.quantity}</td>
								<td class="align-left">${x.refNo}</td>
								<td class="align-right">${x.dateAdd}</td>
								<td class="align-right">${x.purDate}</td>
								<td class="align-left">${x.updateBy}</td>
								<td class="align-right">${x.updateLast}</td>
								<td style="display: none;">${x.suppId}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
            </div>
            </div>
          </div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	clickId();
	checkDisplay();
	showResult();
	function goInsertPage() {
	new Ajax.Request(contextPath + '/stocks', {
			method : 'POST',
			parameters : {
				action : "goinsert",
				returnScreen: "stock"
			},
			onComplete : function(response) {
				$("mainDiv").update(response.responseText);
			}
		}); 
	}
	function addStock() {
		try {
			new Ajax.Request(contextPath + '/stocks', {
				method : 'POST',
				parameters : {
					action : "insert",
					stkSuppId : $("selItemName").value,
					stkDateAdd : $("txtDateAdded").value,
					stkPurDate : $("txtPurchase").value,
					stkRefNo : $("txtReference").value,
					stkQuantity : $("txtQuantity").value
				},
				onComplete : function(response) {
					$("mainDiv").update(response.responseText);
				}
			});

		} catch (e) {
			alert("stock " + e);
		}
	}
	function updateStock() {
		try {
			new Ajax.Request(contextPath + '/stocks', {
				method : 'POST',
				parameters : {
					action : "update",
					stkStkId : $("txtStockId").value,
					stkSuppId : $("selItemName").value,
					stkDateAdd : $("txtDateAdded").value,
					stkPurDate : $("txtPurchase").value,
					stkRefNo : $("txtReference").value,
					stkQuantity : $("txtQuantity").value
				},
				onComplete : function(response) {
					$("mainDiv").update(response.responseText);
				}
			});
		} catch (e) {
			alert("stock " + e);
		}
	}
	function clickId() {
		$$(".stocksRec")
				.each(function(y) {
						$("rec" + y.id).observe("click",function() {
									$("selItemName").value = y.down("td", 8).innerHTML;
										if ($("selItemName").value == "") {
											swal(
													'Item Unavailable',
													'Selected item is already obsolete',
													'error');
												} else {
													var dateAdded = y.down("td", 4).innerHTML.split("/");
													var datePurchase = y.down("td", 5).innerHTML.split("/");
													$("txtStockId").value = y.id;
													$("txtQuantity").value = y.down("td", 2).innerHTML;
													$("txtReference").value = y.down("td", 3).innerHTML;
													$("txtDateAdded").value =dateAdded[2]+"-"+dateAdded[0]+"-"+dateAdded[1];
													$("txtPurchase").value = datePurchase[2]+"-"+datePurchase[0]+"-"+datePurchase[1];
												}
										});
						});
	}
	function searchStock() {
		var tag = "N"
		$$(".stocksRec").each(
				function(y) {
					$(y.id).writeAttribute("style", "");
					for (var i = 0; i <= 8; i++) {
						if (i == 0) {
							if ($(y.id).id.include($F("txtSearch"))) {
								tag = "Y";
								break;
							}
						} else {
							if (y.down("td", i).innerHTML.toLowerCase()
									.include($F("txtSearch").toLowerCase())) {
								tag = "Y";
								break;
							} else {
								tag = "N";
							}
						}
					}
					if (tag == "N") {
						$(y.id).writeAttribute("style", "display:none");
					}
				});
	}
	function returnStockPage() {
		var contextPath = "${pageContext.request.contextPath}";
		new Ajax.Request(contextPath + '/action', {
			method : 'POST',
			parameters : {
				action : '${returnScreen}'
			},
			onComplete : function(response) {
				$("mainDiv").update(response.responseText);
			}
		});
	}
	$("txtSearch").observe("keyup", searchStock);
	$("btnAddStock").observe("click", goInsertPage);
	$("btnCancel").observe("click", returnStockPage);

	$("btnSave").observe("click", function() {
	 	if (fieldValidation()){	
	 		if ('${action}' == "goinsert") {
			addStock();
			} else {
			updateStock();
			}	   
	 }
	});
	function checkDisplay() {
		if ('${action}' == "goinsert") {
			$("stmTblDiv").writeAttribute("style", "visibility:hidden");
			$("trSearch").writeAttribute("style", "display:none");
			$("btnAddStock").writeAttribute("style", "display:none");
			$("selItemName").removeAttribute("disabled");
		}
	}
	function fieldValidation(){
	   if ($("selItemName").value == ""){
		   if ('${action}' == "goinsert"){
		      swal('Unsuccessful',
					'Please select an Item',
					'error'); 
		   }else{
			  swal('Unsuccessful',
						'Please select record from the table',
						'error'); 
		   }
		   return false;
	   } else if($("txtQuantity").value == "" ) {
		   swal('Unsuccessful',
					'Quantity of item must be enter',
					'error');
		   return false;
	   } 
	   else if( (isNaN($("txtQuantity").value)) || (parseInt($("txtQuantity").value) < 0)){
		   swal('Unsuccessful',
					'Invalid Quantity Entered',
					'error');
	   } else if ($("txtReference").value == "" ){
		   swal('Unsuccessful',
					'Reference number of item must be enter',
					'error');
		   return false;
	   }else if ($("txtDateAdded").value == "" ){
		   swal('Unsuccessful',
					'Date added of item must be enter',
					'error');
		   return false;
	   }else if ($("txtPurchase").value == "" ){
		   swal('Unsuccessful',
					'Purchase date of item must be enter',
					'error');
		   return false;
	   }
	   var dateAdded = new Date($("txtDateAdded").value);
	   var datePurchase = new Date($("txtPurchase").value);
	   var currDate = new Date();
	   if (currDate < dateAdded){
		   swal('Unsuccessful',
					'Invalid date added entered',
					'error');
		   return false;
	   } else if (currDate < datePurchase){
		   swal('Unsuccessful',
					'Invalid purchase date entered',
					'error');
		   return false;
	   }
	   return true; 
	}
	function showResult(){
		if ('${result}' != ""){
			swal('Successful',
					'Record is already '+'${result}',
					'success');
		}
	}
</script>