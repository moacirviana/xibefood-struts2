<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   
	
   <div class="panel panel-default">
   <div class="panel-heading">Mensagem do sistema</div>
   <div class="panel-body">
       <p class="note">Veja as informações abaixo detalhadas pelo sistema.</p>
		 
           <!-- MENSAGENS DE ERRO DO SISTEMA  -->
				<s:if test="hasActionErrors()">
					<div class="alert alert-danger" role="alert" id="error">
						<i class="glyphicon glyphicon-remove-sign"></i>
						<s:iterator value="actionErrors">
							<s:property escapeHtml="false" />
							<br>
						</s:iterator>
					</div>
				</s:if>
			<!-- FIM MENSAGENS -->
			
			<!-- MENSAGENS  DO SISTEMA  -->
				<s:if test="hasActionMessages()">
					<div class="alert alert-success" role="alert" id="success_message">
						<i class="glyphicon glyphicon-ok"></i>
						<s:iterator value="actionMessages">
							<s:property escapeHtml="false" />
							<br>
						</s:iterator>
					</div>
				</s:if>
			<!-- FIM MENSAGENS -->
	
	  </div>
   </div>
	
    		
    </div>  
  </div> 

<jsp:include page = "/javascripts.jsp" />

<jsp:include page = "/mainfooter.inc.jsp" />










	
	
		

 
