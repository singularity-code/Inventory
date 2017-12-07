<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<script src="//code.angularjs.org/snapshot/angular.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="<c:url value='/resources/css/basic.css'/>" rel="stylesheet">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Editor</title>
</head>
<body ng-app="koiMaterialList" ng-controller="myCtrl">
<h2 align="center">Editor</h2>
<div style="margin:auto;width:40%">
	<form novalidate class="simple-form" action="./update" method="post" name="form">
		ID <input type="text" name="id" readonly="readonly" value="${koiMaterial.id}">
		Name<input type="text" name="name" value="${koiMaterial.name}">
		Update Date<input type="text" name="date" readonly="readonly" value="${koiMaterial.updatedate}">
		Campus
		<select id="campus">
			<option ng-repeat="x in campus">{{x}}</option>
		</select>
		Previous <input type="text" name="previous" value="${koiMaterial.previous}">
		Location
		<select id="location" required>
			<option ng-repeat="x in location">{{x}}</option>
		</select>
		User<input type="text" name="user" value="${koiMaterial.user}">
		Type <input type="text" id="type" value="${koiMaterial.type}">
		Status  <input type="text" id="status" value="${koiMaterial.status}">
		Brand
		<select id="brand">
			<option ng-repeat="x in brand">{{x}}</option>
		</select>
		<span style="color:red" ng-show="form.name.$invalid || form.user.$invalid || form.ip.$invalid || form.comModel.$invalid ||
										form.serialNumber.$invalid || form.productNumber.$invalid || form.bios.$invalid ||
										form.purchaseDate.$invalid">!!! All details are required !!!</span>
		<p align="center">
			<a href="./" class="button_back">Back</a>
			<input class="button_mid" type="button" ng-click="reset()" value="Reset"/>
			<input class="button_mid" type="submit" ng-click="update(koiMaterial)"
				   ng-disabled="form.name.$invalid || fomr.user.$invalid || form.ip.$invalid || form.comModel.$invalid || form.serialNumber.$invalid ||
			   form.productNumber.$invalid || form.bios.$invalid || form.purchaseDate.$invalid" value="Apply"></input>
		</p>
	</form>
</div>
<script>
	var app = angular.module("koiMaterialList", []);

	app.controller("myCtrl", function ($scope) {
		$scope.master = {};
		$scope.campus = ["Market", "Kent", "Kent L1", "Kent L5"];
		$scope.location = ["Accounting", "Admission", "Academic", "Reception", "Marketing", "Board Room", "Ricard Office", "Print Bay",
			"Student Canteen", "Lecture Office", "IT Office", "CR101", "CR102", "CR103", "CR104", "CR105", "CR106", "CR107", "CR108", "CR501", "CR502", "CR503", "CR504", "CR505"];
		$scope.brand = ["Apple", "Acer", "Dell", "Hp", "Lenovo", "Samsung", "Sony", "LG", "Toshiba", "Panasonic", "TEAC"];

		$scope.update = function (koiMaterial) {
			$scope.master = angular.copy(koiMaterial);
			lastEdit();
		};

		$scope.reset = function () {
			$scope.koiMaterial = angular.copy($scope.master);
		};

		$scope.getRandomSpan = function () {
			return Math.floor((Math.random() * 6) + 1);
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
	$(document).ready(function () {
		$("#campus").val("${koiMaterial.campus}");
		$("#location").val("${koiMaterial.location}");
		$("#brand").val("${koiMaterial.brand}");
	});
</script>
</body>
</html>