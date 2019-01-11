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

    # get the icons data
    $scope.icons = window.icons

    # set search scope
    $scope.searchByName = true
    $scope.searchByKeywords = true
    $scope.searchByInheritance = true

    # initialize scope variables
    $scope.q = ''
    $scope.visibleCount = 0

    # search by user text input
    $scope.search = () ->
      $scope.visibleCount = 0
      for k, v of $scope.icons
        if $scope.q.length is 0
          $scope.icons[k].hidden = false
          $scope.visibleCount++
        else
          if ($scope.searchByName and matchesByName(v)) or ($scope.searchByKeywords and matchesByKeyword(v)) or ($scope.searchByInheritance and matchesByInheritance(v))
            $scope.icons[k].hidden = false
            $scope.visibleCount++
          else
            $scope.icons[k].hidden = true

    # search by actual name
    matchesByName = (icon) ->
      if icon.name.indexOf($scope.q.toLowerCase()) > -1
        return true

      false

    # search by assigned keywords
    matchesByKeyword = (icon) ->
      if icon.keywords? and icon.keywords.length > 0
        for k, keyword of icon.keywords
          if keyword.toLowerCase().indexOf($scope.q.toLowerCase()) > -1
            return true

      false

    # search by inherited keywords
    matchesByInheritance = (icon) ->
      if icon.inherit? and icon.inherit.length > 0
        for i, inherit of icon.inherit
          if ($scope.icons[inherit] != undefined && matchesByKeyword($scope.icons[inherit]))
            return true

      false

    $scope.isVisible = (icon) ->
      if icon.hidden? and icon.hidden
        return false

      true

    $scope.search()

]


# Main JavaScript
# equalHeights = ->
#   var $ = jQuery;
#   a = $('.equal-heights')
#   a.removeClass('equalized')
#   windowWidth = $(window).width()
#   if windowWidth > 768 then a.length > 0 and a.each((->
#     `var a`
#     a = $(this).find('.equal')
#     b = 0
#     a.height('auto')
#     a.each((->
#       `var a`
#       a = $(this).innerHeight()
#       b < a and (b = a)
#       return
#     ))
#     a.css('height', b + 'px')
#     $(this).addClass('equalized')
#     return
#   )) else a.find('.equal').css('height', 'auto')
#   return

# $(window).on 'load', ->
#   $(window).trigger 'resize'
#   return

# $(window).on 'resize', ->
#   equalHeights()
#   return
