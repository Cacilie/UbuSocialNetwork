<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" title="no title" charset="utf-8">
   <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
   <link rel="shortcut icon" href="Images/logo.png">
   <link rel="stylesheet" href="css/code_view.css">
   <link rel="stylesheet" href="sweetalert/sweetalert.css">
   <link rel="stylesheet" href="awesomplete/awesomplete.css" media="screen" title="no title">
  <script src="js/jquery.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/angular/angular.min.js"></script>
   <script src="js/angular/angular-ui-router.min.js"></script>
   <script src="js/angular/modules/code_view.js"></script>
  
  
   <script src="sweetalert/sweetalert.min.js" ></script>
   <script src="ace/src-noconflict/ace.js" charset="utf-8"></script>
   <script src="awesomplete/awesomplete.min.js" charset="utf-8"></script> 
</head>

<body ng-app="codeapp" ng-controller="firstController">
   <header>
    <nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-1" aria-expanded="true">
            <span class="sr-only">Navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/feed"> <span><img src="Images/logo.png" align="center" width="50" height="25"/></span></script></a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-1">
             <form class="navbar-form navbar-left" role="search">
               <div class="form-group" >
                 <input type="text" class="form-control" id="ingenieur" placeholder="Buscar" >
               </div>
               <button ng-click="irPerfil()" class="btn btn-info"><span class="glyphicon glyphicon-search"></span></button>
             </form>
          
          <ul class="nav navbar-nav navbar-right">
            <li><a href="feed"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="/my_profile"><span class="glyphicon glyphicon-user"></span> Perfil</a></li>
                <!--<li><a href="my_profile#/user_config"><span class="glyphicon glyphicon-wrench"></span> Opciones</a></li>-->
                <li role="separator" class="divider"></li>
                <li><a href="/"><span class=" glyphicon glyphicon-off"></span> Log Out</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
  </header>
  <textarea id="recibeCodigo">{{data.codigo}}</textarea>
  <div class="main container-fluid col-md-8 col-xs-12 col-sm-12">

    <div class="media">
      <div class="media-body">
        <h4 class="media-heading" ng-repeat="data in codigodata">{{data.titulo}}</h4>
      <p ng-repeat="data in codigodata">{{data.sintaxis}} <span class="glyphicon glyphicon-tags"></span></p>
      <div class="row">
        <!--
      <pre id="code-layer">

      </pre>
    -->
    <div id="editor"></div>
      </div>
      <!-- <button type="submit" class="btn btn-large btn-primary" name="like">Like</button> -->

      <div class="media" id="media-com">
        <div class="media-left">
          <a ng-repeat="info in personalInfo" ng-href="/publicprofile={{info.email}}" >
            <img ng-src="{{info.profile_picture}}" class="img-rounded post-picture" alt="">
          </a>
        </div>
        <div class="media-body">
          <a ng-repeat="info in personalInfo" ng-href="/publicprofile={{info.email}}">
          <h4 class="media-heading" >{{info.name}}</h4>
           </a>
          <div class="col-md-8">
            <div class="row">
            <div class="input-group" ng-repeat="info in personalInfo" >
              <input type="text" class="form-control" placeholder="Comenta algo, {{info.name}}" ng-model="comentarioData.comentario">
              <span class="input-group-btn">
              <button class="btn btn-default" ng-click="sendComentario()">Comentar</button>
              </span>
            </div>
          </div>
        </div>
        </div>
      </div>
      <div class="media" id="media-com" ng-repeat="c in comentarios">
        <div class="media-left">
          <a ng-href="/publicprofile={{c.email}}">
            <img ng-src="{{c.profile_picture}}" class="img-rounded post-picture" alt="">
          </a>
        </div>
        <div class="media-body">
          <a ng-href="/publicprofile={{c.email}}">
          <h4 class="media-heading" >{{c.name}}</h4>
          </a>
          <p>
        {{c.comentario}}
        </p>
        </div>
      </div>
    </div>
  </div>
  </div>

<aside class="col-md-4">
  <h3>Códigos Relacionados</h3>
  <div class="media" id="related-code" ng-repeat="rel in relacionados">

    <div class="media-body">
      <h4 class="relacionados" ng-click="viewCode(rel.id)">
          <span class="label label-info">{{rel.titulo}} en {{rel.sintaxis}}</span>  
    </h4>
    </div>
  </div>
</aside>



<!-- <script src="js/code_layer.js" charset="utf-8"></script> -->
</body>


<style media="screen">
#editor{
     height: 50em;
     top: 0;
     right: 0;
     bottom: 0;
     left: 0;
 }
</style>
</html>
