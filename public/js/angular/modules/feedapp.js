var feedapp = angular.module('feedapp',[]);

feedapp.controller('MainController',['$scope','$http',function($scope,$http){
  $scope.search = {email:''}
  $scope.searchSb = function(){
    window.location = "publicprofile="+$scope.search.email
  }
$scope.usuario = {email:''}
 $scope.busqueda = {titulo:''}
$scope.irPerfil = function(){
   $scope.busqueda.titulo = $("#ingenieur").val();
   console.log($scope.busqueda);
  var index = $scope.awlist.indexOf($scope.busqueda.titulo)
  //console.log(index);
  $scope.usuario.email = $scope.awlist[index + 1]
  window.location = "publicprofile="+$scope.usuario.email
 }

var input = document.getElementById("ingenieur");
var awesomplete = new Awesomplete(input)
$http.post('getAllUsers',{})
.success(function(data){
  awesomplete.list = data;
  $scope.awlist = data
  //console.log(data);
});

  $http.post('group/myGroups',{})
  .success(function(data){
    console.log(data);
    $scope.misgrupos = data;
  })
  .error(function(err){
    console.log("error");
  })
  $scope.intervalo = function(){
    setInterval(function () {
      $http.post('feed/getPost',{})
      .success(function(data){
        // console.log(data);
        $scope.news = data
      })
      .error(function(data){
        console.log("error");
      })
    }, 800);
  }

$scope.intervalo();
  $http.post('feed/info',{})
  .success(function(data){
    $scope.myinfo = data
  })
  .error(function(err){
    console.log("err");
  })

  $http.post('feed/codes',{})
  .success(function(data){
    $scope.codigos = data;
  })
  .error(function(err){
    console.log("err");
  })

  $scope.addLike = {pid : ''};
  $scope.sendlike = function(id){
    $scope.addLike.pid = id;
    $http.post('publicprofile/like',$scope.addLike)
    .success(function(data){
      // console.log(data);
    })
    .error(function(err){
      console.log(500)
    })

    console.log($scope.addLike);
  }

  $scope.posttosend = {post:''}
  $scope.send = function(){
    // console.log($scope.posttosend);
    $http.post('sendapost',$scope.posttosend)
    .success(function(data){
      console.log("ok");
      // console.log(data);
      $scope.posttosend.post = ''
    })
    .error(function(err){
      console.log(500);
    })
  };

  $scope.viewCode = function(id){
    window.location = "/codigo_id="+encodeURI(id)
  }

  $scope.cod = {titulo:'',sintaxis:'',codigo: ''}
  $scope.pubCod = function(){
    $http.post('feed/postCode',$scope.cod)
    .success(function(data){
      swal("Publicado Correctamente")
    })
    .error(function(err){
      swal("Error")
    })
  }

  $scope.grupo = {nombre:'',asunto:''}
  $scope.crearGrupo = function(){
    $http.post('group/create',$scope.grupo)
    .success(function(data){
      swal("Creado correctamente")
    })
    .error(function(err){
      swal("Error")
    })
  }
}])
