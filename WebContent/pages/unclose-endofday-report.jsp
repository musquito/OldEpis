<%@page import="java.util.List"%>
<%@page import="th.net.cat.epis.controller.EpContextHolder"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>รายงานไม่ปิดบัญชีการรับชำระเงิน</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="resources/bootstrap-table/src/bootstrap-table.css" rel="stylesheet" type="text/css" />
		<link href="resources/custom.css" rel="stylesheet" type="text/css" />
		<script src="resources/jquery.min.js" type="text/javascript"></script>
		<script src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script src="resources/bootstrap-table/src/bootstrap-table.js"></script>
		<script src="resources/custom.js" type="text/javascript"></script>
		<link href="resources/css/datepicker.min.css" rel="stylesheet" type="text/css" />
		<script src="resources/js/bootstrap-datepicker.min.js"></script>
		
        <script type="text/javascript">
		    $(document).ready(function() {
		        $('.stDate').datepicker({
		             format: 'dd/mm/yyyy',
		             lang: 'th',
		             startDate: '01/01/2016',
		             endDate: '30/12/2025'
		        });
		        $('.stDate').datepicker('setDate', new Date());
		        $('.stDate').datepicker('update');
		        $('.stDate').val('');
		        $('a#printReport').prop('disabled', true);		        
		    });
		    
			function runningFormatter(val, row, ind) {
				$('a#printReport').prop('disabled', false);
				return ind + 1;
			}
			function currencyFormatter(val, row, ind) {
		    	return parseFloat(val, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
		    }
		    function numberFormatter(val, row, ind) {
		    	return parseFloat(val, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,').replace(/\.00$/g, "");
		    }
		    function nameFormatter(val, row, ind) {
		    	return row.userName + " " + row.userFamilyname + " ("+row.userCode+")";
		    }
       	</script>
    </head>
    <body>
        <header class="header_page"></header>
        <section class="container-fluid menu">
            <button class="menu-toggle btn btn-sm btn-default" style="margin-bottom: 5px"><span class="glyphicon glyphicon-step-forward"></span></button>
                <%@include  file="menu.jsp" %>
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                    	<li><i>รายงานการรับชำระเงิน</i></li>
                        <li class="active"><i>รายงานไม่ปิดบัญชีการรับชำระเงิน</i></li>
                    </ol>
                    <div class="panel panel-default">
                    	<div class="panel-heading">ข้อมูลไม่ปิดบัญชีการรับชำระเงิน</div>
                    	<div class="panel-body">
                    		<div class="row">
                    			<div class="col-md-12">
                    			<form id=documentReportForm method="post" class="form-horizontal" role="form">
									<div class="form-group">
										<label class="control-label col-sm-2">วันที่รับชำระ :</label>
										<div class="col-sm-2">
				                           <div class="input-group input-append date stDate">
				                               <input type="text" class="form-control" id="startDate" name="startDate" value="" />
				                               <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
				                           </div>
										</div>
										<label class="control-label col-sm-2" >ถึงวันที่ :</label>
										<div class="col-sm-2">
                                         <div class="input-group input-append date stDate">
                                           <input type="text" class="form-control" id="toDate" name="toDate" value="" />
				                           <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                         </div>
                                         </div>
                                         <div class="col-sm-4">
                                         	<a id="inquiryReport" class="btn btn-primary glyphicon glyphicon-search"> ค้นหาข้อมูล</a>
                                           	&nbsp;&nbsp;
                                           	<a id="printReport" class="btn btn-success glyphicon glyphicon-print"> แสดงรายงาน</a> 
                                       	 </div>
                                      </div>
                                      <div class="form-group">
                                      	<label class="control-label col-sm-2">สาขารับชำระ :</label>
                                      	<div class="col-sm-2">
											<select class="form-control" id="shop" name="shop"></select>
                                        </div>
										<label class="control-label col-sm-2">เจ้าหน้าที่ :</label>
										<div class="col-sm-2">
											<select class="form-control" id="officer" name="officer"></select>
										</div>
								  	</div>
								</form>
                    			</div>	
                    		</div>
                    	</div>
            		</div>
            	
	            	<div class="table-responsive">
			            <table id="UnCloseEndOfDayReport"
			              data-toggle="table"
			              data-single-select="true"
			              data-classes="table table-hover table-condensed "
			              data-search="true"
			              data-show-pagination-switch="true"
			              data-show-refresh="true"
			              data-show-toggle="true"
			              data-show-columns="true"
			              data-show-export="false"
			              data-show-footer="false"
			              data-pagination="true"
			              data-height="525">
				          <thead>
					          <tr>
				                   <th data-align="center" data-formatter="runningFormatter">ลำดับที่</th>
				                    <th data-align="center" data-field="receiptDate" data-sortable="true">วันที่รับชำระเงิน</th>
				                   <th data-align="left" data-field="shopName" data-sortable="true">ชื่อสถานะที่รับชำระ</th>
				                   <th data-align="center" data-field="posno" data-sortable="true">ชื่อเครื่องที่รับชำระ</th>
				                   <th data-align="center" data-field="paymentUser" data-sortable="true">รหัสผู้รับชำระเงิน</th>
				                   <th data-align="left" data-field="payFullname" data-sortable="true">ชื่อ - กสุลผู้รับชำระเงิน</th>
				                   <th data-align="center" data-field="shopNo" data-sortable="true">รหัสสถานที่รับชำระ</th>
				                   
					           </tr>
				           </thead>
			          	</table>
			          </div>
            	</div>
            </div>
            <form action="../printUnCloseEndOfDayReport.pdf" method="post" target="_printForm">
            	<input type="hidden" id="printPdf" name="printPdf" value="1"/>
            	<input type="hidden" id="startDate" name="startDate"/>
            	<input type="hidden" id="toDate" name="toDate"/>
            	<input type="hidden" id="period" name="period"/>
            	<input type="hidden" id="shop" name="shop"/>
            	<input type="hidden" id="officer" name="officer"/>
            </form>
            <script type="text/javascript">
            	$(document).on("click", "a#inquiryReport", function() {
            		$("#UnCloseEndOfDayReport").bootstrapTable("refresh", 
            				{ url: "../getUnCloseEndOfDayReport.json?printPdf=0"
            						+"&startDate="+$("#startDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")
            						+"&toDate="+$("#toDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")
            						+"&period="+$("#period option:selected").val()
            						+"&shop="+$("#shop option:selected").val()
            						+"&officer="+$("#officer option:selected").val(), cache: false });
            			setTimeout(function() { 
            				$("#UnCloseEndOfDayReport").bootstrapTable("resetView")
            		}, 200);
            	}).on("click", "a#printReport", function() {
            		document.forms[1].startDate.value = $("#startDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3");
            		document.forms[1].toDate.value = $("#toDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3");
            		document.forms[1].period.value = $("#period option:selected").val();
            		document.forms[1].shop.value = $("#shop option:selected").val();
            		document.forms[1].officer.value = $("#officer option:selected").val();
            		document.forms[1].submit();
            	});
            	
            	var view = (function($){
            		function DropDown(el, url) { var obj = this, data = [{ key: "", value: "", text: "Please Select" }]; obj.el = el; obj.elem = $(el);
            		obj.data = function(array) { if ($.type(array) == "array") { setup(data = array); return this } return data; };
            		obj.init = function(url) { if (url) $.get(url, function(res) { setup(data = res.data) }); else setup(data); return this };
            		obj.disable = function(flag) { obj.elem.attr("disabled", (flag == null ? true : flag)); return this }
            		obj.enable = function() { obj.disable(false); return this }
            		obj.index = function() { if (arguments.length == 1) { var maxLen = data.length, index = arguments[0]; obj.elem.find("option").each(function(i, opt){ opt.removeAttribute("selected") }).eq(index < 0 ? maxLen + index : index).attr("selected", true); return this } return $.inArray("selected", obj.elem.find("option").map(function(i, opt){ return opt.selected ? "selected" : "no-selected" })) }
            		obj.selected = function(){ return data[obj.index()]; }; 
            		obj.val = function() { return obj.elem.val(); }; 
            		obj.key = function(){ if (arguments.length == 0) { var key = obj.elem.find("option:selected").data("key"); if (typeof key === "string" && key === "undefined") { var item = data[obj.index()]; key = item && item.key ? item.key : item.id } return key } var key = arguments[0]; for (var i = 0, m = data.length; i < m; i++) { var item = data[i]; if (item.key && item.key == key) { obj.index(i); break; } if (item.id && item.id == key) { obj.index(i); break; } } return this }
            		
            		var roleName = "<%=EpContextHolder.getContext().getRoleName().toString()%>";
            		
            		function setup(array) { obj.elem.find("*").remove();
            		console.log("roleName : "+roleName);
	        			obj.elem.append('<option data-index="-1" data-key="-1" value="all">ทั้งหมด</option>');            		
            			$.each(array,function(i,o){
            				var tempShop = '${epContext.branchCode}'; 
            				var tempUser = '${epContext.userName}'; 
            				if(o.category == 'source.service.name') {
            					if(o.descAbvrEn == 'CAT'){
	            					obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.code +'" value="'+ o.mapCode2 +'">'+ o.descFullTh +'</option>')
            					}
            				
            				} else {
            					
            					
            					if (o.no != null) {
            						var username = "<%=EpContextHolder.getContext().getUserName().toString()%>";
            						var selectted ="";
            						
            						
            						console.log("tempUser : "+tempUser);
            						if(name == username){
            							selectted = 'selected="selected"'
            						}           		
            						
           							obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.id +'" value="'+ o.no +'"'+selectted+'>'+ o.name +'</option>');
            						if(roleName != "Suppervisor")
            							{
               							$("#officer").val(tempUser);         
            							}
            						$("#shop").val(tempShop)

            					} else {

           							obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.id +'" value="'+ o.no +'">'+ o.name +'</option>');
            					}

           					}
            			}); 
            		}
            		data = obj.elem.change(window[el.substring(1) +"ChangeEvent"]).find("option").map(function(i, opt){ return { key: opt.getAttribute("data-key"), value: opt.value, text: opt.textContent } });
            		}
            		(function(){ $(window["setup"]) })();
            		var strComboValue = [ 
            			<% 
            			    List<String> options = EpContextHolder.getContext().getOwners();
            			    for (int i = 0; i < options.size(); i++) {
            			%>
            			        "<%=options.get(i)%>"
            			<%
            			        if (i + 1 < options.size()) {
            			%>
            			            ,
            			<%
            			        }
            			    }
            			%>
            			    ];
            		
            			var selectted = $("#officer").val();
            			var dataselect =[];
            			var i = 0;
            			for(i = 0; i<strComboValue.length ; i++){
            				var data = {"no":strComboValue[i],"name":strComboValue[i]};           				
            				dataselect.push(data);

            			}
            			new DropDown("#officer").data(dataselect);
            			if(i < 2){
            				new DropDown("#officer").disable();
            			}
            			new DropDown("#shop").init("../findShopList.json");
            			new DropDown("#soureType").init("../findSourceType.json");
            			new DropDown("#shop").disable();
            		return this;
            	})(jQuery);
            </script>
	</body>
</html>
