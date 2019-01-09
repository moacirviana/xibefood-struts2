<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page = "/mainhead.inc.jsp" />

 <div class="container-fluid">
    
   <div class="card-columns"> 
      <div id="result2"> </div>
      
      <div id="result"> </div>
      
   </div>        
 
  
 </div>  
   
     		
<jsp:include page = "/javascripts.jsp" />
<script>
	$(document).ready(function() {
		// COMANDAS EM ANDAMENTO
		$.getJSON( "listarSituacaoJson", function(jsonResponse) {
	 	   }).done (function(jsonResponse){
	 		  var linha = "";
	 		  var status = "";
	 		  $.each(jsonResponse, function(key, value) {
	             if(value.status==0){
	                	status='primary';
	                }else{
	                	status='success';
	              }
	             
	             var total = (value.total).toFixed(2).replace('.',',');
	                linha = '<div id="card'+value.id+'" class="card text-center alert-'+status+'">\n'+
					            '<div class="card-body">\n'+
					                 '<h4 class="card-title">'+value.cliente+'</h4>\n'+
					                 '<p class="card-text">Atendente '+ value.usuario+' Total R$ ' + total + '</p>\n';
					                 
		                if(value.status==0){
		                	linha += '<a id="'+value.id+'" onclick="solicitaConta(this)" href="#" class="btn btn-warning">Solicitar conta</a>\n';
		                }else{
		                	linha += '<a href="frmSetupFechar?id='+value.id+'" class="btn btn-primary">Pagar</a>\n';
		                }
					                 
		                linha += '</div></div>\n';
	                $("#result2").append(linha);
	                linha = "";
 			   });
	 		 
	 		// MESAS LIVRES
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
	 	    });	
 	    });
	});
	
 // METODO PARA SOLICITACAO DE FECHAMENTO DE CONTA	
 solicitaConta = function(handler) {
		  var id = $(handler).attr('id'); 
      bootbox.confirm("Confirma solicitação de fechamento de conta ?", function(result){ 		  
	           if (result){
	    	    	var url = "mudarStatus?id=1&venda.id=" + id;
			    	$.getJSON( url, function( data ) {
			    		if (data.id==1){
			    			$.notify({
			    				title: '<strong>Mensagem </strong>',
			    				message: data.mensagem
				    			},{
				    				type: 'success'
				    			});
			    			// MUDAR O BOTÃO PARA EFETUAR O PAGAMENTO
			    			$("#"+id).attr("href", "frmSetupFechar?id="+id);
			    			$("#"+id).attr('class', 'btn btn-primary');
			    			$("#"+id).text("Pagar");
			    			// MUDA A COR DO CARD
			    			$("#card"+id).attr('class', 'card text-center alert-success');
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
			    				message: "Ocorreu um erro ao realizar esse procedimento!"
			    			},{
			    				type: 'danger'
			    			});
			    	  });
	    	   } 	
	    	});
		   
   return false;
  };
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />