<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>รับชำระค่าบริการ</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="resources/bootstrap-table/src/bootstrap-table.css"
	rel="stylesheet" type="text/css" />
<link href="resources/custom.css" rel="stylesheet" type="text/css" />
<script src="resources/jquery.min.js" type="text/javascript"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/bootstrap-table/src/bootstrap-table.js"></script>
<script src="resources/js/mustache.min.js" type="text/javascript"></script>
<script src="resources/custom.js" type="text/javascript"></script>

<script src="resources/js/bootstrap-datepicker.min.js"></script>
<script src="resources/js/bootstrap-datepicker.th.js"
	type="text/javascript" charset="UTF-8"></script>
<script src="resources/js/bootstrap-datepicker-thai.js" charset="UTF-8"></script>
</head>
<body>
	<header class="header_page"></header>
	<section class="container-fluid menu">
		<button class="menu-toggle btn btn-sm btn-default"
			style="margin-bottom: 5px">
			<span class="glyphicon glyphicon-step-forward"></span>
		</button>


		<%@include file="menu.jsp"%>
		<form id="payServiceChargeForm" method="post" class="form-horizontal"
			role="form">
			<input type="hidden" name="customerType" id="customerType" value="">
			<div class="row">
				<div class="col-md-12 tab-modefile">
					<div id="mainMessageDialog"></div>
					<div id="alertDangerAreaMsg" class="hide alert alert-danger">
						<span class="glyphicon glyphicon-remove-sign"></span>
						เกิดข้อผิดพลาด
					</div>
					<div id="billingGroupMessageDialog"></div>
				</div>
			</div>

			<ul id="navigatePanel" class=" list-inline pull-right list-menu-set">
				<li><a id="summaryPayment" class="btn btn-link"><span
						class="glyphicon glyphicon-th-list"></span> สรุปรายการรับชำระ</a></li>
				<li><a id="submitPayment" class="btn btn-link"><span
						class="glyphicon glyphicon-edit"></span> ดำเนินการรับชำระ</a></li>
			</ul>
			<div id="customerAddPanel" class="row">
				<div class="col-md-12 tab-modefile">
					<ul id="paymentInfoAddTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#tab_cus"
							aria-controls="tab_cus" role="tab" data-toggle="tab"><span
								class="glyphicon glyphicon-user"></span> เพิ่มใบเสร็จ</a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="tab_cus">
							<div class="panel panel-default panal-radius">
								<div class="panel-body">
									<div class="row">

										<div class="col-md-12">
											<div class="form-horizontal">
												<div class="form-group">
													<label class="control-label col-sm-2">ชื่อ :</label>
													<div class="col-sm-2">
														<input id="inputCusName" class="form-control">
													</div>
													<label class="control-label col-sm-2">เลขที่ลูกค้า
														:</label>
													<div class="col-sm-2">
														<input id="inputBa" class="form-control">
													</div>

													<label class="control-label col-sm-2">TaxNo:</label>
													<div class="col-sm-2">
														<input id="inputTaxNo" class="form-control">
													</div>
												</div>
												<div class="form-group">

													<label class="control-label col-sm-2">ที่อยู่ : </label>
													<div class="col-sm-6">
														<textarea id="inputAddress" rows="3" cols="50"
															class="form-control"></textarea>
													</div>
													<div class=" col-sm-4">
														<div class="form-group row ">
															<label class="control-label col-sm-6">สาขา :</label>
															<div class="col-sm-6">
																<input id="inputBranch" class="form-control">
															</div>
														</div>
														<div class="form-group row ">
															<label class="control-label col-sm-6">กลุ่มผู้ใช้บริการ
																:</label>
															<div class="col-sm-6">
																<select class="form-control" id="inputCustomerSegment"><option
																		data-index="-1" data-key="-1" value="-1">กรุณาเลือกกลุ่มผู้ใช้</option>
																	<option data-index="0" data-key="1" value="1"
																		selected="selected">ธุรกิจทั่วไป</option>
																	<option data-index="1" data-key="2" value="2">หน่วยงานรัฐ</option>
																	<option data-index="2" data-key="3" value="3">บุคคลทั่วไป</option>
																	<option data-index="3" data-key="4" value="4">Carrier/Operator/NON
																		POTs</option>
																	<option data-index="4" data-key="5" value="5">Mkt.Arm</option>
																	<option data-index="5" data-key="6" value="6">ISP</option>
																	<option data-index="6" data-key="7" value="7">Reseller/Agent</option>
																	<option data-index="7" data-key="8" value="8">ธุรกิจ
																		กสท</option>
																	<option data-index="8" data-key="9" value="9">สถานฑูต/องค์กรระหว่างประเทศ</option></select>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2">เลขที่ใบแจ้ง :</label>
												<div class="col-sm-2">
													<input id="inputInvoiceNo" class="form-control">
												</div>
												<label class="control-label col-sm-2">หมายเลขบริการ
													:</label>
												<div class="col-sm-2">
													<input id="inputSubNo" class="form-control">
												</div>
												<label class="control-label col-sm-2">ยอดก่อนภาษี :</label>
												<div class="col-sm-2">
													<input id="inputBeforVat" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2">ภาษีมูลค่าเพิ่ม
													:</label>
												<div class="col-sm-2">
													<input id="inputVatAmount" class="form-control">
												</div>
												<label class="control-label col-sm-2">จำนวนเงินรวมภาษี
													:</label>
												<div class="col-sm-2">
													<input id="inputTotalCharge" class="form-control">
												</div>
												<label class="control-label col-sm-2">ยอดชำระ :</label>
												<div class="col-sm-2">
													<input id="inputTotalAmount" class="form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2">รอบการใช้งานเริ่ม</label>
												<div class="col-sm-2">
													<div class="input-group input-append date"
														data-provide="datepicker" data-date-format="dd/mm/yyyy">
														<input class="form-control" id="inputBillCycleFrom"
															placeholder="dd/MM/yyyy" maxlength="10"> <span
															class="input-group-addon add-on"><span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</div>
												<label class="control-label col-sm-2">รอบการใช้งานสิ้นสุด</label>
												<div class="col-sm-2">
													<div class="input-group input-append date"
														data-provide="datepicker" data-date-format="dd/mm/yyyy">
														<input class="form-control" id="inputBillCycleTo"
															placeholder="dd/MM/yyyy" maxlength="10"> <span
															class="input-group-addon add-on"><span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2">วันครบกำหนด</label>
												<div class="col-sm-2">
													<div class="input-group input-append date"
														data-provide="datepicker" data-date-format="dd/mm/yyyy">
														<input class="form-control" id="inputDueDt"
															placeholder="dd/MM/yyyy" maxlength="10"> <span
															class="input-group-addon add-on"><span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</div>
												<label class="control-label col-sm-2">วันจัดทำใบแจ้งค่าใช้บริการ</label>
												<div class="col-sm-2">
													<div class="input-group input-append date"
														data-provide="datepicker" data-date-format="dd/mm/yyyy">
														<input class="form-control" id="inputIssueDt"
															placeholder="dd/MM/yyyy" maxlength="10"> <span
															class="input-group-addon add-on"><span
															class="glyphicon glyphicon-calendar"></span></span>
													</div>
												</div>
											</div>
											<div class="form-group">

												<label class="control-label col-sm-2">สถานะ</label>
												<div class="col-sm-2">
													<input id="inputStatus" class="form-control" value="ปกติ"
														readonly="">
												</div>

												<label class="control-label col-sm-2">Vat Rate</label>
												<div class="col-sm-2">
													<input id="vatRate" class="form-control" value="7"
														readonly="">
												</div>

											</div>

										</div>
									</div>
								</div>
								<br />
							</div>
						</div>
					</div>
				</div>
			</div>



			<div id="fillDataInputPanel" class="row">
				<div class="col-md-5">
					<label class="label-panal label-warning">รายการหัก</label>
					<div id="setTaxType" class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span class="selection">ภาษีหัก ณ ที่จ่าย</span> <span
								class="caret"></span>
						</button>
						<ul class="dropdown-menu" id='testmenu'>
							<li><a href="#">ภาษีหัก ณ ที่จ่าย</a></li>
							<!-- GFMIS -->
							<li><a href="#">ค่าธรรมเนียม</a></li>
							<li><a href="#">ค่าปรับ</a></li>
							<li><a href="#">เงินประกันผลงาน</a></li>
							<li><a href="#">ค่าตอบแทนการรับชำระเงิน</a></li>
						</ul>
					</div>
					<!--                     <a id="addTaxType" class="btn btn-link"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการหัก</a> -->
					<div class="panel panel-default panal-radius">
						<div class="panel-body" style="padding-right: 0; padding-left: 0">
							<div class="col-md-12">
								<div role="tabpanel" class="tab-pane hide"
									id="withholdingTaxPanel">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-6">ประเภทภาษีหัก ณ
												ที่จ่าย :</label>
											<div class="col-sm-6">
												<label class="radio-inline"><input type="radio"
													name="withholdingTaxType" data-label="69 ทวิ"
													data-type="69BIS" id="69tvi"><b> 69 ทวิ</b></label>&nbsp;&nbsp;
												<label class="radio-inline"><input type="radio"
													name="withholdingTaxType" data-label="3 เตรส"
													data-type="3TREDECIM" id="3trs"><b> 3 เตรส</b></label>&nbsp;&nbsp;
												<label class="radio-inline"><input type="radio"
													name="withholdingTaxType" data-label="69 ตรี"
													data-type="69TRE" id="69tri"><b> 69 ตรี</b></label>
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-sm-6">เลขที่เอกสาร :</label>
											<div class="col-sm-5">
												<input id="withholdingTaxNo" type="text"
													class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">จำนวนเงิน :</label>
											<div class="col-sm-5">
												<input id="withholdingTaxAmount"
													class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6"></label>
											<div class="col-sm-5">
												<a id="addWithholdingTaxNo" class="btn btn-link"><span
													class="glyphicon glyphicon-th-list"></span>
													เพิ่มรายการภาษีหัก ณ ที่จ่าย</a>
											</div>
										</div>
									</div>
									<table id="withholdingTaxList" class="table table-hover">
										<thead>
											<tr>
												<th data-running-no="true">#</th>
												<!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
												<th>เลขที่ใบแจ้งค่าใช้บริการ</th>
												<!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
												<th>เลขที่เอกสาร</th>
												<th>ประเภทหัก ณ ที่จ่าย</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<!-- GFMIS -->
								<div role="tabpanel" class="tab-pane hide" id="feeTaxPanel">
									<div class="form-horizontal">
										<div class="form-group hide">
											<label class="control-label col-sm-6">ประเภทค่าธรรมเนียม
												:</label>
											<div class="col-sm-5">
												<label class="radio-inline"><input type="radio"
													name="feeTaxType" data-label="ขาออก" checked><b>
														ขาออก</b></label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">ศูนย์ต้นทุน :</label>
											<div class="col-sm-5">
												<select id="feeDepartmentCost" class="form-control"></select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">จำนวนเงิน :</label>
											<div class="col-sm-5">
												<input id="feeTaxAmount" class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">ภาษีซื้อ :</label>
											<div class="col-sm-5">
												<input id="feeBuyTaxAmount" class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">ภาษีหัก ณ
												ที่จ่าย :</label>
											<div class="col-sm-5">
												<input id="feeWTAmount" class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6"></label>
											<div class="col-sm-5">
												<a id="addFeeTaxNo" class="btn btn-link"><span
													class="glyphicon glyphicon-th-list"></span>
													เพิ่มรายการค่าธรรมเนียม</a>
											</div>
										</div>
									</div>
									<table id="feeTaxList" class="table table-hover">
										<thead>
											<tr>
												<th data-running-no="true">#</th>
												<th>ศูนย์ต้นทุน</th>
												<th style="display: none;">ประเภทค่าธรรมเนียม</th>
												<th>ภาษีหัก ณ ที่จ่าย</th>
												<th>ภาษีซื้อ</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="penaltyTaxPanel">
									<div class="form-horizontal">
										<div class="form-group hide">
											<label class="control-label col-sm-6">ประเภทค่าปรับ :</label>
											<div class="col-sm-5">
												<!--                                                 <label class="radio-inline"><input type="radio" name="penaltyTaxType" data-label="ขาเข้า" checked><b> ขาเข้า</b></label>&nbsp;&nbsp;&nbsp; -->
												<label class="radio-inline"><input type="radio"
													name="penaltyTaxType" data-label="ขาออก" checked><b>
														ขาออก</b></label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">จำนวนเงิน :</label>
											<div class="col-sm-5">
												<input id="penaltyTaxAmount" class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6"></label>
											<div class="col-sm-5">
												<a id="addPenaltyTaxNo" class="btn btn-link"><span
													class="glyphicon glyphicon-th-list"></span>
													เพิ่มรายการค่าปรับ</a>
											</div>
										</div>
									</div>
									<table id="penaltyTaxList" class="table table-hover">
										<thead>
											<tr>
												<th data-running-no="true">#</th>
												<!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
												<th>เลขที่ใบแจ้งค่าใช้บริการ</th>
												<!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
												<th style="display: none;">ประเภทค่าปรับ</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide"
									id="retentionTaxPanel">
									<div class="form-horizontal">
										<div class="form-group hide">
											<label class="control-label col-sm-6">ประเภทเงินประกันผลงาน
												:</label>
											<div class="col-sm-5">
												<!--                                                 <label class="radio-inline"><input type="radio" name="retentionTaxType" data-label="ขาเข้า" checked><b> ขาเข้า</b></label>&nbsp;&nbsp;&nbsp; -->
												<label class="radio-inline"><input type="radio"
													name="retentionTaxType" data-label="ขาออก" checked><b>
														ขาออก</b></label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">จำนวนเงิน :</label>
											<div class="col-sm-5">
												<input id="retentionTaxAmount"
													class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6"></label>
											<div class="col-sm-5">
												<a id="addRetentionTaxNo" class="btn btn-link"><span
													class="glyphicon glyphicon-th-list"></span>
													เพิ่มรายการเงินประกันผลงาน</a>
											</div>
										</div>
									</div>
									<table id="retentionTaxList" class="table table-hover">
										<thead>
											<tr>
												<th data-running-no="true">#</th>
												<!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
												<th>เลขที่ใบแจ้งค่าใช้บริการ</th>
												<!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
												<th style="display: none;">ประเภทเงินประกันผลงาน</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide"
									id="compensationTaxPanel">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-6">ศูนย์ต้นทุน :</label>
											<div class="col-sm-5">
												<select id="compensationDepartmentCost" class="form-control"></select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6">จำนวนเงิน :</label>
											<div class="col-sm-5">
												<input id="compensationTaxAmount"
													class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-6"></label>
											<div class="col-sm-5">
												<a id="addCompensationTaxNo" class="btn btn-link"><span
													class="glyphicon glyphicon-th-list"></span>
													เพิ่มรายการค่าตอบแทน</a>
											</div>
										</div>
									</div>
									<table id="compensationTaxList" class="table table-hover">
										<thead>
											<tr>
												<th data-running-no="true">#</th>
												<th>ศูนย์ต้นทุน</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<a class="btn btn-primary pull-right" id="addTaxType"
									style="margin-top: 1em"><span
									class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการหัก</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<label class="label-panal label-warning">วิธีการรับชำระ</label>
					<div id="setPayType" class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown">
							<span class="selection">เงินสด</span> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" id='testmenu2'>
							<li><a href="#">เงินสด</a></li>
							<li><a href="#">เช็ค</a></li>
							<li><a href="#">บัตรเครดิต</a></li>
						</ul>
					</div>
					<!--                     <a id="addPayType" class="btn btn-link"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มวิธีการรับชำระ</a> -->
					<div class="panel panel-default panal-radius">
						<div class="panel-body" style="padding-right: 0; padding-left: 0;">
							<div class="col-md-12">
								<div role="tabpanel" class="tab-pane hide" id="payType1">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-8">จำนวนเงิน :</label>
											<div class="col-sm-4">
												<input id="payCashAmount" class="form-control text-right">
											</div>
										</div>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType2">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-2">รหัสธนาคาร :</label>
											<div class="col-sm-4">
												<select id="payChqBankCode" class="form-control"></select>
											</div>
											<label class="control-label col-sm-2">เลขที่เช็ค :</label>
											<!-- ICE FIXED CODE ข้อ 23 เช็ค length = 7 -->
											<div class="col-sm-4">
												<input class="form-control" id="payChqNo" maxlength="7">
											</div>
											<!-- End ICE FIXED CODE ข้อ 23 -->
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2">ชื่อธนาคาร :</label>
											<div class="col-sm-4">
												<select id="payChqBankName" class="form-control"></select>
											</div>
											<label class="control-label col-sm-2">วันที่หน้าเช็ค
												:</label>
											<div class="col-sm-4">
												<div class="input-group input-append date"
													data-provide="datepicker" data-date-format="dd/mm/yyyy">
													<input class="form-control" id="payChqDate"
														placeholder="dd/MM/yyyy" maxlength="10"> <span
														class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2">สาขา :</label>
											<div class="col-sm-4">
												<input class="form-control" id="payChqBranch">
											</div>
											<label class="control-label col-sm-2">จำนวนเงิน :</label>
											<div class="col-sm-4">
												<input class="form-control text-right" id="payChqAmount">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right" id="payChqSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการเช็ค</a>
									<table id="payChqList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>รหัสธนาคาร</th>
												<th>ชื่อธนาคาร</th>
												<th>สาขา</th>
												<th>เลขที่เช็ค</th>
												<th>วันที่หน้าเช็ค</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType3">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-3">ประเภทบัตรเครดิต
												:</label>
											<div class="col-sm-3">
												<select class="form-control" id="payCCType"></select>
											</div>
											<label class="control-label col-sm-3">เลขที่บัตร :</label>
											<div class="col-sm-3">
												<input class="form-control" id="payCCNo" maxlength="16">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-3">ธนาคารเจ้าของเครื่อง
												(EDC) :</label>
											<div class="col-sm-3">
												<select class="form-control" id="payCCBankName"></select>
											</div>
											<label class="control-label col-sm-3">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input class="form-control text-right" id="payCCAmount">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right" id="payCCSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span>
										เพิ่มรายการบัตรเครดิต</a>
									<table id="payCCList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>ประเภทบัตรเครดิต</th>
												<th>เลขที่บัตร</th>
												<th>EDC</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType4">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-3">วันที่ธนาณัติ :</label>
											<div class="col-sm-3">
												<div class="input-group input-append date"
													data-provide="datepicker" data-date-format="dd/mm/yyyy">
													<input class="form-control" id="payMoneyOrderInputDate"
														placeholder="dd/MM/yyyy" maxlength="10"> <span
														class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<label class="control-label col-sm-3">เลขที่ธนาณัติ :</label>
											<!-- ICE FIXED CODE ข้อ 24 length เลขธนาณัติ = 9 -->
											<div class="col-sm-3">
												<input class="form-control" id="payMoneyOrderInputNo"
													maxlength="9">
											</div>
											<!-- End ICE FIXED CODE ข้อ 24 -->
										</div>
										<div class="form-group">
											<label class="control-label col-sm-3">รหัสไปรษณีย์ต้นทาง
												:</label>
											<!-- ICE FIXED CODE ข้อ 24 length postcode = 5 -->
											<div class="col-sm-3">
												<input class="form-control" id="payMoneyOrderInputPostCode"
													maxlength="5">
											</div>
											<!-- end ICE FIXED CODE ข้อ 24  -->
											<label class="control-label col-sm-3">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input class="form-control text-right"
													id="payMoneyOrderInputAmount">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right"
										id="payMoneyOrderButtonSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span>
										เพิ่มรายการธนาณัติ</a>
									<table id="payMoneyOrderTableList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>เลขที่ธนาณัติ</th>
												<th>วันที่ธนาณัติ</th>
												<th>รหัสไปรษณีต้นทาง</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType5">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-3">วันที่ตั๋วแลกเงิน
												:</label>
											<div class="col-sm-3">
												<div class="input-group input-append date"
													data-provide="datepicker" data-date-format="dd/mm/yyyy">
													<input class="form-control" id="payBillExchgInputDate"
														placeholder="dd/MM/yyyy" maxlength="10"> <span
														class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<label class="control-label col-sm-3">เลขที่ตั๋วแลกเงิน
												:</label>
											<!-- ICE FIXED CODE ข้อ 22 length เลขที่ตั๋วแลกเงิน = 9 -->
											<div class="col-sm-3">
												<input class="form-control" id="payBillExchgInputNo"
													maxlength="9">
											</div>
											<!--  end ICE FIXED CODE ข้อ 22 -->
										</div>
										<div class="form-group">
											<label class="control-label col-sm-3">รหัสไปรษณีย์ต้นทาง
												:</label>
											<!-- ICE FIXED CODE ข้อ 22 length postcode = 5 -->
											<div class="col-sm-3">
												<input class="form-control" id="payBillExchgInputPostCode"
													maxlength="5">
											</div>
											<!--  end ICE FIXED CODE ข้อ 22 -->
											<label class="control-label col-sm-3">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input class="form-control text-right"
													id="payBillExchgInputAmount">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right"
										id="payBillExchgButtonSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span>
										เพิ่มรายการตั๋วแลกเงิน</a>
									<table id="payBillExchgTableList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>เลขที่ตั๋วแลกเงิน</th>
												<th>วันที่ตั๋วแลกเงิน</th>
												<th>รหัสไปรษณีต้นทาง</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType6">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-9">เลขที่คูปอง :</label>
											<div class="col-sm-3">
												<input class="form-control" id="payCouponInputNo">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-9">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input class="form-control text-right"
													id="payCouponInputAmt">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right"
										id="payCouponButtonSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการคูปอง</a>
									<table id="payCouponTableList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>เลขที่คูปอง</th>
												<th>รายละเอียด</th>
												<th>วันที่หมดอายุ</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType7">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-4">รหัสธนาคาร :</label>
											<div class="col-sm-3">
												<select class="form-control" id="payBankTxnfInputBankCode"></select>
											</div>
											<label class="control-label col-sm-2">ชื่อธนาคาร :</label>
											<div class="col-sm-3">
												<select class="form-control" id="payBankTxnfInputBankName"></select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">สาขา :</label>
											<div class="col-sm-3">
												<select class="form-control"
													id="payBankTxnfDropDownBankBrnh"></select>
											</div>
											<label class="control-label col-sm-2">เลขที่อ้างอิง :</label>
											<div class="col-sm-3">
												<input class="form-control" id="payBankTxnfInputNo"
													maxlength="10">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">รหัสบัญชีเงินฝากธนาคาร
												:</label>
											<div class="col-sm-3">
												<select class="form-control"
													id="payBankTxnfDropDownBankAcCd"></select>
											</div>
											<label class="control-label col-sm-2">วันที่โอน :</label>
											<div class="col-sm-3">
												<div class="input-group input-append date"
													data-provide="datepicker" data-date-format="dd/mm/yyyy">
													<input class="form-control" id="payBankTxnfInputDate"
														placeholder="dd/MM/yyyy" maxlength="10"> <span
														class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">เลขที่บัญชีเงินฝากธนาคาร
												:</label>
											<div class="col-sm-3">
												<select class="form-control"
													id="payBankTxnfDropDownBankAcct"></select>
											</div>
											<label class="control-label col-sm-2">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input class="form-control text-right"
													id="payBankTxnfInputAmt">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right"
										id="payBankTxnfButtonSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น
										ๆ</a>
									<table id="payBankTxnfTableList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>รหัสธนาคาร</th>
												<th>ชื่อธนาคาร</th>
												<th>สาขา</th>
												<th>เลขที่อ้างอิง</th>
												<th>วันที่โอน</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType8">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-3">เลขที่เอกสาร/ปี
												:</label>
											<div class="col-sm-3">
												<input id="payOffsetDocumentNo" class="form-control">
											</div>
											<label class="control-label col-sm-3">รหัสบัญชี :</label>
											<div class="col-sm-3">
												<input id="payOffsetAccountCode" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-3">ชื่อบัญชี :</label>
											<div class="col-sm-3">
												<input id="payOffsetAccountName"
													class="form-control text-right">
											</div>
											<label class="control-label col-sm-3">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input id="payOffsetAmount" class="form-control text-right">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-10"></label>
											<div class="col-sm-2">
												<a class="btn btn-warning pull-right"
													id="payOffsetButtonSubmit"><span
													class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการ
													offset</a>
											</div>
										</div>
									</div>
									<table id="payOffsetTableList" class="table table-hover">
										<thead>
											<tr>
												<th data-running-no="true">#</th>
												<th>เลขที่เอกสาร/ปี</th>
												<th>รหัสบัญชี</th>
												<th>ชื่อบัญชี</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType11">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-3">สกุลเงินต่างประเทศ
												:</label>
											<div class="col-sm-3">
												<select class="form-control" id="currencyTypeSelect"
													onchange="addExchangRate()"></select>
											</div>
											<label class="control-label col-sm-3">อัตราแลกเปลี่ยน
												:</label>
											<div class="col-sm-3">
												<input class="form-control text-right"
													id="exchangeRateInput" value="0.00" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-3">วันที่โอน :</label>
											<div class="col-sm-3">
												<div class="input-group input-append date"
													data-provide="datepicker" data-date-format="dd/mm/yyyy">
													<input class="form-control" id="payDateInputDate"
														placeholder="dd/MM/yyyy" maxlength="10"> <span
														class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<label class="control-label col-sm-3">จำนวนเงินต่างประเทศ
												:</label>
											<div class="col-sm-3">
												<input class="form-control text-right"
													id="foreignAmountInput" onblur="convertAmount()">
											</div>
										</div>

										<div class="form-group">
											<label class="control-label col-sm-3 col-sm-offset-6">จำนวนเงิน(บาท)
												:</label>
											<div class="col-sm-3">
												<input class="form-control text-right" id="thAmountInput"
													readonly>
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right"
										id="payForeignButtonSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น
										ๆ</a>
									<table id="payForeignTableList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>สกุลเงินต่างประเทศ</th>
												<th>อัตราแลกเปลี่ยน</th>
												<th>วันที่โอน</th>
												<th data-align="right" data-number-format="true">จำนวนเงินต่างประเทศ</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน(บาท)</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType9">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-3">ช่องทางการชำระ
												:</label>
											<div class="col-sm-3">
												<select class="form-control" id="payOtherDropDownChannel"></select>
											</div>
											<label class="control-label col-sm-3">เลขที่อ้างอิง :</label>
											<div class="col-sm-3">
												<input class="form-control" id="payOtherInputNo">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-3">วันที่อ้างอิง :</label>
											<div class="col-sm-3">
												<div class="input-group input-append date"
													data-provide="datepicker" data-date-format="dd/mm/yyyy">
													<input class="form-control" id="payOtherInputDate"
														placeholder="dd/MM/yyyy" maxlength="10"> <span
														class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
											<label class="control-label col-sm-3">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input class="form-control text-right" id="payOtherInputAmt">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right" id="payOtherButtonSubmit"><span
										class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น
										ๆ</a>
									<table id="payOtherTableList" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>เลขที่อ้างอิง</th>
												<th>ช่องทางการรับชำระ</th>
												<th>วันที่รับชำระ</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<div role="tabpanel" class="tab-pane hide" id="payType10">
									<div class="form-horizontal">
										<div class="form-group">
											<label class="control-label col-sm-4">รหัสธนาคาร :</label>
											<div class="col-sm-3">
												<input class="form-control" id="payBankTxnfInputBankCodeGf"
													maxlength="5">
											</div>
											<label class="control-label col-sm-2">ชื่อธนาคาร :</label>
											<div class="col-sm-3">
												<select class="form-control" id="payBankTxnfInputBankNameGf"></select>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">สาขา :</label>
											<div class="col-sm-3">
												<select class="form-control"
													id="payBankTxnfDropDownBankBrnhGf"></select>
											</div>
											<label class="control-label col-sm-2">เลขที่อ้างอิง :</label>
											<div class="col-sm-3">
												<input class="form-control" id="payBankTxnfInputNoGf"
													maxlength="10">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">รหัสบัญชีเงินฝากธนาคาร
												:</label>
											<div class="col-sm-3">
												<select class="form-control"
													id="payBankTxnfDropDownBankAcCdGf"></select>
											</div>
											<label class="control-label col-sm-2">วันที่โอน :</label>
											<div class="col-sm-3">
												<div class="input-group input-append date"
													data-provide="datepicker" data-date-format="dd/mm/yyyy">
													<input class="form-control" id="payBankTxnfInputDateGf"
														placeholder="dd/MM/yyyy" maxlength="10"> <span
														class="input-group-addon add-on"><span
														class="glyphicon glyphicon-calendar"></span></span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-4">เลขที่บัญชีเงินฝากธนาคาร
												:</label>
											<div class="col-sm-3">
												<select class="form-control"
													id="payBankTxnfDropDownBankAcctGf"></select>
											</div>
											<label class="control-label col-sm-2">จำนวนเงิน :</label>
											<div class="col-sm-3">
												<input class="form-control text-right"
													id="payBankTxnfInputAmtGf">
											</div>
										</div>
									</div>
									<a class="btn btn-warning pull-right"
										id="payBankTxnfButtonSubmitGf"><span
										class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น
										ๆ</a>
									<table id="payBankTxnfTableListGf" class="table">
										<thead>
											<tr>
												<th data-align="center" data-running-no="true">#</th>
												<th>รหัสธนาคาร</th>
												<th>ชื่อธนาคาร</th>
												<th>สาขา</th>
												<th>เลขที่อ้างอิง</th>
												<th>วันที่โอน</th>
												<th data-align="right" data-number-format="true">จำนวนเงิน</th>
												<th></th>
											</tr>
										</thead>
									</table>
								</div>
								<a class="btn btn-primary pull-right" id="addPayType"
									style="margin-top: 1em"><span
									class="glyphicon glyphicon-plus-sign"></span>
									เพิ่มวิธีการรับชำระ</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--  <div id="linkPanel" class="row">
            <div class="col-md-5">
            <div class="col-md-13" align="right">
				<a id="addTaxType" class="btn btn-link"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการหัก</a>
            </div>
            </div>
            <div class="col-md-7">
            <div class="col-md-13" align="right">
				<a id="addPayType" class="btn btn-link"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มวิธีการรับชำระ</a>
            </div>
            </div>
            </div> -->
			<div id="informationPanel" class="row">
				<div class="col-md-5">
					<div class="panel panel-default">
						<div class="panel-heading">สรุปรายการหัก</div>
						<div class="panel-body">
							<table id="deductionList" class="table table-hover">
								<thead>
									<tr>
										<th data-running-no="true">#</th>
										<th>รายการหัก</th>
										<th data-align="right" data-number-format="true"
											class="text-right">จำนวนเงิน</th>
										<th></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<div class='col-md-7'>
					<div class="panel panel-default">
						<div class="panel-heading">สรุปวิธีการรับชำระ</div>
						<div class="panel-body">
							<table id="payTypeList" class="table table-hover">
								<thead>
									<tr>
										<th data-running-no="true">#</th>
										<th>วิธีการรับชำระ</th>
										<th data-align="right" data-number-format="true"
											class="text-right">จำนวนเงิน</th>
										<th></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<div class="modal fade" role="dialog" id="customerSearch">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<span class="glyphicon glyphicon-user"></span> ค้นหาลูกค้า
					</h4>
				</div>
				<div class="modal-body">
					<div id="advanceSearchMessageDialog"></div>
					<div class="tab-modefile">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								aria-controls="home" role="tab" data-toggle="tab">เลขที่ใบแจ้งค่าบริการ</a></li>
							<li role="presentation"><a href="#profiles" id="profile"
								aria-controls="profiles" role="tab" data-toggle="tab">หมายเลขบริการ</a></li>
							<li role="presentation"><a href="#messages" id="message"
								aria-controls="messages" role="tab" data-toggle="tab">ข้อมูลลูกค้า</a></li>
						</ul>
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="tab-content border-tab-content">
									<div role="tabpanel" class="tab-pane active" id="home">
										<div class="form-inline col-md-12">
											<div class="form-group col-md-12">
												<label>เลขที่ใบแจ้งค่าบริการ :</label>
												<div class="input-group col-md-8">
													<input type="text" class="form-control" id="advSrcBillNo"
														placeholder="กรุณาป้อนข้อมูลที่ต้องการค้นหาอย่างน้อย 6 ตัวอักษร">
													<span class="input-group-btn"><a
														id="advSrcBillNoBtn" class="btn btn-info"><span
															class="glyphicon glyphicon-search"></span> ค้นหา</a></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<table id="advSrcBillNoResultList" data-toggle="table"
													data-pagination="true" data-page-size="5"
													data-page-list="[5, 10, 20, 50, 100, 200]"
													data-cache="false">
													<thead>
														<tr>
															<th data-formatter="runningFormatter">#</th>
															<th data-field="acctNo">เลขที่ใบแจ้งค่าบริการ</th>
															<th data-field="customerId">เลขที่ลูกค้า</th>
															<th data-field="customerAccountName">ชื่อลูกค้า</th>
															<!--
                                                    <th data-field="propLabel">ประเภทบริการ</th>
                                                    -->
															<th data-field="billGroup">Billing Group</th>
															<th data-align="center" data-formatter="SelectButton"></th>
														</tr>
													</thead>
												</table>
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="profiles">
										<div class="form-horizontal">
											<div class="form-group">
												<!--
                                            <label class="control-label col-sm-2">ประเภทบริการ :</label>
                                            <div class="col-sm-4">
                                                <select id="advSrcSvcType" class="form-control"></select>
                                            </div>
                                            -->

												<label class="control-label col-sm-2">ชื่อบริการ :</label>
												<div class="col-sm-4">
													<select id="advSrcSvcType" class="form-control"></select>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2">หมายเลขบริการ
													:</label>
												<div class="col-sm-4">
													<div class="input-group">
														<input type="text" class="form-control" id="advSrcSvcNo">
														<span class="input-group-btn"><a
															id="advSrcSvcNoBtn" class="btn btn-info"><span
																class="glyphicon glyphicon-search"></span> ค้นหา</a></span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-2"></label>
												<div class="col-sm-4">
													<label class="checkbox-inline"> <input
														type="checkbox" name="advSrcSvcProperty" value="1">
														Property1
													</label> <label class="checkbox-inline"> <input
														type="checkbox" name="advSrcSvcProperty" value="2">
														Property2
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<table id="advSrcSvcNoResultList" name="tableproperty"
													class="table table-hover" data-toggle="table"
													data-pagination="true" data-page-size="5"
													data-page-list="[5, 10, 20, 50, 100, 200]"
													data-cache="false">
													<thead>
														<tr>
															<th data-formatter="runningFormatter">#</th>
															<th data-field="propertyOne">หมายเลขบริการ<br>(Property
																One)
															</th>
															<th data-field="propertyTwo">Property Two</th>
															<th data-field="catBillAcctNo">เลขที่ลูกค้า</th>
															<th data-field="customerName">ชื่อลูกค้า</th>
															<!--
                                                    <th data-field="propLabel">ประเภทบริการ</th>
                                                    -->
															<th data-field="billingGroupFull">Billing Group</th>
															<th data-align="center" data-formatter="SelectButton"></th>
														</tr>
													</thead>
												</table>
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="messages">
										<div class="form-horizontal">
											<div class="form-group">
												<label class="control-label col-sm-3">เลขที่ลูกค้า
													(BA) :</label>
												<div class="col-sm-3">
													<input class="form-control" id="advSrcCusNo">
												</div>
												<label class="control-label col-sm-3">เลขประจำตัวผู้เสียภาษี
													:</label>
												<div class="col-sm-3">
													<input class="form-control" id="advSrcCusTaxId">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3">ชื่อลูกค้า :</label>
												<div class="col-sm-3">
													<input class="form-control" id="advSrcCusFirstName">
												</div>
												<label class="control-label col-sm-3">นามสกุล :</label>
												<div class="col-sm-3">
													<input class="form-control" id="advSrcCusLastName">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3">ชื่อนิติบุคคล/ราชการ
													:</label>
												<div class="col-sm-6">
													<input class="form-control" id="advSrcOrgName">
												</div>
												<div class="col-sm-3"></div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-3">กลุ่มผู้ใช้บริการ
													:</label>
												<div class="col-sm-6">
													<select class="form-control" id="advInputCustomerSegment"></select>
												</div>
												<div class="col-sm-3">
													<a id="advSrcCusNoBtn" class="btn btn-info pull-right"><span
														class="glyphicon glyphicon-search"></span> ค้นหา</a>
												</div>
											</div>
										</div>

										<br>

										<div class="row">
											<div class="col-md-12">
												<table id="advSrcCusNoResultList" class="table table-hover"
													data-toggle="table" data-pagination="true"
													data-page-size="5"
													data-page-list="[5, 10, 20, 50, 100, 200]"
													data-cache="false">
													<thead>
														<tr>
															<th data-formatter="runningFormatter">#</th>
															<th data-field="customerId">เลขที่ลูกค้า (BA)</th>
															<th data-field="customerAccountName">ชื่อลูกค้า/ชื่อนิติบุคคล/ราชการ</th>
															<th data-field="customerTaxNo">TAX ID</th>
															<!--
                                                    <th data-field="propLabel">ประเภทบริการ</th>
                                                    -->
															<th data-field="billGroup">Billing Group</th>
															<th data-align="center" data-formatter="SelectButton"></th>
														</tr>
													</thead>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<i class="pull-left"><span class="glyphicon glyphicon-filter"></span>
						กรุณาป้อนข้อมูลที่ต้องการค้นหาอย่างน้อย 6 ตัวอักษร </i> <br>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" role="dialog" id="remarkModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">หมายเหตุ</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<span id="remark"></span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a class="btn btn-default" data-dismiss="modal"><span
						class="glyphicon glyphicon-ok-circle"></span> Ok</a>
				</div>
			</div>
		</div>
	</div>
	<script id="template" type="x-tmpl-mustache">
	<table  class="table table-striped table-bordered" style="width:70% !important">
		<thead>
			<tr>
				<th class="text-center">รหัสผลิตภัณฑ์</th>
				<th class="text-center">ชื่อผลิตภัณฑ์</th>
				<th class="text-center">ผลิตภัณฑ์ย่อย</th>
				<th class="text-center">ชื่อผลิตภัณฑ์ย่อย</th>
				<th class="text-center">ประเภทรายได้</th>
				<th class="text-center">ชื่อประเภทรายได้</th>
				<th class="text-center">จำนวนเงินก่อนภาษีมูลค่าเพิ่ม</th>
			</tr>
		</thead>
		<tbody>
		{{#invoices}}
			<tr>
			<td class="text-center">{{productCode}}</td>
			<td>{{productName}}</td>
			<td class="text-center">{{subProductCode}}</td>
			<td>{{subProductName}}</td>
			<td>{{revTypeCode}}</td>
			<td>{{revTypeName}}</td>
			<td class="text-right">{{amount}}</td>
			</tr>
		{{/invoices}}
		</tbody>
	</table>
	</script>
</body>
</html>
<script type="text/javascript">
    var invDisplay = '';
    var view = (function($){
        var self = this, defaultErrorMessage = "An error occurred but there is no message response.";
        self.session = function(key, val) { if (!val) { var val = window.sessionStorage.getItem(key); return val && (val.indexOf("{") > -1 || val.indexOf("[") > -1) ? JSON.parse(val) : val } window.sessionStorage.setItem(key, ($.type(val) != "object" && $.type(val) != "array" ? val : JSON.stringify(val)))	};
        self.utils = {
            guid: function(){ function r() { return Math.floor((Math.random() + 1) * 0x10000).toString(16).substring(1) } return r() + r() +"-"+ r() +"-"+ r() +"-"+ r() +"-"+ r() + r() + r() },
            numberFormat: function(num, dec) { return $.type(num) !== "number" ? "0.00" : num.toFixed(dec || 2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,'); },
            dateFormat: function() { var obj = arguments[0]; if ($.type(obj) == "string" && /[0-9]{2}.[0-9]{2}.[0-9]{4}/g) { return obj } else if ($.isNumeric(obj)) { var dt = new Date(obj), dd = dt.getDate().toString(), mm = (dt.getMonth() + 1).toString(), yyyy = dt.getFullYear().toString(); return (dd[1]?"":"0") + dd +"/"+ (mm[1]?"":"0") + mm +"/"+ yyyy } else if ($.type == "date") { return "" } return "" },
            dateTimeFormat: function() { var obj = arguments[0], dt = $.type(obj) != "date" ? ($.isNumeric(obj) ? new Date(obj) : new Date()) : new Date(), dd = dt.getDate().toString(), MM = (dt.getMonth() + 1).toString(), yyyy = dt.getFullYear().toString(), hh = dt.getHours().toString(), mm = dt.getMinutes().toString(), ss = dt.getSeconds().toString(); return (dd[1]?"":"0") + dd +"/"+ (MM[1]?"":"0") + MM +"/"+ yyyy +" "+ (hh[1]?"":"0") + hh +":"+ (mm[1]?"":"0") + mm +":"+ (ss[1]?"":"0") + ss },
            queryString: function() { var pos = location.href.indexOf("?"), obj = {}; if (pos < 0) return obj; var params = location.href.slice(pos + 1).split("&"); for (var i = 0, m = params.length; i < m; i++) { pos = params[i].indexOf("="); if (pos < 0) { obj[params[i]] = true; continue; } obj[params[i].substring(0, pos)] = params[i].substring(pos + 1) } return obj },
            window: function(windowName, url, side) { window.windowOpened = (window.windowOpened || {}); var screenProp = ""; if (side == "left") { screenProp = "left=0,top=0,width="+ (screen.width/2) +",height="+ (screen.height-100) } else if (side == "right") { screenProp = "left="+ (screen.width/2-40) +",top=0,width="+ (screen.width/2+40) +",height="+ (screen.height-100) } window.windowOpened[windowName] = window.open(url, windowName, "menubar=no,scrollbars=no,resizable=0,"+ screenProp, false); return window.windowOpened }
        };
        //// AUTOMATIC REGISTER FORMATTER FUNCTION ////
        window.get = function(url, params, success, msgDialog, preCheck){ $.ajax({ "url": url, "type": "GET", "data": params, "error": (msgDialog || { "valid": function(jqXHR, textStatus, errorThrow){ console.log(jqXHR); console.log("textStatus: "+ textStatus); console.log("errorThrow:"); console.log(errorThrow) } }).valid, "success": function(res){ var isNotJson = res.constructor == String; console.log(res); (preCheck || function(o){})(res); if (isNotJson) res = { "statusCode": "99", "errorList": ["No matching data found."] }; if (msgDialog && !msgDialog.valid(res)) { return; } success(res) } }) }
        window.post = function(url, params, success, msgDialog, preCheck){ $.ajax({ "url": url, "type": "POST", "data": params, "error": (msgDialog || { "valid": function(jqXHR, textStatus, errorThrow){ console.log(jqXHR); console.log("textStatus: "+ textStatus); console.log("errorThrow:"); console.log(errorThrow) } }).valid, "success": function(res){ var isNotJson = res.constructor == String; console.log(res); (preCheck || function(o){})(res); if (isNotJson) res = { "statusCode": "99", "errorList": ["No matching data found."] }; if (msgDialog && !msgDialog.valid(res)) { return; } success(res) } }) }
        window.add = function(num1, num2, dec) { if (!dec) dec = 2; return parseFloat((num1 + num2).toFixed(dec), 10); }; window.subtract = function(num1, num2, dec){ if (!dec) dec = 2; return parseFloat((num1 - num2).toFixed(dec), 10); }; window.multiply = function(num1, num2, dec){ if (!dec) dec = 2; return parseFloat((num1 * num2).toFixed(dec), 10); }; window.divide = function(num1, num2, dec){ if (!dec) dec = 2; return parseFloat((num1 / num2).toFixed(dec), 10); }
        window.find = function(array, propName, obj){ var tmp; for (var i = 0, m = array.length; i < m; i++) { if (array[i][propName] == obj[propName]) tmp = array[i]; } if (tmp == null) { array.push(tmp = obj); } return tmp; }
        window.toMap = function(array, propNames){ var map = {}, prop; function key(obj){ var p = []; for (var i = 0, m = propNames.length; i < m; i++) { p.push(obj[propNames[i]]) } return p.join() }; for (var i = 0, m = array.length; i < m; i++) { prop = key(array[i]); map[prop] = array[i] } return map }
        window.stripToNumber = function(str) { return $.type(str) === "string" && $.isNumeric(str = str.replace(/[^0-9\.]/g, "")) ? parseFloat(str, 10) : 0 }
        window.runningFormatter = function(val, row, ind) { return ind + 1 }
        window.numberFormatter = function(val, row, ind) { return !$.isNumeric(stripToNumber(val)) ? "0.00" : parseFloat(val, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,') }
        window.numberFormatterWithCurrency = function(val, row, ind) {
            var currencyCode = "฿";
            if(row.currencyCode == "1"){
                currencyCode = "$";
            }
            return !$.isNumeric(stripToNumber(val)) ? "0.00"+currencyCode : parseFloat(val, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,')+currencyCode }
        window.numberFormatter2 = function(val, row, ind) {
            return !$.isNumeric(stripToNumber(val)) || val == 0 ? "-" : parseFloat(val, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,') }
        window.stringInputFormatter = function(val, row, ind) { return '<input value="'+ $.trim(val) +'" maxLength="40" class="form-control">' }
        window.numberInputFormatter = function(val, row, ind) { return '<input value="'+ self.utils.numberFormat(parseFloat(val || "0.00", 10)) +'" maxLength="10" style="width:100px" class="form-control text-right" onkeypress="return $.isNumeric(String.fromCharCode(event.which)) || (event.which == 46 && this.value.indexOf(\'.\') == -1)" onfocus="(function(o){ o.value = o.value.replace(/[,]/g, \'\') })(this)" onblur="(function(o){ o.value = parseFloat(o.value, 10).toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, \'$1,\'); })(this)">' }
        window.moneyInputFormatter = function(val, row, ind) {
        	var value = parseFloat(val || "0.00", 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
        	var currencySymbol = "฿";
        	/* if (row != null) {
        	    var currencySymbol = chkCurrencySymbol(row.currencyCode);
        	    console.log("symbol is >>>>>> " + currencySymbol)
        	}; */
        	return '<div class="input-group"><span class="input-group-addon" id="basic-addon1" style="padding:2px 4px;">' + currencySymbol + '</span><input value="' + value + '" id="received_' + ind + '"  maxLength="10" style="width:100px" class="form-control text-right" onkeypress="return $.isNumeric(String.fromCharCode(event.which)) || (event.which == 46 && this.value.indexOf(\'.\') == -1)" onkeyup="if (event.which == 13) this.blur()" onfocus="(function(o){ o.value = o.value.replace(/[,]/g, \'\'); o.select() })(this)" onblur="(function(o){ o.value = parseFloat(o.value, 10).toFixed(2).replace(/(\\d)(?=(\\d{3})+\\.)/g, \'$1,\'); o.style.backgroundColor = o.value !== \'' + value + '\' ? \'yellow\' : \'\'; var table, elem = o; while (table == null) { elem = elem.parentNode; if (elem.tagName == \'TABLE\') table = elem; } (window[table.id +\'InputBlurEvent\'] || function(t){ console.log(t) })(table) })(this)"></div>'

        }

        window.modifyButtonFormatter = function(val, row, ind) { return '<a class="btn btn-link modList" onclick=\'(function(elem, row, ind){ var table = $("#"+ $(elem).closest("table")[0].id); window[table[0].id +"ModifyEvent"](table, row, ind) })(this, '+ JSON.stringify(row) +', '+ ind +')\'><span class="glyphicon glyphicon-pencil"></span></a>' }
        window.removeButtonFormatter = function(val, row, ind) { return '<a class="btn btn-link delList" onclick=\'(function(elem, row, ind){ $("#"+ $(elem).closest("table")[0].id).bootstrapTable("remove", { field: "index", values: [ind] }) })(this, '+ JSON.stringify(row) +', '+ ind +')\'><span class="glyphicon glyphicon-trash"></span></a>' }
        window.LoadingPanel = function(id) { var obj = this, loadCnt = 0, setupFunc, loadFunc; function checkElemReady(){ if ((obj.elem = $("#"+ id).css("font", "")).length != 1) { alert("The element hasn't insert into HTML DOM."); throw "The element hasn't insert into HTML DOM."; } clearTimeout(setupFunc); clearInterval(loadFunc) }; return { "elem": null, "finish": function(html){ checkElemReady(); (this.elem ? this.elem : this.elem = $("#"+ id)).css("font", "").html(html); return this }, "toString": function(){ var elem; setupFunc = setTimeout(function(){ loadFunc = setInterval(function(){ (elem || (elem = document.getElementById(id))).innerHTML = "Loading"+ Array(++loadCnt).join(".."); if (loadCnt > 60) loadCnt = 2 }, 250) }, 1000); return "<div id='"+ id +"' style='font:BOLD 16pt Arial'></div>" } } }
        window.remarkIconFormatter = function(val, row, ind) {if(row.remark != null){return '<a  style="cursor: pointer" onclick="modalPopupRemark('+"'"+row.remark+"'"+')"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></a>';}}
        function Button(el) { var obj = this, badge; obj.el = el; obj.elem = $(el);
            obj.hide = function() { this.elem.addClass("hide"); return this }; obj.show = function() { this.elem.removeClass("hide"); return this };
            obj.hideLoad = function(){ obj.elem.button("reset"); return this }; obj.showLoad = function(){ obj.elem.button("loading"); return this };
            obj.disable = function(flag) { if (flag == null || flag) this.elem.addClass("disabled").attr("disabled", true); else this.elem.removeClass("disabled").attr("disabled", false); return this }; obj.enable = function() { obj.disable(false); return this };
            obj.badge = function(val) { if (badge) badge.text(val) }; if ((badge = this.elem.next()).length == 0) badge = null;
            obj.elem.click(window[el.substring(1) +"ClickEvent"]);
        }
        function Message(el) { var obj = this, timeCnt = 0, loadFunc; obj.el = el; obj.elem = $(el);
            obj.hide = function() { obj.elem.addClass("hide"); return obj };
            obj.show = function(flag) { if (flag == null || flag) obj.elem.removeClass("hide"); else obj.hide(); return obj };
            obj.clear = function() { obj.elem.find("*").remove(); obj.hide(); return obj };
            obj.message = function(arr, cls) { $.each(arr, function(i,o) { var m = o; if ($.type(o) === "object") { m = (o.desc || o.messageDesc) +" [code="+ (o.code || o.messageCode) +"]" }; obj.elem.append('<div class="'+ cls +'">'+ m +'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button></div>') }); window.scrollTo(0, 0); return obj };
            obj.error = function(arr) { return obj.message(arr, "alert alert-danger") };
            obj.warn = function(arr) { return obj.message(arr, "alert alert-warning") };
            obj.success = function(arr) { return obj.message(arr, "alert alert-success") };
            obj.valid = function(jqXHR, textStatus, errorThrow){ var res = jqXHR; obj.stopLoad(); if (jqXHR && jqXHR.responseJSON) res = jqXHR.responseJSON; if (res) { var isNoData = false; if (res.statusCode && res.statusCode != "0") { obj.warn(res && $.type(res.warningList) === 'array' ? res.warningList : []).error(res && $.type(res.errorList) === 'array' ? res.errorList : ["An error occurred on the server side but there is no error message returned."]).show(); return false } if (res.data && res.statusCode == '0' && res.data.length < 1) isNoData = true; if ($.type(res._embedded) === 'object' && $.map(res._embedded,function(v,k){return v}).length < 1) isNoData = true; if (isNoData) { return false } return true } obj.error(["An error occurred on the server side but there is no error message returned."]).show(); return false }
            obj.hideLoad = function(){ obj.stopLoad().clear(); return this }; obj.stopLoad = function(){ clearInterval(loadFunc); return this }
            obj.showLoad = function(msg){ obj.elem.append('<div id="'+ obj.el +'-loading" class="alert alert-warning">'+ bind(msg, 0) +'</div>'); timeCnt = 0; var elem = document.getElementById(obj.el +"-loading"); loadFunc = setInterval(function(){ elem.innerHTML = bind(msg, ++timeCnt) }, 1000); obj.show(); return this }
            function bind(msg, timeCnt) { return msg.replace(/\{timeCnt\}/g, timeCnt) }
        }
        function Panel(el, hide) { var obj = this, dura = 500, counter = 0, cntFunc; obj.el = el; obj.elem = $(el); if ($.inArray(obj.elem[0].tagName.toLowerCase(), ["ol", "ul"]) > -1) { obj.elem.removeAttr("id").css("display", "").removeClass("hide").removeClass("hidden"); obj.elem = obj.elem.wrap('<div id="'+ el.substring(1) +'"></div>').parent(); } var children = obj.elem.children(), bodyEl = el.substring(1) +'-body', body = obj.elem.append('<div style="'+ (hide == null || hide ? "display: none" : "") +'" id="'+ bodyEl +'"></div>').find("#"+ bodyEl).append(children), progressType, progress = obj.elem.append('<div class="progress" style="display: none"><div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span class="sr-only">0% Complete</span></div></div>').find(".progress");
            obj.center = function(){ obj.elem.removeClass(["text-left", "text-right"]).addClass("text-center"); return this }; obj.right = function(){ obj.elem.removeClass(["text-left", "text-center"]).addClass("text-right"); return this }
            obj.hide = function(ms) { if (isHidden()) return this; body.hide(ms || dura); return this }; obj.show = function(ms) { if (!isHidden()) return this; if (!ms || !$.isNumeric(ms)) ms = dura; if (ms >= 0) body.css("display", "none").removeClass("hide").removeClass("hidden").show(ms); else obj.hide(Math.abs(ms)); return this }
            obj.slideDown = function(ms){ if (isHidden()) { body.css("display", "none").removeClass("hide").removeClass("hidden").slideDown(ms || dura, arguments[1] || function(){}) } return this }; obj.slideUp = function(ms){ if (!isHidden()) { body.slideUp(ms || dura, arguments[1] || function(){}) } return this }
            obj.progress = function(){ return { "elem": progress, "show": function(ms){ body.slideUp(ms || 10); progress.slideDown(); return this }, "hide": function(ms){ body.slideDown(ms || 10); progress.slideUp(); return this }
                ,"success": function(){ return this.style("progress-bar-success") }, "info": function(){ return this.style("progress-bar-info") }, "warn": function(){ return this.style("progress-bar-warning") }, "error": function(){ return this.style("progress-bar-danger") }, "plain": function(){ return obj.style("") }, "style": function(clsName) { $(this.elem[0].childNodes[0]).removeClass(progressType).addClass(progressType = clsName); return this }
                ,"percent": function(perc){ if (!$.isNumeric(perc) || (perc > 100 || perc < 0)) return this; this.elem[0].childNodes[0].style.width = perc +"%"; return this }
                ,"timeCnt": function(seconds) { var o = this; this.percent(counter = 0); cntFunc = setInterval(function(){ o.percent(100/seconds * ++counter); if (seconds < counter) { clearInterval(cntFunc); o.hide(1000) } }, 1000); return this }
            } }; function isHidden() { return body.css("display") === "none" || body.hasClass("hide") || body.hasClass("hidden") }; obj.elem.css("display", "").removeClass("hide").removeClass("hidden");
        }
        function CheckBox(el) { var obj = this; obj.el = el; obj.elem = $(el); obj.elem.click(window[obj.elem.attr("name") +"ClickEvent"])
            obj.disable = function() { obj.elem.attr("disabled", arguments.length == 0 || (arguments.length == 1 && (arguments[0] == "true" || arguments[0] == true))); return this }
            obj.contains = function(val) { return $.inArray(val, obj.val()) > -1 };
            obj.val = function() { return obj.elem.filter(":checked").map(function(i,o){ return o.value }) };
            obj.unchecked = function(){ obj.elem.each(function(i,o){ o.checked = false }); return this }
        }
        function Input(el, maxLen, propPos) { var obj = this; obj.el = el; obj.elem = $(el);
            obj.error = function(flag) { if (arguments.length == 0 || flag) obj.elem.parent().addClass("has-error"); else obj.elem.parent().removeClass("has-error"); return this }
            obj.clear = function() { obj.val(""); return this }; obj.isEmpty = function() { return $.trim(obj.val()) === "" }; obj.isNumeric = function() { return $.isNumeric(obj.val()) }
            obj.nextFocus = function(nextElem) { if (nextElem && "Input|Button".indexOf(nextElem.constructor.name) > -1) { obj.elem.keyup(function(e){ var key = (e.which || e.keyCode || e.charCode || 0); if (key == 13) nextElem.elem.focus(); return true }) } return this };
            obj.click = function(func) { obj.elem.click(func); return this }
            obj.readOnly = function(flag) { obj.elem.attr("readonly", (flag == null ? true : flag)); return this }
            obj.disable = function(flag) { obj.elem.attr("disabled", (flag == null ? true : flag)); return this }
            obj.enable = function() { obj.disable(false); return this }
            obj.val = function() { if (arguments.length == 1) { this.elem.val(arguments[0]) } return $.trim(this.elem.val()) }
            obj.get = function(propName) { if ($.type(propPos[propName]) !== "array" || propPos[propName].length !== 2) return ""; return obj.val().substring(propPos[propName][0], propPos[propName][1]) }
            obj.elem.blur(window[el.substring(1) +"BlurEvent"]); obj.elem.keyup(function(e){ var func = (window[el.substring(1) +"KeyUpEvent"] || function(){}); func((e.which || e.keyCode || e.charCode || 0), obj.elem) }); obj.elem.focus(function(){ this.select() }); if ($.isNumeric(maxLen)) { obj.elem.attr("maxLength", maxLen) }
        }
        function NumberInput(el, dec) { var obj = this, decimal = (dec == null ? 2 : dec); obj.el = el; obj.elem = $(el).addClass("text-right");
            obj.val = function() { if (arguments.length == 0) return parseFloat(strip(this.elem.val() || "0"), 10); this.elem.val(format(arguments[0])); return this }
            obj.decimal = function(dec) { decimal = dec }; obj.format = format;
            obj.disable = function(){ obj.elem.attr("disabled", (arguments.length != 1 ? true : arguments[0])); return obj }; obj.enable = function(){ obj.disable(false); return obj }; obj.readOnly = function(flag) { obj.elem.attr("readonly", (flag == null ? true : flag)); return this }
            obj.elem.keypress(function(e) { var key = (e.which || e.keyCode || e.charCode || 0); var ch = String.fromCharCode(key); return "0123456789.".indexOf(ch) > -1 });
            obj.elem.focus(function(){ this.value = strip(this.value); this.select() });
            obj.elem.blur(function(){ this.value = format(this.value) });
            function format(val) { var str = ($.isNumeric(val) ? parseFloat(val, 10) : obj.val()).toFixed(decimal == 0 ? 1 : decimal).replace(/(\d)(?=(\d{3})+\.)/g, '$1,'); return decimal == 0 ? str.substring(0, str.lastIndexOf(".")) : str };
            function strip(str) { return (str || "").replace(/[,]/g, "") }
            obj.elem.blur(window[el.substring(1) +"BlurEvent"]); obj.elem.keyup(function(e){ var key = (e.which || e.keyCode || e.charCode || 0), func = (window[el.substring(1) +"KeyUpEvent"] || function(){}); func(key, obj.elem); if (key == 13) this.blur() }); obj.elem.focus(function(){ this.select() })
            if (obj.elem.val() == "") obj.elem.val("0" + (decimal < 1 ? "" : "."+ Array(decimal + 1).join("0")));
        }
        function DropDown(el, url) { var obj = this, data = [{ key: "", value: "", text: "Please Select" }]; obj.el = el; obj.elem = $(el);
            obj.data = function(array) { if ($.type(array) == "array") { setup(data = array); return this } return data; };
            obj.init = function(url) { if (url) $.get(url, function(res) { setup(data = res.data) }); else setup(data); return this };
            obj.index = function() { if (arguments.length == 1) { var maxLen = data.length, index = arguments[0]; obj.elem.find("option").each(function(i, opt){ opt.removeAttribute("selected") }).eq(index < 0 ? maxLen + index : index).attr("selected", true); return this } return $.inArray("selected", obj.elem.find("option").map(function(i, opt){ return opt.selected ? "selected" : "no-selected" })) }
            obj.selected = function(){ return data[obj.index()]; }; obj.val = function() { return obj.elem.val(); }; obj.key = function(){ if (arguments.length == 0) { var key = obj.elem.find("option:selected").data("key"); if (typeof key === "string" && key === "undefined") { var item = data[obj.index()]; key = item && item.key ? item.key : item.id } return key } var key = arguments[0]; for (var i = 0, m = data.length; i < m; i++) { var item = data[i]; if (item.key && item.key == key) { obj.index(i); break; } if (item.id && item.id == key) { obj.index(i); break; } } return this }
            obj.error = function(flag) { if (arguments.length == 0 || flag) obj.elem.parent().addClass("has-error"); else obj.elem.parent().removeClass("has-error"); return this }

            function setup(array) { obj.elem.find("*").remove(); $.each(array,function(i,o){ obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.key +'" value="'+ o.value +'">'+ (o.text || o.value) +'</option>') }); }
            data = obj.elem.change(window[el.substring(1) +"ChangeEvent"]).find("option").map(function(i, opt){ return { key: opt.getAttribute("data-key"), value: opt.value, text: opt.textContent } });
        }
        function Listbox(el, url) { var obj = this, data = []; obj.el = el; obj.elem = $(el);
            obj.data = function(array) { if ($.type(array) == "array") { setup(data = array); return this } return data; };
            obj.init = function(url) { if (url) $.get(url, function(res) { setup(data = res.data) }); else setup(data); return this };
            obj.index = function() { if (arguments.length == 1) { var maxLen = data.length, index = arguments[0]; obj.elem.find("option").each(function(i, opt){ opt.removeAttribute("selected") }).eq(index < 0 ? maxLen + index : index).attr("selected", true); return this } return $.inArray("selected", obj.elem.find("option").map(function(i, opt){ return opt.selected ? "selected" : "no-selected" })) }
            obj.selected = function(){ return data[obj.index()]; }; obj.val = function() { return obj.elem.val(); };
            obj.key = function(){ if (arguments.length == 0) { var key = obj.elem.find("option:selected").data("key"); if (typeof key === "string" && key === "undefined") { var item = data[obj.index()]; key = item && item.key ? item.key : item.id } return key } var key = arguments[0]; for (var i = 0, m = data.length; i < m; i++) { var item = data[i]; if (item.key && item.key == key) { obj.index(i); break; } if (item.id && item.id == key) { obj.index(i); break; } } return this }
            function setup(array) {
                //array.unshift({ key: "", value: "กรุณาเลือก"});
            obj.elem.find("*").remove();
            obj.elem.append('<option data-index="-1" data-key="-1" value="-1">ทั้งหมด</option>');
            $.each(array,function(i,o){ obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.key +'" value="'+ o.key +'">'+ (o.value) +'</option>') }); }
            data = obj.elem.change(window[el.substring(1) +"ChangeEvent"]).find("option").map(function(i, opt){ return { key: opt.getAttribute("data-key"), value: opt.value, text: opt.textContent } });
        }
        function ListboxBillingGroup(el, url) { var obj = this, data = [{ key: "", value: "", text: "กรุณาเลือก" }]; obj.el = el; obj.elem = $(el);
            obj.data = function(array) { if ($.type(array) == "array") { setup(data = array); return this } return data; };
            obj.init = function(url) { if (url) $.get(url, function(res) { setup(data = res.data) }); else setup(data); return this };
            obj.index = function() { if (arguments.length == 1) { var maxLen = data.length, index = arguments[0]; obj.elem.find("option").each(function(i, opt){ opt.removeAttribute("selected") }).eq(index < 0 ? maxLen + index : index).attr("selected", true); return this } return $.inArray("selected", obj.elem.find("option").map(function(i, opt){ return opt.selected ? "selected" : "no-selected" })) }
            obj.selected = function(){ return data[obj.index()]; }; obj.val = function() { return obj.elem.val(); }; obj.key = function(){ if (arguments.length == 0) { var key = obj.elem.find("option:selected").data("key"); if (typeof key === "string" && key === "undefined") { var item = data[obj.index()]; key = item && item.key ? item.key : item.id } return key } var key = arguments[0]; for (var i = 0, m = data.length; i < m; i++) { var item = data[i]; if (item.key && item.key == key) { obj.index(i); break; } if (item.id && item.id == key) { obj.index(i); break; } } return this }
            function setup(array) {
                obj.elem.find("*").remove();
                obj.elem.append('<option data-index="-1" data-key="-1" value="-1">ทั้งหมด</option>');
                $.each(array,function(i,o){ obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.key +'" value="'+ o.key +'">'+ (o.value) +'</option>') }); }
            data = obj.elem.change(window[el.substring(1) +"ChangeEvent"]).find("option").map(function(i, opt){ return { key: opt.getAttribute("data-key"), value: opt.value, text: opt.textContent } });
        }
        function BootstrapTable(el, options) { var obj = this, rawData = [],

        	successFunc = function(){}, checkEvt = function(e){ console.log(e) }, uncheckEvt = checkEvt; obj.el = el; rowDataList = [];obj.elem = $(el).bootstrapTable(options = $.extend({ uniqueId: "id", responseHandler: function(res){ if (!res) return []; if (res.constructor === Array) return res; if (!res.data || res.data.constructor !== Array) return []; return res.data }, onLoadSuccess: function(res){ rawData = res; obj.resetView(400); successFunc(res) }, onCheck: window[el.substring(1) +"CheckEvent"], onUncheck: window[el.substring(1) +"UncheckEvent"], onCheckAll: window[el.substring(1) +"CheckAllEvent"], onUncheckAll: window[el.substring(1) +"UncheckAllEvent"] }, options));
            obj.clear = function() { obj.elem.bootstrapTable("removeAll"); return obj }; obj.remove = function(index){ obj.elem.bootstrapTable("remove", { field: "index", values: [index] }); return this }; obj.resetView = function(ms){ setTimeout(function(){ obj.elem.bootstrapTable("resetView") }, ms || 200); return this }; obj.isEmpty = function(){ return obj.data().length == 0 }
            obj.showLoad = function() { this.elem.bootstrapTable("showLoading"); return this }; obj.hideLoad = function() { this.elem.bootstrapTable("hideLoading"); return this };
            obj.update = function(rec){ var id = rec.id, index = rec.index, row; if ((row = obj.getId(id)) != null) { obj.elem.bootstrapTable("updateRow", { "index": row.index, "row": $.extend(row, rec) }) } else if ((row = obj.data()[index]) != null) { obj.elem.bootstrapTable("updateRow", { "index": index, "row": $.extend(row, rec) }) } else obj.insert(rec); return this }; obj.insert = function(row) { var data = obj.elem.bootstrapTable("getData"); obj.elem.bootstrapTable("insertRow", { "index": data.length, "row": $.extend(row, { "index": data.length }) }); return this }
            obj.find = function(field, value) { var data = obj.elem.bootstrapTable("getData"); return $.map(data, function(o,i){ return o[field] === value ? o : null }) }
            obj.map = function(col) { var resultMap = {}; $.each(obj.data(), function(ind, row){ resultMap[row[col]] = row }); return resultMap }
            obj.rawData = function() { if (arguments.length == 1) { this.elem.bootstrapTable("load", rawData = arguments[0]); return this } return $.map(this.elem.bootstrapTable("getData"), function(row){ return row }) }; obj.getSelections = function(){ return obj.elem.bootstrapTable("getAllSelections") }
            obj.getRowDataList = function(){ return this.rowDataList; };
            obj.rawDataList = function(){ if (arguments.length == 1) { rowDataList.push(arguments[0]); } else { return rowDataList; } };
            obj.data = function() { var data = []; obj.elem.find("tbody tr").each(function(i,o){ var row = o, record = []; for (var j = 0, n = row.childNodes.length; j < n; j++) { var col = row.childNodes[j], val = ""; if (col.childNodes.length != 1) val = ""; else if (col.childNodes[0].nodeType == 3) val = $.trim(col.childNodes[0].textContent); else if (col.childNodes[0].nodeName == "INPUT") { var elm = col.childNodes[0], isText = elm.type == "text"; val = $.trim(isText ? elm.value : ((elm.type == "checkbox" || elm.type == "radio") && elm.checked ? elm.value : "")) } else if (col.childNodes[0].nodeName == "DIV") val = $.trim(col.childNodes[0].childNodes[0].value); record.push(val) } data.push(record) }); return data };
            obj.selected = function() { var data = []; obj.elem.find("tbody tr").find("input[type=checkbox]:checked, input[type=radio]:checked").each(function(i,o){ var row = o.parentNode.parentNode, record = []; for (var j = 0, n = row.childNodes.length; j < n; j++) { var col = row.childNodes[j], val = ""; if (col.childNodes.length != 1) val = ""; else if (col.childNodes[0].nodeType == 3) val = $.trim(col.childNodes[0].textContent); else if (col.childNodes[0].nodeName == "INPUT") val = $.trim(col.childNodes[0].value); else if (col.childNodes[0].nodeName == "DIV") val = $.trim(col.childNodes[0].childNodes[0].value); record.push(val) } data.push(record) }); return data };
            obj.getId = function(id) { var o = obj.elem.bootstrapTable("getRowByUniqueId", id); if ($.type(o) == "array") return null; return o[options.uniqueId] == id ? o : null }; obj.delId = function(id) { obj.elem.bootstrapTable("removeByUniqueId", id); return this }; // options: { uniqueId: "fieldName" }
            obj.filter = function(func) { var filteredRow, filteredData = []; for (var i = 0, m = rawData.length; i < m; i++) { if (filteredRow = func(rawData[i])) filteredData.push(filteredRow) } obj.elem.bootstrapTable("load", filteredData); return this }
            obj.sum = function(isAll, colName) { var sum = 0; $.each(this.elem.bootstrapTable(isAll ? "getData" : "getSelections"), function(i,o){ sum += (o[colName] || 0) }); return sum };
            obj.sumInput = function(index) { var sum = 0; obj.elem.find("tbody tr").each(function(i,o){ var val = o.children[index].children[0].value.replace(/[,]/g, ""); sum += (!$.isNumeric(val) ? 0 : parseFloat(val, 10)) }); return sum }
            obj.http = function(url, urlParams, succFunc) { if (succFunc) successFunc = succFunc; obj.elem.bootstrapTable("refresh", { "url": url, "query": urlParams }); return this }
            obj.expand = function() { obj.elem.find(".detail-icon i.icon-plus").click(); return this }; obj.collapse = function() { obj.elem.find(".detail-icon i.icon-minus").click(); return this };
            obj.checkAll = function(){ var checked = arguments.length == 0 || arguments[0] == true || ($.type(arguments[0]) == "boolean" ? arguments[0] : arguments[0] == "true"), data = obj.elem.bootstrapTable("getData"); $.each(obj.elem.bootstrapTable("getOptions").columns[0], function(i, col){ if (col.checkbox) $.each(data, function(j, row){ row[col.field] = checked }) }); return this }; obj.uncheckAll = function(){ obj.checkAll(false); return this }
            obj.elem.on("check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table", window[el.substring(1) +"CheckBoxEvent"])
        }
        function AuthenticationDialog(succFunc, failFunc, url, title, usrLabel, pwdLabel, okBtn, cnBtn) { var obj = this, done = succFunc, fail = failFunc, cancel = function(){}; obj.el = "modal_authentication";
            var content = '<div class="row"><div class="col-md-12"><div class="col-md-offset-2 col-md-10"><div class="form-horizontal"><div class="form-group"><label class="col-sm-3 control-label">'+ (usrLabel || "User Name :") +'</label><div class="col-sm-6"><input type="text" id="discApprUser" class="form-control"></div></div><div class="form-group"><label class="col-sm-3 control-label">'+ (pwdLabel || "Password :") +'</label><div class="col-sm-6"><input type="password" class="form-control"></div></div></div></div></div></div>';
            var hdrCS = '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
            var hdrTT = '<h4 class="modal-title"><span class="glyphicon glyphicon-user"></span> '+ (title || "Authentication") +'</h4>';
            var divMG = '<div class="alert alert-danger hide"></div>';
            var btnOK = '<button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok-circle"></span> '+ (okBtn || "OK") +'</button>';
            var btnCN = '<button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> '+ (cnBtn || "Cancel") +'</button>';
            obj.elem = $(document.body).append('<div class="modal fade" role="dialog" data-backdrop="static" id="'+ obj.el +'"><div class="modal-dialog"><div class="modal-content"><div class="modal-header">'+ hdrCS + hdrTT +'</div><div class="modal-body">'+ divMG + content +'</div><div class="modal-footer">'+ btnOK + btnCN +'</div></div></div></div>').find("#"+ obj.el);
            obj.elem.find("button").eq(1).on({ click: function(){ var inputs = obj.elem.find("input"); $.post(url, { username: inputs.eq(0).val(), password: inputs.eq(1).val() }, function(res){ if (!res || res.statusCode != "0") { obj.elem.find(".alert").text("You don't have permission to access this feature. Please contact to Administration for more information.").removeClass("hide"); fail(res); return; } done(res); obj.hide() }) } }).end().filter(function(index){ return index == 0 || index == 2 }).on({ click: function(){ cancel() } })
            obj.show = function(){ obj.elem.modal("show"); obj.elem.find("div.alert").addClass("hide").text(""); return this }; obj.hide = function(){ obj.elem.modal("hide"); return this }
            obj.done = function(func) { done = func; return this }; obj.fail = function(func) { fail = func; return this }; obj.cancel = function(func) { cancel = func; return this }
        }
        function Radio(el) { var obj = this; obj.el = el; obj.elem = $(el);
            obj.disable = function(){ if (arguments.length == 2 && $.isNumeric(arguments[0])) obj.elem.eq(arguments[0]).attr("disabled", (arguments[1] != null && $.type(arguments[1]) == 'boolean' ? arguments[1] : false)); return this }; obj.enable = function(){ obj.disable(false); return this }
            obj.label = function() { return this.elem.filter(":checked").data("label") };
            obj.type = function() { return this.elem.filter(":checked").data("type") };
            obj.val = function() { var s = this.elem.filter(":checked"),val = s.val(); return !val ? s.data("label") : val };
            obj.checked = function(index) { obj.elem.eq(index).attr("checked", true); return this }
            obj.unchecked = function() { obj.elem.each(function(i,o){ o.checked = false }); return this }
            obj.click = function(evt) { obj.elem.each(function(i,o){ $(o).click(function(e){ if (o.checked) evt(o.value) }) }); return this }
        }
        self.button = new(function(){
            var that = this;
            that.setTaxType = new ButtonGroup("#setTaxType");
            that.setPayType = new ButtonGroup("#setPayType");
            that.addTaxType = new Button("#addTaxType");
            that.addPayType = new Button("#addPayType");
            that.search = new Button("#search");
            that.advanceSearch = new Button("#advanceSearch");
            that.advSrcBillNoBtn = new Button("#advSrcBillNoBtn");
            that.advSrcSvcNoBtn = new Button("#advSrcSvcNoBtn");
            that.advSrcCusNoBtn = new Button("#advSrcCusNoBtn");
            that.addPayment = new Button("#addPayment");
            that.summaryPayment = new Button("#summaryPayment");
            that.submitPayment = new Button("#submitPayment");
            that.addWithholdingTaxNo = new Button("#addWithholdingTaxNo");
            that.addFeeTaxNo = new Button("#addFeeTaxNo");
            that.addPenaltyTaxNo = new Button("#addPenaltyTaxNo");
            that.addRetentionTaxNo = new Button("#addRetentionTaxNo");
            that.addCompensationTaxNo = new Button("#addCompensationTaxNo");
        	that.payChqSubmit = new Button("#payChqSubmit");
    		that.payCCSubmit = new Button("#payCCSubmit");
    		that.payMoneyOrderButtonSubmit = new Button("#payMoneyOrderButtonSubmit");
    		that.payBillExchgButtonSubmit = new Button("#payBillExchgButtonSubmit");
    		that.payCouponButtonSubmit = new Button("#payCouponButtonSubmit");

            function ButtonGroup(el) {
    			var obj = this, index = 0;
    			obj.el = el;
    			obj.elem = $(el);
    			obj.val = function() { return obj.elem.find(".selection").text() }
    			obj.index = function() { if (arguments.length == 1) { obj.list[arguments[0]].click() } return index }
    			obj.list = obj.elem.find(".dropdown-menu a").each(function(i){ $(this).click(function(){ index = i }) });
    			obj.hideIndex = function() { if (arguments.length == 1) { var selected = obj.elem.find(".dropdown-menu a")[arguments[0]]; $(selected).addClass("hide");} return index }
    		}
        });
        self.panel = new(function(){
            var that = this;
            that.navigatePanel = new Panel("#navigatePanel");
            that.fillDataInputPanel = new Panel("#fillDataInputPanel");
            that.customerAddPanel = new Panel("#customerAddPanel");
            that.tax = new FadePanel(self.button.setTaxType, "#withholdingTaxPanel","#feeTaxPanel", "#penaltyTaxPanel", "#retentionTaxPanel", "#compensationTaxPanel");
            that.pay = new FadePanel(self.button.setPayType, "#payType1", "#payType2", "#payType3", "#payType4", "#payType5", "#payType6", "#payType7", "#payType9", "#payType8", "#payType10", "#payType11");

            that.receiptInfoPanel = new Panel("#receiptInfoPanel");
    		function Panel(el) { var obj = this, dura = 500; obj.el = el; obj.elem = $(el);
				obj.hide = function(ms) { obj.elem.hide(ms || dura); return this }; obj.show = function(ms) { obj.elem.show(ms || dura); return this }
			}
    		function FadePanel() { var obj = this, index = 0, dura = 200;
				obj.els = $.map(arguments, function(o,i){ return $.type(o) !== "string" ? null : o });
				obj.elems = $(obj.els.join(","));
				obj.hide = function() { obj.elems.addClass("hide"); return this }; obj.show = function() { obj.elems.removeClass("hide"); return this }
				obj.prev = function() { obj.index(index - 1); return this }; obj.next = function() { obj.index(index + 1); return this }
				obj.index = function(ind) { if (ind === index) return this; var target = obj.elems.length > ind && ind > -1 ? ind : (ind >= obj.elems.length ? 0 : obj.elems.length - 1); obj.elems.eq(index).fadeOut(dura, function(){ obj.elems.eq(index = target).removeClass("hide").css("display", "") }); return this }
				obj.elems.eq(index).hide().removeClass("hide").show(dura);
				arguments[0].list.each(function(i,o){ $(o).click(function(){ obj.index(i) }) })
			}
        });
        self.dialog = new(function(){
            var that = this;
            that.customerSearch = new Modal("#customerSearch");
            that.advancePayment = new Modal("#advancePayment", true);
            that.mainMessageDialog = new Message("#mainMessageDialog");
            that.advanceSearchMessageDialog = new Message("#advanceSearchMessageDialog");
            that.billingGroupMessageDialog = new Message("#billingGroupMessageDialog");
            that.remarkModal = new Modal("#remarkModal", true);
            function Modal(el) {
                this.el = el;
                this.elem = $(el);
                this.hide = function() { this.elem.modal("hide") };
                this.show = function() { this.elem.modal("show") };
            }
        });
        self.checkbox = new(function(){
            var that = this;
            that.advSrcSvcProperty = new CheckBox("[name=advSrcSvcProperty]");
            that.splitReceiptDocument = new CheckBox("#splitReceiptDocument");
            that.receiptDocumentOnly = new CheckBox("#receiptDocumentOnly");
            that.receiptInvoiceDocumentOnly = new CheckBox("#receiptInvoiceDocumentOnly");
        });
        self.input = new(function(){
            var that = this;
            that.compensationDepartmentCost = new DropDown("#compensationDepartmentCost").data([{ key: "1", value: "0000 จต." }]);
            that.advSrcBillNo = new Input("#advSrcBillNo");
            that.advSrcSvcType = new Listbox("#advSrcSvcType");//.init("../findAllPrintingInvDisplay.json");
            that.advSrcSvcNo = new Input("#advSrcSvcNo");
            that.advSrcCusNo = new Input("#advSrcCusNo");
            that.advSrcCusTaxId = new Input("#advSrcCusTaxId");
            that.advSrcCusFirstName = new Input("#advSrcCusFirstName");
            that.advSrcCusLastName = new Input("#advSrcCusLastName");
            that.advSrcOrgName = new Input("#advSrcOrgName");
            that.billNo = new Input("#billNo", 18);
            that.barcode = new Input("#barcode", 62, { "billNo": [16, 34], "invoiceNo": [34, 52] });
            that.customerNo = new Input("#customerNo");
            that.egpNo = new Input("#egpNo");
            that.egpContract = new Input("#egpContract");
            that.customerName = new Input("#customerName");
            that.taxId = new Input("#taxId");
            that.branch = new Input("#branch");
            that.billingGroup = new Input("#billingGroup");
            that.changeReceiptAddress = new Input("#changeReceiptAddress");
            that.receiptAddress = new Input("#receiptAddress");
            that.invoiceAddress = new Input("#invoiceAddress");
            that.balance = new NumberInput("#balance");
            that.discountAmount = new NumberInput("#discountAmount");
            that.beforeDiscountAmount = new NumberInput("#beforeDiscountAmount");
            that.vat = new NumberInput("#vat");
            that.preDiscount = new NumberInput("#preDiscount");
            that.totalCharge = new NumberInput("#totalCharge");
            that.deduct = new NumberInput("#deduct");
            that.payCashAmount = new NumberInput("#payCashAmount");
        	that.inputReceived = new NumberInput("#inputReceived");
            that.inputInvoiceNo = new Input("#inputInvoiceNo");
            that.inputBeforVat = new NumberInput("#inputBeforVat");
            that.inputCusName = new Input("#inputCusName");
            that.inputVatAmount = new NumberInput("#inputVatAmount");
            that.inputVatRate = new NumberInput("#vatRate");
            that.inputTotalCharge = new NumberInput("#inputTotalCharge");

            that.inputTotalAmount = new NumberInput("#inputTotalAmount");
            that.inputBillCycleFrom = new Input("#inputBillCycleFrom");
            that.inputBillCycleTo = new Input("#inputBillCycleTo");
            that.inputBa = new Input("#inputBa");
            that.inputSubNo = new Input("#inputSubNo");
            
            that.inputBranch = new Input("#inputBranch");
            that.inputTaxNo = new Input("#inputTaxNo");
            that.inputAddress = new Input("#inputAddress");
            that.inputStatus = new Input("#inputStatus");
            that.inputIssueDt = new Input("#inputIssueDt");
            that.inputDueDt = new Input("#inputDueDt");
            that.inputAging = new Input("#inputAging");
            that.withholdingTaxNo = new Input("#withholdingTaxNo");
            that.vat = new NumberInput("#vat");
            that.payMoneyOrderInputDate = new Input("#payMoneyOrderInputDate");
        		that.totalCharge = new NumberInput("#totalCharge");
        		that.deduct = new NumberInput("#deduct");
        		that.fee = new NumberInput("#fee");
        		that.penalty = new NumberInput("#penalty");
        		that.retention = new NumberInput("#retention");
        		that.compensation = new NumberInput("#compensation");
        		that.balanceDue = new NumberInput("#balanceDue");
        		that.change = new NumberInput("#change");
        		that.foreignExchangeRate = new Input("#foreignExchangeRate");
        		that.withholdingTaxAmount = new NumberInput("#withholdingTaxAmount");
        		that.feeDepartmentCost = new DropDown("#feeDepartmentCost").data([{ key: "1", value: "0000 จต." }]);
        		that.feeWTAmount = new NumberInput("#feeWTAmount");
        		that.feeBuyTaxAmount = new NumberInput("#feeBuyTaxAmount");
    		    that.feeTaxAmount = new NumberInput("#feeTaxAmount");
      	    that.penaltyTaxAmount = new NumberInput("#penaltyTaxAmount");
      	    that.retentionTaxAmount = new NumberInput("#retentionTaxAmount");
      	    that.compensationTaxAmount = new NumberInput("#compensationTaxAmount");
      	    that.payChqBankCode = new DropDown("#payChqBankCode").data([{ key: "0", value: "001" },{ key: "1", value: "002" },{ key: "2", value: "003" }]);
        		that.payChqBankName = new DropDown("#payChqBankName").data([{ key: "0", value: "กรุณาเลือกธนาคาร" },{ key: "1", value: "กรุงเทพ" },{ key: "2", value: "กสิกรไทย" }]);
        		that.payChqAmount = new NumberInput("#payChqAmount");
        		that.payChqNo = new Input("#payChqNo");
        		that.payChqDate = new Input("#payChqDate");
        		that.payChqBranch = new Input("#payChqBranch");
        		that.payCCType = new DropDown("#payCCType").data([{ key: "0", value: "กรุณาเลือกประเภทบัตร" },{ key: "1", value: "VISA" },{ key: "2", value: "MASTER" }]);
        		that.payCCBankName = new DropDown("#payCCBankName").data([{ key: "0", value: "กรุณาเลือกธนาคาร" },{ key: "1", value: "กรุงเทพ" },{ key: "2", value: "กสิกรไทย" }]);
        		that.payCCNo = new Input("#payCCNo");
        		that.payCCAmount = new NumberInput("#payCCAmount");
          	that.payMoneyOrderInputNo = new Input("#payMoneyOrderInputNo");
            that.payMoneyOrderInputPostCode = new Input("#payMoneyOrderInputPostCode");
            that.payMoneyOrderInputAmount = new NumberInput("#payMoneyOrderInputAmount");
            that.payBillExchgInputDate = new Input("#payBillExchgInputDate");
            that.payBillExchgInputNo = new Input("#payBillExchgInputNo");
            that.payBillExchgInputPostCode = new Input("#payBillExchgInputPostCode");
            that.payBillExchgInputAmount = new NumberInput("#payBillExchgInputAmount");
            that.payCouponInputNo = new Input("#payCouponInputNo");
            that.payCouponInputAmt = new NumberInput("#payCouponInputAmt");
            
            that.inputAdvanced = new NumberInput("#inputAdvanced");
   
            that.val = function() { if (arguments.length == 1) { $.each(arguments[0],function(k,v){ $("#"+ k).val(v) }) } }
        });
        self.tab = new(function(){
            var that = this;
            that.customerInfoTab = new Tab("#customerInfoTab");
            that.addressTab = new Tab("#addressTab");
            that.invoiceDetailsTab = new Tab("#invoiceDetailsTab");
            function Tab(el) {
                var obj = this, index = 0, change = function(e){ console.log(e) }, initEvts = [];
                obj.el = el;
                obj.elem = $(el);
                obj.index = function() { if (arguments.length == 1) { index = arguments[0]; obj.elem.find("li").removeClass("active").find("a").eq(index).click(); return this } return index }
                obj.show = function(ind) { obj.elem.find("a").eq(ind).tab("show"); return this; }
                obj.change = function(func) { change = func; return this }
                obj.init = function(ind, evt) { initEvts[ind] = evt; return obj }
                obj.elem.find("a").each(function(i,o){ $(o).data("index", i) });
                obj.elem.find("li").each(function(i,o){ if ($(o).hasClass("active")) index = i; initEvts.push(function(){ console.log("index: "+ i) }) });
                obj.elem.on("show.bs.tab", function(e){ index = $(e.target).data("index"); change(e); initEvts[index]() });
            }
        });
        self.radio = new(function(){
            var that = this;
            that.discountCheckbox = new Radio("[name=discountCheckbox]");
    		that.withholdingTaxType = new Radio("[name=withholdingTaxType]");
    		that.feeTaxType = new Radio("[name=feeTaxType]");
    		that.penaltyTaxType = new Radio("[name=penaltyTaxType]");
    		that.retentionTaxType = new Radio("[name=retentionTaxType]");
    		that.specialOptions = new Radio("[name=specialOptions]");
    		

        });
        self.table = new(function(){
            var that = this;
            that.advSrcBillNoResultList = new BootstrapTable("#advSrcBillNoResultList");
            that.advSrcSvcNoResultList = new BootstrapTable("#advSrcSvcNoResultList");
            that.advSrcCusNoResultList = new BootstrapTable("#advSrcCusNoResultList");
    		that.feeTaxList = new Table("#feeTaxList");
            that.subscriptionList = new Table("#subscriptionList");
            that.invoiceList = new BootstrapTable("#invoiceList");
            that.historyList = new BootstrapTable("#historyList");
            that.changeList = new BootstrapTable("#changeList");
    		that.payTypeList = new Table("#payTypeList");
    		that.deductionList = new Table("#deductionList");
    		that.withholdingTaxList = new Table("#withholdingTaxList");
    		that.penaltyTaxList = new Table("#penaltyTaxList");
    		that.retentionTaxList = new Table("#retentionTaxList");
    		that.compensationTaxList = new Table("#compensationTaxList");
    		that.payChqList = new Table("#payChqList");
    		that.payCCList = new Table("#payCCList");
    		that.payMoneyOrderTableList = new Table("#payMoneyOrderTableList");
    		that.payBillExchgTableList = new Table("#payBillExchgTableList");
    		that.payCouponTableList = new Table("#payCouponTableList");

    		function Table(el) {
    			var obj = this, headers = [], data = [], onApn = function() {}, onDel = onApn, loadCnt = 0, loadInt, loadFunc = function(){ obj.body.find("div#loading").html("Loading"+ Array(++loadCnt).join(".")); if (loadCnt > 8) loadCnt = 0; };
    			var checkboxHtml = '<input type="checkbox" name="{field}" value="{value}" data-index="{index}">', radioHtml = '<input type="radio" name="{field}" value="{value}" data-index="{index}">', inputHtml = '<input name="{field}" value="{value}" {style} data-index="{index}">';
    			obj.el = el; obj.elem = $(el); obj.body = obj.elem.find("tbody");
    			obj.onAppend = function(func) { onApn = func }; obj.onDelete = function(func) { onDel = func };
    			obj.hideLoad = function() { obj.elem.find("tbody tr").remove(); clearInterval(loadInt); return obj };
    			obj.showLoad = function(){ obj.clear(); obj.elem.find("tbody").append("<tr><td colspan='"+ headers.length +"'><div id='loading' style='text-align:center;font:BOLD 16pt Arial'>Loading</div></td></tr>"); loadCnt = 0; loadInt = setInterval(loadFunc, 500); return obj };
    			function reorder(index) { obj.body.find("tr").each(function(i,o){ $(o).find("td").eq(index).text(i + 1) }) }
    			obj.insert = function(array, showRemove, attrs) {
    				if (arguments.length < 1) array = $.map(headers,function(o){ return " " });
    				obj.body.append("<tr "+ $.map($.extend(attrs, {}), function(v, k){ return k +"='"+ v +"'" }).join(" ") +">"
    					+ $.map(array, function(v,i){ var field = headers[i].field, value = v, colStyle = "", colWidth = 0;
    						if (headers[i].runningNo) value = (obj.size() + 1);
    						else if (headers[i].numberFormat) { value = !$.isNumeric(v) ? "0.00" : parseFloat(v, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,'); }
    						else if (headers[i].checkbox) value = replace(checkboxHtml, null, field, i, v); else if (headers[i].radio) value = replace(radioHtml, null, field, i, v);
    						else if (headers[i].input) value = replace(inputHtml, 'style="width:100%;margin:-4px 0;text-align:'+ (headers[i].align || "left") +'"', field, i, v);
    						if (headers[i].modifyButton) { colWidth += 45; value += '<a class="btn btn-link" onclick=\'(function(tableId, row, col){ window[tableId +"ModifyEvent"]($("#"+ tableId), row, col); })(this.parentNode.parentNode.parentNode.parentNode.parentNode.id, '+ JSON.stringify(array) +', this)\'><span class="glyphicon glyphicon-pencil"></span></a>'; } if (headers[i].removeButton) { colWidth += 45; value += '<a class="btn btn-link" onclick=\'(function(tableId, row, col){ window[tableId +"RemoveEvent"]($("#"+ tableId), row, col); col.parentNode.parentNode.parentNode.remove() })(this.parentNode.parentNode.parentNode.parentNode.parentNode.id, '+ JSON.stringify(array) +', this)\'><span class="glyphicon glyphicon-trash"></span></a>'; }
    						return '<td style="'+ (!headers[i].valign ? "" : "vertical-align:"+ headers[i].valign +";") + (!colStyle ? "" : colStyle +";") + (colWidth < 1 ? "" : "width:"+ colWidth +"px;") +'"><div style="'+ (headers[i].align ? "text-align:"+ headers[i].align : "") +'">'+ value +'</div></td>' }).join("")
    					+ (!showRemove ? "" : '<td style="width:40px;text-align:center"><a href="#" class="delList"><span class="glyphicon glyphicon-trash"></span></a></td>')
    				+"</tr>"); return obj }
    			obj.find = function(key, cri) { return obj.elem.find("tbody tr").filter("["+ key +"="+ cri +"]") }
    			obj.clear = function() { obj.elem.find("tbody tr").remove(); return obj }
    			obj.remove = function(index) { this.elem.find("tbody tr").eq(index).remove(); $.each(headers,function(i,o){ if (o.runningNo) reorder(i) }); }
    			obj.data = function() { var data = [];
    				if (arguments.length != 1) { var rows = obj.elem.find("tbody tr");
    					for (var i = 0, m = rows.length; i < m; i++) { var row = []; for (var j = 0, n = rows[i].children.length; j < n; j++) { row.push(extract(headers[j], rows[i].children[j])) } data.push(row) } return data;
    				} for (var i = 0, m = (data = arguments[0]).length; i < m; i++) { obj.insert(data[i]); } return obj };
    			obj.col = function(colIndex) { var rows = obj.elem.find("tbody tr"), data = []; for (var i = 0, m = rows.length; i < m; i++) { data.push(extract(headers[colIndex], rows[i].children[colIndex])) } return data }
    			obj.size = function() { return obj.elem.find("tbody tr").length };
    			obj.typeSum =  function(typeIndex) { return stripToNumber(obj.find("type", typeIndex).find("td:eq(2) div").text());}
    			obj.deduct = function(index) { var sum = 0; this.elem.find("tbody tr").each(function(i, row){ var val = row.children[index].innerText.replace(/[,]/g, ""); sum += (isNaN(val) ? 0 : parseFloat((val * -1), 10)) }); return sum };
    			obj.calcBalance = function(typeindex,index) { var sum = 0; var gettingIncome = 'ขาเข้า'; this.elem.find("tbody tr").each(function(i, row){ var type = row.children[typeindex].innerText.replace(/[]/g, ""); var multiplier = (gettingIncome == type.trim()) ? 1 : -1; var val = row.children[index].innerText.replace(/[,]/g, ""); sum += (isNaN(val) ? 0 : parseFloat((val * multiplier), 10)) }); return sum };
    			obj.sum = function(index) { var sum = 0; this.elem.find("tbody tr").each(function(i, row){ var val = row.children[index].innerText.replace(/[,]/g, ""); sum += (isNaN(val) ? 0 : parseFloat(val, 10)) }); return sum }
    			$(obj.el).on("click", ".delList", function(){ $(this).parent().parent().remove(); $.each(headers, function(i,p){ if (p.runningNo) reorder(i) }); onDel(obj.data()) });
    			obj.elem.removeClass("table").removeClass("table-hover").addClass("table").addClass("table-hover");
    			obj.elem.find("thead th").each(function(i,o){ var elem = $(o); headers.push({ "field": elem.data("field"), "valign": $.trim(elem.data("valign")), "align": $.trim(elem.data("align")), "modifyButton": elem.data("modifyButton") === true, "removeButton": elem.data("removeButton") === true, "runningNo": elem.data("runningNo") === true, "numberFormat": elem.data("numberFormat") === true, "checkbox": elem.data("checkbox") === true, "radio": elem.data("radio") === true, "input": elem.data("input") === true }) });
    			function replace(str, style, field, index, value){ var s = str; if (style) s = s.replace("\{style\}", style); return s.replace("\{field\}", $.trim(field)).replace("\{index\}", index).replace("\{value\}", value) }
    			function extract(prop, col) { if (prop.checkbox) { var elem = col.children[0].children[0]; return !elem.checked ? "" : elem.value } else if (prop.radio) { var elem = col.children[0].children[0]; return !elem.checked ? "" : elem.value } else if (prop.input) { var elem = col.children[0].children[0]; return elem.value } return col.childNodes[0].nodeType === 3 ? col.textContent : col.children[0].innerHTML }
    			if(obj.body.length < 1) { obj.elem.append("<tbody></tbody>"); obj.body = obj.elem.find("tbody") }
    		}
        });
        self.contextPath = '${pageContext.request.contextPath}/';
        self.acctCatLkp = new Input("#acctCatLkp");
        self.customerType = new Input("#customerType");
        self.catCustomerSegment = new Input("#catCustomerSegment");
        self.custInfoInputAccruedAmount = new NumberInput("#custInfoInputAccruedAmount");
        self.custInfoInputAdvancedAmount = new NumberInput("#custInfoInputAdvancedAmount");
        self.custInfoInputStatus = new Input("#custInfoInputStatus");
        self.custInfoInputCurrencyCode = new Input("#custInfoInputCurrencyCode");
        self.custInfoInputVatRate = new Input("#custInfoInputVatRate");
        self.advancedCheckbox = new CheckBox("[name=advancedCheckbox]");
        self.advancedAmount = new NumberInput("#advancedAmount").disable();
        self.billCycle = new Input("#billCycle").disable();
        self.checkboxAdditionalDiscount = new CheckBox("#checkboxAdditionalDiscount");
        self.inputAdditionalDiscount = new NumberInput("#inputAdditionalDiscount");
        self.inputCollectionUnit = new Input("#inputCollectionUnit");
        self.advanceInvSelected = null;
        self.inputCustomerSegment = new ListboxBillingGroup("#inputCustomerSegment");
        self.advInputCustomerSegment = new ListboxBillingGroup("#advInputCustomerSegment");
        /* $.ajax({
            type: "GET",
            url: "../findAccountCategoryList.json",
            //data: dataSend,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success:function(res){
                console.log("show findAccountCategoryList"+ JSON.stringify(res.data));
                self.inputCustomerSegment = new ListboxBillingGroup("#inputCustomerSegment").data(res.data);
                self.advInputCustomerSegment = new ListboxBillingGroup("#advInputCustomerSegment").data(res.data);
                doQueueSearch();
            }
        }); */

        self.inputAdditionalRemark = new Input("#inputAdditionalRemark");
        this.dialogAuthentication = new AuthenticationDialog(function(res){console.log(res); }, function(res){  }, "../checkAuthorize.json");
        $('#payChqBankCode').click(function () {
            var key = view.input.payChqBankCode.key();
            $('#payChqBankName option:selected').prop('selected', false);
            $('#payChqBankName option[data-key='+key+']').prop('selected', true);
        });
        $('#payChqBankName').click(function () {
            var key = view.input.payChqBankName.key();
            $('#payChqBankCode option:selected').prop('selected', false);
            $('#payChqBankCode option[data-key='+key+']').prop('selected', true);
        });
        return this;
    })(jQuery);
    $("#testmenu li a").click(function () { $(this).parents(".btn-group").find('.selection').text($(this).text()); $(this).parents(".btn-group").find('.selection').val($(this).text()); });
    $("#testmenu2 li a").click(function () { $(this).parents(".btn-group").find('.selection').text($(this).text()); $(this).parents(".btn-group").find('.selection').val($(this).text()); });
    var checkSpecial = "";
    function addTaxTypeClickEvent() {
    	var index = view.button.setTaxType.index(), value = 0;
    	if (index === 0)        { value = view.table.withholdingTaxList.deduct(4); 		window.wthList = view.table.withholdingTaxList.data() }
    	else if (index === 1)   { value = view.table.feeTaxList.calcBalance(2,5); 		window.feeList = view.table.feeTaxList.data() }
    	else if (index === 2)   { value = view.table.penaltyTaxList.calcBalance(2,3); 	window.pntyList = view.table.penaltyTaxList.data() }
    	else if (index === 3)   { value = view.table.retentionTaxList.calcBalance(2,3); window.rttList = view.table.retentionTaxList.data() }
    	else if (index === 4)   { value = view.table.compensationTaxList.deduct(2);		window.cmpstList = view.table.compensationTaxList.data() }
    	view.table.deductionList.find("type", index).remove();
    	view.table.deductionList.insert(["-", view.button.setTaxType.val(), value], true, { "type": index });
    	updateDeduction();
    	calculate();
    }
    function addPayTypeClickEvent() {
    	var index = view.button.setPayType.index(), payAmt = view.input.payCashAmount.val();
    	if (index == 1)      { window["payChqListData"] = view.table.payChqList.data();                         payAmt = view.table.payChqList.sum(6)        }
    	else if (index == 2) { window["payCCListData"] = view.table.payCCList.data();                           payAmt = view.table.payCCList.sum(4)         }
    	else if (index == 3) { window["payMoneyOrderTableListData"] = view.table.payMoneyOrderTableList.data();       payAmt = view.table.payMoneyOrderTableList.sum(4)  }
    	else if (index == 4) { window["payBillExchgTableListData"] = view.table.payBillExchgTableList.data();         payAmt = view.table.payBillExchgTableList.sum(4)   }
    	else if (index == 5) { window["payCouponTableListData"] = view.table.payCouponTableList.data();               payAmt = view.table.payCouponTableList.sum(4)      }
    	else if (index == 6) { window["payBankTxnfTableListData"] = view.table.payBankTxnfTableList.data();           payAmt = view.table.payBankTxnfTableList.sum(6)    }
    	else if (index == 7) { window["payOffsetTableListData"] = view.table.payOffsetTableList.data();               payAmt = view.table.payOffsetTableList.sum(4)      }
    	else if (index == 9) { window["payOtherTableListData"] = view.table.payOtherTableList.data();                 payAmt = view.table.payOtherTableList.sum(4)       }
        else if (index == 10) { window["payBankTxnfTableListGfData"] = view.table.payBankTxnfTableListGf.data();      payAmt = view.table.payBankTxnfTableListGf.sum(6)  }
        else if (index == 8){ window["payForeignTableListData"] = view.table.payForeignTableList.data();              payAmt = view.table.payForeignTableList.sum(5)     }
    	view.table.payTypeList.find("method", index).remove();
    	view.table.payTypeList.insert(["-", view.button.setPayType.val(), payAmt], true, { method: index });
    	view.input.inputReceived.val(view.table.payTypeList.sum(2));
    	if(view.allowedCurrenyCode) {
    		view.button.submitPayment.enable();
    		view.button.submitPaymentEng.enable();
    	}
    	updateDeduction();
    	calculate();
    }
    function addWithholdingTaxNoClickEvent() {
    	if(validateAddWithholdingTaxNo()) {
    		var taxType = view.radio.withholdingTaxType.label();
    		view.table.withholdingTaxList.insert(["-", view.input.inputInvoiceNo.val(), view.input.withholdingTaxNo.val(), taxType, view.input.withholdingTaxAmount.val()], true, {"type": view.radio.withholdingTaxType.type()});
    	}
    }
    function validateAddWithholdingTaxNo() {
    	var isValid = true;
//     	if(view.input.withholdingTaxNo.val() == "") {view.input.withholdingTaxNo.error(true); isValid = false;} else {view.input.withholdingTaxNo.error(false);}
    	return isValid;
    }
    function doQueueSearch(){
        var queryString = view.session("queryString");
        if(Object.keys(queryString).length > 0){
            if(queryString.ba != null && queryString.ba != ""){
                view.input.billNo.val(queryString.ba);
                searchClickEvent();
            }else if(queryString.txid != null && queryString.txid != ""){
                view.input.advSrcCusTaxId.val(queryString.txid);
                view.dialog.customerSearch.show();
                $("#message").click();
                advSrcCusNoBtnClickEvent();
            }else if(queryString.sn != null  && queryString.sn != ""){
                view.input.advSrcSvcNo.val(queryString.sn);
                view.dialog.customerSearch.show();
                $("#profile").click();
                advSrcSvcNoBtnClickEvent();
            }
            view.session("queryString", []);
        }
    }
    function updateDeduction() {
    	view.input.deduct.val(view.table.deductionList.typeSum(0));
    	view.input.fee.val(view.table.deductionList.typeSum(1));
    	view.input.penalty.val(view.table.deductionList.typeSum(2));
    	view.input.retention.val(view.table.deductionList.typeSum(3));
    	view.input.compensation.val(view.table.deductionList.typeSum(4));
    }

    function advanceSearchClickEvent() {
        view.dialog.advanceSearchMessageDialog.clear();
// 	view.table.advSrcBillNoResultList.hideLoad().clear();
// 	view.table.advSrcSvcNoResultList.hideLoad().clear();
// 	view.table.advSrcCusNoResultList.hideLoad().clear();
    }
    function advSrcBillNoBtnClickEvent() {
        view.dialog.advanceSearchMessageDialog.clear();
        if (view.input.advSrcBillNo.val().length < 6) {
            view.dialog.advanceSearchMessageDialog.error(["โปรดระบุ 'เลขที่ใบแจ้งค่าบริการ' อย่างน้อย 6 ตัวอักษร"]).show();
            return false;
        }
        else{
            var billNo = view.input.advSrcBillNo.val();
            var chs=0;
            for(var i=0; i<billNo.length; i++){
                var ch = billNo.charAt(i);
                if(Number(parseFloat(ch))==ch){chs+=1;}
            }
            if(chs<6){
                view.dialog.advanceSearchMessageDialog.error(["โปรดระบุ 'เลขที่ใบแจ้งค่าบริการ' มีตัวเลขอย่างน้อย 6 ตัว"]).show();
                return false;
            }
        }
        view.dialog.advanceSearchMessageDialog.clear();
        view.table.advSrcBillNoResultList.clear().showLoad();
        view.dialog.advanceSearchMessageDialog.clear().showLoad("ระบบกำลังรอข้อมูลจาก CRM : {timeCnt} วินาที")
        var dataSend = {
            "invNo": view.input.advSrcBillNo.val()
        };

        $.ajax({
            type: "GET",
            url: "../findInvoiceBillingWriteOffByNo.json",
            data: dataSend,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success:function(res){
                console.log(res);
                //console.log("xxx3-->"+JSON.stringify(res))
                var writeOffInvoiceData = [];
                if(res.statusCode=='0') {
                    writeOffInvoiceData = $.map(res.data,avdInvoiceListMapper);
                }
                console.log("xxx4-->"+writeOffInvoiceData.length)

                view.table.advSrcBillNoResultList.hideLoad().rawData(writeOffInvoiceData);

                view.dialog.advanceSearchMessageDialog.hideLoad();
            }
        });

        /*
         get("../findInvoiceByNo.json", { "invNo": view.input.advSrcBillNo.val() }, function(res){
         view.table.advSrcBillNoResultList.hideLoad().rawData($.map(res.data, function(o,i){
         return {
         "acctNo": o.invoiceNo
         ,"customerId": o.billingNo
         ,"customerAccountName": o.billingName
         ,"propLabel": o.customerType
         ,"billGroup": o.billGroup
         ,"billNo": o.billingNo
         };
         }));
         }, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad() });
         */
    }
    function advSrcSvcNoBtnClickEvent() {
        var isProp1 = view.checkbox.advSrcSvcProperty.contains("1");
        var isProp2 = view.checkbox.advSrcSvcProperty.contains("2");
        var svcNo = view.input.advSrcSvcNo.val().replace("[\?\*]", "");
        view.dialog.advanceSearchMessageDialog.clear();
        if (svcNo.length < 4) {
            view.dialog.advanceSearchMessageDialog.error(["กรุณากรอก 'Service No' อย่างน้อย 4 ตัวอักษร"]).show();
            return;
        }
        view.table.advSrcSvcNoResultList.clear().showLoad();
        function ResponseHandler(res) {
            view.table.advSrcSvcNoResultList.hideLoad().rawData($.map(res._embedded.billServices, function(o,i){
                return {
                    "propOne": o.propOne
                    ,"acctNo": o.profile.no
                    ,"acctName": o.profile.customerAccountName
                    ,"propLabel": o.propLabel
                    ,"billGroup": o.profile.billGroup + " " + $.trim(o.profile.billGroupFull)
                    ,"billNo": o.profile.no
                };
            }));
        }
        view.dialog.advanceSearchMessageDialog.clear();
        view.table.advSrcSvcNoResultList.clear().showLoad();
        view.dialog.advanceSearchMessageDialog.clear().showLoad("ระบบกำลังรอข้อมูลจาก CRM : {timeCnt} วินาที");
        if(view.input.advSrcSvcType.val() == null) var advSrcSvcType = "";
        else var advSrcSvcType = view.input.advSrcSvcType.val().replace(/-1/g,"");
        console.log("kkkk");
        console.log(advSrcSvcType);
        console.log("kkkk");

        $.get("../advanceSearchByService.json", {
            "billingGroups": advSrcSvcType, "serviceNo": svcNo, "isPropertyOne": isProp1, "isPropertyTwo": isProp2 }, function(res) {
            var filteredData = [];
            for(var i = 0 ;i<res.data.length;i++){
                if(res.data[i].catBillAcctNo !=null && res.data[i].catBillAcctNo.length>0)
                    filteredData.push(res.data[i])
            }
            view.table.advSrcSvcNoResultList.hideLoad().rawData($.map(filteredData, function(o,i){
                return {
                    "propertyOne": o.propertyOne
                    ,"propertyTwo": o.propertyTwo
                    ,"catBillAcctNo": o.catBillAcctNo
                    ,"customerName": o.customerName
                    ,"billingGroupFull": o.billingGroupFull
                    ,"billNo": o.catBillAcctNo
                    ,"acctNo": o.catBillAcctNo
                };
            }));
            //view.table.advSrcSvcNoResultList.hideLoad().rawData(res.data);
            view.dialog.advanceSearchMessageDialog.hideLoad();
            view.table.advSrcSvcNoResultList.hideLoad();
        });
        /*
         if (isProp1 && isProp2) {
         get("../service/bill-svcs/search/both", { "label": view.input.advSrcSvcType.val(), "one": svcNo, "two": svcNo }, ResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcSvcNoResultList.hideLoad() });
         } else if (isProp1) {
         get("../service/bill-svcs/search/one", { "label": view.input.advSrcSvcType.val(), "one": svcNo }, ResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcSvcNoResultList.hideLoad() });
         } else if (isProp2) {
         get("../service/bill-svcs/search/two", { "label": view.input.advSrcSvcType.val(), "two": svcNo }, ResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcSvcNoResultList.hideLoad() });
         } else {
         view.table.advSrcSvcNoResultList.hideLoad();
         view.dialog.advanceSearchMessageDialog.error(["กรุณาเลือก 'Property1' หรือ 'Property2' ก่อนทำการค้นหา"]).show();
         }*/
    }
    function advSrcCusNoBtnClickEvent() {
        view.dialog.advanceSearchMessageDialog.clear();
        var url = "", params, searchByCustId = false, searchByCustName = false, searchByOrg = false;
        /*
        if (!view.input.advSrcCusNo.isEmpty())         { url = "../service/cust-profiles/search/no"; params = { "no": view.input.advSrcCusNo.val() }; searchByCustId = true; }
        else if (!view.input.advSrcCusTaxId.isEmpty()) { url = "../service/bill-profiles/search/tax"; params = { "tax": view.input.advSrcCusTaxId.val() } }
        else if (!view.input.advSrcCusFirstName.isEmpty() || !view.input.advSrcCusLastName.isEmpty()) { url = "../findBillProfileByName.json"; params = { "ty": true, "fn": view.input.advSrcCusFirstName.val() , "ln": view.input.advSrcCusLastName.val() }; searchByCustName = true}
        else if (!view.input.advSrcOrgName.isEmpty())  { url = "../findBillProfileByName.json"; params = { "ty": false, "fn": view.input.advSrcOrgName.val() , "ln": "" }; searchByOrg = true }
        else { view.dialog.advanceSearchMessageDialog.error(["กรุณากรอกรายละเอียดอย่างน้อย 1 ช่องการค้นหา"]).show(); return; }
        view.table.advSrcCusNoResultList.clear().showLoad();
        view.dialog.advanceSearchMessageDialog.clear().showLoad("ระบบกำลังรอข้อมูลจาก CRM : {timeCnt} วินาที")
        */
        if((!view.input.advSrcCusFirstName.isEmpty() && !view.input.advSrcOrgName.isEmpty())
            || (!view.input.advSrcCusLastName.isEmpty() && !view.input.advSrcOrgName.isEmpty())

        ){
            view.dialog.advanceSearchMessageDialog.error(["ไม่สามารถค้นหา ชื่อลูกค้า/นามสกุล และ ชื่อนิติบุคคล/ราชการ พร้อมกันได้"]).show(); return;
        }
        //console.log("customerSegmentSearch key="+view.advInputCustomerSegment.key());
        if(!view.input.advSrcCusNo.isEmpty() || !view.input.advSrcCusTaxId.isEmpty() || !view.input.advSrcCusFirstName.isEmpty()
            || !view.input.advSrcCusLastName.isEmpty() || !view.input.advSrcOrgName.isEmpty()
        ){
            url = "../findBillingProfile.json"; params = {
                "customerFirstName": view.input.advSrcCusFirstName.val() ,
                "customerLastName": view.input.advSrcCusLastName.val() ,
                "orgName" : view.input.advSrcOrgName.val() ,
                "customerNumber": view.input.advSrcCusNo.val(),
                "idRegisterNumber": view.input.advSrcCusTaxId.val(),
                "catCustomerSegment": view.advInputCustomerSegment.key()
            };

        }else{
            view.dialog.advanceSearchMessageDialog.error(["กรุณากรอกรายละเอียดอย่างน้อย 1 ช่องการค้นหา"]).show(); return;
        }
        view.table.advSrcCusNoResultList.clear().showLoad();
        view.dialog.advanceSearchMessageDialog.clear().showLoad("ระบบกำลังรอข้อมูลจาก CRM : {timeCnt} วินาที")
        function ResponseHandler(res) {
            view.table.advSrcCusNoResultList.hideLoad().rawData($.map(res._embedded.billProfiles, function(o,i){
                return {
                    "acctNo": o.no
                    ,"customerId": o.no
                    ,"customerAccountName": o.customerAccountName
                    ,"propLabel": o.type
                    ,"billGroup": o.billGroup + " " + $.trim(o.billGroupFull)
                    ,"billNo": o.no
                };
            }));
        }
        function CustNoResponseHandler(res) {
            if(res && res._embedded.customerProfiles) {
                var customer = res._embedded.customerProfiles[0];
                console.log(customer);
                var url = "../service/bill-profiles/search/custId", params = { "custId": customer.id };
                get(url, params, ResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcCusNoResultList.hideLoad() });
            }
        }
        function CustNameResponseHandler(res) {
            if(res && res.data) {
                view.table.advSrcCusNoResultList.hideLoad().rawData($.map(res.data, function(o,i){
                    return {
                        "acctNo": o.no
                        ,"customerId": o.no
                        ,"customerAccountName": o.accountCategoryLookup==3?((o.billFirstName||'')+" "+(o.billLastName||'')):(o.billCompName || "")
                        ,"customerTaxNo": o.taxRegisterNo
                        ,"customerSegment": (o.customer.segment!=null)?o.customer.segment.text:""
                        ,"billGroup":o.billGroupFull
                        ,"billNo": o.no
                    };
                }));
            }
        }
        function OrgResponseHandler(res) {
            if(res && res.data) {
                view.table.advSrcCusNoResultList.hideLoad().rawData($.map(res.data, function(o,i){
                    return {
                        "acctNo": o.no
                        ,"customerId": o.no
                        ,"customerAccountName": o.billFirstName
                        ,"propLabel": o.type
                        ,"billGroup": o.billGroup + " " + $.trim(o.billGroupFull)
                        ,"billNo": o.no
                    };
                }));
            }
        }
        get(url, params, CustNameResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcCusNoResultList.hideLoad() });
        /*
        if(searchByCustName){
            searchByCustName = false;
            get(url, params, CustNameResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcCusNoResultList.hideLoad() });
        } else if(searchByOrg) {
            searchByOrg = false;
            get(url, params, OrgResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcCusNoResultList.hideLoad() });
        } else if(searchByCustId) {
            searchByCustId = false;
            get(url, params, CustNoResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcCusNoResultList.hideLoad() });
        } else {
            get(url, params, ResponseHandler, view.dialog.advanceSearchMessageDialog, function(){ view.dialog.advanceSearchMessageDialog.hideLoad(); view.table.advSrcCusNoResultList.hideLoad() });
        }
        */
    }
    function addPaymentClickEvent() {
        var selectList = view.table.invoiceList.getSelections();
        if (selectList.length < 1 && !view.advancedCheckbox.contains("on")) {
            view.dialog.mainMessageDialog.error(["กรุณาเลือกใบแจ้งค่าใช้บริการอย่างน้อย 1 รายการ"]).show();
            return false;
        }
        //var invoiceList = view.table.invoiceList.data();
        var table=$("#invoiceList");
        var invoiceList=table.bootstrapTable("getData");
        var selectedInvoiceNoList = [];
        for(var rowid=0;rowid<invoiceList.length;rowid++) {
            var invoice = invoiceList[rowid];
            var checked = invoiceList[rowid]["checked"];
            if (checked) {
                var invoiceNo = invoiceList[rowid]["invoiceNo"];
                var balanceDue = stripToNumberWithFormat(invoiceList[rowid]["balanceDue"]);
                //var receivedList = document.getElementsByName("received");
                //var receivedValue =receivedList[rowid].value;
                var receivedValue = $("#received_"+rowid).val()
                var received = stripToNumberWithFormat(receivedValue);
                console.log(balanceDue+","+received)
                console.log((balanceDue - received))

                //if( subtract(balanceDue, received) < 0) {
                if( (balanceDue - received) < 0) {

                    view.dialog.mainMessageDialog.error(["ระบบไม่อนุญาตให้ กำหนดจำนวน ยอดชำระ มากกว่า จำนวนเงินคงค้าง"]).show();
                    return false;
                }
                selectedInvoiceNoList.push(invoiceNo);
            }
        }
        console.log("selectedInvoiceNoList->"+selectedInvoiceNoList.toString());
        /*
         var selectedInvoiceNoList = [];
         for (var i = 0, m = invoiceList.length; i < m; i++) {
         var invoice = invoiceList[i], checked = invoice[1], invoiceNo = invoice[2], balanceDue = stripToNumber(invoice[10]), received = stripToNumber(invoice[11]);
         if (checked == "on" ) {
         if( subtract(balanceDue, received) < 0) {
         view.dialog.mainMessageDialog.error(["ระบบไม่อนุญาตให้ กำหนดจำนวน ยอดชำระ มากกว่า จำนวนเงินคงค้าง"]).show();
         return false;
         }
         selectedInvoiceNoList.push(invoiceNo);
         }
         }
         */
        // must have atleast 1 invoice no
        $.get("../findInvoiceNoInPayQueue.json", { "list": selectedInvoiceNoList.toString() }, function(res) {
            var invoiceReturnedList = $.map((res && res.data ? res.data : []), function (o) { if(o.status == null){ return o.invoiceNo; } });
            console.log(invoiceReturnedList);
            if( invoiceReturnedList && invoiceReturnedList.length !== 0) {
                view.dialog.mainMessageDialog.error(["ระบบรอหักล้างหนี้สำหรับใบแจ้งหนี้เลขที่ ".concat(invoiceReturnedList.toString())]).show();
                return false;
            }else{
                var receiptDocumentOnly=$.inArray("true", view.checkbox.receiptDocumentOnly.val()) > -1;
                var receiptInvoiceDocumentOnly=$.inArray("true", view.checkbox.receiptInvoiceDocumentOnly.val()) > -1;
                console.log("receiptDocumentOnly["+receiptDocumentOnly+"]");
                console.log("receiptInvoiceDocumentOnly["+receiptInvoiceDocumentOnly+"]");
                var receiptFormat="receive_wh";
                if(receiptDocumentOnly && !receiptInvoiceDocumentOnly)
                    receiptFormat="receive_only";
                else if(!receiptDocumentOnly && receiptInvoiceDocumentOnly)
                    receiptFormat="wh_only";
                view.session("receiptFormat",receiptFormat);// receive + wh [receive_wh] , receive only [receive_only] ,  wh only [wh_only]
                console.log("receiptFormat["+receiptFormat+"]");
                var receiptFormat="receive_wh";
                view.session("receiptFormat",receiptFormat);// receive + wh [receive_wh] , receive only [receive_only] ,  wh only [wh_only]
                view.session("isStateAgency", view.inputCustomerSegment.key());
                location.href = 'pay-service-charge_2.jsp';
                //return false;
                // check duplicate pay in
                $.get("../findInvoiceNoDuplicatePayQueue.json", { "list": selectedInvoiceNoList.toString()}, function(res) {
                    var invoiceReturnedList = $.map((res && res.data ? res.data : []), function (o)
                    { //if(o.status == null){
                        return o.invNo;
                        //	}
                    });
                    //console.log(invoiceReturnedList);
                    //alert(invoiceReturnedList)
                    //console.log(invoiceReturnedList);
                    //var buildBillingList=buildBillingList();
                    //alert(buildBillingList);
                    //console.log(buildBillingList);
                    if( invoiceReturnedList && invoiceReturnedList.length !== 0) {
                        view.dialog.mainMessageDialog.error(["ระบบกำลังมีการชำระหนี้สำหรับใบแจ้งหนี้เลขที่ ".concat(invoiceReturnedList.toString())]).show();
                        return false;
                    }else{
                        // lock inv
                        view.session("billingList", buildBillingList());
                        //alert(view.session("billingList"));
                        //console.log(JSON.stringify(view.session("billingList")));
                        var billingList = view.session("billingList");
                        var invoiceLockList=[];
                        for (var i = 0, m = billingList.length; i < m; i++) {
                            for (var j = 0, n = billingList[i].invoiceList.length; j < n; j++) {
                                var invoice = billingList[i].invoiceList[j];
                                if(invoice.checked){
                                    var invoiceLock={
                                        invNo:invoice.no,
                                        mode:"ADD"
                                    }
                                    invoiceLockList.push(invoiceLock)
                                }
                            }
                        }
                        console.log(invoiceLockList);
                        console.log(JSON.stringify(invoiceLockList));
                        //var isStateAgency = false;

                        $.ajax({
                            type: "POST",
                            url: "../manageDuplicatePayQueue.json",
                            data: JSON.stringify(invoiceLockList),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success:function(data){
                                view.session("isStateAgency", view.inputCustomerSegment.key());
                                location.href = 'pay-service-charge_2.jsp';
                            }
                        });
                    }
                });
            }

        });
    }
    /*function discountCheckboxClickEvent() {
        var discountCheckBox = $(this);
        if (discountCheckBox.prop("checked")) {
            view.dialogAuthentication.show().done(function(res) {
                view.inputAdditionalDiscount.enable();
            }).fail(function(res) {
                view.inputAdditionalDiscount.disable();
            }).cancel(function() {
                discountCheckBox.prop("checked", false)
            });
        } else {
            view.inputAdditionalDiscount.disable().val(0);
        }
    }*/
    function buildBillingList() {
        var invoiceMap = {}; $.each(view.table.invoiceList.rawData(), function(i, o){ invoiceMap[o.invoiceNo] = o });
        var isPrepaid = view.advancedCheckbox.contains("on");
        var billingList = view.session("billingList"), bill, invoice;
        // data = view.table.invoiceList.data();
        var table=$("#invoiceList");

        bill = find(billingList, "custNo", { "custNo": view.input.customerNo.val() });
        bill.custName = view.input.customerName.val();
        bill.custType = view.customerType.val();
        bill.acctCatLkp = view.acctCatLkp.val();//by NSD 02-03-2017
        bill.catCustomerSegment = view.catCustomerSegment.val();
        bill.billGroup = view.input.billingGroup.val();
        bill.additionalRemark = view.inputAdditionalRemark.val();
        bill.address1 = view.input.receiptAddress.val();
        bill.address2 = view.input.invoiceAddress.val();
        bill.prepaid = view.advancedAmount.val();
        bill.split = $.inArray("true", view.checkbox.splitReceiptDocument.val()) > -1;
        bill.taxId = view.input.taxId.val();
        bill.branch = view.input.branch.val();
        bill.collectionUnit = view.inputCollectionUnit.val();
        /* start ADD e-GP */
        bill.egpNo = view.input.egpNo.val();
        bill.egpContract = view.input.egpContract.val();
        /* end ADD e-GP */
        bill.invoiceList = (bill.invoiceList || []);
        var data=table.bootstrapTable("getData");
        console.log('data from table');console.log(data);console.log('data from table');
        if(data.length>0){
            bill.invoiceDisplay = data[0]["invoiceDisplay"];
        }else{
            bill.invoiceDisplay = invDisplay;
        }
        bill.receiptFormat = view.session("receiptFormat");//by NSD 25-04-2017

        for(var rowid=0;rowid<data.length;rowid++){
            var checked = data[rowid]["checked"];
            if (checked) {
                var invoiceNoValue = data[rowid]["invoiceNo"];
                var invoiceNo = invoiceNoValue, inv = invoiceMap[invoiceNo], vatRate = (inv ? inv.vatRate : 0), currencyCode = (inv ? inv.currencyCode : 0), kenan = (inv ? inv.accountNo : 0);
                invoice = find(bill.invoiceList, "no", { "no": invoiceNo });
                //alert(invoice);
                if (invoice.checked == null) invoice.checked = "on";
                invoice.issueDate = data[rowid]["issueDt"];//data[i][3];
                invoice.dueDate = data[rowid]["dueDt"];//data[i][4];
                invoice.amount = stripToNumberWithFormat(data[rowid]["charge"]);//stripToNumber(data[i][5]);
                invoice.discount = stripToNumberWithFormat(data[rowid]["discount"]);//stripToNumber(data[i][6]);
                invoice.charge = invoice.amount - invoice.discount;
                invoice.vat = stripToNumberWithFormat(data[rowid]["vat"]);//stripToNumber(data[i][7]);
                invoice.vatRate = vatRate;
                invoice.totalCharge = stripToNumberWithFormat(data[rowid]["totalCharge"]);//stripToNumber(data[i][8]);
                invoice.balanceDue = stripToNumberWithFormat(data[rowid]["balanceDue"]);//stripToNumber(data[i][10]);
                //var receivedList = document.getElementsByName("received");
                //var receivedValue =receivedList[rowid].value;
                invoice.deduction = stripToNumberWithFormat(data[rowid]["deduct"]);
                var receivedValue = $("#received_"+rowid).val()
                invoice.received = stripToNumberWithFormat(receivedValue);//stripToNumber(data[i][11]);
                // Fix by EPIS8 26/12/2016 refer issue no 4, 6, 9
                var isStateAgency = view.inputCustomerSegment.key() == "2";
                if(invoice.deduction > 0){
                    if(invoice.totalCharge != invoice.received){ invoice.deduction = invoice.balanceDue * ((isStateAgency) ? 0.01 : 0.03);}
                    else{ invoice.deduction = stripToNumberWithFormat(data[rowid]["deduct"]);}//stripToNumber(data[i][12]);}
                } else {
                    invoice.deduction = 0;
                }
                // End Fix by EPIS8 26/12/2016 refer issue no 4, 6, 9
                invoice.billCycle = data[rowid]["billCycle"];//data[i][13];
                invoice.status = data[rowid]["status"];//data[i][14];
                invoice.currencyCode = currencyCode;
                invoice.kenan = kenan;
                invoice.afterSaleDiscount = (view.afterSaleDiscountMap && view.afterSaleDiscountMap[invoiceNo] != null ? view.afterSaleDiscountMap[invoiceNo] : 0)
                invoice.calculatedVat = calculateVatFromIncluded(invoice.received, invoice.vatRate, data[rowid]["invoiceVatDetails"]);//by NSD 20-04-2017
                invoice.isStateAgency = isStateAgency;
                invoice.subNoList = data[rowid]["subNoList"];
                invoice.discApprUser = discApprUser;
                invoice.discountType = chkDiscount;//by NSD 03-04-2017
                if(chkDiscount == "2"){
                    invoice.afterSaleDiscVat = (invoice.afterSaleDiscount*vatRate/100).toFixed(2);
                }else{
                    invoice.afterSaleDiscVat = 0;
                }
                console.log('yyyyyy');console.log(data[rowid]["invoiceNo"]); console.log(invoice);console.log('yyyyy');
                invoice.invoiceVatDetails = data[rowid]["invoiceVatDetails"];
                // alert(data[rowid]["subNoList"])
            }
        }
        /*
         for (var i = 0, m = data.length; i < m; i++) {
         var invoiceNo = data[i][2], inv = invoiceMap[invoiceNo], vatRate = (inv ? inv.vatRate : 0), currencyCode = (inv ? inv.currencyCode : 0), kenan = (inv ? inv.accountNo : 0);
         invoice = find(bill.invoiceList, "no", { "no": invoiceNo });
         if (invoice.checked == null) invoice.checked = data[i][1] == "on";
         invoice.issueDate = data[i][3];
         invoice.dueDate = data[i][4];
         invoice.amount = stripToNumber(data[i][5]);
         invoice.discount = stripToNumber(data[i][6]);
         invoice.charge = invoice.amount - invoice.discount;
         invoice.vat = stripToNumber(data[i][7]);
         invoice.vatRate = vatRate;
         invoice.totalCharge = stripToNumber(data[i][8]);
         invoice.balanceDue = stripToNumber(data[i][10]);
         invoice.received = stripToNumber(data[i][11]);
         // Fix by EPIS8 26/12/2016 refer issue no 4, 6, 9
         if(invoice.totalCharge != invoice.received){ invoice.deduction = invoice.balanceDue * 0.03;}
         else{ invoice.deduction = stripToNumber(data[i][12]);}
         // End Fix by EPIS8 26/12/2016 refer issue no 4, 6, 9
         invoice.billCycle = data[i][13];
         invoice.status = data[i][14];
         invoice.currencyCode = currencyCode;
         invoice.kenan = kenan;
         invoice.afterSaleDiscount = (view.afterSaleDiscountMap && view.afterSaleDiscountMap[invoiceNo] != null ? view.afterSaleDiscountMap[invoiceNo] : 0)
         invoice.calculatedVat = calculateVatFromIncluded(invoice.received, invoice.vatRate);
         }
         */
        if (isPrepaid) {
            var received = view.advancedAmount.val(), vatRate = stripToNumberWithFormat(view.custInfoInputVatRate.val()), vat = calculateVatFromIncluded(received, vatRate), charge = received - vat;
            invoice = find(bill.invoiceList, "no", { "no": "Advance Payment" });//{ "no": "-" });
            invoice.checked = true;
            invoice.issueDate = "-";
            invoice.dueDate = "-";
            invoice.amount = charge;
            invoice.discount = 0;
            invoice.charge = charge;
            invoice.vat = invoice.calculatedVat = vat;
            invoice.vatRate = vatRate;
            invoice.totalCharge = received;
            invoice.balanceDue = 0;
            invoice.received = received;
            invoice.deduction = 0;
            //invoice.billCycle = "Advance Payment";
            invoice.billCycle = view.billCycle.val()//by NSD 24-03-2017
            invoice.currencyCode = 12;
            invoice.kenan = view.kenan;
            invoice.afterSaleDiscount = 0;
        }
        return billingList;

    }

    view.tab.customerInfoTab.init(1, function(e) {
        view.table.subscriptionList.showLoad();
        get("../findSubscription.json", { "no": billNoSelected }, function(res) {
            var data = []; $.each(res.data, function(i,o){ data.push(["-", o.subscrType, o.subscrNo, o.statusName]) });
            view.table.subscriptionList.data(data);
        }, view.dialog.mainMessageDialog, function(){ view.table.subscriptionList.hideLoad() });
    });
    view.input.changeReceiptAddress.click(function() {
        view.tab.addressTab.show(0);
        view.input.receiptAddress.disable(!this.checked);
    });
    view.tab.invoiceDetailsTab.init(0, function() {
        // view.table.invoiceList.clear();
        view.table.invoiceList.showLoad();

        $.get("../findInvoiceList.json", { "no": billNoSelected}, function(res) {
// 		view.table.invoiceList.showLoad();
            var invoiceData = $.map((res && res.data ? res.data : []), invoiceListMapper)
            console.log("------> Invoice Data : "+invoiceData);
            if(invoiceData.length>0){
                console.log("------>2 Invoice Data : x"+invoiceData+"x");
            }
            view.table.invoiceList.rawData(invoiceData);
            var combineInvoiceList = [];
            $.get("../findWriteOffInvoiceList.json", { "no": billNoSelected }, function(res) {
                var writeOffInvoiceData = $.map((res && res.data ? res.data : []), writeOffInvoiceListMapper);
                combineInvoiceList.push.apply(combineInvoiceList,invoiceData);
                combineInvoiceList.push.apply(combineInvoiceList,writeOffInvoiceData);
                console.log("writeOffInvoiceData>"+writeOffInvoiceData)
                view.table.invoiceList.rawData(combineInvoiceList);
                view.table.invoiceList.hideLoad();
            });
// 		view.table.invoiceList.showLoad();
        });
// 	view.table.invoiceList.hideLoad();
    });
    view.tab.invoiceDetailsTab.init(1, function() {
        view.table.historyList.showLoad();
        $.get("../findPaymentHistory.json", { "billingNo": billNoSelected }, function(res) {
            view.table.historyList.hideLoad().rawData($.map((res && res.data ? res.data : []), function(o,i){
                return {
                    //"updateDt":	view.utils.dateTimeFormat(o.updatePrintDate)
                    //,"receiptDt": view.utils.dateTimeFormat(o.receiptPrintDate)
                    "updateDt":o.updatePrintDateStr
                    ,"receiptDt": o.receiptPrintDateStr
                    ,"receiptNo": o.receiptNo
                    ,"branch": o.shopPaymentName
                    ,"user": o.paymentReceiver
                    ,"invoiceNo": o.billRefNo
                    ,"billCycle": o.billCycle
                    ,"totalCharge": (o.billAmount || 0)
                    ,"afterSaleDiscount" : (o.afterSaleDiscount || 0)
                    ,"payMethod": o.paymentMethod
                    ,"payType": o.paymentCategory
                    ,"totalPaid": ((o.transAmount || 0)-(o.afterSaleDiscount || 0))
                    ,"vatAmt": (o.billAmountVat || 0)
                    //,"totalPaid": (o.transAmount || 0)
                    ,"status": o.status
                    ,"remark": o.remark
                    ,"currencyCode": o.currencyCode
                };
            }));
        });
    });
    view.tab.invoiceDetailsTab.init(2, function() {
        view.table.changeList.showLoad();
        $.get("../findPaymentDetails.json", { "billingNo": billNoSelected }, function(res) {
            /*console.log('1902-5555');
             console.log(res);
             console.log('1902-5555');*/
            view.table.changeList.hideLoad().rawData($.map((res && res.data ? res.data : []), function(o,i){
                var vatRate = 0.00;
                try{
                    vatRate = parseFloat(o.vatType);
                }catch(err) {
                    vatRate = 0.00;
                }
                return {
                    "paidDt": convertToDate(o.paymentDate)
                    ,"invoiceNo": o.invoiceNo
                    // ,"vat": o.vatType //by NSD 19-02-2017
                    //,"vat": ((o.vatAmount!=0)?o.vatAmount+"":"")
                    ,"totalCharge": (o.totalCharged*(1.00)).toFixed(2)
                    ,"processedDt": view.utils.dateTimeFormat(o.processDate)
                   // ,"branch":o.locationName
                  //  ,"payType": o.paymentType
                    ,"billCycle": o.billCycle
                    ,"status": o.status
                    ,"trackingId": o.trackingId
                    /*
                     <BillingAccountNo>800079218</BillingAccountNo>
                     <BillRefNo>0</BillRefNo>
                     <TrackingNo>14116</TrackingNo>
                     <Amount>234</Amount>
                     <vatAmount>
                     <Status>ยกเลิก</Status>
                     <ProcessDate>2011-05-03</ProcessDate>
                     <PaymentType>Advance</PaymentType>
                     billPeriod
                     <LocationName>กองระบบบัญชี (ตัดหนี้สูญ)</LocationName>
                     <PayDate>2011-05-03</PayDate>
                     */
                    // ตัด Column ( ใบเสร็จรับเงิน , ภาษีมูลค่าเพิ่ม VAT , สถานที่รับชำระ ,ผู้รับชำระ , ประเภทชำระ ) ออก

                    /*
                     "paidDt": view.utils.dateTimeFormat(o.paymentDate)
                     ,"invoiceNo": o.invoiceNo
                     ,"totalCharge": o.totalCharged
                     ,"processedDt": view.utils.dateTimeFormat(o.processDate)
                     ,"payType": o.paymentType
                     ,"trackingId": o.trackingId
                     ,"trackingIdServ": o.trackingIdServ
                     */
                };
            }));
        });
    });
    $(document).ready(function() {

        // Added 20161201. Detect barcode scanner.
    	var isStateAgency ='2';
        //alert('333 '+isStateAgency);
        if(isStateAgency=='2'){
            $("#69tvi").prop('checked', 'checked');
        }else{
            $("#3trs").prop('checked', 'checked');
        }

           view.panel.navigatePanel.show();
           view.panel.customerAddPanel.show();
           
           view.radio.specialOptions.click(function(val) {
       		checkSpecial = val;
       		console.log("CheckSpecial :::: "+checkSpecial)
       		var note = "";
       		if (val == "3") {
//        		params["checkSpecial"] = checkSpecial;
       		
       		
       			var advanceAmount =  view.input.change.val() + view.input.inputAdvanced.val();
       			view.input.inputAdvanced.disable();
       	
               }else if(val == "2") {
//        			params["checkSpecial"] = checkSpecial;
                   view.input.inputAdvanced.disable();
                   view.dialog.otherProfitVat.show();

                   var otherAmount =  view.input.change.val() + view.input.inputAdvanced.val();
                  
               }else if(val == "1") {
//        			params["checkSpecial"] = checkSpecial;
                   view.input.inputAdvanced.disable();
                   view.dialog.otherProfitVat.show();

                   var otherAmount =  view.input.change.val() + view.input.inputAdvanced.val();
               }else{
                   view.inputAdvanced.enable();
               }
       	});

    }).on("click", view.button.advanceSearch.el, function(){ view.dialog.customerSearch.show() });
    function SelectButton(val, row, ind) {
        //return "<a class='btn btn-success btn-xs' onclick='BillSelectButtonEvent("+ JSON.stringify(row) +")'>เลือก</a>";
        return "<a class='btn btn-success btn-xs' onclick='BillSelectButtonWithParamEvent("+ row.billNo +","+row.acctNo+")'>เลือก</a>";
    }
    function BillSelectButtonEvent(bill) {
        view.input.billNo.val(bill.billNo);
        view.button.search.elem.click();
        view.dialog.customerSearch.hide();
        view.advanceInvSelected = bill.acctNo;
    }
    function BillSelectButtonWithParamEvent(billNo,acctNo) {
        view.input.billNo.val(billNo);
        view.button.search.elem.click();
        view.dialog.customerSearch.hide();
        view.advanceInvSelected = acctNo;
    }
    function avdInvoiceListMapper(o) {
        return {
            "acctNo": o.invoiceNo
            , "customerId": o.billingNo
            , "customerAccountName": o.billingName
            , "propLabel": o.customerType
            , "billGroup": o.billGroup
            , "billNo": o.billingNo
            , "tableID" :"advSrcBillNoResultList"
        };
    }
    function invoiceListMapper(o) {
        var isStateAgency = view.inputCustomerSegment.key() == "2";
        if (o.billNo == "0") {
            view.kenan = o.accountNo;
        }
        if (o.billNo == "0" || o.balanceDue == 0)
            return null;
        return {
            "invoiceNo": o.billNo
            ,"accountNo": o.accountNo
            ,"issueDt": view.utils.dateFormat(o.issueDate)
            ,"dueDt": view.utils.dateFormat(o.dueDate)
            ,"amount": stripToNumberWithFormat(o.amountBeforeTax)
            ,"charge": stripToNumberWithFormat(o.amountBeforeTax)
            ,"discount": stripToNumberWithFormat((o.discount || 0))
            ,"vat": stripToNumberWithFormat(o.taxAmount)
            ,"vatRate": stripToNumberWithFormat((o.taxRate || "0"))
            ,"totalCharge": stripToNumberWithFormat(o.amountAfterTax)
            ,"balanceDue": stripToNumberWithFormat(o.balanceDue)
            ,"totalAdj": stripToNumberWithFormat(o.totalAdj)
            ,"totalPaid": stripToNumberWithFormat(o.totalPaid)
            ,"rentalCharge": o.rentalCharge
            ,"usageCharge": o.usageCharge
            ,"deduct": (o.rentalCharge * (isStateAgency ? 0.01 : 0.05)) + (o.usageCharge * (isStateAgency ? 0.01 : 0.03))
            ,"billCycle": view.utils.dateFormat(o.chargeCycleFromDate) +" - "+ view.utils.dateFormat(o.chargeCycleToDate)
            ,"billRefNo": o.billNo
            ,"currencyCode": o.currencycode
            ,"status": "ปกติ"
            //,"aging":stripToNumberWithFormat(o.aging)
            ,"aging":o.aging
            ,"subNoList" : o.subNoListensationTaxList.insert(["-", view.input.compensationDepartmentCost.val(), view.input.compensationTaxAmount.val()], true)
            ,"invoiceDisplay": o.invoiceDisplay
            ,"invoiceVatDetails": o.invoiceVatDetails
            ,"taxTypeCode": o.taxTypeCode
        };
    }
    function writeOffInvoiceListMapper(o) {
        var isStateAgency = view.inputCustomerSegment.key() == "2";
        if (o.billNo == "0") {
            view.kenan = o.accountNo;
        }
        if (o.billNo == "0" || o.balanceDue == 0)
            return null;
        return {
            "invoiceNo": o.billNo
            ,"accountNo": o.accountNo
            ,"issueDt": view.utils.dateFormat(o.issueDate)
            ,"dueDt": view.utils.dateFormat(o.dueDate)
            ,"amount": stripToNumberWithFormat(o.amountBeforeTax)
            ,"charge": stripToNumberWithFormat(o.amountBeforeTax) - stripToNumberWithFormat((o.taxAmount || 0))
            ,"discount": stripToNumberWithFormat((o.discount || 0))
            ,"vat": stripToNumberWithFormat(o.taxAmount)
            ,"vatRate": stripToNumberWithFormat((o.taxRate || "0"))
            ,"totalCharge": stripToNumberWithFormat(o.amountAfterTax)
            ,"balanceDue": stripToNumberWithFormat(o.balanceDue)
            ,"totalAdj": stripToNumberWithFormat(o.totalAdj)
            ,"totalPaid": stripToNumberWithFormat(o.totalPaid)
            ,"rentalCharge": o.rentalCharge
            ,"usageCharge": o.usageCharge
            ,"deduct": (o.rentalCharge * (isStateAgency ? 0.01 : 0.05)) + (o.usageCharge * (isStateAgency ? 0.01 : 0.03))
            ,"billCycle": view.utils.dateFormat(o.chargeCycleFromDate) +" - "+ view.utils.dateFormat(o.chargeCycleToDate)
            ,"billRefNo": o.billNo
            ,"currencyCode": o.currencycode
            ,"status": "หนี้สูญ"
            ,"aging":o.aging
            ,"subNoList" : o.subNoList
        };
    }
    function payTypeFormatter(val, row, ind) {
        var payType = !$.isNumeric(stripToNumber(val)) ? "-" : stripToNumber(val);
        var result;
        if(payType == 1) {
            result = "check/cash";
        } else if(payType == 2) {
            result = "credit card";
        } else if(payType == 3) {
            result = "direct debit (ตัดผ่านบัญชี/เครดิต)";
        } else if(payType == 4) {
            result = "debit card";
        } else {
            result = payType;
        }
        return result;
    }
    function changeListStatusFormatter(val, row, ind) {
        var status = !$.isNumeric(stripToNumber(val)) ? "-" : stripToNumber(val);
        var result;
        if(status == 1) {
            result = "distribution of an active payment";
        } else if(status == 2) {
            result = "distribution of an active postbill payment reversal";
        } else if(status == 3) {
            result = "distribution reversed due to later type-4 reallocation";
        } else if(status == 4) {
            result = "reallocation resulting in reversal of earlier distribution";
        } else if(status == 5) {
            result = "distribution reversed due to postbill payment reversal";
        } else if(status == 6) {
            result = "distribution reversed due to prebill payment reversal";
        } else if(status == 7) {
            result = "distribution of an active prebill payment reversal";
        } else {
            result = status;
        }
        return result;
    }
    function invoiceServiceFormatter(val, row, ind) {
        var guid = view.utils.guid();
        var loadPanel = new LoadingPanel(guid);
        $.get("../findProduct.json", { "no": row.invoiceNo,"source":"IBACSS" }, function(res){
            loadPanel.finish(Mustache.render($('#template').html(), { "invoices": $.map(res.data, function(o, i){
                return { "productCode": o.productCode, "productName": o.productName, "subProductCode": o.subProductCode, "subProductName": o.subProductName, "revTypeCode":o.revTypeCode , "revTypeName": o.revTypeName, "amount": view.utils.numberFormat(o.amount) }
            }) }));
        });
        return loadPanel;
    }
    function invoiceListInputBlurEvent() {
    	view.dialog.mainMessageDialog.hide();
    	$('#alertDangerAreaMsg').removeClass('hide');
    	if(view.inputCustomerSegment.key =="-1"){
    		view.dialog.mainMessageDialog.error('กรุณาเลือกกลุ่มผู้ใช้บริการ');
    		return false;
    	}
    	calculate();

    }
    function invoiceListCheckEvent(row) {
        var listSize = view.table.invoiceList.selected().length;
        view.checkboxAdditionalDiscount.disable(listSize != 1).unchecked();
        view.inputAdditionalDiscount.disable().val(0);
        //console.log('checked');console.log(row);console.log('checked');
        //by NSD 03-04-2017
        view.radio.discountCheckbox.disable(1, false);
        view.radio.discountCheckbox.disable(0, false);

        calculate();
    }
    function invoiceListUncheckEvent(row) {
        var listSize = view.table.invoiceList.selected().length;
        view.checkboxAdditionalDiscount.disable(listSize != 1).unchecked();
        view.inputAdditionalDiscount.disable().val(0);
        if(listSize!=1){
            view.radio.discountCheckbox.disable(1, true);
            view.radio.discountCheckbox.disable(0, true);
            view.radio.discountCheckbox.unchecked();
        }

        calculate();
    }
    function invoiceListCheckAllEvent() {
        invoiceListCheckEvent(null);
    }
    function invoiceListUncheckAllEvent() {
        invoiceListUncheckEvent(null);
    }
    function calculateVatFromIncluded(received, vatRate, invoiceVatDetails) {
        var rtVat = 0;
        if(invoiceVatDetails!=null && invoiceVatDetails.length>1){
            for(i1=0;i1<invoiceVatDetails.length;i1++){
                rtVat += invoiceVatDetails[i1].vat;
            }
        }else{
            rtVat =  (received / (100 + vatRate)) * vatRate;
        }
        return rtVat;
    }
    function calculate() {
        var invoiceMap = {}; $.each(view.table.invoiceList.rawData(), function(i, o){ invoiceMap[o.invoiceNo] = o });
        //var data = view.table.invoiceList.data();
        var sumVat = 0, sumReceived = 0, sumDeduct = 0 ,sumTotalCharge=0, sumDiscount = 0;
        var table=$("#invoiceList");
        var data=table.bootstrapTable("getData");
        var sumAmount = 0;
        //console.log('xxxxx55555');console.log(data);console.log('xxxxx55555');
        //console.log("data size->"+data.length)
        for(var rowid=0;rowid<data.length;rowid++){
            var checked = data[rowid]["checked"];
            if (checked) {

                var invoiceNo = data[rowid]["invoiceNo"];
                var amount = data[rowid]["amount"];
                var discount = data[rowid]["discount"];//by NSD 28-03-2017
                var vatRate = invoiceMap[invoiceNo] == null ? 7 : invoiceMap[invoiceNo].vatRate;
                var balanceDueValue = data[rowid]["balanceDue"];

                // var receivedList = document.getElementsByName("received");
                var receivedValue = $("#received_"+rowid).val();//receivedList[rowid].value;

                var vatValue = data[rowid]["vat"];
                var deductValue = data[rowid]["deduct"];
                var totalChargeValue = data[rowid]["totalCharge"];
                var invoiceVatDetails = data[rowid]["invoiceVatDetails"];
                //console.log("receivedValue->" + receivedValue)
                var balanceDue = stripToNumberWithFormat(balanceDueValue), received = stripToNumberWithFormat(receivedValue), vat = stripToNumberWithFormat(vatValue);
                // console.log("received->" + received)
                var deduct = stripToNumberWithFormat(deductValue);
                var totalCharge = stripToNumberWithFormat(totalChargeValue);
                console.log("invoiceNo: " + invoiceNo+ "amount: "+ amount+ "deduct: "+ deduct)
                /*if (balanceDue != received)*/
                vat = calculateVatFromIncluded(received, vatRate, invoiceVatDetails);
                sumReceived += received;
                sumVat += vat;
                sumDeduct += deduct;
                sumTotalCharge += totalCharge;
                sumAmount += amount;
                sumDiscount += discount;

            }
        }
        /*
         for (var i = 0, m = data.length; i < m; i++) {
         var checked = data[i][1] == "on", invoiceNo = data[i][2];
         var vatRate = invoiceMap[invoiceNo] == null ? 7 : invoiceMap[invoiceNo].vatRate;
         var balanceDue = stripToNumber(data[i][10]), received = stripToNumber(data[i][11]), vat = stripToNumber(data[i][7]), deduct = stripToNumber(data[i][12]), totalCharge = stripToNumber(data[i][8]);
         if (!checked) continue;
         vat = calculateVatFromIncluded(received, vatRate);
         sumReceived += received;
         sumVat += vat;
         sumDeduct += deduct;
         }
         */
        //console.log("sumReceived->"+sumReceived)
        var isStateAgency = view.inputCustomerSegment.key() == "2";
        console.log("received:" + received + " totalCharge :"+ totalCharge+ " sumReceived :"+ sumReceived+ " sumVat :"+ sumVat+ " balanceDue :"+ balanceDue+ " sumDeduct :"+ sumDeduct)
        // Fix by EPIS8 WT Issue 19/01/2016
        if(received != balanceDue) {
            if(sumDeduct > 0)
                sumDeduct = (sumReceived - sumVat) * ((isStateAgency) ? 0.01 : 0.03);
        }
        var balance = sumReceived - sumVat;
        if(sumDeduct > 0){
            if(sumAmount != balance){
                sumDeduct = balance * ((isStateAgency) ? 0.01 : 0.03);
            }
        }
        // End Fix by EPIS8 WT Issue 19/01/2016
        // End Fix by EPIS8 WT Issue 19/01/2016

        view.input.balance.val(balance);
        view.input.vat.val(sumVat);
        view.input.totalCharge.val(sumReceived);
        // Fix by EPIS8 26/12/2016 refer issue no 4, 6, 9
        console.log("sumDeduct :"+sumDeduct);
        // End Fix by EPIS8 26/12/2016 refer issue no 4, 6, 9
        view.input.deduct.val(sumDeduct);
        view.input.discountAmount.val(sumDiscount);
        view.input.beforeDiscountAmount.val(balance+sumDiscount);
        view.button.addPayment.disable(sumTotalCharge <= 0);
    }
    function getRowSelected(eleId){
        var table=$("#"+eleId);
        var data=table.bootstrapTable("getData");
        var dataReturn=[];
        for(var rowid=0;rowid<data.length;rowid++) {
            var checked = data[rowid]["checked"];
            if (checked) {
                dataReturn = data[rowid];
                break;
            }
        }
        return dataReturn;
    }
    function inputAdditionalDiscountBlurEvent() {
        var data = view.table.invoiceList.selected();
        view.afterSaleDiscountMap = (view.afterSaleDiscountMap || {});
        view.afterSaleDiscountMap[$.trim(data[0][2])] = view.inputAdditionalDiscount.val();
    }
    function advancedCheckboxClickEvent() {
        view.advancedAmount.disable(!this.checked);
        view.billCycle.disable(!this.checked);
        view.button.addPayment.disable(!this.checked);
        if (!this.checked) {
            view.advancedAmount.val(0);
            view.billCycle.val('');
        }
    }
    function numberAgingFormatter(x) {
        return x;//x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    function stripToNumberWithFormat(str){
        var strFormat= str+"";
        strFormat = strFormat.replace(/[^0-9\.]/g, "");
        return parseFloat(strFormat, 10);
    }payChqNo

    function taxIdKeyUpEvent() { if(!view.input.taxId.isNumeric()) view.input.taxId.val(""); }
    function branchKeyUpEvent() { if(!view.input.branch.isNumeric()) view.input.branch.val(""); }
//     function summaryPaymentClickEvent() { location.href = 'pay-service-charge_2.jsp'; }
    function submitPaymentClickEvent() { submitPayment('TH') }
    function convertToDate(dtNumber){
        function pad(s) { return (s < 10) ? '0' + s : s; }
        var dt = new Date(dtNumber);
        return [pad(dt.getDate()), pad(dt.getMonth()+1), dt.getFullYear()].join('/');
    }
    function chkCurrencySymbol(str){
        console.log("currency code: "+str);
        var url = "../getSymbolByCurrencyCode.json"; params = { "code": str };
        var symbol="฿";
        var data = [];
        console.log(url);
        console.log(params);
        // var exchangeRate = null;
        $.ajax({
            url: url,
            type: "GET",
            data: {
                "code": str
            },
            async: false,
            success: function(res) {
                window.getSymbolByCurrencyCodeObj = res.data[0];
                console.log(window.getSymbolByCurrencyCodeObj);
                symbol = window.getSymbolByCurrencyCodeObj.currencySymbol;
                symbol = symbol!=null?symbol:"฿"
            },
            error: function(){
                symbol = "฿"
            }
        });
        console.log("symbol =================> "+symbol);
        return symbol;
    }
    var chkDiscount = ""; var discApprUser = "";
    view.radio.discountCheckbox.click(function(val) {
        //var discountCheckBox = $(this);
        chkDiscount = val;
        if (val == "1" || val == "2") {
            view.dialogAuthentication.show().done(function(res) {
                discApprUser = $("#discApprUser").val();
                view.inputAdditionalDiscount.enable();
            }).fail(function(res) {
                view.inputAdditionalDiscount.disable();
            }).cancel(function() {
                //discountCheckBox.prop("checked", false)
            });
        } else {
            view.inputAdditionalDiscount.disable().val(0);
        }
    });
    function modalPopupRemark(remark){
        if(remark != "null"){
            document.getElementById("remark").textContent=remark;
        }else{
            document.getElementById("remark").textContent="ไม่มีหมายเหตุ";
        }
        view.dialog.remarkModal.show();
    }

    function addFeeTaxNoClickEvent() {
    	view.table.feeTaxList.insert(["-", view.input.feeDepartmentCost.val(), view.radio.feeTaxType.label(), view.input.feeWTAmount.val(), view.input.feeBuyTaxAmount.val(), view.input.feeTaxAmount.val()], true);
        $('#feeTaxList td:nth-child(3)').hide();
    }
    function addPenaltyTaxNoClickEvent() {
        view.table.penaltyTaxList.insert(["-", view.input.inputInvoiceNo.val(), view.radio.penaltyTaxType.label(), view.input.penaltyTaxAmount.val()], true);
        $('#penaltyTaxList td:nth-child(3)').hide();
    }
    function addRetentionTaxNoClickEvent() {
        view.table.retentionTaxList.insert(["-", view.input.inputInvoiceNo.val(), view.radio.retentionTaxType.label(), view.input.retentionTaxAmount.val()], true);
        $('#retentionTaxList td:nth-child(3)').hide();
    }
    function addCompensationTaxNoClickEvent() {
    	view.table.compensationTaxList.insert(["-", view.input.compensationDepartmentCost.val(), view.input.compensationTaxAmount.val()], true);
    }

    function payChqSubmitClickEvent() {
    	if(validationChqSubmit()) view.table.payChqList.insert(["-", view.input.payChqBankCode.val(), view.input.payChqBankName.val(), view.input.payChqBranch.val(), view.input.payChqNo.val(), view.input.payChqDate.val(), view.input.payChqAmount.val()], true)
    }
    function validationChqSubmit() {
    	var isValid = true;
    	if(view.input.payChqNo.val() == "") {view.input.payChqNo.error(true); isValid = false;} else {view.input.payChqNo.error(false);}
    	if(view.input.payChqDate.val() == "") {view.input.payChqDate.error(true); isValid = false;} else {view.input.payChqDate.error(false);}
    	return isValid;
    }
    function payCCSubmitClickEvent() {
    	if(validatePayCCSubmit()) view.table.payCCList.insert(["-", view.input.payCCType.val(), view.input.payCCNo.val(), view.input.payCCBankName.val(), view.input.payCCAmount.val()], true)
    }
    function validatePayCCSubmit() {
    	var isValid = true;
    	if(view.input.payCCType.index() === 0) {view.input.payCCType.error(true); isValid = false;} else {view.input.payCCType.error(false);}
    	if(view.input.payCCNo.val() == "" || view.input.payCCNo.val() < 16) {view.input.payCCNo.error(true); isValid = false;} else {view.input.payCCNo.error(false);}
    	if(view.input.payCCBankName.index() === 0) {view.input.payCCBankName.error(true); isValid = false; } else {view.input.payCCBankName.error(false);}
    	return isValid;
    }
    function payMoneyOrderButtonSubmitClickEvent() {
    	if(validatePayMoneyOrderButtonSubmit()) view.table.payMoneyOrderTableList.insert(["-", view.input.payMoneyOrderInputNo.val(), view.input.payMoneyOrderInputDate.val(), view.input.payMoneyOrderInputPostCode.val(), view.input.payMoneyOrderInputAmount.val()], true);
    }
    function validatePayMoneyOrderButtonSubmit() {
    	var isValid = true;
    	if(view.input.payMoneyOrderInputDate.val() == "") { view.input.payMoneyOrderInputDate.error(true); isValid = false; } else {view.input.payMoneyOrderInputDate.error(false);}
    	if(view.input.payMoneyOrderInputNo.val() == "") { view.input.payMoneyOrderInputNo.error(true); isValid = false; } else {view.input.payMoneyOrderInputNo.error(false);}
    	return isValid;
    }
    function payBillExchgButtonSubmitClickEvent() {
    	if(validatePayBillExchgButtonSubmit()) view.table.payBillExchgTableList.insert(["-", view.input.payBillExchgInputNo.val(), view.input.payBillExchgInputDate.val(), view.input.payBillExchgInputPostCode.val(), view.input.payBillExchgInputAmount.val()], true);
    }
    function validatePayBillExchgButtonSubmit() {
    	var isValid = true;
    	if(view.input.payBillExchgInputDate.val() == "") { view.input.payBillExchgInputDate.error(true); isValid = false; } else {view.input.payBillExchgInputDate.error(false); }
    	if(view.input.payBillExchgInputNo.val() == "") { view.input.payBillExchgInputNo.error(true); isValid = false; } else {view.input.payBillExchgInputNo.error(false); }
    	return isValid;
    }
    
    function submitPayment(receiptLang) {
        var radioChkVal = $("input[name='specialOptions']:checked").val();
    	var balanceDue = view.input.balanceDue.val(), received = view.input.inputReceived.val(), change = view.input.change.val(), advance = view.input.inputAdvanced.val(), deduction = Math.abs(view.input.deduct.val());
//     	if (balanceDue > received) {
//     		view.dialog.mainMessageDialog.clear().error(["ระบบไม่อนุญาตให้จ่าย เนื่องจากจำนวนเงินไม่ถูกต้อง"]).show();
//     		return false;
//     	}
//     	if (subtract(received, balanceDue) != add(advance, change)) {
//     		view.dialog.mainMessageDialog.clear().error(["ระบบไม่อนุญาตให้จ่าย เนื่องจากจำนวนเงินที่ทำรายการชำระล่วงหน้าไม่ถูกต้อง"]).show();
//     		return false;
//     	}
//     	var billingList = view.session("billingList"), sumBalanceDue = 0, sumReceived = 0, difBalanceDue = 0, difReceived = 0;
//     	for (var i = 0, m = billingList.length; i < m; i++) {
//     		for (var j = 0, n = billingList[i].invoiceList.length; j < n; j++) {
//     			var invoice = billingList[i].invoiceList[j]; if (invoice.no == "-" || invoice.no == "Advance Payment") continue;
//     			if (invoice.checked) { sumBalanceDue += invoice.balanceDue; sumReceived += invoice.received; }
//     			else                 { difBalanceDue += invoice.balanceDue; difReceived += invoice.received; }
//     		}
//     	}

//     	console.log("sumBalanceDue : "+sumBalanceDue +" , sumReceived : "+sumReceived+" , advance : "+advance+" , difBalanceDue : "+difBalanceDue);
//     	var hasDueAmount = false;
//     	for(var i = 0 ; i < billingList.length ; i++){
//     		for (var j = 0; j < billingList[i].invoiceList.length; j++) {
//     			var invoice = billingList[i].invoiceList[j]; if (invoice.no == "-" || invoice.no == "Advance Payment") continue;//by NSD 24-03-2017
//     			console.log("invoice.balanceDue : "+invoice.balanceDue +" , invoice.received : "+invoice.received);
//     			if((invoice.balanceDue - invoice.received) > 0){
//     				//Check advance payment that have or not
//     				if (view.input.inputAdvanced.val() > 0) {
//     					var inputs = view.table.customerList.elem.find("input");
//     					var inputs2 = view.table.customerList2.elem.find("input");
//     					$.each(view.table.customerList.data(), function(k,o) {
//     						var totalCharge = stripToNumber(inputs[k].value);
//     						console.log("billingList["+i+"].custNo : "+billingList[i].custNo+" , o.custNo : "+o.custNo +" , Advance Total Charge : "+totalCharge);
//     						if(billingList[i].custNo == o.custNo && totalCharge > 0){
//     							hasDueAmount = true;
//     						}
//     					});
//     					$.each(view.table.customerList2.data(), function(k,o) {
//     						var totalCharge = stripToNumber(inputs2[k].value);
//     						console.log("billingList["+i+"].custNo : "+billingList[i].custNo+" , o.custNo : "+o.custNo +" , Advance Total Charge : "+totalCharge);
//     						if(billingList[i].custNo == o.custNo && totalCharge > 0){
//     							hasDueAmount = true;
//     						}
//     					});
//     				}
//     			}
//     		}
//     	}

//     	console.log("hasDueAmount : "+hasDueAmount);

    	if (advance > 0) {
    		var inputs = view.table.customerList.elem.find("input"), totalAdvance = 0;
    		var inputs2 = view.table.customerList2.elem.find("input"), totalAdvance = 0;
    		$.each(view.table.customerList.data(), function(i,o) {
    			totalAdvance += stripToNumber(inputs[i].value);
    		});
    		$.each(view.table.customerList2.data(), function(i,o) {
    			totalAdvance += stripToNumber(inputs2[i].value);
    		});
    		totalAdvance = (totalAdvance*100)/100;
    	}
    	console.log("step1 validation passed.");
    


    	console.log("step2 initial params set.");
    	var deductIndex = 0;
    	var gettingIncome = 'ขาเข้า', inType = '-IN', outType = '-OUT';
    	var watPaymentCase = "WT ";
    	var deducts=[];
    	var methods=[];
    	var params ={};
    	// <!-- Deduction. -->
        //by NSD 17-03-2017
        var wtRow = view.table.deductionList.find("type", 0);
        var feeRow = view.table.deductionList.find("type", 1);
        var pntRow = view.table.deductionList.find("type", 2);
        var rttRow = view.table.deductionList.find("type", 3);
        var cmpRow = view.table.deductionList.find("type", 4);

    	$.map((window["wthList"] || []), function(o, i) {
            if(wtRow.length>0) {
            	var deduct ={};
       			deduct ={
       				"type": o[3] == "69 ทวิ" ? "69BIS" : o[3] == "69 ตรี" ? "69TRE" : "3TREDECIM",
       				"withholdingDocNo" : $.trim(o[2]),
       				"amount" : o[4].replace(/[,]/g, ""),
       				"invoiceNo" :  $.trim(o[1])
       			}
               
                //console.log('SET WITHHOLDINGTAX '+o[0]+' : '+o[1]+' : '+o[2]+' : '+o[3]+' : '+o[4])
                deductIndex++;
                //watPaymentCase = watPaymentCase.concat("เลขที่: "+$.trim(o[2]+" + "));
                //if($.trim(o[2]).length>0)
                watPaymentCase = watPaymentCase.concat("" + $.trim(o[2] + " + "));
                //else
                //  watPaymentCase = (""+$.trim(o[2]+" + "));
                deducts.push(deduct);
            }
    	});
    	$.map((window["feeList"] || []), function(o, i) {
            if(feeRow.length > 0) {
                params["deducts[" + deductIndex + "].type"] = "FEE".concat((gettingIncome == o[2]) ? inType : outType); // FEE  ค่าธรรมเนียม
                params["deducts[" + deductIndex + "].amount"] = o[5].replace(/[,]/g, "");
                deductIndex++;
            }
    	});
    	$.map((window["pntyList"] || []), function(o, i) {
            if(pntRow.length > 0) {
                params["deducts[" + deductIndex + "].type"] = "PTY".concat((gettingIncome == o[2]) ? inType : outType); // PENALTY ค่าปรับ
                params["deducts[" + deductIndex + "].amount"] = o[3].replace(/[,]/g, "");
                deductIndex++;
            }
    	});
    	$.map((window["rttList"] || []), function(o, i) {
            if(rttRow.length > 0){
    		var type =
    		params["deducts["+ deductIndex +"].type"] = "RTTN".concat((gettingIncome == o[2])? inType : outType); // RETENTION ค่าประกันผลงาน
    		params["deducts["+ deductIndex +"].amount"] = o[3].replace(/[,]/g, "");
    		deductIndex++;
            }
    	});
    	$.map((window["cmpstList"] || []), function(o, i) {
            if(cmpRow.length > 0) {
                params["deducts[" + deductIndex + "].type"] = "CMPST"; // COMPENSATE ค่าตอบแทนการรับชำระ
                params["deducts[" + deductIndex + "].amount"] = o[2].replace(/[,]/g, "");
                deductIndex++;
            }
    	});
    	console.log("step3 Deduction set.");
    	var paymentCase = "";
    	// <!-- Pay Method. -->
    	var methodIndex = 0, cashRow = view.table.payTypeList.find("method", 0);
    	// Fix by EPIS8 23/12/2016 refer issue no.57
    	var chequeRow = view.table.payTypeList.find("method", 1);
    	var creditRow = view.table.payTypeList.find("method", 2);
    	var moneyOrderRow = view.table.payTypeList.find("method", 3);
    	var billExchangeRow = view.table.payTypeList.find("method", 4);
    	var couponRow = view.table.payTypeList.find("method", 5);
    	var moneyTransferRow = view.table.payTypeList.find("method", 6);
    	var offsetRow = view.table.payTypeList.find("method", 7);
        var otherRow = view.table.payTypeList.find("method", 9);
        var moneyTransferGFRow = view.table.payTypeList.find("method", 10);
        var moneyForeignRow = view.table.payTypeList.find("method", 8);
        // End Fix by EPIS8 23/12/2016 refer issue no.57
        
        var change = 0 , amount = 0, sumCash = cashRow.find("td:eq(2) div").text().replace(/[,]/g, "");
        var receivedMoney = view.input.inputReceived.val(),balanceDue = view.input.balanceDue.val()
        change = Number(receivedMoney) - Number(balanceDue);

        var amount = Number(sumCash) - change;// Number(change);
        
    	$.map((window["payChqListData"] || []), function(o, i) { // For: Cheque
    		if(chequeRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
                console.log(o);
                var method = {
                		"type" :'CHEQUE',
                		"code" : "CH",
                		"name" :'เช็ค',
                		"chequeNo" : $.trim(o[4]),
                		"amount" :o[6].replace(/[,]/g, ""),
                		"payChqBankCode" :$.trim(o[1]),
                		"payChqBankName" : $.trim(o[2]),
                		"payChqBranch" : $.trim(o[3]),
                		"payChqDate" : $.trim(o[5])
                		
                } 
    			paymentCase = paymentCase.concat("เช็ค "+$.trim(o[2])+" เลขที่: "+$.trim(o[4])+" + ");
    			methods.push(method);
  
    		}
    	});
    	$.map((window["payCCListData"] || []), function(o, i) { // For: Credit Card
    		if(creditRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
    			var method = {
                		"type" :'CREDITCARD',
                		"code" : "CR",
                		"name" :'เครดิต',
                		"cardType" : $.trim(o[1]),
                		"cardNo" : $.trim(o[2]),
                		"bankName" :$.trim(o[1]),
                		"amount" : o[4].replace(/[,]/g, "")
                        		
                }
    			paymentCase = paymentCase.concat("บัตรเครดิต "+$.trim(o[1])+" เลขที่: "+$.trim(o[2])+" + ");
    		}
    	});
    	$.map((window["payMoneyOrderTableListData"] || []), function(o, i) { // For: Money Order
    		if(moneyOrderRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
    			params["methods["+ methodIndex +"].type"] = "MONEYORDER";
    			params["methods["+ methodIndex +"].code"] = "MO";
    			params["methods["+ methodIndex +"].name"] = "ธนาณัติ";
    			params["methods["+ methodIndex +"].mnyOrderNo"] = $.trim(o[1]);
    			params["methods["+ methodIndex +"].mnyOrderDt"] = o[2] +" 00:00:00";
    			params["methods["+ methodIndex++ +"].amount"] = o[4].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("ธนาณัติ เลขที่: "+$.trim(o[1])+" + ");
    		}
    	});
    	$.map((window["payBillExchgTableListData"] || []), function(o, i) { // For: Bill of Exchange
    		if(billExchangeRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
    			params["methods["+ methodIndex +"].type"] = "BILLEXCHANGE";
    			params["methods["+ methodIndex +"].code"] = "BX";
    			params["methods["+ methodIndex +"].name"] = "ตั๋วแลกเงิน";
    			params["methods["+ methodIndex +"].trnfNo"] = $.trim(o[1]);
    			params["methods["+ methodIndex +"].transferDt"] = o[2] +" 00:00:00";
    			params["methods["+ methodIndex++ +"].amount"] = o[4].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("ตั๋วแลกเงิน เลขที่: "+$.trim(o[1])+" + ");
    		}
    	});
    	$.map((window["payCouponTableListData"] || []), function(o, i) { // For: Coupon
    		if(couponRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
    			params["methods["+ methodIndex +"].type"] = "COUPON";
    			params["methods["+ methodIndex +"].code"] = "CP";
    			params["methods["+ methodIndex +"].name"] = "คูปอง";
    			params["methods["+ methodIndex +"].couponNo"] = $.trim(o[1]);
    			params["methods["+ methodIndex++ +"].amount"] = o[4].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("คูปอง เลขที่: "+$.trim(o[1])+" + ");
    		}
    	});
    	$.map((window["payBankTxnfTableListData"] || []), function(o, i) { // For: Money Transfer
    		if(moneyTransferRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
    			params["methods["+ methodIndex +"].type"] = "BANKTRANSFER";
    			params["methods["+ methodIndex +"].code"] = "TR";
    			params["methods["+ methodIndex +"].name"] = "เงินโอนในประเทศ";
    			params["methods["+ methodIndex +"].bankAcct"] = o[4];
    			params["methods["+ methodIndex +"].transferDt"] = o[5] +" 00:00:00";
    			params["methods["+ methodIndex +"].isBackDt"] = "${epContext.roleName}" == "GFMISAGENT";
    			params["methods["+ methodIndex++ +"].amount"] = o[6].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("เงินโอนในประเทศ + ");
    		}
    	});
        $.map((window["payBankTxnfTableListGfData"] || []), function(o, i) {
    		if(moneyTransferGFRow.length > 0){
    			params["methods["+ methodIndex +"].type"] = "BANKTRANSFER";
    			params["methods["+ methodIndex +"].code"] = "GF";
    			params["methods["+ methodIndex +"].name"] = "เงินโอน (GFMIS)";
    			params["methods["+ methodIndex +"].bankAcct"] = o[4];
    			params["methods["+ methodIndex +"].transferDt"] = o[5] +" 00:00:00";
    			params["methods["+ methodIndex +"].isBackDt"] = "${epContext.roleName}" == "GFMISAGENT";
    			params["methods["+ methodIndex++ +"].amount"] = o[6].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("เงินโอน (GFMIS) + ");
    		}
    	});
    	$.map((window["payOffsetTableListData"] || []), function(o, i) { // For: Offset
    		if(offsetRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
    			params["methods["+ methodIndex +"].type"] = "OFFSET";
    			params["methods["+ methodIndex +"].code"] = "OF";
    			params["methods["+ methodIndex +"].name"] = "offset";
    			params["methods["+ methodIndex +"].offsetDocumentNo"] = o[1];
    			params["methods["+ methodIndex +"].offsetAccountCode"] = o[2];
    			params["methods["+ methodIndex +"].offsetAccountName"] = o[3];
    			params["methods["+ methodIndex++ +"].amount"] = o[4].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("offset "+o[1]+" + "); // add Document No
    		}
    	});
    	$.map((window["payOtherTableListData"] || []), function(o, i) { // For: Other Type
    		if(otherRow.length > 0){	// Fix by EPIS8 23/12/2016 refer issue no.57
    			params["methods["+ methodIndex +"].type"] = "OTHER";
    			params["methods["+ methodIndex +"].code"] = "OT"; 
    			params["methods["+ methodIndex +"].name"] = "อื่นๆ";
    			params["methods["+ methodIndex++ +"].amount"] = o[4].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("อื่นๆ + ");
    		}
    	});
    	$.map((window["payForeignTableListData"] || []), function(o, i) {
    	    console.log("moneyForeignRow >>> ");
    	    console.log(moneyForeignRow.length);
    		if(moneyForeignRow.length > 0){
                console.log("moneyForeignRow +++ true");
    			params["methods["+ methodIndex +"].type"] = "FOREIGNTRANSFER";
    			params["methods["+ methodIndex +"].code"] = "TF";
    			params["methods["+ methodIndex +"].name"] = "เงินโอนต่างประเทศ";
                params["methods["+ methodIndex +"].transferDt"] = o[3] +" 00:00:00";
                params["methods["+ methodIndex +"].isBackDt"] = "${epContext.roleName}" == "GFMISAGENT";
    			params["methods["+ methodIndex++ +"].amount"] = o[5].replace(/[,]/g, "");
    			paymentCase = paymentCase.concat("เงินโอนต่างประเทศ + ");
    		}
    	});

    	if (cashRow.length == 1) { // For: Cash
    	   	
    		var method = {
            		"type" :'CASH',
            		"code" : "CC",
            		"name" :'เงินสด',
            		"amount" : amount
                    		
            }
    		methods.push(method);
    		paymentCase = paymentCase.concat("เงินสด + ");
    	}
    	var watPaymentCaseConclude = "";
    	if(deduction > 0) {
    		var watPaymentCaseArr = watPaymentCase.substring(0, watPaymentCase.length-2).split(" + ");
    		if(watPaymentCaseArr.length > 0) {
    			watPaymentCaseConclude = " + ";
    			watPaymentCaseConclude = watPaymentCaseConclude.concat($.each(watPaymentCaseArr, function(i,o){ return o }).join(" + "));
    		}
    	}
    	var paymentCaseArr = paymentCase.substring(0, paymentCase.length-3).split(" + ");
    	var paymentCaseConclude = $.each(paymentCaseArr, function(i,o){ return o }).join(" + ") + (deduction > 0? watPaymentCaseConclude: "");
    	params["paymentCase"] = paymentCaseConclude;


    	console.log("step4 Payment set.");
    	var billGroup=view.session("billingGroup");
    	var subScriptionData = view.session("subScriptionData");
    	// <!-- Invoice List. -->
    	var custIndex = 0, invoiceIndex = 0, customer, receiptList = [];
        var otherFlg = false;
        if(radioChkVal == "1" || radioChkVal == "2"){
            //console.log('xxxx555');console.log(radioChkVal);console.log(view.table.customerList2.data()); console.log('xxxx555');
            otherFlg = true;
        }
    	
    	console.log("step6 Advance Invoice set.");
    	console.log("-- Ready to post! --");
    	params = {
       		 "inputInvoiceNo": view.input.inputInvoiceNo.val(),
       		 "inputBa":  view.input.inputBa.val(),
       		 "inputBeforVat":  view.input.inputBeforVat.val(),
       		 "inputCusName": view.input.inputCusName.val(),
       		 "inputVatAmount": view.input.inputVatAmount.val(),
       		 "inputTotalCharge": view.input.inputTotalCharge.val(),
       		 "vatRate" : view.input.inputVatRate.val(),
       		 "inputTotalAmount" : view.input.inputTotalAmount.val(),
       		 "inputBillCycleFrom" : view.input.inputBillCycleFrom.val(),
       		 "inputBillCycleTo" : view.input.inputBillCycleTo.val(),
       		 "inputDueDt" : view.input.inputDueDt.val(),
       		 "inputIssueDt" : view.input.inputIssueDt.val(),
       		 "inputStatus" : view.input.inputStatus.val(),
       		 "inputAging" : view.input.inputAging.val(),
       		 "methods" : methods,
    		 "deducts" : deducts,
    		 "inputTaxNo" : view.input.inputTaxNo.val(),
       		 "inputSubNo" :  view.input.inputSubNo.val(),
    		 "inputAddress" :  view.input.inputAddress.val(),
    		 "inputBranch" :  view.input.inputBranch.val(),
    		 "inputCustomerSegment" : view.inputCustomerSegment.val()
    		 
       		 
       	};

        $.ajax({
         url: "../createPaymentService.json"
         ,type: "POST"
         ,data:  JSON.stringify(params)
         ,contentType: "application/json; charset=utf-8"
         ,error: view.dialog.mainMessageDialog.valid
         ,success: function(res){
         if (!view.dialog.mainMessageDialog.valid(res)) { return; }
         view.dialog.mainMessageDialog.clear();
         $(document.body).append('<form action="../printPaymentReceipt.pdf" method="post" target="_printForm"></form>');
         var form = document.forms[1]; function input(n,v) { var input = document.createElement("input"); input.type = "hidden"; input.name = n; input.value = v; return input }
//          form.appendChild(input("receiptOffline", res.data));
         form.appendChild(input("manualId", res.data.manualEntity.manualId));
//          form.appendChild(input("receipts["+ i +"].billingServiceName", o.billingServiceName));//by NSD 24-03-20
//          form.appendChild(input("receipts["+ i +"].flgHeader", o.flgHeader));
//          });
//          var custIndex =0, invoiceIndex = 0, customer, receiptList = [];
//          var billingList = view.session("billingList");
//          while (customer = billingList[custIndex]) {
//          form.appendChild(input("customers["+ custIndex +"].custNo", customer.custNo));
//          form.appendChild(input("customers["+ custIndex +"].egpNo", customer.egpNo));
//          form.appendChild(input("customers["+ custIndex +"].egpContract", customer.egpContract));
//          for (var j = 0, n = customer.invoiceList.length; j < n; j++) {
//          var invoice = customer.invoiceList[j];
//          form.appendChild(input("customers["+ custIndex +"].invoices["+ invoiceIndex +"].currencyCode", invoice.currencyCode));
//          invoiceIndex++;
//          }
//          custIndex++;
//          invoiceIndex = 0;
//          }

//          // add Code Receive Only
//          var receiptFormat=view.session("receiptFormat");
//          form.appendChild(input("receiptFormat", receiptFormat)); // receive + wh [receive_wh] , receive only [receive_only] ,  wh only [wh_only]
//          form.appendChild(input("billingGroup", billGroup));
//          form.appendChild(input("receiptLang", receiptLang));
//          form.appendChild(input("note", $('#custNote').val()));
//          form.appendChild(input("receiptOffline", res.data));
//          //
         form.submit();
         }
         });
    }
</script>
