app = angular.module("VcesteApp", ["ngResource"])

app.factory "Scream", ($q, $http) ->
  get: (hashtag)->
    deferred = $q.defer()
    url = "http://deliens-cvbe.herokuapp.com/screams/#{hashtag}.json?callback=JSON_CALLBACK"
    $http.jsonp(url).success((json) ->
      deferred.resolve(json)
    ).error (json) ->
    deferred.promise