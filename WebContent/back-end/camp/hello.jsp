
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  
   1.method �ӨM�w�L�OPOST�٬OGET
   2.ACTION �ӹ���web.xml ���|�ϥΨ쨺��servlet
   3.name=���W�٥i�H�ۤv��
   4.<p>${hello}</p>����	req.setAttribute("hello");
 -->
<form method="post" ACTION="<%=request.getContextPath()%>/camp/hello.do">
	<input type="text" name="n123insert" value="�s�W"/>
	<input type="hidden" name="test" value="insert"/>
	<p>${n123}</p>
    <button type="submit" value="�e�X">�s�W</button>
</form>

<form method="post" ACTION="<%=request.getContextPath()%>/camp/hello.do">
	<input type="text" name="n123update" value="�ק�"/>
	<input type="hidden" name="test" value="update"/>
	<p>${n123}</p>
    <button type="submit" value="�e�X">�ק�</button>
</form>
<form method="post" ACTION="<%=request.getContextPath()%>/camp/hello.do">
	<input type="text" name="n123delete" value="�R��"/>
	<input type="hidden" name="test" value="delete"/>
	<p>${n123}</p>
    <button type="submit" value="�e�X">�R��</button>
</form>
<form method="post" ACTION="<%=request.getContextPath()%>/camp/hello.do">
	<input type="text" name="n123query" value="�d��"/>
	<input type="hidden" name="test" value="query"/>
	<p>${n123}</p>
    <button type="submit" value="�e�X">�d��</button>
</form>

</body>
</html>