<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="mnuComanda">active</s:set>
<jsp:include page = "/mainhead.inc.jsp" />

<div class="container">
   <div class="card">
	<div class="card-body">
	   <h5 class="card-title">Nova Comanda</h5>
	    
	 <form action="inserir" method="post" name="form1" id="frmVenda">
	    
	          <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputNome">Cliente</label>
			          
			         <select class="form-control form-control-sm" id="cliente" name="venda.cliente.id">
					      <option value="4">Moacir Viana</option>
				    </select>
			      
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputCPF">Obs</label>
			      <input name="venda.obs" type="text" value="nenhuma" class="form-control form-control-sm" id="obs" placeholder="observações">
			    </div>
			  </div>
			  
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail">Total</label>
			     <input name="venda.total" type="text" value="" class="form-control form-control-sm" id="tot" placeholder="R$">
			    </div>
			    <div class="form-group col-md-6">
			      
			    </div>
			  </div>
			  				  
			   <div class="form-row">
			    <div class="table-responsive">
			    <table class="table table-sm">
					  <thead>
					    <tr>
					      <th scope="col">Prod</th>
					      <th scope="col">VlUnd</th>
					      <th scope="col">Qtd</th>
					      <th scope="col">R$</th>
					      <th scope="col"></th>
					    </tr>
					    
					  </thead>
					  <tbody>
					    <tr id="rowid0">
					      <td> 
					        <select class="form-control form-control-sm" name="itens[0].id.produto.id" id="produto0" onChange="getValor(0,this.value)">
					          <option value="1" selected>1</option>
				          </select>
				          </td>					      
				          <td><input name="itens[0].valorunt" id="vlrund0" type="text" value="" size="7" class="form-control form-control-sm"></td>
					      <td><input name="itens[0].quantidade" id="qtd0" type="text" size="5" value="1" class="form-control form-control-sm"></td>
					      <td><input name="itens[0].valor" id="vlr0" type="text" size="5" value="" class="form-control form-control-sm"></td>
					      <td></td>
					    </tr>
	    				
					  </tbody>
					</table>
			     </div>  
			    
			  </div>
			  				  
			   <button id="add-row" type="button" class="btn btn-sm btn-info">Add Item</button> <button id="btnVenda" type="button" class="btn btn-sm btn-success">Salvar</button>
			   
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
<script type="text/javascript" charset="UTF-8">
  <%@include file="/WEB-INF/js/vendas.min.js" %>  
</script>	


<jsp:include page = "/footer.inc.jsp" />