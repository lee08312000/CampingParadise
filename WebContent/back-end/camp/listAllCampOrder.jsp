<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.campOrder.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/colorbox.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="../js/jquery.colorbox.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//��s�W���O��Page
	$("#testBtn").click(function() {
		//var campOrderId = $("input#campOrderId").val();
		var campOrderId = 12;
		param = {
			data : {
				"action":"GETONECAMP",
				"campOrderId" : campOrderId
			},
			title : "�s�W���O��",
			href : '<c:url value="/camp/campOrder.do" />',
			innerHeight : 350,
			innerWidth : 650,
			opacity : 0.5,
			top : 100
		};
		$.colorbox(param);
	});
});
</script>

<title>order</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet" href="..\css\campOrder.css">
</head>
<body>

	<header class="header-outer">
		<div class="header-inner responsive-wrapper">
			<div class="header-logo">
				<a style="display: inline-block; vertical-align: middle;"
					href="����URL"> <img src="..\images\camp_paradise_logo.png" />
				</a> <span style="display: inline-block; vertical-align: middle;">Camping
					Paradise</span>
			</div>
			<nav class="header-navigation">
				<a href="#">Home</a> <a href="#">�u�W�ӫ�</a> <a href="#"><img
					src="..\images\heart.png"></a> <a href="#">���U</a> <a href="#">�n�J</a>
				<a href="#"> <i class="fas fa-user"></i></a>
				<button>Menu</button>
			</nav>
		</div>
	</header>

<div id="bodyCenter">
	<!-- --------main�ϰ�------- -->
	<h2>��a�q��d��</h2>

	<div class="divSearchForm">
		<form class="searchForm" action="/action_page.php"
			style="margin: auto; max-width: 300px">
			<select class="selector">
				<option>����</option>
				<option>�̤���Ƨ�</option>
				<option>�w�B�z</option>
				<option>�B�z��</option>
				<option>�w����</option>
			</select> <input type="text" placeholder="�п�J����r" name="search2">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
			<div style="clear: both;"></div>
		</form>
		
    <input type="button" value="open the box" id="testBtn"/>
    
	</div>
	<table>
		<thead>
			<tr>
				<th>���</th>
				<th>�q��y����</th>
				<th>�I�ڤH</th>
				<th>�s���q��</th>
				<th>�q���`���B</th>
				<th>�q�檬�A</th>
				<th>����</th>
				<th>�s��</th>


			</tr>
		</thead>


		<tbody>

			<tr>
				<!-- <td>�ĤG�C</td> -->
				<td>10/04</td>
				<td>02</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$2000</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>

			</tr>

			<tr>
				<!-- <td>�ĤT�C</td> -->
				<td>10/10</td>
				<td>03</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$2000</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<tr>
				<!-- <td>�ĥ|�C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>

			</tr>

			<tr>
				<!-- <td>�Ĥ��C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<tr>
				<!-- <td>�Ĥ��C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<tr>
				<!-- <td>�ĤC�C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<tr>
				<!-- <td>�ĤK�C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<tr>
				<!-- <td>�ĤE�C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<tr>
				<!-- <td>�ĤQ�C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			<tr>
				<!-- <td>�ĤQ�@�C</td> -->
				<td>10/20</td>
				<td>04</td>
				<td>����Q</td>
				<td>0988565372</td>
				<td>$200</td>
				<td>�w�B�z</td>
				<td>5��</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/camp/camp.Select">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="camp" value="${campVO.camp}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
		</tbody>
	</table>
	<div class="pagination">

		<a href="#">&laquo;</a> <a href="#">1</a> <a href="#" class="active">2</a>
		<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
		<a href="#">&raquo;</a>
	</div>
</div>
	<!-- ----------------aside�ϰ�------------------->
<div id="sidebar">
	<aside class="aside">
		<div class="container">
			<nav>
				<ul class="mcd-menu">
					<li><a href="" class="light"> <i class="fa fa-campground"></i>
							<strong>��a�޲z</strong> <small>Camp Management</small>
					</a>
						<ul>
							<li><a href="#"><i class="fas fa-cannabis"></i>�ڪ���a</a></li>
							<li><a href="#"><i class="fas fa-cannabis"></i>��a�W�U�[</a></li>
							<li><a href="#"><i class="fas fa-cannabis"></i>�f�֪��p</a></li>
						</ul></li>
					<li><a href="" class="light"> <i class="fa fa-edit"></i> <strong>�ӫ~�޲z</strong>
							<small>Commodity </small>
					</a></li>
					<li><a href="" class="light"> <i class="fa fa-gift"></i> <strong>�q��޲z</strong>
							<small>Order </small>
					</a>
						<ul>
							<li><a href="#"><i class="fas fa-cannabis"></i>��{��޲z</a></li>
							<li><a href="#"><i class="fas fa-cannabis"></i>��a�q��޲z</a></li>
							<li><a href="#"><i class="fas fa-cannabis"></i>�ӫ��q��޲z</a></li>
						</ul></li>
					<li><a href="" class="light"> <i
							class="fas fa-calendar-week"></i> <strong>�t�Ӹ��</strong> <small>Vendor
								Information</small>
					</a>
						<ul>
							<li><a href="#"><i class="fas fa-cannabis"></i>�򥻸���s��,�ק�</a></li>
							<li><a href="#"><i class="fas fa-cannabis"></i>���K�X</a></li>
						</ul></li>
					<li><a href="" class="light"> <i class="fa fa-comment-alt"></i>
							<strong>�ڪ�����</strong> <small>Comment</small>
					</a>
						<ul>
							<li><a href="#"><i class="fas fa-cannabis"></i>��a����</a></li>
							<li><a href="#"><i class="fas fa-cannabis"></i>�ӫ~����</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</aside>
</div>



	<footer class="tm-footer text-center">
		<pre>�A�ȱM�u�G(02)2252-7966�@�@ �ȪA�ɶ��G�g�@�ܶg��9:00~18:00�@�@ �ȪA�H�c�Gcamp@easycamp.com.tw</pre>
		<pre>Copyright &copy; 2021 Camping Paradise | Design: <a
				style="text-decoration: none;" rel="nofollow" href="#">TFA104�Ĥ���</a>
				</pre>
	</footer>
</body>
</html>