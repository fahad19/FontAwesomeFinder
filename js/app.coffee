##
# Angular: module
#
module = angular.module 'FontAwesomeFinder', []

##
# Controller
#
module.controller 'IndexController', [
  '$scope',
  ($scope) ->

    $scope.icons = window.icons

    $scope.searchByName = true

    $scope.searchByKeywords = true

    $scope.q = ''

    $scope.visibleCount = 0

    $scope.search = () ->
      $scope.visibleCount = 0
      for k, v of $scope.icons
        if $scope.q.length is 0
          $scope.icons[k].hidden = false
          $scope.visibleCount++
        else
          if ($scope.searchByName and matchesByName(v)) or ($scope.searchByKeywords and matchesByKeyword(v))
            $scope.icons[k].hidden = false
            $scope.visibleCount++
          else
            $scope.icons[k].hidden = true

    matchesByName = (icon) ->
      if icon.name.indexOf($scope.q.toLowerCase()) > -1
        return true

      false

    matchesByKeyword = (icon) ->
      if icon.keywords? and icon.keywords.length > 0
        for k, keyword of icon.keywords
          if keyword.toLowerCase().indexOf($scope.q.toLowerCase()) > -1
            return true

      false

    $scope.isVisible = (icon) ->
      if icon.hidden? and icon.hidden
        return false

      true

    $scope.search()

]
