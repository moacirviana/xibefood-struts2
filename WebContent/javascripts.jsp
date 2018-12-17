    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!--  <script src="${pageContext.request.contextPath}/js/fontawesome.min.js"></script>  -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootbox.min.js"></script>
    
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/select2.min.js"></script>
        

    <script>
    var uriapp = '${pageContext.request.contextPath}'
   //PROCEDIMENTO PARA LOGOUT
     $( "[id*='logout']" ).click(function(event) {
     	BootstrapDialog.confirm({
                 title: 'Atenção',
                 message: "Deseja realizar o logout?",
                 type: BootstrapDialog.TYPE_DANGER, 
                 closable: true, 
                 btnCancelLabel: 'Cancelar', 
                 btnOKLabel: 'Ok', 
                 btnOKClass: 'btn-danger', 
                 callback: function(result) {
                     if(result) {
                          $.ajax({type: "POST", 
                                   url: uriapp + '/Login/logout',
                               success: function(data) {
                         	              $(location).attr('href', uriapp); 
                              }    
                           }); // END AJAX
                     }
                 }
             });

       });
</script>