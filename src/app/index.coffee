angular.module("landing", ['ngResource', 'ngRoute', 'ngCookies', 'pascalprecht.translate'])

angular.module "landing"

  .value 'instructionSrc', 'app/instruction/'


  .config ($locationProvider) ->
    $locationProvider.html5Mode(true)


  .config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "app/clients/clients.html"
        controller: "ClientsCtrl"
      .when "/privacy-policy/",
        templateUrl: "app/policy/policy.html"
        controller: "PolicyCtrl"
      .otherwise
        redirectTo: "/"


  # send GA on route change
  .run ($location, $rootScope, $window) ->
    $rootScope.$on '$viewContentLoaded', ->
      $window._gaq.push ['_trackPageview', $location.path()]

    $rootScope.scrollTo = (selector) ->
      setTimeout ->
        $('html, body').animate {
          scrollTop: $(selector).offset().top
        }, 1000
      , 0

    false


  .run ->
    $ ->
      # send scrolling data to GA
      $.scrollDepth()

