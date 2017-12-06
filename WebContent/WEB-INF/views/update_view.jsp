<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<script src="//code.angularjs.org/snapshot/angular.min.js"></script>
<link href="<c:url value='/resources/css/basic.css'/>" rel="stylesheet">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Editor</title>
</head>
<body ng-app="myComputerList" ng-controller="myCtrl">
<h2 align="center">Editor</h2>
	<div style="margin:auto;width:80%">
	  <form novalidate class="simple-form" action="./update" method="post" name="form">
	  	<input type="text" name="id" readonly="readonly" value="${koiMaterial.id}">
		<input type="text" name="date" readonly="readonly" value="${koiMaterial.date}">
		
		Campus
		<select selected="${koiMaterial.campus}" name="campus">
		<option ng-repeat="x in campus">{{x}}</option></select>  
		
		Previous
		<select selected="${koiMaterial.previous}" name="previous" required>
		<option ng-repeat="x in location">{{x}}</option></select>
		
		Location
		<select selected="${koiMaterial.location}" name="location" required>
		<option ng-repeat="x in location">{{x}}</option></select>
				
				Type	  	
	  			<select selected="${koiMaterial.type}" name="type">
			    <option value="Desktop">Desktop</option>
			    <option value="Laptop">Laptop</option>
			    </select>
			    
			    Domain
			    <select selected="${koiMaterial.domain}" name="domain">
			    <option value="KOI">KOI</option>
			    <option value="STDKOI">STDKOI</option>
			    </select>	  	
				
				Role
			    <select  selected="${koiMaterial.role}" name="role">
			    <option value="Staff">Staff</option>
			    <option value="Student">Student</option>
			    </select>
				
				OS
			    <select selected="${koiMaterial.os}" name="os">
			    <option value="Win7">Win7</option>
			    <option value="Win10 Home">Win10 Home</option>
			    <option value="Win10 Pro">Win10 Pro</option>
			    <option value="Linux">Linux</option>
			    </select>		  
	    
	    		License
			    <select selected="${koiMaterial.license}" name="license">
			    <option value="Active">Active</option>
			    <option value="Inactive">Inactive</option>
			    </select>
			    
			    Machine Only
			    <select selected="${koiMaterial.machineOnly}" name="machineOnly">
			    <option value="Yes">Yes</option>
			    <option value="No">No</option>
			    </select>
			    
			    Status
			    <select selected="${koiMaterial.status}" name="status">
			    <option value="Active">Active</option>
			    <option value="Inactive">Inactive</option>
			    </select>
			    
			    Office Activation 
			    <select selected="${koiMaterial.officeActive}" name="officeActive">
			    <option value="Active">Active</option>
			    <option value="Inactive">Inactive</option>
			    </select>
			    
			    Bit Defender
			    <select selected="${koiMaterial.bitDef}" name="bitDef">
			    <option value="Active">Active</option>
			    <option value="Inactive">Inactive</option>
			    </select>
			    
			    Brand
			    <select selected="${koiMaterial.brand}" name="brand">
			    <option ng-repeat="x in brand">{{x}}</option></select>

				CPU
		   		<select selected="${koiMaterial.cpu}" name="cpu">
		   		<option ng-repeat="x in cpu">{{x}}</option></select>
		   		
		   		Memory
		   		<select selected="${koiMaterial.memory}" name="memory">
		   		<option ng-repeat="x in memory">{{x}}</option></select>

				koiMaterial Name<input type="text" value="${koiMaterial.name}" name="name" required/>
				User<input type="text" value="${koiMaterial.user}" name="user" required/>
			    IP<input type="text" value="${koiMaterial.ip}" name="ip" required/>
			    Model<input type="text" value="${koiMaterial.model}"name="comModel" required/>
			    Serial No.<input type="text" value="${koiMaterial.serialNumber}"name="serialNumber" required/>
			    Product No.<input type="text" value="${koiMaterial.productNumber}" name="productNumber" required/>
			    Bios<input type="text" value="${koiMaterial.bios}" name="bios" required/>
				Purchase Date<input type="text" value="${koiMaterial.purchaseDate}" name="purchaseDate" required/>
		   		<span style="color:red" ng-show="form.name.$invalid || form.user.$invalid || form.ip.$invalid || form.comModel.$invalid || 
		   										form.serialNumber.$invalid || form.productNumber.$invalid || form.bios.$invalid || 
		   										form.purchaseDate.$invalid">!!! All details are required !!!</span>	 
				<p align="center">
				<a href="./" class="button_back">Back</a>
			    <input class="button_mid" type="button" ng-click="reset()" value="Reset" />
			    <input class="button_mid" type="submit" ng-click="update(koiMaterial)"
			    	   ng-disabled="form.name.$invalid || fomr.user.$invalid || form.ip.$invalid || form.comModel.$invalid || form.serialNumber.$invalid || 
			    	   form.productNumber.$invalid || form.bios.$invalid || form.purchaseDate.$invalid" value="Apply"></input>
			  	</p>
	  </form>
	</div>
  <script>
  var app = angular.module("myComputerList", []);
  app.controller("myCtrl", function($scope) {
	  $scope.master = {};
	  $scope.campus = ["Market", "Kent"];
	  $scope.location = ["Accounting", "Admission", "Academic", "Reception", "Marketing", "Board Room", "Ricard Office", "Print Bay", 
		  				 "Student Canteen", "Lecture Office", "IT Office", "101", "102","103", "104", "105", "106", "107", "108"];
	  $scope.brand = ["APPLE", "ACER", "DELL", "HP", "LENOVO", "SAMSUNG", "SONY","LG", "TOSHIBA"];
	  $scope.cpu = ["Intel Core™ 2 Duo E7500 2.93GHz",
		  			"Intel Core™ Duo T9550",
		  			"Intel Core™ i3",
		  			"Intel Core™ i3-4005U 1.7GHz",
		  			"Intel Core™ i5",
		  			"Intel Core™ i5-2400s",
		  			"Intel Core™ i5 650 3.2GHz, 3.3GHz",
		  			"Intel Core™ i5 760 2.80GHz",
		  			"Intel Core™ i5 M520 2.4GHz",
		  			"Intel Core™ i5 M560 2.67GHz",
		  			"Intel Core™ i5 M580 2.67GHz",
		  			"Intel Core™ i5-2400S 2.5GHz",
		  			"Intel Core™ i5-2450M 2.5GHz",
		  			"Intel Core™ i5-4200m 2.5GHz",
		  			"Intel Core™ i5-4300M 2.5GHz",
		  			"Intel Core™ i5-6400 2.7GHz",
		  			"Intel Core™ i5-7400 3.00 GHz",
		  			"Intel Core™ i7",
		  			"Intel Core™ i7 870 2.93GHz",
		  			"Intel Core™ i7 M640 2.8GHz",
		  			"Intel Core™ i7-3630QM 2.40GHz",
		  			"Intel Core™ i7-4510U 2.00GHz",
		  			"Intel Core™ i7-4770 3.5GHz"];
	  $scope.memory = ["4GB",
		  			   "8GB",
		  			   "16GB",
		  			   "8GB DDR4 2400Mhz"];
	  $scope.update = function(koiMaterial) {
	  	$scope.master = angular.copy(koiMaterial);
	  	lastEdit();
	  };
	  
      $scope.reset = function() {
    	  $scope.koiMaterial = angular.copy($scope.master);
      };
       
      $scope.getRandomSpan = function(){
    	  return Math.floor((Math.random()*6)+1);
      }
      
      $scope.removeItem = function (x) {
          $scope.errortext = "";    
          $scope.products.splice(x, 1);
      }
  });
  
  function lastEdit() {
	    var x = document.lastModified;
	    document.getElementById("demo").innerHTML = x;
	}

  </script>
</body>
</html>