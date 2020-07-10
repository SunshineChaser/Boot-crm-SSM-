<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>客户管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body class="layui-layout-body">



	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">BOOT客户管理系统v2.0</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img">
						${USER_SESSION.username}
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a
					href="${pageContext.request.contextPath}/logout.action">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">

				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<form class="layui-form layui-form-pane" action="">
						<div class="layui-form-item">
							<label class="layui-form-label"> <i class="layui-icon"
								style="color: #000000;">&#xe615;</i>
							</label>
							<div class="layui-input-block">
								<input type="text" name="search" autocomplete="off"
									placeholder="查询内容" class="layui-input">
							</div>
						</div>
					</form>
					<li class="layui-nav-item layui-nav-itemed"><a href="">客户管理</a></li>
					<li class="layui-nav-item"><a href="">客户拜访</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<ol class="breadcrumb">
				<li><a href="#">管理系统</a></li>
				<li class="active">客户管理</li>
			</ol>
			<fieldset class="layui-elem-field layui-field-title">
				<legend>按条件查询</legend>
			</fieldset>
			<form class="layui-form layui-form-pane"
				action="${pageContext.request.contextPath}/customer/list.action"
				style="padding-top: 15px; padding-left: 15px;" id="searchForm"
				method="get" lay-filter="searchFormFilter">
				<div class="layui-form-item">

					<div class="layui-inline">
						<label class="layui-form-label">客户名称</label>
						<div class="layui-input-inline">
							<input type="text" placeholder="" autocomplete="off"
								class="layui-input" value="${custName}" name="custName"
								id="customerName">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">客户来源</label>
						<div class="layui-input-inline" style="width: 100px;">
							<select id="custometFrom" name="custSource">
								<option value="">请选择</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.dictId}" <c:if test="${item.dictId==custSource}"> selected</c:if>>${item.dictItemName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">所属行业</label>
						<div class="layui-input-inline" style="width: 100px;">
							<select id="custIndustry" name="custIndustry">
								<option value="">请选择</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dictId}" <c:if test="${item.dictId==custIndustry}"> selected</c:if>>${item.dictItemName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">客户级别</label>
						<div class="layui-input-inline" style="width: 100px;">
							<select id="custLevel" name="custLevel">
								<option value="">请选择</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dictId}" <c:if test="${item.dictId==custLevel}"> selected</c:if>>${item.dictItemName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<button type="submit" class="layui-btn">查询</button>
					</div>
					<button type="button" class="layui-btn" data-toggle="modal"
						data-target="#newCustomer" onclick="clearCustomer()">新建</button>
				</div>
			</form>



			<div style="padding: 15px;" id="dataTable">
				<table class="layui-table">

					<thead>
						<tr>
							<th colspan="8">客户信息列表</th>
						</tr>
						<tr>
							<th>编号</th>
							<th>客户名称</th>
							<th>客户来源</th>
							<th>客户所属行业</th>
							<th>客户级别</th>
							<th>固定电话</th>
							<th>手机</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="row">
							<tr>
								<td>${row.custId}</td>
								<td>${row.custname}</td>
								<td>${row.custSource}</td>
								<td>${row.custIndustry}</td>
								<td>${row.custLevel}</td>
								<td>${row.custPhone}</td>
								<td>${row.custMobile}</td>
								<td>
									<button class="layui-btn layui-btn-warm" data-toggle="modal"
										data-target="#customerEditDialog" onclick="editCustomer(${row.custId})">修改</button>
									<button class="layui-btn layui-btn-danger"
										onclick="deleteCustomer(${row.custId})">删除</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<itheima:page
				url="${pageContext.request.contextPath}/customer/list.action" />
		</div>

		<!-- Modal -->
		<div class="modal fade" id="newCustomer" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
					</div>
					<div class="modal-body">

						<form class="form-horizontal" id="new_customer_form">
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">客户名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="客户名称" id="new_customerName" name="custname">
								</div>
							</div>
							<div class="form-group">
								<label for="new_customerfrom" class="col-sm-2 control-label">客户来源</label>
								<div class="col-sm-10">
									<select class="form-control" id="new_customerfrom"
										name="custSource">
										<option>--请选择--</option>
										<c:forEach items="${fromType}" var="item">
											<option value="${item.dictId}"
												<c:if test="${item.dictId==custSource}"> selected</c:if>>
												${item.dictItemName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="new_custIndustry" class="col-sm-2 control-label">所属行业</label>
								<div class="col-sm-10">
									<select class="form-control" id="new_custIndustry"
										name="custIndustry">
										<option>--请选择--</option>
										<c:forEach items="${industryType}" var="item">
											<option value="${item.dictId}"
												<c:if test="${item.dictId==custIndustry}"> selected</c:if>>
												${item.dictItemName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="new_custLevel" class="col-sm-2 control-label">客户级别</label>
								<div class="col-sm-10">
									<select class="form-control" id="new_custLevel"
										name="custLevel">
										<option>--请选择--</option>
										<c:forEach items="${levelType}" var="item">
											<option value="${item.dictId}"
												<c:if test="${item.dictId==custLevel}"> selected</c:if>>
												${item.dictItemName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_linkMan"
										placeholder="联系人" name="custLinkman">
								</div>
							</div>
							<div class="form-group">
								<label for="new_phone" class="col-sm-2 control-label">固定电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_phone"
										placeholder="固定电话" name="custPhone">
								</div>
							</div>
							<div class="form-group">
								<label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_mobile"
										placeholder="移动电话" name="custMobile">
								</div>
							</div>
							<div class="form-group">
								<label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_zipcode"
										placeholder="邮政编码" name="custZipcode">
								</div>
							</div>
							<div class="form-group">
								<label for="new_address" class="col-sm-2 control-label">联系地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="new_address"
										placeholder="联系地址" name="custAddress">
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary"
									onclick="createCustomer()">创建客户</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		
		<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
					</div>
					<div class="modal-body">

						<form class="form-horizontal" id="edit_customer_form">
							<input type="hidden" id="edit_cust_id" name="custId">
							<div class="form-group">
								<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="客户名称" id="edit_customerName" name="custname">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_customerFrom" class="col-sm-2 control-label">客户来源</label>
								<div class="col-sm-10">
									<select class="form-control" id="edit_customerFrom"
										name="custSource">
										<option>--请选择--</option>
										<c:forEach items="${fromType}" var="item">
											<option value="${item.dictId}"
												<c:if test="${item.dictId==custSource}"> selected</c:if>>
												${item.dictItemName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="edit_custIndustry" class="col-sm-2 control-label">所属行业</label>
								<div class="col-sm-10">
									<select class="form-control" id="edit_custIndustry"
										name="custIndustry">
										<option>--请选择--</option>
										<c:forEach items="${industryType}" var="item">
											<option value="${item.dictId}"
												<c:if test="${item.dictId==custIndustry}"> selected</c:if>>
												${item.dictItemName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="edit_custLevel" class="col-sm-2 control-label">客户级别</label>
								<div class="col-sm-10">
									<select class="form-control" id="edit_custLevel"
										name="custLevel">
										<option>--请选择--</option>
										<c:forEach items="${levelType}" var="item">
											<option value="${item.dictId}"
												<c:if test="${item.dictId==custLevel}"> selected</c:if>>
												${item.dictItemName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_linkMan"
										placeholder="联系人" name="custLinkman">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_phone"
										placeholder="固定电话" name="custPhone">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_mobile"
										placeholder="移动电话" name="custMobile">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_zipcode"
										placeholder="邮政编码" name="custZipcode">
								</div>
							</div>
							<div class="form-group">
								<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="edit_address"
										placeholder="联系地址" name="custAddress">
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary"
									onclick="updateCustomer()">保存修改</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© BOOTCustomerManageSystem.com - 底部固定区域
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery2.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

	<script>
		//JavaScript代码区域
		
		//清空新建客户窗口中的数据
		function clearCustomer() {
			$("#new_customerName").val("");
			$("#new_customerfrom").val("");
			$("#new_custIndustry").val("");
			$("#new_custLevel").val("");
			$("#new_linkMan").val("");
			$("#new_phone").val("");
			$("#new_mobile").val("");
			$("#new_zipcode").val("");
			$("#new_address").val("");
		}
		
		//创建客户
		function createCustomer() {
		$.post("<%=basePath%>customer/create.action",
					$("#new_customer_form").serialize(), function(data) {
				if (data == "OK") {
					alert("客户创建成功!");
					window.location.reload();
				} else {
					alert("客户创建失败!");
					window.location.reload();
				}
			});
		}
		
		//通过id获取要修改的客户信息
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/getCustomerById.action",
				data:{"id":id},
				success:function(data){
					$("#edit_cust_id").val(data.custId);
					$("#edit_customerName").val(data.custname);
					$("#edit_customerFrom").val(data.custSource);
					$("#edit_custIndustry").val(data.custIndustry);
					$("#edit_custLevel").val(data.custLevel);
					$("#edit_linkMan").val(data.custLinkman);
					$("#edit_phone").val(data.custPhone);
					$("#edit_mobile").val(data.custMobile);
					$("#edit_zipcode").val(data.custZipcode);
					$("#edit_address").val(data.custAddress);
				}
			});
		}
		
		//执行修改客户操作
		function updateCustomer() {
		$.post("<%=basePath%>customer/update.action",
					$("#edit_customer_form").serialize(), function(data) {
				if (data == "OK") {
					alert("客户信息更新成功!");
					window.location.reload();
				} else {
					alert("客户信息更新失败!");
					window.location.reload();
				}
			});
		}
		
		//删除客户
		function deleteCustomer(id) {
			if(confirm('确实要删除该客户吗？')){
				$.post("<%=basePath%>customer/delete.action",
				{"id":id},
				function(data){
					if (data == "OK") {
						alert("客户删除成功!");
						window.location.reload();
					} else {
						alert("客户删除失败!");
						window.location.reload();
					}
				});
			}
		}
		

		layui.use('element', function() {
			var element = layui.element;

		});

		layui.use('form', function() {
			var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

			//但是，如果你的HTML是动态生成的，自动渲染就会失效
			//因此你需要在相应的地方，执行下述方法来进行渲染
			form.render();
			form.render('select', 'searchFormFilter'); //更新 lay-filter="searchFormFilter" 所在容器内的全部 select 状态
		});

		//引入layer
		/* layui.use('layer', function() { //独立版的layer无需执行这一句
			var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

			//触发事件
			var active = {
				//点击“删除”角色后弹出的确认信息
				confirmDelete : function() {
					layer.confirm('确定要删除该客户吗？', {
						icon : 3,
						title : '确认'
					}, function() {//点击确认后的操作

						layer.msg('客户删除成功！', {
							icon : 1
						});
					}, function(index) {//点击取消后的操作

						layer.close(index);
					});
				}
			};

			//下面是定位layUI弹窗的代码
			$('#dataTable .layui-btn').on('click', function() {
				var othis = $(this), method = othis.data('method');
				active[method] ? active[method].call(this, othis) : '';
			});

		});*/
		
	</script>
</body>
</html>