<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />

	
	
 <main role="main" class="container">
	
     <!-- MENSAGENS DE ERRO DO SISTEMA  -->
				<s:if test="hasActionErrors()">
				
				<div class="card bg-danger text-center">
				  <div class="card-header">Ocorreu um erro no Sistema </div>
					  <div class="card-body">
						    <h5 class="card-title">Veja as informações abaixo detalhadas</h5>
						    <p class="card-text">
						       <i class="glyphicon glyphicon-remove-sign"></i>
						       <s:iterator value="actionErrors">
								<s:property escapeHtml="false" />
									<br>
								</s:iterator>
						    </p>
					  </div>
				  </div>
				</s:if>
			<!-- FIM error MENSAGENS -->
			
		<h1>Struts2 file upload exemplo</h1>
		
		<s:form action="upload" namespace="/" method="POST" enctype="multipart/form-data">
		
		    <s:file name="fileUpload" label="Informe um arquivo para upload" size="40" />
		
		    <s:submit value="Enviar arquivo" name="btnEnviar" />
			
		</s:form>
     <br/>		
     <p>Tipos de arquivos: image/png,image/gif,image/jpeg,image/pjpeg</p>
     
     
     
  </main>
	
	

<jsp:include page = "/javascripts.jsp" />

<jsp:include page = "/mainfooter.inc.jsp" />