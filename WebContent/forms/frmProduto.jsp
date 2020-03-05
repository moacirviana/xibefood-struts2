<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   
  
	 <form action="<s:if test='produto.id != null'>alterar</s:if><s:else>incluir</s:else>" method="post" name="frmProduto" id="frmProduto" enctype="multipart/form-data">
        <s:if test='produto.id != null'><input type="hidden" name="produto.id" value="${produto.id}"></s:if>
	          <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputNome">Produto</label>
			      <input name="produto.descricao" type="text" value="${produto.descricao}" class="form-control form-control-sm" id="obs" placeholder="nome produto">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputCPF">Titulo</label>
			      <input name="produto.titulo" type="text" value="${produto.titulo}" class="form-control form-control-sm" id="obs" placeholder="titulo">
			    </div>
			  </div>
			  
			  
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail">Imagem</label>
			   
			          <s:if test="produto.picture!=null">
			             <img src="showImagem?id=${produto.id}" class="img-thumbnail" style="width: 250px; height: 200px;" data-holder-rendered="true">
			          </s:if>
			          <s:else>
			               <img src="../images/silhueta-comida.png" class="img-thumbnail" style="width: 250px; height: 200px;" data-holder-rendered="true">
			          </s:else>
			    </div>
			    <div class="form-group col-md-6">
			          <label for="inputEmail">Valor</label>
			         <input name="produto.valor" type="text" value="<s:if test='produto.id != null'><s:text name="format.number"><s:param value="produto.valor"/></s:text></s:if>" class="form-control form-control-sm" id="undmed" placeholder="R$">
			      
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputFileUpload">Imagem</label>
			      <s:file name="upload" label="Informe imagem do produto" size="40" theme="simple"/>
			    </div>
			    <div class="form-group col-md-6">
			      
			      
			    </div>
			  </div>
			  
			  
			  				  
			   <button id="btnEnviar" type="button" class="btn btn-sm btn-success">Salvar</button>
			   
       </form>
       
       <br>
		<s:if test="hasActionErrors()">
		   <div class="alert alert-danger" role="alert" id="success_message"> <i class="glyphicon glyphicon-thumbs-down"></i>
				<s:actionerror/>
			</div>	
		</s:if>
		
		<s:if test="hasActionMessages()">
			<!-- Success message -->
	       <div class="alert alert-success" role="alert" id="success_message">
	   		     <s:actionmessage/>
		    </div>
		</s:if>

   </div>  
</div>

  
<jsp:include page = "/javascripts.jsp" />
<script type="text/javascript">
$(document).ready(function() {
	    $( "#btnEnviar" ).click(function() {
	    	bootbox.confirm("Confirma esses dados?", function(result){ 		  
	           if (result){
	        	   $("#frmProduto" ).submit();
	    	   } 	
	    	});
	    });
 });
</script>	


<jsp:include page = "/footer.inc.jsp" />