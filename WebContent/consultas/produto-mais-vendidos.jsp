<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="mnuConsulta">active</s:set>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   

	<table id="table2" class="table table-hover">
	<thead>
	<tr> 
	    <th width="5%">Id</th>
		<th width="8%">Descricao</th>		
		<th width="10%">Qtd Vendidos</th>
		<th width="10%"></th>
	</tr>
	</thead>
	<tbody>
	<s:iterator value="lstProdutosMaisVendidos">
		<tr id="tr${id}">
		    <td>${id}</td>
			<td>${descricao}</td>
			<td>${totalVendidos}</td>
			<td>-</td>
		</tr>	
	</s:iterator>
	 </tbody>	
	</table>
	
	<br>
	<div class="row">
		<div class="col col-md-5">
			<h4>Gráfico:</h4>
				
			<s:iterator value="lstProdutosMaisVendidos">	
				${descricao}<span class="pull-right strong">${totalVendidos}</span>
				 <div class="progress">
					<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="${totalVendidos}"aria-valuemin="0" aria-valuemax="100" style="width:${totalVendidos}%">${totalVendidos}%</div>
				</div>
			</s:iterator>	
				
		</div>
	</div>
		
						
     </div>  
    </div>
     		
<jsp:include page = "/javascripts.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
	    $('#table2').dataTable( {
	        "order": [[ 1, "asc" ]],
	        "language": {
	            "url": "../js/Portuguese-Brasil.json"
	        }
	    });
	  	    
	});
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />