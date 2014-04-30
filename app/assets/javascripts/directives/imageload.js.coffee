angular.module('portfolioApp').directive 'imageonload', ->
  restrict: "A"
  link: (scope, element, attrs) ->
    element.bind "load", ->
      $("#fox").headspin frames: 37
      return
    return
