'use strict';

/* Controllers */

var tirageControllers = angular.module('tirageControllers', []);

tirageControllers.controller('homeCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$log', 'ClientSave', 'fAlert', 
    function($scope, $rootScope, $routeParams, $location, $log, ClientSave, fAlert) {

        var numLigne = 2;

        var MIN_NB_LIGNE = 2;
        var MAX_NB_LIGNE = 15;

        $rootScope.isValide = false;

        $rootScope.client = '';

        $scope.ajouterLigne = function() {
            $rootScope.candidats.push({
            	numClient: numLigne++,
                nom: "",
                prenom: ""
            });
        };

        $scope.init = function() {

            $rootScope.candidats = [{
                numClient: "0",
                nom: "",
                prenom: ""
            }, {
                numClient: "1",
                nom: "",
                prenom: ""
            }];
        };

        $scope.enableSupprimerLigne = function() {
            return $rootScope.candidats.length > MIN_NB_LIGNE;
        };
        $scope.enableAjouterLigne = function() {
            return $rootScope.candidats.length < MAX_NB_LIGNE;
        };

        $scope.supprimerLigne = function(p_candidat) {
            $rootScope.candidats = _.reject($rootScope.candidats, function(c) {
                return c.numClient == p_candidat.numClient;
            });
        };

        $scope.create = function() {
            var userList = {
                    company : $scope.company,
                    notificationEnabled : true,
                    userListRequest: $rootScope.candidats
                  };
            $log.info(JSON.stringify($rootScope.candidats[0]));
            ClientSave.save(angular.toJson($rootScope.candidats), function success(data) {
                    fAlert.success("enregistrer avec succes !", {
                        timeout: 3000
                    });
                    //backup for next page
                    $log.info(data);
                    $location.path('/result/');
                },
                function error(e) {
                    $log.info(e);
                    fAlert.error("une erreur s'est produite : contactez l'administrateur.\n details :" + e.statusText, {
                        timeout: 3000
                    });
                });
        };

        $scope.valider = function() {
            $rootScope.isValide = true;
        };



    }
]);

tirageControllers.controller('tirageCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$log', 'fAlert', 'Tirage',
    function($scope, $rootScope, $routeParams, $location, $log, fAlert, Tirage) {

        $rootScope.candidat = {};
        // Retrieve routeParams
        $scope.email = $routeParams.email;
        $scope.company = $routeParams.company;

        $scope.tirer = function() {
            var email = $scope.email === undefined ? $rootScope.candidat.email : $scope.email;
            var company = $scope.company === undefined ? $rootScope.candidat.company : $scope.company;

            var user = {
                email: email,
                secureCode: $rootScope.candidat.secureCode,
                company: company
            };
            var routePath = '/result/' + company + '/' + email;
            Tirage.save(user, function success(data) {
                    $location.path(routePath);
                },
                function error(e) {
                    $log.info("erreur lors du tirage : " + e);
                    fAlert.error("une erreur s'est produite : " + e.statusText, {
                        timeout: 3000
                    });
                });
        };
    }
]);

tirageControllers.controller('resultCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$log', 'fAlert', 'Client','ClientSave',
    function($scope, $rootScope, $routeParams, $location, $log, fAlert, Client, ClientSave) {

        $scope.resultats = [];
        $scope.init = function() {
            $log.info('Client - charger les client');
            Client.all({
            }, function success(data) {
                $scope.resultats = data ;
                $log.info($scope.resultats);
            }, function error(e) {
                fAlert.error("une erreur s'est produite : " + e.statusText, {
                    timeout: 3000
                });
            });
        };
        
        
        $scope.supprClient =  function(client){
        	 $log.info('Client - remove client');
        	 $log.info(JSON.stringify(client));
        	 
        	 ClientSave.remove({
               	 num_client : client.numClient
                }, function success(data) {
               	    $scope.resultats = _.reject( $scope.resultats, function(c) {
                        return c.numClient == client.numClient;
                    });
               	    fAlert.success("enregistrer avec succes !", {
                        timeout: 3000
                    });
                    //backup for next page
                    $log.info(data);
                    $location.path('/result/');
                    $log.info($scope.resultats);
                }, function error(e) {
                    fAlert.error("une erreur s'est produite : " + e.statusText, {
                        timeout: 3000
                    });
                });
             
        }
        
    }
]);

tirageControllers.controller('tirage-dashboardCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$log', 'fAlert','Resultats',
    function($scope, $rootScope, $routeParams, $location, $log, fAlert, Resultats) {

        $scope.company = $routeParams.company;
        $scope.candidats = [];
        $scope.buildLink = function(candidats) {
          $log.info('length ' +   candidats);
            for (var i = 0; i < candidats.length; i++) {
                candidats[i].link = '#/tirage/' + $scope.company + '/' + candidats[i].email;
                //candidats[i].numero = '';
            }
        };

        $scope.init = function() {
            $log.info('resultCtrl - charger les results');
            Resultats.query({
                company: $scope.company
            }, function success(data) {

                $scope.candidats = data;
                $log.info('candidats ' +   $scope.candidats);
                $scope.buildLink($scope.candidats);
            }, function error(e) {
                fAlert.error("une erreur s'est produite : " + e.statusText, {
                    timeout: 3000
                });
            });
        };


    }
]);

tirageControllers.controller('consulterCtrl', ['$scope', '$rootScope', '$routeParams', '$location', '$log', 'fAlert', 'Resultats',
    function($scope, $rootScope, $routeParams, $location, $log, fAlert, Resultats) {
        $scope.resultats = [];
        $scope.consulter = function() {
          var routePath = '/tirage-dashboard/' + $scope.candidat.company;
          $location.path(routePath);
            $log.info('resultCtrl - charger les results');

        };

    }
]);
