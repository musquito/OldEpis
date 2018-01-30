<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/bootstrap-table/src/bootstrap-table.css" rel="stylesheet" type="text/css" />
        <link href="resources/css/datepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/custom.css" rel="stylesheet" type="text/css" />
        <script src="resources/jquery.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap-table/src/bootstrap-table.js" type="text/javascript"></script>
        <script src="resources/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="resources/custom.js" type="text/javascript"></script>
    </head>

    <body>
        <header class="header_page"></header>
        <section class="container-fluid menu">
            <button class="menu-toggle btn btn-sm btn-default" style="margin-bottom: 5px"><span class="glyphicon glyphicon-step-forward"></span></button>
            <%@include  file="menu.jsp" %>
                <div class="row">
                    <div class="col-md-12">
                        <ol id="breadcrumb" class="breadcrumb">
                            <li><i>รับชำระค่าบริการ</i></li>
                            <li>ค้นหาข้อมูลลูกค้า</li>
                            <li>สรุปรายการรับชำระเงิน</li>
                            <li class="active">เลือกวิธีการรับชำระ</li>
                            <li>ผลการรับชำระ</li>
                        </ol>
                    </div>
                </div>
                <div id="mainMessageDialog"></div>
                <div id="summaryPanel" style="display: none">
                    <ul class="list-inline pull-right list-menu-set">
                        <li><a href="pay-service-charge.jsp?new"><span class="glyphicon glyphicon glyphicon-arrow-left"></span> กลับไปหน้าการรับชำระ</a></li>
                    </ul>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-success">
                                <div class="panel-heading">ผลการรับชำระเงิน</div>
                                <div class="panel-body">
                                    <table id="receiptList" data-row-style="rowStyle" data-toggle="table" data-detail-view="true" data-detail-formatter="detailFormatter"
                                        data-classes="table table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th data-align="center" data-formatter="runningFormatter">#</th>
                                                <th data-field="customerNo">เลขที่ลูกค้า</th>
                                                <th data-field="customerName">ชื่อลูกค้า</th>
                                                <th data-field="invoiceCount">จำนวนใบแจ้งค่าใช้บริการ</th>
                                                <th data-field="receiptNo">เลขที่ใบเสร็จรับเงิน/ใบกำกับภาษี</th>
                                                <th data-field="receiptAmount" data-align="right">จำนวนเงินที่รับชำระ</th>
                                                <th data-field="receiptStatus">สถานะการรับชำระ</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <ul id="navigationPanel" class="list-inline pull-right list-menu-set">
                    <li><a href="pay-service-charge_2.jsp" class="btn btn-link"><span class="glyphicon glyphicon-th-list"></span> สรุปรายการรับชำระ</a></li>
                    <li><a id="submitPayment" class="btn btn-link"><span class="glyphicon glyphicon-print"></span> บันทึกและพิมพ์</a></li>
                    <li><a id="submitPaymentEng" class="btn btn-link"><span class="glyphicon glyphicon-print"></span> บันทึกและพิมพ์(อังกฤษ)</a></li>
                    <li><a id="cancelPaymentBtn" class="btn btn-link"><span class="glyphicon glyphicon-remove-circle"></span> ยกเลิกรายการ</a></li>
                    <li><a id="creditLimit" class="btn btn-link"><span class="glyphicon glyphicon-remove-circle"></span> Credit Limit</a></li>
                </ul>
                <div id="fillDataInputPanel" class="row">
                    <div class="col-md-5">
                        <label class="label-panal label-warning">รายการหัก</label>
                        <div id="setTaxType" class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span class="selection">ภาษีหัก ณ ที่จ่าย</span> <span class="caret"></span>
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
                            <div class="panel-body" style="padding-right:0;padding-left:0">
                                <div class="col-md-12">
                                    <div role="tabpanel" class="tab-pane hide" id="withholdingTaxPanel">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">ประเภทภาษีหัก ณ ที่จ่าย :</label>
                                                <div class="col-sm-6">
                                                    <label class="radio-inline"><input type="radio" name="withholdingTaxType" data-label="69 ทวิ" data-type="69BIS" id="69tvi"><b> 69 ทวิ</b></label>&nbsp;&nbsp;
                                                    <label class="radio-inline"><input type="radio" name="withholdingTaxType" data-label="3 เตรส" data-type="3TREDECIM" id="3trs" ><b> 3 เตรส</b></label>&nbsp;&nbsp;
                                                    <label class="radio-inline"><input type="radio" name="withholdingTaxType" data-label="69 ตรี" data-type="69TRE" id="69tri"><b> 69 ตรี</b></label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                <label class="control-label col-sm-6">เลขที่ใบแจ้งค่าใช้บริการ :</label>
                                                <!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                <div class="col-sm-5"><select id="withholdingInvoiceNo" class="form-control"></select></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">เลขที่เอกสาร :</label>
                                                <div class="col-sm-5"><input id="withholdingTaxNo" type="text" class="form-control"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">จำนวนเงิน :</label>
                                                <div class="col-sm-5"><input id="withholdingTaxAmount" class="form-control text-right"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6"></label>
                                                <div class="col-sm-5"><a id="addWithholdingTaxNo" class="btn btn-link"><span class="glyphicon glyphicon-th-list"></span>  เพิ่มรายการภาษีหัก ณ ที่จ่าย</a></div>
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
                                                <label class="control-label col-sm-6">ประเภทค่าธรรมเนียม :</label>
                                                <div class="col-sm-5">
                                                    <label class="radio-inline"><input type="radio" name="feeTaxType" data-label="ขาออก" checked><b> ขาออก</b></label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">ศูนย์ต้นทุน :</label>
                                                <div class="col-sm-5"><select id="feeDepartmentCost" class="form-control"></select></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">จำนวนเงิน :</label>
                                                <div class="col-sm-5"><input id="feeTaxAmount" class="form-control text-right"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">ภาษีซื้อ :</label>
                                                <div class="col-sm-5"><input id="feeBuyTaxAmount" class="form-control text-right"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">ภาษีหัก ณ ที่จ่าย :</label>
                                                <div class="col-sm-5"><input id="feeWTAmount" class="form-control text-right"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6"></label>
                                                <div class="col-sm-5"><a id="addFeeTaxNo" class="btn btn-link"><span class="glyphicon glyphicon-th-list"></span> เพิ่มรายการค่าธรรมเนียม</a></div>
                                            </div>
                                        </div>
                                        <table id="feeTaxList" class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th data-running-no="true">#</th>
                                                    <th>ศูนย์ต้นทุน</th>
                                                    <th style="display:none;">ประเภทค่าธรรมเนียม</th>
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
                                                    <label class="radio-inline"><input type="radio" name="penaltyTaxType" data-label="ขาออก" checked><b> ขาออก</b></label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                <label class="control-label col-sm-6">เลขที่ใบแจ้งค่าใช้บริการ :</label>
                                                <!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                <div class="col-sm-5">
                                                    <select id="penaltyInvoiceNo" class="form-control"></select>
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
                                                <div class="col-sm-5"><a id="addPenaltyTaxNo" class="btn btn-link"><span class="glyphicon glyphicon-th-list"></span>  เพิ่มรายการค่าปรับ</a></div>
                                            </div>
                                        </div>
                                        <table id="penaltyTaxList" class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th data-running-no="true">#</th>
                                                    <!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                    <th>เลขที่ใบแจ้งค่าใช้บริการ</th>
                                                    <!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                    <th style="display:none;">ประเภทค่าปรับ</th>
                                                    <th data-align="right" data-number-format="true">จำนวนเงิน</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane hide" id="retentionTaxPanel">
                                        <div class="form-horizontal">
                                            <div class="form-group hide">
                                                <label class="control-label col-sm-6">ประเภทเงินประกันผลงาน :</label>
                                                <div class="col-sm-5">
                                                    <!--                                                 <label class="radio-inline"><input type="radio" name="retentionTaxType" data-label="ขาเข้า" checked><b> ขาเข้า</b></label>&nbsp;&nbsp;&nbsp; -->
                                                    <label class="radio-inline"><input type="radio" name="retentionTaxType" data-label="ขาออก" checked><b> ขาออก</b></label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                <label class="control-label col-sm-6">เลขที่ใบแจ้งค่าใช้บริการ :</label>
                                                <!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                <div class="col-sm-5">
                                                    <select id="retentionInvoiceNo" class="form-control"></select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6">จำนวนเงิน :</label>
                                                <div class="col-sm-5">
                                                    <input id="retentionTaxAmount" class="form-control text-right">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6"></label>
                                                <div class="col-sm-5"><a id="addRetentionTaxNo" class="btn btn-link"><span class="glyphicon glyphicon-th-list"></span>  เพิ่มรายการเงินประกันผลงาน</a></div>
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
                                    <div role="tabpanel" class="tab-pane hide" id="compensationTaxPanel">
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
                                                    <input id="compensationTaxAmount" class="form-control text-right">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-6"></label>
                                                <div class="col-sm-5"><a id="addCompensationTaxNo" class="btn btn-link"><span class="glyphicon glyphicon-th-list"></span>  เพิ่มรายการค่าตอบแทน</a></div>
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
                                    <a class="btn btn-primary pull-right" id="addTaxType" style="margin-top:1em"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการหัก</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <label class="label-panal label-warning">วิธีการรับชำระ</label>
                        <div id="setPayType" class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span class="selection">เงินสด</span> <span class="caret"></span>
                        </button>
                            <ul class="dropdown-menu" id='testmenu2'>
                                <li><a href="#">เงินสด</a></li>
                                <li><a href="#">เช็ค</a></li>
                                <li><a href="#">บัตรเครดิต</a></li>
                                <li><a href="#">ธนาณัติ</a></li>
                                <li><a href="#">ตั๋วแลกเงิน</a></li>
                                <li><a href="#">คูปอง</a></li>
                                <li><a href="#">เงินโอนในประเทศ</a></li>
                                <li><a href="#">offset</a></li>
                                <li><a href="#">เงินโอนต่างประเทศ</a></li>
                                <li><a href="#">อื่นๆ</a></li>
                                <li><a href="#">GFMIS</a></li>
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
                                                <div class="col-sm-4"><select id="payChqBankCode" class="form-control"></select></div>
                                                <label class="control-label col-sm-2">เลขที่เช็ค :</label>
                                                <!-- ICE FIXED CODE ข้อ 23 เช็ค length = 7 -->
                                                <div class="col-sm-4"><input class="form-control" id="payChqNo" maxlength="7"></div>
                                                <!-- End ICE FIXED CODE ข้อ 23 -->
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2">ชื่อธนาคาร :</label>
                                                <div class="col-sm-4"><select id="payChqBankName" class="form-control"></select></div>
                                                <label class="control-label col-sm-2">วันที่หน้าเช็ค :</label>
                                                <div class="col-sm-4">
                                                    <div class="input-group input-append date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <input class="form-control" id="payChqDate" placeholder="dd/MM/yyyy" maxlength="10">
                                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2">สาขา :</label>
                                                <div class="col-sm-4"><input class="form-control" id="payChqBranch"></div>
                                                <label class="control-label col-sm-2">จำนวนเงิน :</label>
                                                <div class="col-sm-4"><input class="form-control text-right" id="payChqAmount"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payChqSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการเช็ค</a>
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
                                                <label class="control-label col-sm-3">ประเภทบัตรเครดิต :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payCCType"></select></div>
                                                <label class="control-label col-sm-3">เลขที่บัตร :</label>
                                                <div class="col-sm-3"><input class="form-control" id="payCCNo" maxlength="16"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3">ธนาคารเจ้าของเครื่อง (EDC) :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payCCBankName"></select></div>
                                                <label class="control-label col-sm-3">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="payCCAmount"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payCCSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการบัตรเครดิต</a>
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
                                                    <div class="input-group input-append date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <input class="form-control" id="payMoneyOrderInputDate" placeholder="dd/MM/yyyy" maxlength="10">
                                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div> <label class="control-label col-sm-3">เลขที่ธนาณัติ :</label>
                                                <!-- ICE FIXED CODE ข้อ 24 length เลขธนาณัติ = 9 -->
                                                <div class="col-sm-3"><input class="form-control" id="payMoneyOrderInputNo" maxlength="9"></div>
                                                <!-- End ICE FIXED CODE ข้อ 24 -->
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3">รหัสไปรษณีย์ต้นทาง :</label>
                                                <!-- ICE FIXED CODE ข้อ 24 length postcode = 5 -->
                                                <div class="col-sm-3"><input class="form-control" id="payMoneyOrderInputPostCode" maxlength="5"></div>
                                                <!-- end ICE FIXED CODE ข้อ 24  -->
                                                <label class="control-label col-sm-3">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="payMoneyOrderInputAmount"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payMoneyOrderButtonSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการธนาณัติ</a>
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
                                                <label class="control-label col-sm-3">วันที่ตั๋วแลกเงิน :</label>
                                                <div class="col-sm-3">
                                                    <div class="input-group input-append date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <input class="form-control" id="payBillExchgInputDate" placeholder="dd/MM/yyyy" maxlength="10">
                                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                                <label class="control-label col-sm-3">เลขที่ตั๋วแลกเงิน :</label>
                                                <!-- ICE FIXED CODE ข้อ 22 length เลขที่ตั๋วแลกเงิน = 9 -->
                                                <div class="col-sm-3"><input class="form-control" id="payBillExchgInputNo" maxlength="9"></div>
                                                <!--  end ICE FIXED CODE ข้อ 22 -->
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3">รหัสไปรษณีย์ต้นทาง :</label>
                                                <!-- ICE FIXED CODE ข้อ 22 length postcode = 5 -->
                                                <div class="col-sm-3"><input class="form-control" id="payBillExchgInputPostCode" maxlength="5"></div>
                                                <!--  end ICE FIXED CODE ข้อ 22 -->
                                                <label class="control-label col-sm-3">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="payBillExchgInputAmount"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payBillExchgButtonSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการตั๋วแลกเงิน</a>
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
                                                <div class="col-sm-3"><input class="form-control" id="payCouponInputNo"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-9">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="payCouponInputAmt"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payCouponButtonSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการคูปอง</a>
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
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfInputBankCode"></select></div>
                                                <label class="control-label col-sm-2">ชื่อธนาคาร :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfInputBankName"></select></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">สาขา :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfDropDownBankBrnh"></select></div>
                                                <label class="control-label col-sm-2">เลขที่อ้างอิง :</label>
                                                <div class="col-sm-3"><input class="form-control" id="payBankTxnfInputNo" maxlength="10"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">รหัสบัญชีเงินฝากธนาคาร :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfDropDownBankAcCd"></select></div>
                                                <label class="control-label col-sm-2">วันที่โอน :</label>
                                                <div class="col-sm-3">
                                                    <div class="input-group input-append date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <input class="form-control" id="payBankTxnfInputDate" placeholder="dd/MM/yyyy" maxlength="10">
                                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">เลขที่บัญชีเงินฝากธนาคาร :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfDropDownBankAcct"></select></div>
                                                <label class="control-label col-sm-2">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="payBankTxnfInputAmt"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payBankTxnfButtonSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น ๆ</a>
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
                                                <label class="control-label col-sm-3">เลขที่เอกสาร/ปี :</label>
                                                <div class="col-sm-3"><input id="payOffsetDocumentNo" class="form-control"></div>
                                                <label class="control-label col-sm-3">รหัสบัญชี :</label>
                                                <div class="col-sm-3"><input id="payOffsetAccountCode" class="form-control"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3">ชื่อบัญชี :</label>
                                                <div class="col-sm-3"><input id="payOffsetAccountName" class="form-control text-right"></div>
                                                <label class="control-label col-sm-3">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input id="payOffsetAmount" class="form-control text-right"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-10"></label>
                                                <div class="col-sm-2"><a class="btn btn-warning pull-right" id="payOffsetButtonSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการ offset</a></div>
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
                                                <label class="control-label col-sm-3">สกุลเงินต่างประเทศ :</label>
                                                <div class="col-sm-3"><select class="form-control" id="currencyTypeSelect" onchange="addExchangRate()"></select></div>
                                                <label class="control-label col-sm-3">อัตราแลกเปลี่ยน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="exchangeRateInput" value="0.00"
                                                        readonly></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3">วันที่โอน :</label>
                                                <div class="col-sm-3">
                                                    <div class="input-group input-append date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <input class="form-control" id="payDateInputDate" placeholder="dd/MM/yyyy" maxlength="10">
                                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                                <label class="control-label col-sm-3">จำนวนเงินต่างประเทศ :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="foreignAmountInput" onblur="convertAmount()"></div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-3 col-sm-offset-6">จำนวนเงิน(บาท) :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="thAmountInput" readonly></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payForeignButtonSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น ๆ</a>
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
                                                <label class="control-label col-sm-3">ช่องทางการชำระ :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payOtherDropDownChannel"></select></div>
                                                <label class="control-label col-sm-3">เลขที่อ้างอิง :</label>
                                                <div class="col-sm-3"><input class="form-control" id="payOtherInputNo"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-3">วันที่อ้างอิง :</label>
                                                <div class="col-sm-3">
                                                    <div class="input-group input-append date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <input class="form-control" id="payOtherInputDate" placeholder="dd/MM/yyyy" maxlength="10">
                                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                                <label class="control-label col-sm-3">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="payOtherInputAmt"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payOtherButtonSubmit"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น ๆ</a>
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
                                                <div class="col-sm-3"><input class="form-control" id="payBankTxnfInputBankCodeGf" maxlength="5"></div>
                                                <label class="control-label col-sm-2">ชื่อธนาคาร :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfInputBankNameGf"></select></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">สาขา :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfDropDownBankBrnhGf"></select></div>
                                                <label class="control-label col-sm-2">เลขที่อ้างอิง :</label>
                                                <div class="col-sm-3"><input class="form-control" id="payBankTxnfInputNoGf" maxlength="10"></div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">รหัสบัญชีเงินฝากธนาคาร :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfDropDownBankAcCdGf"></select></div>
                                                <label class="control-label col-sm-2">วันที่โอน :</label>
                                                <div class="col-sm-3">
                                                    <div class="input-group input-append date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                                                        <input class="form-control" id="payBankTxnfInputDateGf" placeholder="dd/MM/yyyy" maxlength="10">
                                                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4">เลขที่บัญชีเงินฝากธนาคาร :</label>
                                                <div class="col-sm-3"><select class="form-control" id="payBankTxnfDropDownBankAcctGf"></select></div>
                                                <label class="control-label col-sm-2">จำนวนเงิน :</label>
                                                <div class="col-sm-3"><input class="form-control text-right" id="payBankTxnfInputAmtGf"></div>
                                            </div>
                                        </div>
                                        <a class="btn btn-warning pull-right" id="payBankTxnfButtonSubmitGf"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มรายการอื่น ๆ</a>
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
                                    <a class="btn btn-primary pull-right" id="addPayType" style="margin-top:1em"><span class="glyphicon glyphicon-plus-sign"></span> เพิ่มวิธีการรับชำระ</a>
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
                                            <th data-align="right" data-number-format="true" class="text-right">จำนวนเงิน</th>
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
                                            <th data-align="right" data-number-format="true" class="text-right">จำนวนเงิน</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="receiptInfoPanel" class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">สรุปยอดเงินที่ต้องชำระ</div>
                            <div class="panel-body">
                                <div class="form-horizontal">
                                    <div class="form-group" id="foreignTotalChargeDiv">
                                        <label class="control-label col-sm-10" id="foreignTotalChargeLabel">ยอดเงินที่ต้องชำระรวมภาษีมูลค่าเพิ่ม (Foreign)  :</label>
                                        <div class="col-sm-2">
                                            <input id="foreignTotalCharge" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group" id="foreignExchangeDiv">
                                        <label class="control-label col-sm-10">อัตราแลกเปลี่ยน  :</label>
                                        <div class="col-sm-2">
                                            <input id="foreignExchangeRate" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <input id="moneyToPay" hidden="hidden" />
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ยอดเงินก่อนหักส่วนลด :</label>
                                        <div class="col-sm-2">
                                            <input id="preItemsDiscount" class="form-control text-right" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ส่วนลด :</label>
                                        <div class="col-sm-2">
                                            <input id="itemsDiscount" class="form-control text-right" disabled="disabled">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ยอดเงินที่ต้องชำระก่อนภาษีมูลค่าเพิ่ม :</label>
                                        <div class="col-sm-2">
                                            <input id="charge" class="form-control text-right" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ภาษีมูลค่าเพิ่ม :</label>
                                        <div class="col-sm-2">
                                            <input id="vat" class="form-control text-right" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ยอดเงินที่ต้องชำระรวมภาษีมูลค่าเพิ่ม :</label>
                                        <div class="col-sm-2">
                                            <input id="totalCharge" class="form-control text-right" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ภาษีหัก ณ ที่จ่าย  :</label>
                                        <div class="col-sm-2">
                                            <input id="deduct" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group" id="feeSummaryDiv">
                                        <label class="control-label col-sm-10">ค่าธรรมเนียม  :</label>
                                        <div class="col-sm-2">
                                            <input id="fee" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group" id="penaltySummaryDiv">
                                        <label class="control-label col-sm-10">ค่าปรับ  :</label>
                                        <div class="col-sm-2">
                                            <input id="penalty" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group" id="retentionSummaryDiv">
                                        <label class="control-label col-sm-10">เงินประกันผลงาน  :</label>
                                        <div class="col-sm-2">
                                            <input id="retention" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group" id="compensationSummaryDiv">
                                        <label class="control-label col-sm-10">ค่าตอบแทนการรับชำระเงิน  :</label>
                                        <div class="col-sm-2">
                                            <input id="compensation" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <%--<label class="control-label col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" id="check_dis_notused" disabled> <b>ลูกค้ารับภาระภาษี&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-lock"></span> อื่นๆ :</b>
                                            </label>
                                        </div>
                                    </label>--%>
                                            <div class="control-label col-sm-10">
                                                <label class="strong"><input type="radio" name="discountCheckbox" disabled="disabled" value="1"> รับภาระภาษีเต็มจำนวน</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <label class="strong"><input type="radio" name="discountCheckbox" disabled="disabled" value="2"> รับภาระภาษีบางส่วน :</label>
                                            </div>
                                            <div class="col-sm-2">
                                                <input id="discount" class="form-control text-right" disabled="disabled">
                                            </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ยอดเงินที่ต้องชำระ :</label>
                                        <div class="col-sm-2">
                                            <input id="balanceDue" class="form-control text-right" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">ยอดเงินรับมา :</label>
                                        <div class="col-sm-2">
                                            <input id="inputReceived" class="form-control text-right" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-10">เงินทอน :</label>
                                        <div class="col-sm-2">
                                            <input id="change" class="form-control text-right" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="control-label col-sm-10">
                                            <label class="strong"><input type="radio" name="specialOptions" value="1"> รายได้อื่นที่ไม่มีภาษี</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label class="strong"><input type="radio" name="specialOptions" value="2"> รายได้อื่นมีภาษี</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label class="strong"><input type="radio" name="specialOptions" value="3"> รับชำระล่วงหน้า :</label>
                                        </div>
                                        <div class="col-sm-2">
                                            <input id="inputAdvanced" class="form-control text-right">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" role="dialog" id="modal_authen">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title"><span class="glyphicon glyphicon-user"></span> Authentication</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-2">

                                        </div>
                                        <div class="col-md-10">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">ผู้อนุมัติ :</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <label class="col-sm-3 control-label"></label>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">รหัสผ่าน :</label>
                                                    <div class="col-sm-6">
                                                        <input type="password" class="form-control">
                                                    </div>
                                                    <label class="col-sm-3 control-label"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok-circle"></span> ตกลง</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> ยกเลิก</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="advancePayment">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">เลือกรายการลูกค้าที่จะรับชำระล่วงหน้า</h4>
                            </div>
                            <div class="modal-body">
                                <div id="advancePaymentMessage"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>รายการลูกค้า</label>

                                        <table id="customerList" data-toggle="table">
                                            <thead>
                                                <tr>
                                                    <th data-align="center" data-formatter="runningFormatter">#</th>
                                                    <th data-field="custNo">เลขที่ลูกค้า</th>
                                                    <th data-field="custName">ชื่อลูกค้า</th>
                                                    <!--<th data-field="svcType">ประเภทบริการ</th>-->
                                                    <th data-field="billGroup">Billing Group</th>
                                                    <th data-field="advanceAmount" data-formatter="numberInputFormatter">ยอดชำระ</th>
                                                    <th data-field="billCycle" data-formatter="billCycleInputFormatter">รอบการใช้งาน</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a id="advancePaymentSubmit" class="btn btn-default"><span class="glyphicon glyphicon-ok-circle"></span> เลือกรายการ</a>
                                <a id="advancePaymentCancel" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> ยกเลิก</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="otherProfitVat">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">เลือกรายการลูกค้า</h4>
                            </div>
                            <div class="modal-body">
                                <div id="advancePaymentMessage2"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>รายการลูกค้า</label>

                                        <table id="customerList2" data-toggle="table">
                                            <thead>
                                                <tr>
                                                    <th data-align="center" data-formatter="runningFormatter">#</th>
                                                    <th data-field="custNo">เลขที่ลูกค้า</th>
                                                    <th data-field="custName">ชื่อลูกค้า</th>
                                                    <th data-field="billGroup">Billing Group</th>
                                                    <th data-field="otherAmount" data-formatter="numberInputFormatter2">ยอดชำระ</th>
                                                    <th data-formatter="stringInputFormatter" data-field="otherNote">เพิ่มเติม</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a id="otherPaymentSubmit" class="btn btn-default"><span class="glyphicon glyphicon-ok-circle"></span> เลือกรายการ</a>
                                <a id="otherPaymentCancel" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> ยกเลิก</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" role="dialog" id="creditLimitDialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">เลือกรายการ Subscription</h4>
                            </div>
                            <div class="modal-body">
                                <div id="creditLimitMessage"></div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>รายการใบแจ้งหนี้ / Subscription</label>
                                        <table id="subScriptionListTb" data-maintain-selected="true" class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <!--
												<th  data-field="checked" data-checkbox="true"><input name="btSelectAll" type="checkbox"></th>
												-->
                                                    <th data-formatter="checkboxFormatter"><input id="btSelectAll" type="checkbox"></th>

                                                    <th data-field="ba">BA</th>
                                                    <!-- ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                    <th data-field="invoiceNo">เลขที่ใบแจ้งค่าใช้บริการ</th>
                                                    <!-- end ice fixed code no.109 'ทุกระบบต้องเลขที่ใบแจ้งค่าใช้บริการใบแจ้งค่าใช้บริการ" -->
                                                    <th data-field="subscriptionNo">Subscription</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a id="creditLimitSubmit" class="btn btn-default"><span class="glyphicon glyphicon-ok-circle"></span> เลือกรายการ</a>
                                <a id="creditLimitCancel" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> ยกเลิก</a>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

    </body>

    </html>
    <script type="text/javascript">

    </script>