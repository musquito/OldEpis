<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=application.getInitParameter("episName")%></title>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/bootstrap-table/src/bootstrap-table.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/datepicker.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/custom.css" rel="stylesheet" type="text/css"/>
        <script src="resources/jquery.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap-table/src/bootstrap-table.js"></script>
        <script src="resources/js/bootstrap-datepicker.min.js"></script>
        <script src="resources/custom.js" type="text/javascript"></script>
    </head>
    <body>
        <header class="header_page"></header>
        <section class="container-fluid menu">
            <button class="menu-toggle btn btn-sm btn-default" style="margin-bottom: 5px"><span class="glyphicon glyphicon-step-forward"></span></button>
            <%@include  file="menu.jsp" %>
            <div class="row">
                <div class="col-md-12 tab-modefile">
                	<ol class="breadcrumb">
                        <li><i>บันทึกคำร้องขอปรับลดหนี้</i></li>
                        <li class="active">ค้นหาข้อมูลการปรับลดหนี้</li>
                        <li>บันทึกรายละเอียดขอปรับลดหนี้</li>
                        <li>สรุปการขอปรับลดหนี้</li>
                        <li>ผลการขอปรับลดหนี้</li>
                    </ol>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                        	<a href="#tab_cus" aria-controls="tab_cus" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-filter"></span> ค้นหาข้อมูล</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="tab_cus">
                            <div class="panel panel-default panal-radius">
                                <div class="panel-body">
                                    <div class="row">
		                                <div class="col-md-12">
		                                    <div class="form-horizontal">
		                                        <div class="form-group">
		                                            <label class="control-label col-sm-2">เลขที่ใบแจ้งค่าบริการ  :</label>
		                                            <div class="col-sm-2">
		                                                <input class="form-control" value="" disable>
		                                            </div>
		                                            <label class="control-label col-sm-2" >เลขที่ใบเสร็จรับเงิน :</label>
		                                            <div class="col-sm-2">
		                                                <input class="form-control" value="">
		                                            </div>
		                                            <div class="col-sm-4">
		                                            <button type="button" class="btn btn-primary" onclick="link()">
		                                            	<span class="glyphicon glyphicon-search"></span> ค้นหา</button>&nbsp;&nbsp;
		                                            <button type="button" class="btn btn-success"  data-toggle="modal" data-target="#CustomerSearch">
		                                            	<span class="glyphicon glyphicon-zoom-in"></span> ค้นหาเพิ่มเติม</button></div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--------------------------------------->
            <ul id="navigatePanel" class="list-inline pull-right list-menu-set">
                <li><a id="addAdjustReceiptList" href="adjust-payment_2.jsp" class="btn btn-link"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการการขอปรับลดหนี้</a></li>
                <li><a id="sumAdjustReceiptList" href="adjust-payment_3.jsp" class="btn btn-link"><span class="glyphicon glyphicon-th-list"></span> สรุปรายการขอปรับลดหนี้</a><span class="badge badge_modefil">2</span></li>
            </ul>
            <!--------------------------------------->
            <div class="row">
	                <!-- Tab panes -->
	                	<div class="col-md-12 tab-modefile">
		                <div class="panel-heading">
		                    <h3 class="panel-title"><span class="glyphicon glyphicon-shopping-cart"></span> รายการขอปรับลดหนี้</h3>
		                </div>
	                    <div role="tabpanel" class="tab-pane active" id="tab-2-1">
	                        <table id="table_1"
	                               data-row-style="rowStyle"
	                               data-toggle="table"
	                               data-classes="table table-hover table-striped"
	                               >
	                            <thead>
	                                <tr>
	                                	<th></th>
		                                <th data-field="runningFormatter" data-align="center">#</th>
		                                <th data-field="inv" data-align="center">เลขที่ใบแจ้งค่าบริการ</th>
		                                <th data-field="no" data-align="center">เลขที่ใบเสร็จรับเงิน</th>
		                                <th data-field="date" data-align="center">วันที่รับชำระ</th>
		                                <th data-field="custNo" data-align="center">เลขที่ลูกค้า</th>
		                                <th data-field="custName" data-align="center">ชื่อลูกค้า</th>
		                                <th data-field="payMethod" data-align="center">วิธีการชำระเงิน</th>
		                                <th data-field="total" data-align="center">ยอดเงิน</th>
		                                <th data-field="branch" data-align="center">สถานที่รับชำระ</th>
		                                <th data-field="username" data-align="center">ผู้รับชำระ</th>
		                                <th data-field="status" data-align="center">สถานะ</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td><input type="radio" name="optradio"></td>
	                                    <td>1</td>
	                                    <td>255900001</td>
	                                    <td>EP0171701F150714000020</td>
	                                    <td>05/02/2016 12:45</td>
	                                    <td>200006599</td>
	                                    <td>นาย วสันตืชาย วงค์คำเดือน</td>
	                                    <td>เงินสด</td>
	                                    <td>1,070.00</td>
	                                    <td>ศบล.แจ้งวัฒนะ</td>
	                                    <td>EPIS2016</td>
	                                    <td>ปกติ</td>
		                            </tr>
		                            <tr>
	                                    <td><input type="radio" name="optradio"></td>
	                                    <td>2</td>
	                                    <td>200058590</td>
	                                    <td>EP0171701F150714000021</td>
	                                    <td>10/01/2016 10:45</td>
	                                    <td>200006599</td>
	                                    <td>นาย วสันตืชาย วงค์คำเดือน</td>
	                                    <td>เงินสด</td>
	                                    <td>1,070.00</td>
	                                    <td>ศบล.แจ้งวัฒนะ</td>
	                                    <td>EPIS2016</td>
	                                    <td>ปกติ</td>
		                            </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
            
        </div>
    </section>
    <!------------------------->
    <div class="modal fade" role="dialog" id="CustomerSearch">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-user"></span> ค้นหาลูกค้า</h4>
                </div>
                <div class="modal-body">
                    <div class="tab-modefile">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">เลขที่ใบแจ้งค่าบริการ</a></li>
                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">หมายเลขบริการ</a></li>
                            <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">ข้อมูลลูกค้า</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="tab-content border-tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="home">
                                        <div class="form-inline">
                                            <div class="form-group">
                                                <label>เลขที่ใบแจ้งค่าบริการ :</label>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" value="2559*">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-search"></span> ค้นหา</button>
                                                    </span>
                                                </div><!-- /input-group -->
                                            </div>
                                        </div><br>
                                        
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>เลขที่ใบแจ้งค่าบริการ</th>
                                                            <th>เลขที่ลูกค้า</th>
                                                            <th>ชื่อลูกค้า</th>
                                                            <th>ประเภทบริการ</th>
                                                            <th>Billing Group</th> 
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>255900001</td>
                                                            <td>700005673</td>
                                                            <td>บริษัท AEC จำกัด</td>
                                                            <td>Inmarsat-C</td>
                                                            <td>LN</td>
                                                            <td><button type="button" class="btn btn-success btn-xs">เลือก</button></td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>255900002</td>
                                                            <td>700005675</td>
                                                            <td>บริษัท พี เอ็น แท้งก์เกอร์จำกัด</td>
                                                            <td>Inmarsat-C</td>
                                                            <td>LN</td>
                                                            <td><button type="button" class="btn btn-success btn-xs">เลือก</button></td>
                                                        </tr>
                                                        <tr>
                                                            <td>3</td>
                                                            <td>255900099</td>
                                                            <td>700005675</td>
                                                            <td>บริษัท พี เอ็น แท้งก์เกอร์จำกัด</td>
                                                            <td>Inmarsat-C</td>
                                                            <td>LN</td>
                                                            <td><button type="button" class="btn btn-success btn-xs">เลือก</button></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div role="tabpanel" class="tab-pane" id="profile">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="control-label col-sm-2" >ประเภทบริการ :</label>
                                                <div class="col-sm-4">
                                                    <select class="form-control">
                                                        <option>INMARSAT-C</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2" >หมายเลขบริการ :</label>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="456700*">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-search"></span> ค้นหา</button>
                                                        </span>
                                                    </div><!-- /input-group -->
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2" ></label>
                                                <div class="col-sm-4">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Property1
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" id="inlineCheckbox2" value="option2"> Property2
                                                    </label>
                                                </div>
                                            </div>
                                        </div><br>
                                        

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <table class="table table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>หมายเลขบริการ</th>
                                                                    <th>เลขที่ลูกค้า</th>
                                                                    <th>ชื่อลูกค้า</th>
                                                                    <th>ประเภทบริการ</th>
                                                                    <th>Billing Group</th>
                                                                    <th></th> 
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>456700100</td>
                                                                    <td>700005673</td>
                                                                    <td>บริษัท AEC จำกัด</td>
                                                                    <td>Inmarsat-C</td>
                                                                    <td>LN</td>
                                                                    <td><button type="button" class="btn btn-success btn-xs">เลือก</button></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2</td>
                                                                    <td>456700200</td>
                                                                    <td>700005675</td>
                                                                    <td>บริษัท พี เอ็น แท้งก์เกอร์จำกัด</td>
                                                                    <td>Inmarsat-C</td>
                                                                    <td>LN</td>
                                                                    <td><button type="button" class="btn btn-success btn-xs">เลือก</button></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                    </div>

                                    <div role="tabpanel" class="tab-pane" id="messages">
                                        <div class="form-horizontal">
											<div class="form-group">
												<label class="control-label col-sm-3">เลขที่ลูกค้า :</label>
												<div class="col-sm-3"><input class="form-control" id="advSrcCusNo"></div>
												<label class="control-label col-sm-3">เลขประจำตัวผู้เสียภาษี :</label>
												<div class="col-sm-3"><input class="form-control" id="advSrcCusTaxId"></div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3">ชื่อลูกค้า :</label>
												<div class="col-sm-3"><input class="form-control" id="advSrcCusFirstName"></div>
												<label class="control-label col-sm-3">นามสกุล :</label>
												<div class="col-sm-3"><input class="form-control" id="advSrcCusLastName"></div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3">ชื่อนิติบุคคล/ราชการ :</label>
												<div class="col-sm-6"><input class="form-control" id="advSrcOrgName"></div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3">กลุ่มผู้ใช้บริการ :</label>
												<div class="col-sm-4">
													<select id="advSrcCusType" class="form-control" >
														<option value="" selected>กรุณาเลือกกลุ่มผู้ใช้บริการ</option>
														<option value="Carrier">Carrier/Operator/NON POTs</option >
														<option value="ISP">ISP</option >
														<option value="MKT">Mkt Arm</option >
														<option value="AGENT">ReSeller/Agent</option >
														<option value="ORGANIZATIONINC">ธุรกิจ กสท</option >
														<option value="ORGANIZATIONBASIC">ธุรกิจทั่วไป</option >
														<option value="INDIVIDUAL">บุคคลทั่วไป</option >
														<option value="EMBASSIES">สถานฑูต/องค์กรระหว่างประเทศ</option >
														<option value="OFFICIAL">หน่วยงานรัฐ</option>
													</select>
												</div>
												<div class="col-sm-5">
													<a id="advSrcCusNoBtn" class="btn btn-info pull-right"><span class="glyphicon glyphicon-search"></span> ค้นหา</a>
												</div>
											</div>
										</div>

                                        <br>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>เลขที่ลูกค้า</th>
                                                            <th>ชื่อลูกค้า</th>
                                                            <th>ประเภทบริการ</th>
                                                            <th>Billing Group</th> 
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>1</td>
                                                            <td>700005673</td>
                                                            <td>บริษัท AEC จำกัด</td>
                                                            <td>Inmarsat-C</td>
                                                            <td>LN</td>
                                                            <td><button type="button" class="btn btn-success btn-xs">เลือก</button></td>
                                                        </tr>
                                                        <tr>
                                                            <td>2</td>
                                                            <td>700005675</td>
                                                            <td>บริษัท พี เอ็น แท้งก์เกอร์จำกัด</td>
                                                            <td>Inmarsat-C</td>
                                                            <td>LN</td>
                                                            <td><button type="button" class="btn btn-success btn-xs">เลือก</button></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

				<i class="pull-right"><span class="glyphicon glyphicon-filter"></span> สามารถใช้เครื่องหมาย ? แทนหนึ่งตัวอักษร หรือ *
						แทนหลายตัวอักษรในการค้นหา (กรุณาป้อนข้อมูลที่ต้องการค้นหาอย่างน้อย 4 ตัวอักษร)</i><br>
                </div>
				
            </div>
        </div>
    </div>
   
