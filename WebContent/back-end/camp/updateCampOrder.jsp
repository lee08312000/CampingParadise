<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.campOrder.model.*"%>

<%
CampOrderVO campOrderVO = (CampOrderVO) request.getAttribute("campOrderVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<div style="padding: 10px; width: 95%;" id="workArea">
		<div style="clear: both;"></div>
		<table id="datatable" width="100%">
			<thead>
				<tr height="40" id="even">
					<th class="confirmTh" colspan="2">�ק�q��</th>
				</tr>
			</thead>
			<tbody>
				<tr class="confirmTr">
					
					<td id="confirmTd" colspan="1" style="text-align: left; padding:10px;">
						<font color="red">*</font>��a�q��y����:<br>
						<input type="hidden" id="campOrderId" value="${campOrderVO.campOrderId}">
						${campOrderVO.campOrderId}
					</td>
				</tr>
				<tr class="confirmTr">
					<td id="confirmTd" colspan="1" style="text-align: left; padding:10px;">
					<font color="red">*</font>�I�ڤH�m�W<br>
						<input name="payerName" type="text" value="${campOrderVO.payerName}" >
					</td>
				</tr>
				<tr class="confirmTr">
					<td id="confirmTd" colspan="1" style="text-align: left; padding:10px;">
						<font color="red">*</font>�I�ڤH�q��:<br> 
						<input id="detailName" type="text" value="${campOrderVO.payerPhone}" >
					</td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: center; margin-top: 10px;">
				&nbsp;
				<button id="submitaddDetail">�e�X</button>
				&nbsp;
				<button id="updateCommand" name="${campOrderVO.campOrderId}">����</button>
		</div>
	</div>
</body>
</html>