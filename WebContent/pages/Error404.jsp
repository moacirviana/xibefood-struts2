<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>${pageContext.request.contextPath}</title>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS --> 
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!-- Page Content -->
    <div class="container">
   <br/>
	  <div class="jumbotron">
		  <h2><img src="${pageContext.request.contextPath}/images/messagebox_warning.png" />Ops! Página ou recurso não encontrado!</h2>
		  <p>Infelizmente o caminho informado não foi encontrado no sistema. Verifique se a requisição solicitada está correta. </p>
	  </div>

    </div>
    <!-- /.container -->
</body>

</html>
