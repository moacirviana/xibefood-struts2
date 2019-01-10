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
			      <input name="produto.qtd" type="text" value="${produto.titulo}" class="form-control form-control-sm" id="obs" placeholder="qtd">
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail">Imagem</label>
			          <img data-src="holder.js/200x200" class="img-thumbnail" alt="200x200" style="width: 200px; height: 200px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22200%22%20height%3D%22200%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20200%20200%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16838e237e8%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16838e237e8%22%3E%3Crect%20width%3D%22200%22%20height%3D%22200%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2274%22%20y%3D%22104.5%22%3E200x200%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
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
	    	bootbox.confirm("Confirma essa venda?", function(result){ 		  
	           if (result){
	        	   $("#frmProduto" ).submit();
	    	   } 	
	    	});
	    });
 });
</script>	


<jsp:include page = "/footer.inc.jsp" />