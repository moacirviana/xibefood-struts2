<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page = "/mainhead.inc.jsp" />



  <div class="container-fluid">   

	<table id="table2" class="table" width="100%">
	<thead>
	<tr> 
	    <th width="5%">Id</th>
	    <th width="8%">Status</th>
		<th width="8%">Data</th>		
		<th width="8%">Cliente</th>
		<th width="10%">Total</th>
		<th width="10%">Itens</th>
		<th width="10%"></th>
	</tr>
	</thead>
	<tbody>
	<s:iterator value="lstVenda">
		<tr id="tr${id}">
			<td>${id}</td>
			<td>
			  <s:if test="status==0">
			       <span class="badge badge-danger">Aberto</span>
			  </s:if>
			   <s:if test="status==1">
			       <span class="badge badge-primary">Solicitação</span>
			   </s:if>
			   <s:if test="status==2">
			       <span class="badge badge-success">Fechado</span> 
			   </s:if>
			</td>
			<td><fmt:formatDate type="both" value="${datacad}" timeStyle="short"/></td>
			<td>${cliente.nome}</td>
			<td align="right"><s:property value="%{getText('format.money',{total})}"/></td>
			<td>
					<table class="table table-bordered">
				         <tbody>
					        <s:iterator value="itens">
						        <tr>
						          <td>${quantidade}</td>
						          <td>${id.produto.descricao}</td>
						          <td><s:property value="%{getText('format.money',{valor})}"/></td>
						        </tr>
					        </s:iterator>
				        <tbody>
				      </table>
			</td>	
			<td>
				<a title="excluir venda" href="#" id="excluir${id}" class="btn btn-sm btn-danger" role="button" 
						    data-record-id="${id}">
						          <i class="fa fa-trash-o" aria-hidden="true"></i>
				</a>
			</td>
		</tr>	
	</s:iterator>
	 </tbody>	
	</table>
	
  </div>  
   
     		
<jsp:include page = "/javascripts.jsp" />
<script>
	$(document).ready(function() {
	  /*  $('#table2').dataTable( {
	        "order": [[ 1, "asc" ]],
	        "language": {
	            "url": "../js/Portuguese-Brasil.json"
	        }
	    }); */

	    $( "[id*='excluir']" ).click(function(event) {
			var data = $(event.delegateTarget).data();
			var id = data.recordId;
			
			bootbox.confirm("Confirma essa venda? ", function(result){ 		  
		           if (result){
		    	    	
				    	$.getJSON( "remover?venda.id="+id, function( data ) {
				    		//console.log(data);
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