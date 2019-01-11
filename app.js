(function() {
  var module;

  module = angular.module('FontAwesomeFinder', []);

  module.controller('IndexController', [
    '$scope', function($scope) {
      var matchesByKeyword, matchesByName;
      $scope.icons = window.icons;
      $scope.searchByName = true;
      $scope.searchByKeywords = true;
      $scope.q = '';
      $scope.visibleCount = 0;
      $scope.search = function() {
        var k, v, _ref, _results;
        $scope.visibleCount = 0;
        _ref = $scope.icons;
        _results = [];
        for (k in _ref) {
          v = _ref[k];
          if ($scope.q.length === 0) {
            $scope.icons[k].hidden = false;
            _results.push($scope.visibleCount++);
          } else {
            if (($scope.searchByName && matchesByName(v)) || ($scope.searchByKeywords && matchesByKeyword(v))) {
              $scope.icons[k].hidden = false;
              _results.push($scope.visibleCount++);
            } else {
              _results.push($scope.icons[k].hidden = true);
            }
          }
        }
        return _results;
      };
      matchesByName = function(icon) {
        if (icon.name.indexOf($scope.q.toLowerCase()) > -1) {
          return true;
        }
        return false;
      };
      matchesByKeyword = function(icon) {
        var k, keyword, _ref;
        if ((icon.keywords != null) && icon.keywords.length > 0) {
          _ref = icon.keywords;
          for (k in _ref) {
            keyword = _ref[k];
            if (keyword.toLowerCase().indexOf($scope.q.toLowerCase()) > -1) {
              return true;
            }
          }
        }
        return false;
      };
      $scope.isVisible = function(icon) {
        if ((icon.hidden != null) && icon.hidden) {
          return false;
        }
        return true;
      };
      return $scope.search();
    }
  ]);

}).call(this);
