'use strict';

/* Services */

var tirageServices = angular.module('tirageServices', ['ngResource']);

// http://lagrangien.jelastic.servint.net/tiragebom/webapi/tirage/initparticipants

tirageServices.factory('Client', ['$resource', function($resource) {
	  return $resource('http://localhost:8080/jersey/rest/clients', {}, {
	    'all': {
	      method: 'GET', isArray:true
	    }
	    
	  });
	}]);


tirageServices.factory('ClientSave', ['$resource', function($resource) {
  return $resource('http://localhost:8080/jersey/rest/clients/:num_client', {}, {
    save: {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      }
    }, 
    remove : {
    	method: 'DELETE',
    	 headers: {
    	        'Content-Type': 'application/json'
    	 }
    }
   
  });
}]);

tirageServices.factory('Tirage', ['$resource', function($resource) {
  return $resource('https://www.lagrangien.fr/tirage/webapi/tirage/tire', {}, {
    save: {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    }
  });
}]);

tirageServices.factory('Resultats', ['$resource', function($resource) {
  return $resource('https://www.lagrangien.fr/tirage/webapi/backoffice/results/:company', {}, {
    'query': {
      method: 'GET', isArray:true
    }
  });
}]);

tirageServices.factory('Resultat', ['$resource', function($resource) {
  return $resource('https://www.lagrangien.fr/tirage/webapi/backoffice/result/:email/:secureCode/:company', {}, {
    'query': {
      method: 'GET', isArray:false
    }
  });
}]);

tirageServices.factory('Compagny', ['$resource', function($resource) {
  return $resource('https://www.lagrangien.fr/tirage/webapi/backoffice/verifycompany/:company', {}, {
    'query': {
      method: 'GET', isArray:true
    }
  });
}]);
