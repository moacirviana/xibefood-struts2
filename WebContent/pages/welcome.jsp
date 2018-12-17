<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Projeto Harpia</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/one-page-wonder.css" rel="stylesheet">
    <link href="css/welcome.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">TRE-AM</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                   <li>
                        <a href="index.jsp">App</a>
                    </li>
                    <li>
                        <a href="checkpoint/index.jsp">CheckPoint</a>
                    </li>
                    <li>
                        <a href="#about">About</a>
                    </li>
                    <li>
                        <a href="#services">Services</a>
                    </li>
                    <li>
                        <a href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Full Width Image Header -->
    <header class="header-image">
        <div class="headline">
            <div class="container">
                <h1>Projeto Harpia</h1>
                <h3>Administrador de pessoas, tecnologias e processos empregados em elei��es oficiais</h3>
            </div>
        </div>
    </header>

    <!-- Page Content -->
    <div class="container">

        <hr class="featurette-divider">

        <!-- First Featurette -->
        <div class="featurette" id="about">
            <img class="featurette-image img-circle img-responsive pull-right" src="images/bem-vindo-small.jpg" style="width:545px;height:485px;">
            <h2 class="featurette-heading">Seja bem vindo ao nosso site!
                <span class="text-muted"></span>
            </h2>
            <p class="lead">Nesta p�gina voc� encontrar� informa��es a respeito do projeto Harpia.
			Este projeto foi criando em 2004, com objeto de propor uma ferramenta capaz de adaptar-se as necessidades de controle e gerencia dos contratos 
			de recursos humanos tempor�rios e estabeler um mecanismo de comunica��o entre os setores respons�veis pela sele��o e contrata��o.</p>
        </div>

        <hr class="featurette-divider">

        <!-- Second Featurette -->
        <div class="featurette" id="services">
            <img class="featurette-image img-circle img-responsive pull-left" src="images/o-projeto.jpg" style="width:500px;height:485px;"> 
            <h2 class="featurette-heading">Sobre o projeto
                <span class="text-muted"></span>
            </h2>
            <p class="lead">A Justi�a Eleitoral realiza contrato com empresas e convoca cidad�os a fim de agregar recursos humanos ao seu quadro de pessoal, posto que, possui quadro t�cnico insuficiente para atender 
            a todas as demandas operacionais existentes em um ano eleitoral. As principais atividades nas quais o TRE-AM tem a necessidade de pessoal referem-se ao processo de totaliza��o da 
            elei��o, destacando-se o apoio operacional aos sistemas eleitorais utilizados, apoio � utiliza��o da urna eletr�nica, apoio � recep��o dos votos e apoio ao processo de transmiss�o de dados necess�rios 
            � divulga��o final dos resultados da elei��o.</p>
        </div>

        <hr class="featurette-divider">

        <!-- Third Featurette -->
        <div class="featurette" id="contact">
            <img class="featurette-image img-circle img-responsive pull-right" src="images/network-fig.jpg" style="width:510px;height:487px;">
            <h2 class="featurette-heading">Transmiss�o de dados
                <span class="text-muted"></span>
            </h2>
            <p class="lead">A transmiss�o de dados via sat�lite, em regi�es isoladas, como muitas no Estado do Amazonas, tem se tornado ao longo das elei��es, fator decisivo para a 
            celeridade na divulga��o dos resultados. Trata-se de um avan�o que atende a expectativa dos eleitores
             da regi�o e do pa�s, que � conhecer os resultados de sua escolha por meio da urna eletr�nica de forma r�pida. 
			Basicamente, um t�cnico � enviado para uma regi�o de dif�cil acesso, onde ser� o respons�vel pelo equipamento de trabalho, um telefone via-sat�lite e um computador port�til, 
			e pela transmiss�o dos disquetes de resultado daquela localidade, com o objetivo da r�pida totaliza��o e 
			divulga��o dos votos. Sua participa��o � de extrema import�ncia, pois sem seu trabalho, o TRE teria que aguardar os disquetes das regi�es 
			mais distantes durante dias, at� sua chegada na capital do Estado.</p>
        </div>

        <hr class="featurette-divider">
        
        
            <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Check Point - protocolo de estado</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
                    <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                    <form action="checkpoint/incluir" name="sentMessage" id="contactForm">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label for="name">Titulo</label>                                                                
                                <s:textfield name="check.tituloEleitor" placeholder="Informe seu titulo" class="form-control"  type="text" theme="simple"/>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>   	           															
									<div class="funkyradio">									    
									        <span class="funkyradio-primary">									        
									            <s:textfield type="radio" name="check.idTipoCheck" id="radio1" value="1"/>
									            <label for="radio1">Cheguei no Cart�rio</label>									    
									    	 </span>									   
									   							    
										     <span class="funkyradio-warning">
										         <s:textfield type="radio" name="check.idTipoCheck" id="radio2" value="2"/>
									     	<label for="radio2">Cheguei no Ponto</label>
										     </span>
										     					    
										     <span class="funkyradio-danger">
										         <s:textfield type="radio" name="check.idTipoCheck" id="radio3" value="3"/>										          
									     	<label for="radio3">Oficializei</label>
										     </span>
										     					    
										     <span class="funkyradio-success">
										         <s:textfield type="radio" name="check.idTipoCheck" id="radio4" value="4"/>
									     	<label for="radio4">Encerramento</label>
										     </span>									        							  																                
                            	  </div>             
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-success btn-lg">Enviar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
