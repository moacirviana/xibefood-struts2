<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page = "/mainhead.inc.jsp" />


<div class="container-full">
  <div class="container-fluid">   

<div class="panel panel-danger">
 <div class="panel-heading">Ops!! Ocorreu um erro ao tentar realizar o procedimento</div>
 <div class="panel-body">
 
 
  <div class="alert alert-danger" role="alert">
      <p>Mensagem do sistema:</p>
    <br>
    <s:actionerror /> 
   </div>  


    </div>  
  </div> 

</div>  
  </div>
  
<jsp:include page = "/javascripts.jsp" />

<jsp:include page = "/mainfooter.inc.jsp" />