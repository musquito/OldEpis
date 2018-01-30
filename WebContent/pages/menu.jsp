<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/commons/includes.jsp" %>
<nav class="menu-side">
    <div>
        <div class="list-group">
            <a href="#" class="list-group-item menu-toggle menu-close" style="text-align: right"><span class="glyphicon glyphicon-step-backward"></span></a>
            <a href="Dashboard.jsp" class="list-group-item small"><span class="glyphicon glyphicon-star-empty"></span> แผงแสดงงาน (Dashboard)</a>
            <a href="#" class="list-group-item active" data-toggle="collapse" data-target="#list_payment" data-parent="#menu"><span class="glyphicon glyphicon-shopping-cart"></span> รับชำระเงิน<span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
            <div id="list_payment" class="sublinks collapse">
                <a href="pay-service-charge-offline.jsp?new" class="list-group-item small"><span class="glyphicon glyphicon-barcode"></span> รับชำระค่าใช้บริการ</a>
                <a href="pay-other_1.jsp?new" class="list-group-item small"><span class="glyphicon glyphicon-briefcase"></span> รับชำระค่าบริการอื่นๆ</a>
            </div>
            
        </div>
    </div>
</nav> 
 

<script>
/* loadListPaymentAgent();
function loadListPaymentAgent() {
    $("#list_payment_agent").append('<a href="pay-6-stap_1.jsp?new" class="list-group-item small"><span class="glyphicon glyphicon-edit"></span> รับชำระค่าบริการ (MNP)</a>')
    $.get("../loadMenuListPaymentAgent.json", function (res) {
        console.log(res.data);
        var agents = res.data;
        for (var i = 0; i < agents.length; i++) {
            var params = "id="+agents[i].id;
            $("#list_payment_agent").append('<a href="pay-agent_1.jsp?'+params+'" class="list-group-item small"><span class="glyphicon glyphicon-road"></span> รับชำระ'+agents[i].name+'</a>')
        }
    });
} */
</script>