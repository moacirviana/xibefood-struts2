<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   
	 <form action="" method="post" name="form1" id="frmCliente">
	    <input type="hidden" name="cliente.id" value="${cliente.id}">
	          <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputNome">Nome</label>
			      <input type="text" name="cliente.nome" value="${cliente.nome}" class="form-control" id="nome" placeholder="Informe nome">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputCPF">CPF</label>
			      <input name="cliente.cpf" type="text" value="${cliente.cpf}" class="form-control" id="cpf" placeholder="cpf">
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail">Email</label>
			      <input type="email" name="cliente.email" value="${cliente.email}" class="form-control" id="email" placeholder="Email">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputEmail">Tipo</label>
			     	 <s:select label="Tipo" class="form-control"
						        name="cliente.ativo"
						        headerKey="-1" headerValue="--Selecione--"
						        list="#{'0':'Desativado', '1':'Ativo'}"
						        required="true"	 />
			    </div>
			  </div>
			  			  			  
			   <button id="btnEditar" type="button" class="btn btn-success">Salvar</button>
       </form>
	
   </div>  
</div>
     		

  
<jsp:include page = "/javascripts.jsp" />
<script type="text/javascript" language="javascript" class="init">
$(document).ready(function() {
	    $( "#btnEditar" ).click(function() {
	    	bootbox.confirm("Confirma essa edição", function(result){ 		  
	           if (result){
	    	    	var dados = $('#frmCliente').serialize();
			    	$.getJSON( "alterar?"+dados, function( data ) {
			    		if (data.id==1){
			    			$.notify({
			    				title: '<strong>Edição </strong>',
			    				message: data.mensagem
			    			},{
			    				type: 'success'
			    			});
			    		}else
			    			{
				    			$.notify({
				    				title: '<strong>Ocorreu um erro</strong>',
				    				message: data.mensagem
				    			},{
				    				type: 'danger'
				    			});
			    			}	    		
			    	 }).fail(function() {
			    		 $.notify({
			    				title: '<strong>Ocorreu um erro</strong>',
			    				message: "Ocorreu um erro ao tentar editar esse registro"
			    			},{
			    				type: 'danger'
			    			});
			    	  });
	    	   } 	
	    	});
	    });
	});
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />