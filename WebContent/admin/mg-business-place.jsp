<%--
  Created by Moew.
  User: Administrator
  Date: 19/5/2560
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EPIS Back Office : Business Place Management.</title>
    <link href="../pages/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../pages/resources/bootstrap-table/src/bootstrap-table.css" rel="stylesheet" type="text/css" />
    <link href="../pages/resources/custom.css" rel="stylesheet" type="text/css" />
    <link href="../pages/resources/select2.min.css" rel="stylesheet" type="text/css"/>
    <script src="../pages/resources/jquery.min.js" type="text/javascript"></script>
    <script src="../pages/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../pages/resources/bootstrap-table/src/bootstrap-table.js"></script>
    <script src="../pages/resources/custom.js" type="text/javascript"></script>
    <script src="../pages/resources/select2.min.js" type="text/javascript"></script>

</head>
<body>
<header class="header_page"></header>
<section class="container-fluid menu">
    <div class="row">
        <div class="col-md-12 tab-modefile">
            <ol class="breadcrumb">
                <li><i>การจัดการทั่วไป</i></li>
                <li class="active"><i>ข้อมูล GL Map</i></li>
            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 tab-modefile">
            <div id="alertSuccessAreaMsg" class="hide alert alert-success"><span class="glyphicon glyphicon-ok-sign"></span> บันทึกเรียบร้อย</div>
            <div id="alertDangerAreaMsg" class="hide alert alert-danger"><span class="glyphicon glyphicon-remove-sign"></span> เกิดข้อผิดพลาด</div>
            <!-- Search -->
            <div id="searchUnitPanel">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-filter"></span> ค้นหาประเภทบริการ</a></li>
                </ul>
                <div class="panel panel-default panal-radius">
                    <div class="panel-body">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="tab_1">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">ประเภทบริการ :</label>
                                        <div class="col-sm-2 select2Div"><select id="inputRevenueType1" class="form-control"></select></div>
                                        <label class="control-label col-sm-2">ชื่อผลิตภัณฑ์ :</label>
                                        <div class="col-sm-2 select2Div"><select id="inputProduct1" class="form-control"></select></div>
                                        <div class="col-sm-4">
                                            <a id="searchUnit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> ค้นหาข้อมูล</a>&nbsp;
                                            <a id="resetSearch" class="btn btn-danger"><span class="glyphicon glyphicon-minus-sign"></span> ยกเลิก</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a id="createUnit" class="btn btn-success"><span class="glyphicon glyphicon-file"></span> เพิ่มรายการ</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Display -->
            <div id="displayUnitPanel" class="hide tab-content">
                <div role="tabpanel" class="tab-pane active" id="tab-2-1">
                    <table id="unitTable" data-toggle="table" data-toolbar="#UnitToolbar" data-search="true" data-show-pagination-switch="true" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-show-export="true" data-pagination="true" data-height="400" data-cache="false">
                        <thead>
                        <tr>
                            <%--<th data-field="costCenterName" data-align="left" >ศูนย์ต้นทุน</th>--%>
                            <th data-field="revenueTypeName" data-align="left" >ประเภทบริการ</th>
                            <th data-field="serviceName" data-align="left" >ชื่อบริการ</th>
                            <th data-field="productName" data-align="left" >ชื่อผลิตภัณฑ์</th>
                            <th data-field="subProductName" data-align="left" >ชื่อผลิตภัณฑ์ย่อย</th>
                            <th data-field="segmentName" data-align="left" >เซกเมนต์</th>
                            <th data-field="status" data-formatter="isPositiveFormatter" data-align="left">สถานะ</th>
                            <th data-field="serviceCode" data-formatter="rowsFormatter" data-align="center"></th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
            <!-- Create -->
            <div id="createUnitPanel" class="hide">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#"><span class="glyphicon glyphicon-list"></span> เพิ่มข้อมูลบริการ</a></li>
                </ul>
                <div class="panel panel-default panal-radius">
                    <form id="createUnitFm" method="post" class="form-horizontal" role="form">
                        <div class="panel-body">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="tab_1">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">รหัสบัญชี(GL) :</label>
                                            <div class="col-sm-3"><input class="form-control" id="inputGL" name="inputGL"></div>

                                        </div>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="control-label col-sm-2">ศูนย์ต้นทุน :</label>--%>
                                            <%--<div class="col-sm-3 select2Div"><select id="inputCostCenter" value="" name="" class="form-control"></select></div>--%>

                                        <%--</div>--%>

                                        <div class="form-group">
                                            <label class="control-label col-sm-2">ชื่อประเภทบริการ :</label>
                                            <div class="col-sm-3 select2Div"><select class="form-control" id="inputRevenueType" name="inputRevenueType"></select></div>

                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">ชื่อผลิตภัณฑ์ :</label>
                                            <div class="col-sm-3 select2Div"><select class="form-control" id="inputProduct" name="inputProduct"></select></div>

                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">ชื่อผลิตภัณฑ์ย่อย :</label>
                                            <div class="col-sm-3 select2Div"><select class="form-control" id="inputSubProduct" name="inputSubProduct"></select></div>

                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-sm-2">ชื่อเซกเมนต์ :</label>
                                            <div class="col-sm-3 select2Div"><select class="form-control" id="inputSegment" name="inputSegment"></select></div>

                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">ชื่อบริการ :</label>
                                            <div class="col-sm-3"><input id="inputServiceName" value="" name="" class="form-control"></div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-2">สถานะ :</label>
                                            <div class="col-sm-2"><select class="form-control" id="inputCheckStatus" name="inputCheckStatus">

                                                <option value="1">เปิดใช้งาน</option>
                                                <option value="0">ระงับใช้งาน</option>
                                            </select></div>

                                            <div class="col-sm-5">
                                                <a id="save" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span> บันทึกข้อมูล</a>&nbsp;
                                                <a id="edit" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span> แก้ไขข้อมูล</a>&nbsp;
                                                <a id="resetCreate" class="btn btn-danger"><span class="glyphicon glyphicon-minus-sign"></span> ยกเลิก</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a id="backToSearch" class="btn btn-success"><span class="glyphicon glyphicon-search"></span> ค้นหาข้อมูล</a>
                                            </div>
                                            <input type="hidden" id="inputServiceCode" value=""/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</section>

