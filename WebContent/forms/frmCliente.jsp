<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   
	 <form action="${flag}" method="post" name="form1" id="frmCliente">
	   <s:if test="flag=='alterar'"><input type="hidden" name="cliente.id" value="${cliente.id}"></s:if>
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
			     	 <s:select label="Tipo" class="form-control" theme="simple"
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
<script type="text/javascript">
$(document).ready(function() {
	    $( "#btnEditar" ).click(function() {
	    	bootbox.confirm("Confirma ?", function(result){ 		  
	           if (result){
	    	    	var dados = $('#frmCliente').serialize();
	    	    	var url = "${flag}?"+dados;
	    	    	console.log(url);
	    	    	// flag variavel do struts
			    	$.getJSON( url, function( data ) {
			    		if (data.id==1){
			    			$.notify({
			    				title: '<strong>Mensagem </strong>',
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
			    				message: "Ocorreu um erro ao realizar esse procedimento!"
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