</body>
<script type="text/javascript">
    var $table = $('#myTable');

    $table.on('expand-row.bs.table', function (e, index, row, $detail) {
        var res = $("#desc" + index).html();
        $detail.html(res);
    });
    $(document).ready(function () {
        $("#status_print").hide();
    });
    function submit_payment() {
        $("#status_print").show();
        setTimeout(' $("#status_print").hide()', 3000);
    }
    function detail_invoice(refno) {
        $.ajax({
            type: 'POST',
            url: 'detail_invoice.jsp',
            data: {refno: refno},
            success: function (data) {
                //alert(data);
                $("#show_detail_invoice_" + refno).prepend(data);
                $("#show_detail_invoice_" + refno).removeClass("hidden");
            }
        });
    }
    function show_price(refno) {
        // alert(refno);
        if ($("#checkbox_" + refno).prop("checked")) {
            $("#text_price_" + refno).addClass("hidden");
            $("#input_price_" + refno).removeClass("hidden");
            $("#input_price_" + refno).focus();
        } else {
            $("#text_price_" + refno).removeClass("hidden");
            $("#input_price_" + refno).addClass("hidden");
        }
    }
    $("#btn_save_c").click(function () {
        //alert("ok");
        var dataSet = {
            c_Num: $("#c_Num").val(),
            c_IdBank: $("#c_IdBank").val(),
            c_Bank: $("#c_Bank").val(),
            c_Bank_branch: $("#c_Bank_branch").val(),
            c_Date: $("#c_Date").val(),
            c_money: $("#c_money").val()
        };
        $.ajax({
            type: 'POST',
            url: 'data_chack.jsp',
            data: dataSet,
            success: function (data) {
                //alert(data);
                $("#data_chack_show").prepend(data);
                $("#c_Num").val("");
                $("#c_IdBank").val("");
                $("#c_Bank").val("");
                $("#c_Bank_branch").val("");
                $("#c_Date").val("");
                $("#c_money").val("");
            }
        });
    });
    $("#c_Date").datetimepicker({
        timepicker: false,
        format: 'd/m/Y', // กำหนดรูปแบบวันที่ ที่ใช้ เป็น 00-00-0000			
        lang: 'th', // แสดงภาษาไทย
        scrollMonth: true,
        // minDate: '0', //เลือกวันย้อนหลัง
        // maxDate: '0'
    });
    
    function showTab1(tab) {
        // $('#myTab1 a[href="#tab-1-3"]').tab('show');
        $('#myTab1 a[href="#tab-1-' + tab + '"]').tab('show');
    }
    function showTab2(tab) {
        $('#myTab2 a[href="#tab' + tab + '"]').tab('show');
                // $('#myTab1 a[href="#tab-1-3"]').tab('show');

    }
    
    function detailFormatter(val, row, ind) {
    	return    	'<table class="table table-striped table-bordered">'+
				    	'<thead>'+
				    		'<tr>'+
				    		'<th class="text-center">รายการ</th>'+
				    		'<th class="text-center">จำนวนเงิน</th>'+
				    		'<th class="text-center">ภาษีมูลค่าเพิ่ม</th>'+
				    		'<th class="text-center">ส่วนลด</th>'+
				    		'<th class="text-center">จำนวนเงินทั้งสิ้น</th>'+
				    		'</tr>'+
				    	'</thead>'+
				    	'<tbody>'+
				    		'<tr><td class="text-center">Inv No. 200058589 : Sub No. 864460704</td><td class="text-center">1,000.00</td><td class="text-center">70.00</td><td class="text-center">0.00</td><td class="text-center">1,070.00</td></tr>'+
				    	'</tbody>'+
			    	'</table>';	
    }
</script>
</html>