</body>
<script type="text/javascript">
    var view = (function($){
        function DropDown(el, url) { var obj = this, data = [{ key: "", value: "", text: "Please Select" }]; obj.el = el; obj.elem = $(el);
            obj.data = function(array) { if ($.type(array) == "array") { setup(data = array); return this } return data; };
            obj.init = function(url,param) { if (url) $.get(url, function(res) { setup(data = res.data,param) }); else setup(data,param); return this };
            obj.disable = function(flag) { obj.elem.attr("disabled", (flag == null ? true : flag)); return this }
            obj.enable = function() { obj.disable(false); return this }
            obj.index = function() { if (arguments.length == 1) { var maxLen = data.length, index = arguments[0]; obj.elem.find("option").each(function(i, opt){ opt.removeAttribute("selected") }).eq(index < 0 ? maxLen + index : index).attr("selected", true); return this } return $.inArray("selected", obj.elem.find("option").map(function(i, opt){ return opt.selected ? "selected" : "no-selected" })) }
            obj.selected = function(){ return data[obj.index()]; };
            obj.val = function() { return obj.elem.val(); };
            obj.key = function(){ if (arguments.length == 0) { var key = obj.elem.find("option:selected").data("key"); if (typeof key === "string" && key === "undefined") { var item = data[obj.index()]; key = item && item.key ? item.key : item.id } return key } var key = arguments[0]; for (var i = 0, m = data.length; i < m; i++) { var item = data[i]; if (item.key && item.key == key) { obj.index(i); break; } if (item.id && item.id == key) { obj.index(i); break; } } return this }

            function setup(array,param) {
                obj.elem.find("*").remove();
                $.each(array,function(i,o){
                    if(o.category == 'payothers.service.unit'){
                        obj.elem.append('<option data-index="-1" data-key="-1" value="">ไม่เลือก</option>');
                        return false;
                    }
                    else{
                        obj.elem.append('<option data-index="-1" data-key="-1" value="">--กรุณาเลือก--</option>');
                        return false;
                    }
                });

                $.each(array,function(i,o){

                    if(o.category == 'payothers.service.category'){
                        obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.code +'" value="'+ o.descFullTh +'">'+ o.descFullTh +'</option>')
                    }
                    else if(param=="product"){
                        obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.product +'" value="'+ o.name +'">'+ o.product +' - '+ o.name +'</option>')
                    }
                    else if(param=="subProduct"){
                        console.log("==============================================");
                        console.log(o);
                        obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.subProduct +'" value="'+ o.name +'">'+ o.subProduct +' - '+ o.name +'</option>')
                    }
                    else if(param=="revenueType"){
                        obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.revenueType +'" value="'+ o.description +'">'+ o.revenueType +' - '+ o.description +'</option>')
                    }
                    else if(param=="segment"){
                        obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.segment +'" value="'+ o.description +'">'+ o.segment +' - '+ o.description +'</option>')
                    }
//                    else if(param=="costCenter"){
//                        obj.elem.append('<option data-index="'+ i +'" data-key="'+ o.costCenterCode +'" value="'+ o.costCenterName +'">'+ o.costCenterCode +' - '+ o.costCenterName +'</option>')
//                    }

                });

            }

            data = obj.elem.change(window[el.substring(1) +"ChangeEvent"]).find("option").map(function(i, opt){ return { key: opt.getAttribute("data-key"), value: opt.value, text: opt.textContent } });
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
        (function(){ $(window["setup"]) })();
        self.inputRevenueType1=new DropDown("#inputRevenueType1").init("../findByRevenueType.json","revenueType");
        self.inputProduct1=new DropDown("#inputProduct1").init("../findByProduct.json","product");

