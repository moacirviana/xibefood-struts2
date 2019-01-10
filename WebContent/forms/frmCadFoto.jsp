<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<body>
    <h1> Struts 2 File Upload Example </h1>
	<s:form method="post" enctype="multipart/form-data" action="multiUploadFile">
		<s:file label="File One" name="upload" />
		
		<s:submit />
	</s:form>
</body>
</html> 

