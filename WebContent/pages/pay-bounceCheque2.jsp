<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="resources/bootstrap-table/src/bootstrap-table.css" rel="stylesheet" type="text/css" />
        <link href="resources/custom.css" rel="stylesheet" type="text/css" />
        <script src="resources/jquery.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap-table/src/bootstrap-table.js"></script>
        <script src="resources/custom.js" type="text/javascript"></script>
    </head>

    <body>
        <header class="header_page"></header>
        <section class="container-fluid menu">
            <button class="menu-toggle btn btn-sm btn-default" style="margin-bottom: 5px">
                    <span class="glyphicon glyphicon-step-forward"></span>
                </button>
            <%@include file="menu.jsp"%>
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li><i>เช็คขัดข้อง</i></li>
                            <li>รับชำระลูกหนี้ SAP รายตัว</li>
                            <li class="active">สรุปการรับชำระเงิน</li>
                        </ol>
                    </div>
                </div>
                <ul class="list-inline pull-right list-menu-set">
                    <li><a href="pay-bounceCheque.jsp" class="btn btn-link"><span class="glyphicon glyphicon-user"></span> เพิ่มข้อมูลลูกค้า</a></li>
                    <li><a id="submitPayment" class="btn btn-link"><span class="glyphicon glyphicon-edit"></span> ดำเนินการรับชำระ</a></li>
                </ul>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-success">
                            <div class="panel-heading">สรุปการรับชำระเงิน</div>
                            <div class="panel-body">
                                <table id="summaryList" data-row-style="rowStyle" data-toggle="table" data-detail-view="true" data-detail-formatter="detailFormatter"
                                    data-classes="table table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th data-align="center" data-formatter="runningFormatter">#</th>
                                            <th data-field="custNo">เลขที่ลูกค้า</th>
                                            <th data-field="custName">ชื่อลูกค้า</th>
                                            <th data-field="billGroup">Billing Group</th>
                                            <th data-formatter="billCountFormatter" data-align="right">จำนวนใบแจ้งค่าใช้บริการ</th>
                                            <th data-formatter="totalChargeFormatter" data-align="right">ยอดที่ต้องชำระ</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="well">
                    <div class="row">
                        <div class=" col-md-12">
                            <div class="form-horizontal">
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <label class="control-label col-sm-12">จำนวนเงินตามสกุลที่บันทึก</label>

                                        <div class="form-group">
                                            <label class="control-label col-sm-1"></label>
                                            <label class="control-label col-sm-8">ยอดเงินที่ต้องชำระก่อนภาษีมูลค่าเพิ่ม  :</label>
                                            <div class="col-sm-3"><input id="sumBalance2" class="form-control text-right" disabled></div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-sm-1"></label>
                                            <label class="control-label col-sm-8">ภาษีมูลค่าเพิ่ม  :</label>
                                            <div class="col-sm-3"><input id="sumVat2" class="form-control text-right" disabled></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-1"></label>
                                            <label class="control-label col-sm-8">ยอดเงินที่ต้องชำระรวมภาษีมูลค่าเพิ่ม :</label>
                                            <div class="col-sm-3"><input id="sumTotalCharge2" class="form-control text-right" disabled></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-1"></label>
                                            <label class="control-label col-sm-8">ภาษีหัก ณ ที่จ่าย :</label>
                                            <div class="col-sm-3"><input id="deduct2" class="form-control text-right" disabled></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="control-label col-sm-12">จำนวนเงินสกุลในประเทศ</label>

                                        <div class="form-group">
                                            <label class="control-label col-sm-3"></label>
                                            <div class="col-sm-9"><input id="sumBalance" class="form-control text-right" disabled></div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-sm-3"></label>
                                            <div class="col-sm-9"><input id="sumVat" class="form-control text-right" disabled></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-3"></label>
                                            <div class="col-sm-9"><input id="sumTotalCharge" class="form-control text-right" disabled></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-3"></label>
                                            <div class="col-sm-9"><input id="deduct" class="form-control text-right" disabled></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

        </section>

    </body>

    </html>
    <script type="text/javascript">

    </script>