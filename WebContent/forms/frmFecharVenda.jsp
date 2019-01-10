<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
   <div class="card">
	<div class="card-body">
	   <h5 class="card-title">Fechamento</h5>
	    
	 <form action="" method="post" name="form1" id="frmComanda">
	    <input type="hidden" name="id" value="${id}">
	          <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputNome">
			            Data : <s:date name="venda.datacad" format="dd/MM/yyyy HH:mm:ss"/>
			                 <!-- pode ser usado também as seguintes tags
			                   <s:text name="format.date"><s:param value="venda.datacad"/></s:text>
			                   <s:text name="format.time"><s:param value="venda.datacad"/></s:text>  -->
			             
			      </label>
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputCPF">Cliente ${venda.cliente.nome}</label>
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail">Total 
			            <strong>
			                <s:text name="format.money"><s:param value="venda.total"/></s:text>
			            </strong>    
			      </label>
			            
			    </div>
			    <div class="form-group col-md-6">
			      
			    </div>
			  </div>
			  				  
			   <div class="form-row">
			    <table class="table table-sm table-hover">
					  <thead>
					    <tr>
					      <th scope="col">Produto</th>
					      <th scope="col" class="text-right">qtd</th>
					      <th scope="col" class="text-right">VlUnit</th>
					      <th scope="col" class="text-right">SubTotal R$</th>
					    </tr>
					  </thead>
					  <tbody>
						  <s:iterator value="venda.itens" var="item">
							    <tr>
							      <td>${produto.descricao}</td>
							      <td class="text-right">${quantidade}</td>
							      <td class="text-right">${valorunt}</td>
							      <td class="text-right">${subTotal}</td>					      
							    </tr>
		    			   </s:iterator>	
					  </tbody>
					</table>
			    
			  </div>
			  				  
			  <button id="btnFecharVenda" type="button" class="btn btn-sm btn-success">Pagar</button>
			   
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
</div>	

  
<jsp:include page = "/javascripts.jsp" />
<script type="text/javascript">

$(document).ready(function() {
    $("#btnFecharVenda").click(function() {
    	bootbox.confirm("Confirma o fechamento ?", function(result){ 		  
           if (result){
    	    	var dados = $('#frmComanda').serialize();
		    	$.getJSON( "fechar?"+dados, function( data ) {
		    		if (data.id==1){
		    			$.notify({
		    				title: '<strong>Mensagem </strong>',
		    				message: data.mensagem
		    			},{
		    				type: 'success'
		    			});
		    			$("#btnFecharVenda").addClass('disabled');
		    			$("#btnFecharVenda").prop("disabled",true);
		    			$("#btnFecharVenda").prop('value', 'Comanda fechada');
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
		    				message: "Ocorreu um erro ao fechar comanda!"
		    			},{
		    				type: 'danger'
		    			});
		    	  });
    	   } 	
    	});
    });
});
</script>	


<jsp:include page = "/footer.inc.jsp" />