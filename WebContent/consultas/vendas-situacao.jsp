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
 
 <!-- Modal -->
<div class="modal fade" id="comandaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Comanda</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <div id="corpomodal"> </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
   
     		
<jsp:include page = "/javascripts.jsp" />
<script>
	$(document).ready(function() {
		// ------- LISTAGEM PARA COMANDAS EM ANDAMENTO ------------
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
					                 '<h4 class="card-title"><a href="#" data-toggle="modal" data-comandaid="'+value.id+'" data-target="#comandaModal">'+value.cliente+'</a></h4>\n'+
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
	 		 
	 		// ------- LISTAGEM PARA MESAS LIVRES   ------------
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
	
 // METODO PARA SOLICITACAO DE FECHAMENTO DE CONTA	--------------------------------------
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
// --- FIM METODO PARA SOLICITACAO DE FECHAMENTO DE CONTA ------------------------	 
 
 // ------- MODAL PARA CONSULTAR COMANDA ---------------------
  $('#comandaModal').on('show.bs.modal', function (event) {
	  var href = $(event.relatedTarget)
	  var id = href.data('comandaid') 
	  var vUrl = "getBeanLimpo?id="+id;
	  $.ajax({
		    url: vUrl,
		    dataType: 'html',
		    success: function(data) {
	           $('#corpomodal').html(data);
		    }
		});
	});
	
  
  /*
    var remoto_href = '';
    jQuery('body').on('click', '[data-toggle="modal"]', function() {
	  	    if(remoto_href != jQuery(this).data("remote")) { 
	        remoto_href = jQuery(this).data("remote");
	        jQuery(jQuery(this).data("target")).removeData('bs.modal');
	        jQuery(jQuery(this).data("target")).find('.modal-body').empty();
	        jQuery(jQuery(this).data("target") + ' .modal-body').load(jQuery(this).data("remote") + '/?modal=1');
	    }
	});
    */
</script>	


<jsp:include page = "/mainfooter.inc.jsp" />