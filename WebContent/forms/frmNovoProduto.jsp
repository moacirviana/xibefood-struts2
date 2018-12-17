<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   
	 <form action="incluir" method="post" name="frmProduto" id="frmProduto" enctype="multipart/form-data">
	    
	          <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputNome">Produto</label>
			      <input name="produto.descricao" type="text" value="nenhuma" class="form-control form-control-sm" id="obs" placeholder="descricao">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputCPF">Obs</label>
			      <input name="produto.qtd" type="text" value="nenhuma" class="form-control form-control-sm" id="obs" placeholder="qtd">
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail">UndMedida</label>
			      <input name="produto.undmed" type="text" value="" class="form-control form-control-sm" id="undmed" placeholder="UN">
			    </div>
			    <div class="form-group col-md-6">
			          <label for="inputEmail">Valor</label>
			         <input name="produto.valor" type="text" value="" class="form-control form-control-sm" id="undmed" placeholder="R$">
			      
			    </div>
			  </div>
			  
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail">Imagem</label>
			      <s:file name="fileUpload" label="Select a File to upload" size="40" />
			    </div>
			    <div class="form-group col-md-6">
			      
			      
			    </div>
			  </div>
			  
			  
			  				  
			   <button id="btnEnviar" type="button" class="btn btn-sm btn-success">Salvar</button>
			   
       </form>
       <br>
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
<script type="text/javascript" language="javascript" class="init">

$(document).ready(function() {
	
	
	    $( "#btnEnviar" ).click(function() {
	    	bootbox.confirm("Confirma essa venda?", function(result){ 		  
	           if (result){
	        	   $("#frmProduto" ).submit();
	    	   } 	
	    	});
	    });

      
   
    		
 });
 

			                
			               
</script>	


<jsp:include page = "/footer.inc.jsp" />