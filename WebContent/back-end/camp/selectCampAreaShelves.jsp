<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.campArea.model.*"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>

<%
	List<CampAreaVO> list = new ArrayList<CampAreaVO>();
	if (request.getAttribute("list") != null) {
		list = (ArrayList<CampAreaVO>) request.getAttribute("list");
	}
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
  function deleteCheck() {
	  var msg = "�z�u���T�w�n�R���ܡH\n\n�нT�{�I";
	  if (confirm(msg)==true){
	  return true;
	  }else{
	  return false;
	  }
  }
</script>
<title>campAreaShelves</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/css/selectCampAreaShelves.css">
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
	
	<h1>���C�� ${errorMsgs}</h1>
	<form method="post" ACTION="<%=request.getContextPath()%>/camp/shelves.do">
		<div class="selectors">		 
		     <input type="hidden" name="campstatus" value="3">
		     <input type="hidden" name="campIdsearch" value="">
			 <input type="hidden" name="action" value="SEARCHALL">
			<button type="submit">
				<i class="fas fa-home"></i>
			</button>
		</div>
	
	</form>
    <form method="post" ACTION="<%=request.getContextPath()%>/camp/campareashelves.do">
		<div class="selectors">		 
			 <input type="hidden" name="action" value="INSERTPAGE">
			  <input type="hidden" name="campId" value="${campId}">		 
			<button type="submit">�s�W</button>
		</div>
	
	</form>
	<form method="post" ACTION="<%=request.getContextPath()%>/camp/campareashelves.do" >
		<div class="selectors">				
		 <input type="hidden" name="action" value="SEARCHALL">
		 <input type="hidden" name="campId" value="${campId}">
		<button type="submit"><i class="fa fa-search"></i></button>
		
		</div>
					
	</form>	

	<div class="pagination">
		<%@ include file="pages/page1.jsp" %>
	</div>
	<table class="camp_table">
		<tbody>
			<tr>
				<th>���y����</th>
				<th>���W��</th>
				<th>������</th>
				<th>������</th>
				<th>�C�b�[��<br>�H�Y�W��</th>
				<th>�[�ʤH�Y����</th>
				<th>�b�ƤW��</th>
				<th>�w�s�b��</th>
				<th>������</th>
				<th colspan="2">�s��</th>

			</tr>
		</thead>


		<tbody>
			<c:forEach var="campareaVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

				<tr>
					<td>${campareaVO.campAreaId}</td>
					<td>${campareaVO.campAreaName}</td>
					<td>${campareaVO.weekdayPrice}</td>  
					<td>${campareaVO.holidayPrice}</td>
					<td>${campareaVO.capitationMax}</td>
					<td>${campareaVO.perCapitationFee}</td>
					<td>${campareaVO.campAreaMax}</td>
					<td></td>
					<td></td>
					<td>
						<form method="post" ACTION="<%=request.getContextPath()%>/camp/campareashelves.do">
						<input type="hidden" name="campAreaId"  value="${campareaVO.campAreaId}" class="update" />
						<input type="hidden" name="action"  value="UPDATEFINDBYKEY" class="update" />
						<input type="submit" value="�ק�"  />
						</form>
					</td>
					<td>
						<form method="post" ACTION="<%=request.getContextPath()%>/camp/campareashelves.do">
						<input type="hidden" name="campAreaId"  value="${campareaVO.campAreaId}" class="delete"/>
						<input type="hidden" name="action"  value="DELETE" class="delete" />
						<input type="hidden" name="camp_Id"  value="${campareaVO.campId}" class="delete"/>
						<input type="submit" onclick="deleteCheck()" value="�R��"  />
						</form>
					</td>
				</tr>
			</c:forEach>


		</tbody>

	</table>

	<div class="pagination">
		<%@ include file="pages/page2.jsp"%>
	</div>



	<!-- --------aside�ϰ�------- -->
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
















