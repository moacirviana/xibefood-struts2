<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="mnuConsulta">active</s:set>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   

	<table id="tbProd" class="table table-hover table-bordered" cellspacing="0" width="100%">
	<thead>
	<tr> 
	    <th width="5%"><a href="frmSetupNovo" class="btn btn-secondary btn-sm" role="button" aria-pressed="true">Novo</a>
		<th width="38%">Descricao</th>		
		<th width="8%">Und</th>
		<th width="10%">Qtd</th>
		<th width="10%">Valor</th>
		<th width="5%"></th>
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
			<td class="text-right">
			       <s:text name="format.money"><s:param value="valor"/></s:text>
			<td class="text-center">
			   <!-- SE TEM IMAGEM MOSTRA O ÍCONE PARA VISUALIZAÇÃO -->
			   <s:if test="picture!=null">
			      <a href="#" data-target="#modalIMG" data-toggle="modal" data-imagemid="${id}" class="color-gray-darker c6 td-hover-none">
			         <i class="fa fa-file-image-o" aria-hidden="true"></i>
			      </a>   
			   </s:if>
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
					
				<a href="frmSetupEditar?id=${id}" class="btn btn-sm btn-info" role="button" title="Editar">
							 <i class="fa fa-pencil" aria-hidden="true"></i>
				</a>		 
			</td>
		</tr>	
	</s:iterator>
	 </tbody>	
	</table>
	
     </div>  
    </div>

<!-- MODAL PARA VISUALIZAÇÃO DAS IMAGENS -->
<div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="modalIMG" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body mb-0 p-0">
				    <img id="imgdobanco" src="" alt="" style="width:100%">
			</div>
			<div class="modal-footer">
				<div><a class="btn btn-outline-primary btn-rounded" id="donwimg" href="" target="_blank">Download</a></div>
				<button class="btn btn-outline-primary btn-rounded btn-md ml-4 text-center" data-dismiss="modal" type="button">Close</button>
			</div>
		</div>
	</div>
</div>
     		
<jsp:include page = "/javascripts.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
	    $('#tbProd').dataTable( {
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
			
    $('#modalIMG').on('show.bs.modal', function (event) {
	  	  var href = $(event.relatedTarget)
	  	  var id = href.data('imagemid') 
	  	  $('#imgdobanco').attr('src',"showImagem?id="+id);
	  	  $('#donwimg').attr('href',"downloadImagem?id="+id);
  	});
    
});
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />