<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   

	<table id="table2" class="table" cellspacing="0" width="100%">
	<thead>
	<tr> 
	    <th width="5%">Id</th>
		<th width="8%">Descricao</th>		
		<th width="8%">Und</th>
		<th width="10%">Qtd</th>
		<th width="10%">Valor</th>
		<th width="10%"></th>
		<th width="10%"></th>
	</tr>
	</thead>
	<tbody>
	<s:iterator value="lstProduto">
		<tr id="tr${id}">
			<td>${id}</td>
			<td>${descricao}</td>
			<td>${undmed}</td>
			<td>${qtd}</td>
			<td>${valor}</td>
			<td>
			<!-- 
			    <s:if test="qtd<10">
			       <span class="badge badge-danger">Insuficiente</span>
			    </s:if>
			    <s:else>
			       <span class="badge badge-success">Estoque bom</span> 
			    </s:else> -->
			</td>	
			<td>
				<a href="#" id="excluir${id}" class="btn btn-sm btn-danger" role="button" 
						    data-record-id="${id}" data-record-descricao="${descricao}">
						          <i class="fa fa-remove" aria-hidden="true"></i>
				</a>
					
				<a href="frmSetupEdit?id=${id}" class="btn btn-sm btn-info" role="button" title="Editar">
							 <i class="fa fa-pencil" aria-hidden="true"></i>
				</a>		 
			</td>
		</tr>	
	</s:iterator>
	 </tbody>	
	</table>
	
     </div>  
    </div>
     		
<jsp:include page = "/javascripts.jsp" />
<script type="text/javascript" language="javascript" class="init">
	$(document).ready(function() {
	    $('#table2').dataTable( {
	        "order": [[ 1, "asc" ]],
	        "language": {
	            "url": "../js/Portuguese-Brasil.json"
	        }
	    });

	    $( "[id*='excluir']" ).click(function(event) {
			var data = $(event.delegateTarget).data();
			var id = data.recordId;
			var nome = data.recordNome;
			
			bootbox.confirm("Confirma essa exclusão do cliente " + nome, function(result){ 		  
		           if (result){
		    	    	
				    	$.getJSON( "remover?cliente.id="+id, function( data ) {
				    		console.log(data);
				    		if (data.id==1){
				    			$.notify({
				    				title: '<strong>Exclusão</strong>',
				    				message: data.mensagem
				    			},{	type: 'success'	});
				    			var vTr = $('#tr'+id);
	                			$('#tr'+id).fadeOut();
				    		}else
				    			{
					    			$.notify({
					    				title: '<strong>Ocorreu um erro</strong>',
					    				message: data.mensagem
					    			},{type: 'danger'});
				    			}	    		
				    	 });
		    	      } 	
		    	  });
	        });
			
			
	    
	    
	});
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />