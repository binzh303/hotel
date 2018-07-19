<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>入住信息查询</title>
<meta name="description" content="入住信息查询">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<c:url value='/assets/i/favicon.png'/>">
<link rel="apple-touch-icon-precomposed" href="<c:url value='/assets/i/app-icon72x72@2x.png'/>">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="<c:url value='/assets/css/amazeui.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>">
<link rel="stylesheet" href="<c:url value='/diagram-viewer/inputtop.css'/>">
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/js/app.js'/>"></script>
<script src="<c:url value='/js/jqPaginator.js'/>"></script>
</head>
<body>

	<div class="admin-biaogelist" style="position: static;">

		<div class="listbiaoti am-cf">
			<ul><img style="margin:-5px 5px 0px 0px;" src="<c:url value='/img/index/menu1.png'/>">入住信息查询
			</ul>

			<dl class="am-icon-home" style="float: right;">
				当前位置： <a href='${pageContext.request.contextPath}/mainPage.action' >首页</a> >
				<a href="#">入住信息查询</a>
			</dl>

			<!--这里打开的是新页面-->
		</div>
		<form action="<c:url value='/guestmanagement/liveinlist.action'/>" method="post">
			<input type="hidden" name="page" value="" />
			<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
				<ul>
					<li>
						<input class="gjz-quq" name="certificatenum" value="${certificatenum }" class="am-form-field am-input-sm am-input-xm" placeholder="顾客证件号" />
	           	 	</li>
					<li>
						<input type="text" name="beginDate" class="datebegin-quq"
						value="${beginDate}" class="am-form-field am-input-sm am-input-zm  am-icon-calendar"
						placeholder="开始日期" data-am-datepicker="{theme: 'success',}" readonly /></li>
					<li>
						<input type="text" name="endDate"  class="dateend-quq"
						value="${endDate}" class="am-form-field am-input-sm am-input-zm  am-icon-calendar"
						placeholder="结束日期" data-am-datepicker="{theme: 'success',}" readonly /></li>

					<li>
<!-- 						<button type="submit" class="am-btn am-radius am-btn-xs am-btn-success find-quq"><span class="find-quq find">搜索</span></button> -->
						<button onclick="compaire()" class="am-btn am-radius am-btn-xs am-btn-success find-quq"><span class="find-quq find">搜索</span></button>
					</li>
				</ul>
			</div>
		</form>
		<div class="am-form am-g">
			<table class="am-table am-table-bordered am-table-radius am-table-striped">
				<thead>
					<tr class="am-success">
						<th width="5%" style="text-align:center;"><input type="checkbox" id="checkAll" /></th>
						<th width="5%" id="th1" style="text-align:center;">序号</th>
						<th width="10%" style="text-align:center;">顾客姓名</th>
						<th width="5%" style="text-align:center;">性别</th>
						<th width="10%" style="text-align:center;">入住房间</th>
						<th width="10%" style="text-align:center;">入住时间</th>
						<th width="10%" style="text-align:center;">证件类型</th>
						<th width="15%" style="text-align:center;">证件号码</th>
						<th width="10%" style="text-align:center;">会员类型</th>
						<th width="10%" style="text-align:center;">查看详情</th>
					<!--<th width="10%" style="text-align:center;">备注</th> -->
<!-- 					<th width="10%" style="text-align:center;">操作</th> -->

					</tr>
				</thead>
				<tbody id="apply-table">

					<c:forEach items="${paging.list}" var="livein" varStatus="status">
						<tr id="1" style="background-color: white;">
							<td align="center" class="oder"><input type="checkbox" id="mychk" class="mychk" name="id"
								value="${livein.customerid}" /></td>
							
							<td align="center" id="td1" class="oder"><span class="span1" id="num">${ status.index + 1}</span></td>
							<td align="center" class="am-hide-sm-only">${livein.name}</td>
							<td align="center" class="am-hide-sm-only">${livein.gender}</td>
							<td align="center" class="am-hide-sm-only">${livein.roomnum}</td>
							<td align="center"><fmt:formatDate value="${livein.checkintime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td align="center">${livein.certificatetype}</td>
							<td align="center" class="am-hide-sm-only">${livein.certificatenum}</td>
							<td align="center" class="am-hide-sm-only">${livein.membertype}</td>
							<td align="center" class="am-hide-sm-only"><a href="<c:url value='/guestmanagement/showdetail.action?id=${livein.customerid }'/>">点击查看</a></td>

						<%--<td align="center" class="am-hide-sm-only">${livein.note}</td> --%>
