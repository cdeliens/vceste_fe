app = angular.module("VcesteApp", ["ngResource"])

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


app.controller 'AppCtrl', ($scope) ->
  $scope.tag = "25este"
  
app.controller 'EventsCtrl', ($scope, Event) ->
  $scope.events = Event.all()
  
  
