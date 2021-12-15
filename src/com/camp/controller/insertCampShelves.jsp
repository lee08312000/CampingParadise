<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.campArea.model.*"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>



<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>campshelves</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/css/insertCampShelves.css">
</head>
<body>
	<!-- --------head�ϰ�------- -->
	<header class="header-outer">
		<div class="header-inner responsive-wrapper">
			<div class="header-logo">
				<a style="display: inline-block; vertical-align: middle;"
					href="����URL"> <img
					src="<%=request.getContextPath()%>/back-end/images/camp_paradise_logo.png" />
				</a> <span style="display: inline-block; vertical-align: middle;">Camping
					Paradise</span>
			</div>
			<nav class="header-navigation">
				<a href="#">Home</a> <a href="#">�u�W�ӫ�</a> <a href="#"><img
					src="<%=request.getContextPath()%>/back-end/images/heart.png"></a>
				<a href="#">���U</a> <a href="#">�n�J</a> <a href="#"> <i
					class="fas fa-user"></i></a>
				<button>Menu</button>
			</nav>
		</div>
	</header>

		<!-- --------main�ϰ�------- -->
		
		<h1>��a�W�[ ${errorMsgs}</h1>
		<form method="post"
			ACTION="<%=request.getContextPath()%>/camp/shelves.do">
			<table class="camp_shelves">
				<tr>
						<td><label>��ܤW�[���date:</label></td>
						<td><input type="date" id="calendar" name="calendar"
							min="2021-11-01" max="2021-11-30"></td>
				</tr>
				<tr>
					<td><label>��a����:</label></td>

					<td><select class="selector" name="CampStatus">
							<option>�_��</option>
							<option>����</option>
							<option>�n��</option>
							<option>�Ὤ</option>
							<option>�x�F</option>
					</select></td>
				</tr>

				<tr>
					<td><label>��a�W��:</label></td>
						<td>
						<input type="text" id="campany_id" name="campany_id">
						<input type="text" id="camp_name" name="camp_name">
						</td>

				</tr>



				<tr>
					<td><label>��a�q��:</label></td>
					<td><input type="text" id="camp_phone" name="camp_phone"></td>
				</tr>

				<tr>
					<td><label>�g��:</label></td>
					<td><input type="text" id="longitude" name="longitude"></td>
				</tr>

				<tr>
					<td><label>�n��:</label></td>
					<td><input type="text" id="lattitude" name="lattitude"></td>
				</tr>


				<tr>
					<td><label>��a�a�}:</label></td>
					<td><input type="text" id="camp_address" name="campAddress"></td>
				</tr>


				<tr>
					<td><label> ��a�ԭz:</label></td>
					<td><textarea name="campDiscription" cols="80" rows="14"> </textarea></td>
				</tr>

				<tr>
					<td><label>��a���ɳW�h:</label></td>
					<td><textarea name="campRule" cols="80" rows="14"> </textarea></td>

				</tr>


				<tr>
					<td><label for="fname">��a����:</label></td>
					<td><textarea name="camp_pic1" cols="80" rows="14"> </textarea></td>

				</tr>

				<tr>
					<td><label for="fname">��a���A:</label></td>


					<td>
						<div>
							<input type="radio" name="camp_status" id="option1" value="1" checked>
							<label for="option1">�W�[</label> <input type="radio" name="camp_status"
								id="option2" value="2"> <label for="option2">�U�[</label>
						</div>
					</td>
				</tr>
				<tr>
					
					<td colspan="2"><input type="hidden" name="action" value="INSERT" />		
					<input type="submit" value="�T�{�s�W"
						style="margin-left: 250px;"> <input type="submit"
						value="����"></td>
				</tr>

			</table>
		</form>

		<div class="pagination">
			<a href="#">&laquo;</a> <a href="#">1</a> <a href="#" class="active">2</a>
			<a href="#">3</a><a href="#">&raquo;</a>
		</div>















		<!-- --------aside�ϰ�------- -->
		<div id="sidebar">
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
									<li><a href="#"><i class="fas fa-cannabis"></i>��{���޲z</a></li>
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
		</div>



		<footer class="tm-footer text-center">
			<pre>�A�ȱM�u�G(02)2252-7966�@�@ �ȪA�ɶ��G�g�@�ܶg��9:00~18:00�@�@ �ȪA�H�c�Gcamp@easycamp.com.tw</pre>
			<pre>Copyright &copy; 2021 Camping Paradise | Design: <a
					style="text-decoration: none;" rel="nofollow" href="#">TFA104�Ĥ���</a>
				</pre>
		</footer>
</body>
</html>
















