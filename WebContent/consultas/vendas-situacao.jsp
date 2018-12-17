<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page = "/mainhead.inc.jsp" />

 <div class="container-fluid">   
   <div class="card-columns"> 
      <div id="result"> </div>
      <div id="result2"> </div>
   </div>        
 
  
 </div>  
   
     		
<jsp:include page = "/javascripts.jsp" />
<script>
	$(document).ready(function() {
		// COMANDAS EM ANDAMENTO 	
		$.getJSON( "../comandas/listarSituacaoJson", function(jsonResponse) {
	 	   }).done (function(jsonResponse){
	 		  var linha = "";
	 		   var status = "";
	 		  $.each(jsonResponse, function(key, value) {
	             if(value.status==0){
	                	status='primary';
	                }else{
	                	status='warning';
	              }
	             
	             var total = (value.total).toFixed(2).replace('.',',');
	             // console.log(totall);
	             
	                linha = '<div class="card bg-'+status+'">\n'+
					            '<div class="card-body text-center">\n'+
					                 '<h4 class="card-title">'+value.cliente+'</h4>\n'+
					                 '<p class="card-text">Atendente '+ value.usuario+' Total R$ ' + total + '</p>\n'+
					                 '<a href="#" class="btn btn-primary">Fechar</a>\n'+
					           '</div></div>\n';
	                $("#result2").append(linha);
	                linha = "";
 			   });
	 		 //$("#result").html(linha);
	 		 //console.log(linha);
	 		// SEM COMANDAS
	 		 $.getJSON( "../clientes/listarSemComandaJson", function(data) {
		     }).done (function(data){
			 		  var linha = "";
			 		  $.each(data, function(key, value) {
			      		  linha = '<div class="card bg-success">\n'+
						  	      '   <div class="card-body text-center">\n'+
						          '     <h4 class="card-title">'+value.nome+'</h4>\n'+
						          '<p class="card-text">Disponivel.</p>\n'+
						          '</div></div>\n';
			                 $("#result").append(linha);
			                 linha = "";
		 			   });
			 		//$("#result2").html(lin);
			 		// console.log(lin);
			   });			  
 	   });
	
	});
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />