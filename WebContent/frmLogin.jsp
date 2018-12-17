<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />

 <div class="container">
  
  
  <div class="row">
        <div class="col-sm-6">
 
	 <h4 class="pagetitle">Login - Usuário e senha</h4>
	 
	 <p class="note">Para acessar o sistema &eacute; necess&aacute;rio realizar o login. Por favor informe os dados abaixo.</p>
	 
	 <form class="form-signin" action="${pageContext.request.contextPath}/login/process" method="post" name="frmLogin">
	                <input type="text" name="username" class="form-control" placeholder="Usuário" required autofocus autocomplete="off">
	                <input type="password" name = "userpass" class="form-control" placeholder="chave de acesso" required autocomplete="off">
	                
	                <button class="btn btn-primary btn-block" type="submit">Entrar</button>                
       </form>
	 
	     <s:if test="hasActionErrors()">
		   <div class="alert alert-danger" role="alert" id="success_message">
				<s:actionerror/>
			</div>	
		</s:if>
	     
   
    </div>
  </div>
 </div>
<jsp:include page = "/javascripts.jsp" />

<jsp:include page = "/mainfooter.inc.jsp" />