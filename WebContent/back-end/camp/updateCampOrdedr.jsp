<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>order</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css\camCompany.css">
</head>
<body>
	<header class="header-outer">
		<div class="header-inner responsive-wrapper">
			<div class="header-logo">
				<a style="display: inline-block; vertical-align: middle;"
					href="����URL"> <img src="images\camp_paradise_logo.png" />
				</a> <span style="display: inline-block; vertical-align: middle;">Camping
					Paradise</span>
			</div>
			<nav class="header-navigation">
				<a href="#">Home</a> <a href="#">�u�W�ӫ�</a> <a href="#"><img
					src="images\heart.png"></a> <a href="#">���U</a> <a href="#">�n�J</a>
				<a href="#"> <i class="fas fa-user"></i></a>
				<button>Menu</button>
			</nav>
		</div>
	</header>


	<!-- --------main�ϰ�------- -->
	<div class="divSearchForm">
		<form class="searchForm" action="/action_page.php"
			style="margin: auto; max-width: 300px">
			<input type="text" placeholder="Search.." name="search2">
			<button type="submit">
			<i class="fa fa-search"></i>
			</button>
			<div style="clear: both;"></div>
		</form>
	</div>
	<table id="table-1">
		<FORM METHOD="post" ACTION="camp.do" name="form1">
			<table>
			<tr>
				<th>���</th>
				<th>�q��y����</th>
				<th>�I�ڤH</th>
				<td><input type="TEXT" name="payer_name"  
			 	value="" /></td><td></td>
			 
				<th>�s���q��</th>
				<td><input type="String" name="payer_phone" 
			 	value="" /></td><td></td>
				
				<th>�q���`���B</th>
				<td><input type="String" name="camp_order_total_amount" 
			 	value="" /></td><td></td>			
				<th>�q�檬�A <select>
						<optgroup label="�q�檬�A">
						</optgroup>
						<td><input type="String" name="camp_order_status" 
			 			value="" /></td><td></td>
				</select></th>
				
				<th>����</th>
				<th colspan="1">�s��</th>
				<td><input type="Text" name="camp_comment" 
			 	    value="" /></td><td></td>
	         	<th></th>	        
			</tr>
		</thead>
			<br>
				<input type="hidden" name="action" value="insert">
				<input type="submit" value="�e�X�s�W"></FORM>
				
					
			<!--aside-->
			<aside class="aside">
				<div class="container">
					<nav>
						<ul class="mcd-menu">
							<li><a href="" class="light"> <i
									class="fa fa-campground"></i> <strong>��a�޲z</strong> <small>Camp
										Management</small>
							</a>
								<ul>
									<li><a href="#"><i class="fas fa-cannabis"></i>�ڪ���a</a></li>
									<li><a href="#"><i class="fas fa-cannabis"></i>��a�W�U�[</a></li>
									<li><a href="#"><i class="fas fa-cannabis"></i>�f�֪��p</a></li>
								</ul></li>
							<li><a href="" class="light"> <i class="fa fa-edit"></i>
									<strong>�ӫ~�޲z</strong> <small>Commodity </small>
							</a></li>
							<li><a href="" class="light"> <i class="fa fa-gift"></i>
									<strong>�q��޲z</strong> <small>Order </small>
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
							<li><a href="" class="light"> <i
									class="fa fa-comment-alt"></i> <strong>�ڪ�����</strong> <small>Comment</small>
							</a>
								<ul>
									<li><a href="#"><i class="fas fa-cannabis"></i>��a����</a></li>
									<li><a href="#"><i class="fas fa-cannabis"></i>�ӫ~����</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</aside>

			<footer class="tm-footer text-center">
				<pre>�A�ȱM�u�G(02)2252-7966�@�@ �ȪA�ɶ��G�g�@�ܶg��9:00~18:00�@�@ �ȪA�H�c�Gcamp@easycamp.com.tw</pre>
				<pre>Copyright &copy; 2021 Camping Paradise | Design: <a
						style="text-decoration: none;" rel="nofollow" href="#">TFA104�Ĥ���</a>
				</pre>
			</footer>
</body>
</html>