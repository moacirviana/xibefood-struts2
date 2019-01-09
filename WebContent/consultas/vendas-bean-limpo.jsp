<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
 <form action="" method="post" name="form1" id="frmComanda">
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
		    			   <tr>
							      <td></td>
							      <td class="text-right"></td>
							      <td class="text-right"></td>
							      <td class="text-right">
							         <strong>
							              <s:text name="format.money"><s:param value="venda.total"/></s:text>
							         </strong>     
							       </td>
							         					      
							    </tr>	
					  </tbody>
					</table>
			    
			  </div>
    </form>