$(document).ready(function() {
	function CarregaCliente(){
	    var select = $('#cliente');	      
	    select.find('option').remove();	      
			      $.getJSON('../clientes/listarSemComandaJson',function(jsonResponse) {			    	  
			    	  $('<option>').val(-1).text("Informe o Cliente").appendTo(select);			    	  
			              $.each(jsonResponse, function(key, value) {
			                 $('<option>').val(value.id).text(value.nome).appendTo(select);
	       			 });
		     });
	  }

	function CarregaProduto(id){
	  var select = $('#produto'+id);	      
	      select.find('option').remove();	      
			      $.getJSON('../produtos/listarJson',function(jsonResponse) {			    	  
			    	  $('<option>').val(-1).text("Informe o cardápio").appendTo(select);			    	  
			              $.each(jsonResponse, function(key, value) {
			                $('<option>').val(value.id).text(("0000" + value.id).slice(-4)  + " - " + value.descricao).appendTo(select);
	       			      });
		          });
	  }	
	
	var line = 0;
 
	 $("#add-row").click(function(){
		 line++;
         var markup ='<tr>'+
				      '<td>'+ 
				        '<select class="form-control form-control-sm" onChange="getValor('+line+',this.value)" name="itens['+line+'].id.produto.id" id="produto'+line+'">'+
				                '<option value="1">1</option>'+
			            '</select>'+
			          '</td>'+					      
			          '<td><input name="itens['+line+'].valorunt" id="vlrund'+line+'" size="3" type="text" value="" class="form-control form-control-sm"></td>'+
				      '<td><input name="itens['+line+'].quantidade" size="5" id="qtd'+line+'" type="text" value="1" class="form-control form-control-sm"></td>'+
				      '<td><input name="itens['+line+'].valor" size="5" id="vlr'+line+'" type="text" value="" class="form-control form-control-sm"></td>'+
				      '<td><button class="btn btn-sm btn-danger" onclick="removeRow(this)" type="button"><i class="fa fa-trash-o" aria-hidden="true"></i></button></td>'+
				    '</tr>';
          $("table tbody").append(markup);
          CarregaProduto(line);
     });
	 
	 $( "#btnVenda" ).click(function() {
	    	bootbox.confirm("Confirma essa venda?", function(result){ 		  
	           if (result){
	        	   $("#frmVenda" ).submit();
	    	   } 	
	    	});
	 });

    CarregaCliente();
    CarregaProduto(0);   		
 });
 
 function getValor(idObj,id){
	var s = document.getElementById("produto"+idObj);
	var valor = s.value;
	 $.getJSON( "../produtos/getBeanJson?id="+id, function( data  ) {
 	   }).done (function(data){
 		     totais(data,idObj);
 	   });
 }

 function totais(data,idObj){
	var qtd = document.getElementById("qtd"+idObj).value;
	var subtotal = (data.valor * qtd);
	var total = (document.getElementById("tot").value.replace(',','.') * 100)/100;

	document.getElementById("vlr"+idObj).value = subtotal.toFixed(2).replace('.',',');
	document.getElementById("vlrund"+idObj).value = data.valor.toFixed(2).replace('.',',');
	
	total = (((total + (subtotal))* 100)/100).toFixed(2);
	document.getElementById("tot").value = total.replace('.',',');
  }

  removeRow = function(handler) {
	    var tr = $(handler).closest('tr');
	    tr.fadeOut(400, function(){ 
	      tr.remove(); 
	    }); 
	    return false;
	  };