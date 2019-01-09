<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />

<div class="container">
  <div class="container-fluid">   

	<p><a target="_blank" href="${pageContext.request.contextPath}/comandas/getBeanJson?id=11">Vendas getBean</a></p>
	
	<p><a target="_blank" href="${pageContext.request.contextPath}/produtos/getBeanJson?id=5">Produtos getBean</a></p>
	
	<p><a target="_blank" href="${pageContext.request.contextPath}/produtos/listarJson">Produtos listar</a></p>
		
	<p><a target="_blank" href="${pageContext.request.contextPath}/clientes/listarSemComandaJson">Clientes/Mesas sem comandas</a></p>
		
	<p><a target="_blank" href="${pageContext.request.contextPath}/comandas/listarSituacaoJson">Clientes/Mesas Situacao</a></p>
	
	<p><a target="_blank" href="${pageContext.request.contextPath}/comandas/getProdutosMaisVendidosJson">Produtos Mais Vendidos</a></p>
	
	
	
	
   </div>  
</div>
     		
<jsp:include page = "/javascripts.jsp" />
<script type="text/javascript" language="javascript" class="init">
 //
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />