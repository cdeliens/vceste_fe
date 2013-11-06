app = angular.module("VcesteApp", ["ngRoute", "ngResource"])

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when("/event/:id",
    templateUrl: "/partials/event.html"
    controller: "EventsShowCtrl"
  ).when("/",
    templateUrl: "partials/main_content.html"
    controller: "MainIndexCtrl"
  ).otherwise redirectTo: "/"
]

app.factory "Scream", ($q, $http) ->
  get: (hashtag)->
    deferred = $q.defer()
    url = "http://deliens-cvbe.herokuapp.com/screams/#{hashtag}.json?callback=JSON_CALLBACK"
    $http.jsonp(url).success((json) ->
      deferred.resolve(json)
    ).error (json) ->
    deferred.promise

app.factory "Event", ($q, $http) ->
  all: (hashtag)->
    deferred = $q.defer()
    url = "http://www.25este75sur.com/api/get_category_posts/?slug=evento&callback=JSON_CALLBACK"
    $http.jsonp(url).success((json) ->
      deferred.resolve(json)
    ).error (json) ->
    deferred.promise
  get: (id)->
    deferred = $q.defer()
    url = "http://www.25este75sur.com/api/get_post/?post_id=#{id}&callback=JSON_CALLBACK"
    $http.jsonp(url).success((json) ->
      deferred.resolve(json)
    ).error (json) ->
    deferred.promise

app.controller 'AppCtrl', ($scope) ->
  $scope.tag = "25este"

app.controller 'MainIndexCtrl', ($scope) ->
  $scope.tag = "25este"  

app.controller 'EventsFeedCtrl', ($scope, Event) ->
  $scope.events = Event.all()
  

app.controller 'EventsShowCtrl', ($scope, $routeParams, Event) ->
  $scope.event = Event.get($routeParams.id)

  
  
