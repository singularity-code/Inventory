<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
	<title>Editor</title>
	<style>
	html,body,h1,h2,h3,h4,h5 {
		font-family: "Raleway", sans-serif
	}
	table, tr, td {
		text-align: center;
	}
	.simple-form {
		width: 100%;
		padding: 6px 10px;
		margin: 4px 0;
		box-sizing: border-box;
		border: 3px solid #ccc;
		-webkit-transition: 0.5s;
		transition: 0.5s;
		outline: none;
	}
	input[type=text]:focus {
		border: 3px solid #555;
	}
	.NOT_IN_USE {
		text-decoration: line-through;
		color: red;
	}
	.OK {
		color: #4169E1;
	}
	</style>
</head>
<body ng-app="koiMaterialList" ng-controller="myCtrl">
<h2 align="center">Editor</h2>
<div style="margin:auto; width:30%">
	<form action="./updateGeneral" method="post" name="form">
		<table>
			<tr>
				<td>INDEX</td>
				<td><input class="simple-form" type="text" name="index" readonly="readonly" value="${koiMaterial.index}"></td>
			</tr>
			<tr>
				<td>SN</td>
				<td><input class="simple-form" type="text" name="sn" readonly="readonly" value="${koiMaterial.sn}"></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input class="simple-form" type="text" name="id" readonly="readonly" value="${koiMaterial.id}"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input class="simple-form" type="text" name="name" value="${koiMaterial.name}"></td>
			</tr>
			<tr>
				<td>Update Date</td>
				<td><input class="simple-form" type="text" name="updatedate" readonly="readonly" value="${koiMaterial.updatedate}"></td>
			</tr>
			<tr>
				<td>Campus</td>
				<td><select class="simple-form" id="campus" name="campus"><option ng-repeat="x in campus">{{x}}</option></select></td>
			</tr>
			<tr>
				<td>Previous</td>
				<td><input class="simple-form" type="text" name="previous" value="${koiMaterial.previous}"></td>
			</tr>
			<tr>
				<td>Location</td>
				<td><select class="simple-form" id="location" name="location" required><option ng-repeat="x in location">{{x}}</option></select></td>
			</tr>
			<tr>
				<td>User</td>
				<td><input class="simple-form" type="text" name="user" value="${koiMaterial.user}"></td>
			</tr>
			<tr>
				<td>Type</td>
				<td><input class="simple-form" type="text" id="type" name="type" value="${koiMaterial.type}"></td>
			</tr>
			<tr>
				<td>Brand</td>
				<td><select class="simple-form" id="brand" name="brand"><option ng-repeat="x in brand">{{x}}</option></select></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><input class="simple-form" type="text" id="status" name="status" value="${koiMaterial.status}"></td>
			</tr>
			<tr>
				<td>Comment</td>
				<td><input class="simple-form" type="text" id="comment" name="comment" value="${koiMaterial.comment}"></td>
			</tr>
		</table>
		<p align="center">
			<a href="javascript:history.back()" class="button_back">Back</a>
			<input class="button_mid" type="button" ng-click="reset()" value="Reset"/>
			<input class="button_mid" type="submit" ng-click="updateGeneral(koiMaterial)" value="Apply"/>
		</p>
	</form>
</div>
<script>
	var app = angular.module("koiMaterialList", []);

	app.controller("myCtrl", function ($scope) {
		$scope.master = {};
		$scope.campus = ["Market", "Kent"];
		
		$scope.location = ["Office", "Office(Accounting)", "Office(Admission)", "Office(Academic)", "Reception", "Office(Marketing)", "Board Room", "Ricard Office", "Print Bay",
			"Student Canteen", "Student Lounge", "Staff Kitchen","Lecture Office", "IT Office", "Server Room", "Marketing Store Room",
			"CR101&102", "CR101", "CR102", "CR103", "CR104", "CR105", "CR106", "CR107", "CR108", 
			"CR501", "CR502", "CR503", "CR504", "CR505", "CR506"];
		
		$scope.brand = ["APPLE", "ACER", "DELL", "HP", "LENOVO", "SAMSUNG", "SONY", "LG", "TOSHIBA", "PANASONC", "TEAC", "MITEL",
			"TP-LINK","NETGEAR","CISCO", "SMEG","OMEGA","Royal Severeign","WESTING"];
		
		$scope.status = ["Brand New", "Good", "Not Good", "Malfunction", "Broken", "Not Using"]

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