<!-- 							<td style="text-align:center;"> -->
<!-- 							入住列表入住信息修改按钮暂不保留 -->
<%-- 			                <a type="button"  href="<c:url value='/guestmanagement/toLiveinModify.action?customerid=${livein.customerid }'/>" >修改</a>  --%>
<%-- 							<a href="javascript:void(0)" onclick="deletedept('${dept.deptid}')">删除</a> --%>
<!--                 	</td>	 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>

<!-- 			<div class="am-btn-group am-btn-group-xs"> -->
<!-- 					<button type="button" style="height: 35px;" class="am-btn am-btn-default button-del" onclick="deletechecked()"></button> -->
<%--             <a  type="button" style="height: 35px;" class="am-btn am-btn-default button-add" href="<c:url value='/guestmanagement/livein.action'/>"> </a> --%>
<!-- 			</div> -->

			<div class="am-cf">
				共 ${paging.totalRows} 条记录
				<div class="am-fr">
					<ul class="am-pagination" id="pagination2"></ul>
					<script type="text/javascript">
			    $.jqPaginator('#pagination2',{
			        totalPages: ${paging.totalPages},
			        visiblePages: ${paging.pageSize},
			        currentPage: ${paging.currentPage},
			        disableClass: 'am-disabled',
			        activeClass: 'am-active',
					prev: '<li class="prev"><a href="javascript:;">上一页</a></li>',
			        next: '<li class="next"><a href="javascript:;">下一页</a></li>',
			        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
			        onPageChange: function (num, type) {
			            if(num!==${paging.currentPage}){
			            	$("input[name='page']").val(num);
			            	$("form").submit();
			            }
			        }
			    });
			</script>

				</div>
			</div>

			<hr />

		</div>
	</div>
	<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="<c:url value='/assets/js/amazeui.min.js'/>"></script>
</body>
<script>
var msg="${msg}";
if(msg!=""){
	alert(msg);
}
    $(function () {

        $("button[look]").click(function(){

            $("#modalLook").modal("open");


        });
        

    });
    
    var compaire=function(){
    	var beginDate=$("input[name='beginDate']").val();  
    	 var endDate=$("input[name='endDate']").val();  
    	 var d1 = new Date(beginDate.replace(/\-/g, "\/"));  
    	 var d2 = new Date(endDate.replace(/\-/g, "\/"));  

    	  if(beginDate!=""&&endDate!=""&&d1 >=d2)  
    	 {  
    	  alert("开始时间不能大于结束时间！");  
    	  return false;  
    	 }
    	  else{
    		  $("form").submit();
    	  }
    }

    	$(document).ready(function(){
    		$("#checkAll").click(function(){
            	if($(this).is(':checked')){
            		$(".mychk").each(function(){
            			this.checked=true;
            		});
            	}else{
            		$(".mychk").each(function(){
            			this.checked=false;
            		});
            	}
            });
    	});
    	
    //}
    

    var showdetail=function(id){
        	window.location.href="${pageContext.request.contextPath}/guestmanagement/showdetail.action?customerid="+customerid;
        };
    var deleteapplyinfo=function(id){
    	if(confirm("您确认要删除此申请？")){
    		$.ajax({
    			url:"${pageContext.request.contextPath}/guestmanagement/delete.action?customerid="+customerid,
    			type:"POST",
    			success:function(result){
    				if(result=="success"){
    					alert("删除成功！");
    					window.location.reload();
    				}else{
    					alert("删除失败！");
    				}
    			}			
    		})
    	}
    };
    var deletechecked=function(){
    	var ids="";
    	$("input[name='id']").each(function(){
    		if($(this).prop("checked")){
    			ids=ids+$(this).val()+",";
    		}    		
    	})
    	if(ids==""){
    		alert("请至少选择一条申请！！");
    		return;
    	}
    	if(confirm("您确认要删除所有选中项？")){
    		$.ajax({
    			url:"${pageContext.request.contextPath}/guestmanagement/deletelist.action?ids="+ids,
    			type:"POST",
    			success:function(result){
    				if(result=="success"){
    					alert("删除成功！");
    					window.location.reload();
    				}else{
    					alert("删除失败！");
    				}
    			}		
    		})
    	}
    };
    
    var sendUpdate=function(id){
    	window.location.href="${pageContext.request.contextPath}/guestmanagement/sendUpdate.action?id="+id;
    };


</script>
</html>