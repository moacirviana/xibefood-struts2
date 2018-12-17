<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container">
  <div class="container-fluid">   
	
   <div class="panel panel-default">
   <div class="panel-heading">Importação de equipamento</div>
   <div class="panel-body">
       
       <table id="table1" class="table table-striped">
					<thead>
						<tr>
							<th width="10%">ID</th>
							<th width="20%">Série</th>
							<th width="20%">Tombamento</th>
							<th width="20%">NumFone</th>
							<th width="10%">Log da importação</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="lstEquipamento">
							<tr>
								<td></td>
								<td><s:property value="serie" /></td>
								<td><s:property value="tomb" /></td>
								<td><s:property value="fone" /></td>
								<td><s:property value="tipo_descricao" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				
		 
           <!-- MENSAGENS DE ERRO DO SISTEMA  -->
				<s:if test="hasActionErrors()">
					<div class="alert alert-danger" role="alert" id="error">
						<i class="glyphicon glyphicon-remove-sign"></i>
						<s:iterator value="actionErrors">
							<s:property escapeHtml="false" />
							<br>
						</s:iterator>
					</div>
				</s:if>
			<!-- FIM MENSAGENS -->
			
			<!-- MENSAGENS  DO SISTEMA  -->
				<s:if test="hasActionMessages()">
					<div class="alert alert-success" role="alert" id="success_message">
						<i class="glyphicon glyphicon-ok"></i>
						<s:iterator value="actionMessages">
							<s:property escapeHtml="false" />
							<br>
						</s:iterator>
					</div>
				</s:if>
			<!-- FIM MENSAGENS -->
	
	  </div>
   </div>
	
    		
    </div>  
  </div> 

<jsp:include page = "/javascripts.jsp" />

<jsp:include page = "/mainfooter.inc.jsp" />










	
	
		

 
