<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>รายงานภาษีขาย (การออกใบแทนใบกำกับภาษี)</title>
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
            $('#stDate').datepicker({
                format: 'dd/mm/yyyy',
                lang: 'th', // แสดงภาษาไทย
                startDate: '01/01/2016',
                endDate: '30/12/2025'
            });
            var date = new Date();

            $('#stDate').datepicker('setDate', new Date());
            $('#stDate').datepicker('update');
            $('#stDate').val('');

            $('#enDate').datepicker({
                format: 'dd/mm/yyyy',
                lang: 'th', // แสดงภาษาไทย
                startDate: '01/01/2016',
                endDate: '30/12/2025'
            });
            $('#enDate').datepicker('setDate', new Date());
            $('#enDate').datepicker('update');
            $('#enDate').val('');
            $('a#printReport').prop('disabled', true);
            $('a#printXls').prop('disabled', true);
        });
        function runningFormatter(val, row, ind) {
            $('a#printReport').prop('disabled', false);
            $('a#printXls').prop('disabled', false);
            return ind + 1;
        }
        function currencyFormatter(val, row, ind) {
            return null!=val?parseFloat(val, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,'):"-";
        }
        function numberFormatter(val, row, ind) {
            return parseFloat(val, 10).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,').replace(/\.00$/g, "");
        }
        function nameFormatter(val, row, ind) {
            return row.userName + " " + row.userFamilyname + " ("+row.userCode+")";
        }

    </script>
    <style>
        .valignMiddle {
            vertical-align: middle !important;
        }
    </style>

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
                <li class="active"><i>รายงานภาษีขาย (การออกใบแทนใบกำกับภาษี)</i></li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">รายงานภาษีขาย (การออกใบแทนใบกำกับภาษี)</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form id=documentReportForm method="post" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="control-label col-sm-1 col-sm-offset-1">วันที่ออกใบแทน:</label>
                                    <div class="col-sm-2" style="width:13%">
                                        <div class="input-group input-append date" id="stDate">
                                            <input type="text" class="form-control" id="startDate" name="startDate" value="">
                                            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="width:3.2%;padding-right: 0px;padding-left: 0px;">
                                        <select class="form-control" id="stHour" name="stHour" style="padding:0;">
                                            <option data-index="-1" data-key="00" value="00" selected="selected">00</option>
                                            <option data-index="0" data-key="01" value="01">01</option>
                                            <option data-index="1" data-key="02" value="02">02</option>
                                            <option data-index="2" data-key="03" value="03">03</option>
                                            <option data-index="3" data-key="04" value="04">04</option>
                                            <option data-index="4" data-key="05" value="05">05</option>
                                            <option data-index="5" data-key="06" value="06">06</option>
                                            <option data-index="6" data-key="07" value="07">07</option>
                                            <option data-index="7" data-key="08" value="08">08</option>
                                            <option data-index="8" data-key="09" value="09">09</option>
                                            <option data-index="9" data-key="10" value="10">10</option>
                                            <option data-index="10" data-key="11" value="11">11</option>
                                            <option data-index="11" data-key="12" value="12">12</option>
                                            <option data-index="12" data-key="13" value="13">13</option>
                                            <option data-index="13" data-key="14" value="14">14</option>
                                            <option data-index="14" data-key="15" value="15">15</option>
                                            <option data-index="15" data-key="16" value="16">16</option>
                                            <option data-index="16" data-key="17" value="17">17</option>
                                            <option data-index="17" data-key="18" value="18">18</option>
                                            <option data-index="18" data-key="19" value="19">19</option>
                                            <option data-index="19" data-key="20" value="20">20</option>
                                            <option data-index="20" data-key="21" value="21">21</option>
                                            <option data-index="21" data-key="22" value="22">22</option>
                                            <option data-index="22" data-key="23" value="23">23</option>
                                        </select>
                                    </div>
                                    <div class="control-label col-md-1" style="width:0.5%;padding-left: 5px;padding-right: 8px;font-weight: bolder;">:</div>
                                    <div class="col-md-2" style="width:3.2%;padding-right: 0px;padding-left: 0px;">
                                        <select class="form-control" id="stMin" name="stMin" style="padding:0;">
                                            <option data-index="-1" data-key="00" value="00" selected="selected">00</option>
                                            <option data-index="0" data-key="15" value="15">15</option>
                                            <option data-index="1" data-key="30" value="30">30</option>
                                            <option data-index="2" data-key="45" value="45">45</option>
                                            <option data-index="3" data-key="59" value="59">59</option>
                                        </select>
                                    </div>
                                    <label class="control-label col-sm-1">ถึงวันที่:</label>
                                    <div class="col-sm-2" style="width:13%">
                                        <div class="input-group input-append date" id="enDate">
                                            <input type="text" class="form-control" id="endDate" name="endDate" value="">
                                            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                        </div>
                                    </div>
                                    <div class="col-md-2" style="width:3.2%;padding-right: 0px;padding-left: 0px;">
                                        <select class="form-control" id="enHour" name="enHour" style="padding:0;">
                                            <option data-index="-1" data-key="00" value="00" style="padding: 0px;">00</option>
                                            <option data-index="0" data-key="01" value="01">01</option>
                                            <option data-index="1" data-key="02" value="02">02</option>
                                            <option data-index="2" data-key="03" value="03">03</option>
                                            <option data-index="3" data-key="04" value="04">04</option>
                                            <option data-index="4" data-key="05" value="05">05</option>
                                            <option data-index="5" data-key="06" value="06">06</option>
                                            <option data-index="6" data-key="07" value="07">07</option>
                                            <option data-index="7" data-key="08" value="08">08</option>
                                            <option data-index="8" data-key="09" value="09">09</option>
                                            <option data-index="9" data-key="10" value="10">10</option>
                                            <option data-index="10" data-key="11" value="11">11</option>
                                            <option data-index="11" data-key="12" value="12">12</option>
                                            <option data-index="12" data-key="13" value="13">13</option>
                                            <option data-index="13" data-key="14" value="14">14</option>
                                            <option data-index="14" data-key="15" value="15">15</option>
                                            <option data-index="15" data-key="16" value="16">16</option>
                                            <option data-index="16" data-key="17" value="17">17</option>
                                            <option data-index="17" data-key="18" value="18">18</option>
                                            <option data-index="18" data-key="19" value="19">19</option>
                                            <option data-index="19" data-key="20" value="20">20</option>
                                            <option data-index="20" data-key="21" value="21">21</option>
                                            <option data-index="21" data-key="22" value="22">22</option>
                                            <option data-index="22" data-key="23" value="23" selected="selected">23</option>
                                        </select>
                                    </div>
                                    <div class="control-label col-md-1" style="width:0.5%;padding-left: 5px;padding-right: 8px;font-weight: bolder;">:</div>
                                    <div class="col-md-2" style="width:3.2%;padding-right: 0px;padding-left: 0px;">
                                        <select class="form-control" id="enMin" name="enMin" style="padding:0;">
                                            <option data-index="-1" data-key="00" value="00" style="padding: 0px;">00</option>
                                            <option data-index="0" data-key="15" value="15" style="padding: 0px;">15</option>
                                            <option data-index="1" data-key="30" value="30">30</option>
                                            <option data-index="2" data-key="45" value="45">45</option>
                                            <option data-index="3" data-key="59" value="59" selected="selected">59</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <a id="inquiryReport" class="btn btn-primary glyphicon glyphicon-search"> ค้นหาข้อมูล</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <a id="printReport" class="btn btn-success glyphicon glyphicon-print" style="padding: 2px 5px;margin-bottom: -5em;">
                <span style="font-size:12px;padding-left: 1px;">PDF</span>
            </a>
            <a id="printXls" class="btn btn-success glyphicon glyphicon-floppy-disk" style="padding: 2px 5px;margin-bottom: -5em;">
                <span style="font-size:12px;padding-left: 1px;">Excel</span>
            </a>
            <div class="table-responsive">
                <table id="SalesTaxDailyReport"
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
                        <th data-align="center" rowspan="2" class="valignMiddle" data-formatter="runningFormatter">ลำดับที่</th>
                        <th data-align="center" rowspan="2"  class="valignMiddle" data-field="receiptName" data-sortable="true">ชื่อผู้ซื้อสินค้า/ผู้รับบริการ</th>
                        <th data-align="center" rowspan="2"  class="valignMiddle" data-field="taxId" data-sortable="true"> เลขประจำตัวผู้เสียภาษี</th>
                        <th data-align="center"  colspan="2" data-sortable="true">สำเนาใบกำกับภาษี</th>
                        <th data-align="center" rowspan="2"  class="valignMiddle" data-field="updateDate" data-sortable="true">วัน เดือน ปีที่ออกใบเเทน</th>
                        <th data-align="center"  rowspan="2" class="valignMiddle" data-field="reason" data-sortable="true">เหตุผล</th>
                    </tr>
                    <tr>
                        <th data-align="center" data-field="receiptNo" data-sortable="true">เล่มที่/เลขที่</th>
                        <th data-align="center" data-field="receiptDate" data-sortable="true">วัน เดือน ปี</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    <form action="../printDailyReceiptSaleReport.pdf" method="post" target="_printForm">
        <input type="hidden" id="printPdf" name="printPdf" value="1"/>
        <input type="hidden" id="startDate" name="startDate"/>
        <input type="hidden" id="endDate" name="endDate"/>
        <input type="hidden" id="serviceType" name="serviceType" value="CAT"/>
    </form>
    <form action="../printDailyReceiptSaleReport.xls" method="post" target="_printForm">
        <input type="hidden" id="printPdf" name="printPdf" value="1"/>
        <input type="hidden" id="startDate" name="startDate"/>
        <input type="hidden" id="endDate" name="endDate"/>
        <input type="hidden" id="serviceType" name="serviceType" value="CAT"/>
    </form>
    <script type="text/javascript">
        $(document).on("click", "a#inquiryReport", function() {
            $("#SalesTaxDailyReport").bootstrapTable("refresh",
                    { url: "../getDailyReceiptSaleReport.json?printPdf=0"
                    +"&startDate="+$("#startDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")+" "+$("#stHour").val()+":"+$("#stMin").val()
                    +"&endDate="+$("#endDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")+" "+$("#enHour").val()+":"+$("#enMin").val()
                    +"&serviceType=CAT"
                        , cache: false });
            setTimeout(function() {
                $("#SalesTaxDailyReport").bootstrapTable("resetView")
            }, 200);
        }).on("click", "a#printReport", function() {
            document.forms[1].startDate.value = $("#startDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")+" "+$("#stHour").val()+":"+$("#stMin").val();
            document.forms[1].endDate.value = $("#endDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")+" "+$("#enHour").val()+":"+$("#enMin").val();
            document.forms[1].submit();
        }).on("click", "a#printXls", function() {
            document.forms[2].startDate.value = $("#startDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")+" "+$("#stHour").val()+":"+$("#stMin").val();
            document.forms[2].endDate.value = $("#endDate").val().replace(/([0-9]{2}).([0-9]{2}).([0-9]{4})/g,"$1-$2-$3")+" "+$("#enHour").val()+":"+$("#enMin").val();
            document.forms[2].submit();
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
                function setup(array) { obj.elem.find("*").remove();
                    obj.elem.append('<option data-index="-1" data-key="-1" value="-1">ทั้งหมด</option>');
                    $.each(array,function(i,o){
                        obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.id +'" value="'+ o.id +'">'+ o.name +'</option>');
                    });
                }
                data = obj.elem.change(window[el.substring(1) +"ChangeEvent"]).find("option").map(function(i, opt){ return { key: opt.getAttribute("data-key"), value: opt.value, text: opt.textContent } });
            }
            (function(){ $(window["setup"]) })();
            new DropDown("#shop").init("../findShopList.json");
            new DropDown("#officer").init("../findOfficerList.json");
            return this;
        })(jQuery);
    </script>
</section>
</body>
</html>