//      self.inputServiceType1 = new DropDown("#inputServiceType1").init("../findServiceCategoryList.json");
        self.inputProduct=new DropDown("#inputProduct").init("../findByProduct.json","product");
        self.inputSubProduct=new DropDown("#inputSubProduct").init("../findBySubProduct.json","subProduct");
        self.inputRevenueType=new DropDown("#inputRevenueType").init("../findByRevenueType.json","revenueType");
        self.inputSegment=new DropDown("#inputSegment").init("../findBySegment.json","segment");
//        self.inputCostCenter = new DropDown("#inputCostCenter").init("../findByCostCenter.json", "costCenter");
        self.inputCheckStatus = new DropDown("#inputCheckStatus");
        self.inputServiceCode = new Input("#inputServiceCode");
        self.inputServiceName = new Input("#inputServiceName");
        self.inputGL = new Input("#inputGL");



        return this;
    })(jQuery);

    $("#inputCostCenter").select2();
    $("#inputRevenueType").select2();
    $("#inputProduct").select2();
    $("#inputSubProduct").select2();
    $("#inputSegment").select2();
    $("#inputRevenueType1").select2();
    $("#inputProduct1").select2();
    $('.select2Div span.select2-container').removeAttr('style');
    $(document).on("click", "a#searchUnit", function() {
        runningMsgHide();
        if($('#inputRevenueType1').val() == '' && $('#inputProduct1').val() == '') {
            if($('#inputRevenueType1').val() == '') { $('#inputRevenueType1').attr("style", "color:#a94442"); $("#inputRevenueType1").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
            if($('#inputProduct1').val() == '') { $('#inputProduct1').attr("style", "color:#a94442"); $("#inputProduct1").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
            return false;
        } else {
            $('#displayUnitPanel').removeClass('hide');
            $('#createUnitPanel').addClass('hide');
            $('#inputRevenueType1').removeAttr("style");
            $('#inputProduct1').removeAttr("style");
            var dataSend={
                revenueTypeCode:view.inputRevenueType1.key(),
                productCode:view.inputProduct1.key()
            };
            $.ajax({
                type: "POST",
                url: "../findServiceNameMapGl.json",
                data: JSON.stringify(dataSend),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success:function(data){
                    console.log(data);
                    $('#displayUnitPanel').removeClass('hide');
                    $("#unitTable").bootstrapTable("load", data);
                }
            });
        }
    }).on("click", "a#createUnit", function() {
        runningMsgHide();

        $('#searchUnitPanel').addClass('hide'); $('#displayUnitPanel').addClass('hide');  $('#createUnitPanel').removeClass('hide');
        $('#edit').addClass('hide');
        $('#unitCode').removeAttr("style"); $('#unitName').removeAttr("style");
        $("#id").val(''); $("#unitCode").val(''); $("#unitName").val(''); $("#isPositive").val('');
    }).on("click", "a#backToSearch", function() {
        runningMsgHide();
        location.reload();
        $('#searchUnitPanel').removeClass('hide'); $('#displayUnitPanel').addClass('hide');  $('#createUnitPanel').addClass('hide');
        $('#unitCode').removeAttr("style"); $('#unitName').removeAttr("style");
    }).on("click", "a#resetSearch", function() {
        runningMsgHide();
//        $('#inputRevenueType1').removeAttr("style"); $('#inputProduct1').removeAttr("style");
//        $('#inputRevenueType1').val(""); $('#inputProduct1').val("");
        $('#inputRevenueType1').val('').trigger('change.select2');
        $('#inputProduct1').val('').trigger('change.select2');
    }).on("click", "a#resetCreate", function() {
        runningMsgHide();
        $('#inputGL').removeAttr("style");
        $('#inputSubProduct').removeAttr("style");
        $('#inputRevenueType').removeAttr("style");
        $('#createUnitFm')[0].reset();
    }).on("click", "a#save", function() {
            runningMsgHide();
            if(view.inputGL.val() == '' || view.inputSubProduct.val() == '' || view.inputRevenueType.val() == '') {
                if(view.inputGL.val() == '') { $('#inputGL').attr("style", "color:#a94442"); $("#inputGL").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
                if(view.inputSubProduct.val() == '') { $('#inputSubProduct').attr("style", "color:#a94442"); $("#inputSubProduct").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
                if(view.inputRevenueType.val() == '') { $('#inputRevenueType').attr("style", "color:#a94442"); $("#inputRevenueType").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
                return false;
            } else {
                $('#inputGL').removeAttr("style");
                $('#inputSubProduct').removeAttr("style");
                $('#inputRevenueType').removeAttr("style");
                var dataSend={
                    glCode:$("#inputGL").val(),
//                    costCenterCode:view.inputCostCenter.key(),
//                    costCenterName:view.inputCostCenter.val(),
                    revenueTypeCode:view.inputRevenueType.key(),
                    revenueTypeName:view.inputRevenueType.val(),
                    productCode:view.inputProduct.key(),
                    productName:view.inputProduct.val(),
                    subProductCode:view.inputSubProduct.key(),
                    subProductName:view.inputSubProduct.val(),
                    segmentCode:view.inputSegment.key(),
                    segmentName:view.inputSegment.val(),
                    serviceName:view.inputServiceName.val(),
                    status:view.inputCheckStatus.val()
                };
                $.ajax({
                    type: "POST",
                    url: "../saveMapGLServiceType.json",
                    data: JSON.stringify(dataSend),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success:function(data){
                        $('#inputRevenueType').val('').trigger('change.select2');
                        $('#inputProduct').val('').trigger('change.select2');
                        $('#inputSubProduct').val('').trigger('change.select2');
                        $('#inputSegment').val('').trigger('change.select2');
                        $('#createUnitFm')[0].reset();
                        $('#alertSuccessAreaMsg').removeClass('hide');
                        $('#alertDangerAreaMsg').addClass('hide');
                    },
                    error: function(jqxhr) {
                        $('#alertDangerAreaMsg').removeClass('hide');
                        $('#alertSuccessAreaMsg').addClass('hide');
                    }
                });
            }
        }).on("click", "a#edit", function() {
        runningMsgHide();
        if(view.inputGL.val() == '' || view.inputSubProduct.val() == '' || view.inputRevenueType.val() == '') {
            if(view.inputGL.val() == '') { $('#inputGL').attr("style", "color:#a94442"); $("#inputGL").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
            if(view.inputSubProduct.val() == '') { $('#inputSubProduct').attr("style", "color:#a94442"); $("#inputSubProduct").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
            if(view.inputRevenueType.val() == '') { $('#inputRevenueType').attr("style", "color:#a94442"); $("#inputRevenueType").attr("style", "background-color:#ffffaa;border:solid 1px #a94442;padding:0 10px"); }
            return false;
        } else {
            $('#inputGL').removeAttr("style"); $('#inputSubProduct').removeAttr("style"); $('#inputRevenueType').removeAttr("style");
            var dataSend={
                serviceCode: view.inputServiceCode.val(),
                glCode:$("#inputGL").val(),
//                    costCenterCode:view.inputCostCenter.key(),
//                    costCenterName:view.inputCostCenter.val(),
                revenueTypeCode:view.inputRevenueType.key(),
                revenueTypeName:view.inputRevenueType.val(),
                productCode:view.inputProduct.key(),
                productName:view.inputProduct.val(),
                subProductCode:view.inputSubProduct.key(),
                subProductName:view.inputSubProduct.val(),
                segmentCode:view.inputSegment.key(),
                segmentName:view.inputSegment.val(),
                serviceName:view.inputServiceName.val(),
                status:view.inputCheckStatus.val()
            };
            $.ajax({
                type: "POST",
                url: "../editMapGLServiceType.json",
                data: JSON.stringify(dataSend),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success:function(data){

                    $('#inputRevenueType').val('').trigger('change.select2');
                    $('#inputProduct').val('').trigger('change.select2');
                    $('#inputSubProduct').val('').trigger('change.select2');
                    $('#inputSegment').val('').trigger('change.select2');
                    $('#createUnitFm')[0].reset();
                    $('#alertSuccessAreaMsg').removeClass('hide');
                    $('#alertDangerAreaMsg').addClass('hide');

                },
                error: function(jqxhr) {
                    $('#alertDangerAreaMsg').removeClass('hide');
                    $('#alertSuccessAreaMsg').addClass('hide');
                }
            });
        }
    }).on("change", "#inputGL, #inputRevenueType, #inputSubProduct", function(){
        var serviceName = view.inputGL.val() +" "+view.inputRevenueType.val() +" "+ view.inputSubProduct.val();
        view.inputServiceName.val(serviceName);

    });

    function runningFormatter(val, row, ind) { return ind + 1; }
    function runningMsgHide() { $('#alertSuccessAreaMsg').addClass('hide'); $('#alertDangerAreaMsg').addClass('hide'); }
    function isPositiveFormatter(val) {var target; if(0 == val) {target = "ระงับใช้งาน";} else if(1 == val) { target = "เปิดใช้งาน";} return target; }
    function rowsFormatter(serviceCode) {return '<a id="unitEdit" style="cursor:pointer" onClick="findServiceNameMapGlByServiceCode(\''+ serviceCode +'\')" class="btn-sm btn-info"><i class="glyphicon glyphicon-edit"></i> แก้ไข</a>'; }
    function findServiceNameMapGlByServiceCode(serviceCode) {
        $.get("../findServiceNameMapGlByServiceCode.json", { "serviceCode": serviceCode }, function(response) {
            $('#searchUnitPanel').addClass('hide');
            $('#displayUnitPanel').addClass('hide');
            $('#createUnitPanel').removeClass('hide');
            $('#resetCreate').addClass('disabled');
            $('#save').addClass('hide');

            res = response[0];

            view.inputGL.val(res.glCode)
            view.inputServiceCode.val(res.serviceCode);
            view.inputServiceName.val(res.serviceName);
//            $('#inputCostCenter option[data-key='+res.costCenterCode+']').prop('selected', true).trigger('change.select2');
            $('#inputRevenueType option[data-key='+res.revenueTypeCode+']').prop('selected', true).trigger('change.select2');
            $('#inputProduct option[data-key='+res.productCode+']').prop('selected', true).trigger('change.select2');
            $('#inputSubProduct option[data-key='+res.subProductCode+']').prop('selected', true).trigger('change.select2');
            $('#inputSegment option[data-key='+res.segmentCode+']').prop('selected', true).trigger('change.select2');
            $('#inputCheckStatus option[data-key='+res.status+']').prop('selected', true).trigger('change.select2');
        });
    }

</script>
</html>
