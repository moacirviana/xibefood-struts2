
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">     
	       <form class="form-signin" method="post" id="login-form">
		                <div align="center">
					<img id="img_logo" src="${pageContext.request.contextPath}/images/brasao-peq2.png">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					</div>
					
        <h4 align="center">Area Restrita</h4>
		<br>
       <div style="margin-bottom: 25px" class="form-group">
		     <input type="text" class="form-control" placeholder="Titulo" name="login" id="login" />
        </div>
		
		<div id="error">      
        </div>
		 
                                       
        <div style="margin-bottom: 25px" class="form-group">
        <input type="password" class="form-control" placeholder="Senha" name="senha" id="senha" />
        </div>
       
     	<hr />
        
        <div class="form-group">
            <button type="submit" class="btn btn-default" name="btn-login" id="btn-login">
    		<span class="glyphicon glyphicon-log-in"></span> &nbsp; Entrar
			</button> 
        </div>  
      
      </form>

    </div>   

   
	
	<jsp:include page = "footer.inc.jsp" />

 
</body>
</html>