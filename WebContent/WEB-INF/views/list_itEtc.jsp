<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<%--<script src="https://www.w3schools.com/lib/w3.js"></script>--%>
<%--<link href="<c:url value='/resources/css/basic.css?v=3'/>" rel="stylesheet">--%>
<%--<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KOI Inventory v0.2</title>
<style>
	body {
		font-family: "Lato", sans-serif;
	}
	table {
		border: none;
		width: 100%;
	}
	table caption {
		font-size: 1.3em;
	}
	table thead {
		clip: rect(0 0 0 0);
		height: 1px;
		margin: -1px;
		overflow: hidden;
		padding: 0;
		position: absolute;
		width: 1px;
	}
	table tr {
		border-bottom: 1px solid slategrey;
		display: block;
		margin-bottom: .325em;
	}
	table td {
		/*     border-bottom: 1px solid #ddd; */
		font-size: 1.0em;
		cellpadding: 10;
		text-align: left;
	}
	table td:before {
		/*
		* aria-label has no advantage, it won't be read inside a table
		content: attr(aria-label);
		*/
		content: attr(data-label);
		float: left;
		font-weight: bold;
		text-transform: uppercase;
	}
	table td:last-child {
		border-bottom: 0;
	}
	.center {
		margin: auto;
		width: 95%;
/*		border: 0.5px solid lightgrey;*/
		padding: 10px;
		text-align:center;
	}
	button {
		width: 80px;
		height: 30px;
	}
	.reportRowH1 {
		width: 500px;
		text-align: center;
	}
	.reportRowH2 {
		width: 300px;
		text-align: center;
	}
	.reportRowSection {
		width: 100px;
		text-align: center;
	}
	select {
		width: 50%;
		padding: 12px 20px;
		margin: 8px 0;
		box-sizing: border-box;
	}
	input[type=text] {
		width: 50%;
		padding: 12px 20px;
		margin: 8px 0;
		box-sizing: border-box;
		border: none;
		border-bottom: 2px solid darkslategrey;
	}
	.button_back {
	background-color: #888a85;
	border: none;
	color: white;
	padding: 6.5px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
}
</style>
</head>
<body  ng-app="myComputerList" ng-controller="myCtrl">
<!-- Tab Menu -->
<!-- Navbar (sit on top) -->
<div class="center">
	<div align="left" style="margin-bottom: 15px; margin-top: 25px;">
		<input type="search" id="search" placeholder="Say Anything..." style="width: 400px; height: 40px;" ng-model="$ctrl.query"/>
		<button class="button_small" ng-click="setTab(1)" style="width: 100px; height: 40px;">Search</button>
		<button class="button_small" onclick="myFunction()" style="width: 100px; height: 40px;">Clear</button>
		<a href="./" class="button_back">Back</a>
		<h3>Total : {{filtered.length}} Items</h3>
		<button ng-click="setTab('create-koiMaterial')">Create</button>
	</div>
</div>
<!-- Menu Contents -->
<div class="center" >
<!-- 	General Edit Page -->
	<div ng-show="isSet('create-koiMaterial')">
		<div>
			<h3 class="">Create New</h3>
		</div>
		<div>
			<form novalidate class="simple-form" action="./create_koiMaterial" method="post" name="form">
				<input type="text" name="index" readonly="readonly" value={{nextIndex()}}>
				<input type="text" name="id" readonly="readonly" value={{nextId('staff')}}>
				<input type="text" placeholder="Name" ng-model="koiMaterial.name" name="name" required/>
				<input type="text" placeholder="User" ng-model="koiMaterial.user" name="user" required/>
				<input type="text" placeholder="Status" ng-model="koiMaterial.status" name="status" required/>
				<input type="text" name="type" readonly="readonly" value="itEtc">
				<select ng-model="koiMaterial.campus" name="campus">
					<option value="" disabled selected >Campus</option>
					<option ng-repeat="x in campus">{{x}}</option>
				</select>
				<select ng-model="koiMaterial.location" name="location" required>
					<option value="" disabled selected>Location</option>
					<option ng-repeat="x in location">{{x}}</option>
				</select>
				<select ng-model="koiMaterial.brand" name="brand">
					<option value="" disabled selected>Brand</option>
					<option ng-repeat="x in brand">{{x}}</option>
				</select>
				<input type="text" placeholder="Comment" ng-model="koiMaterial.comment" name="comment" required/>
				<p align="center">
					<input type="button" ng-click="reset()" value="Reset" />
					<input type="submit" ng-click="createGeneral(koiMaterial)" value="Create"/>
				</p>
			</form>
			<pre>koiMaterial_draft = {{koiMaterial | json}}</pre>
		</div>
	</div>
	<!-- Desktop Set -->
	<div style="margin:auto;width:85%">
		<table>
			<tr>
				<td style="width: 50px;"><b>Idx</b></td>
				<td style="width: 100px;"><b>S/N</b></td>
				<td style="width: 100px;"><b>ID</b></td>
				<td style="width: 100px;"><b>Type</b></td>
				<td style="width: 100px;"><b>Brand</b></td>
				<td style="width: 150px;"><b>Previous</b></td>
				<td style="width: 150px;"><b>Location</b></td>
				<td style="width: 150px;"><b>Campus</b></td>
				<td style="width: 150px;"><b>User</b></td>
				<td style="width: 150px;"><b>Comment</b></td>
				<td style="width: 150px;"><b>Last Update</b></td>
				<td></td>
			</tr>
		</table>
		<table id="switchTable" align="center" ng-repeat="obj in objects | filter:$ctrl.query as filtered ">
			<tr id="">
				<td style="width: 50px;">{{obj.index}}</td>
				<td style="width: 100px;">{{obj.sn}}</td>
				<td style="width: 100px;">{{obj.id}}</td>
				<td style="width: 100px;">{{obj.type}}</td>
				<td style="width: 100px;">{{obj.brand}}</td>
				<td style="width: 150px;">{{obj.previous}}</td>
				<td style="width: 150px;">{{obj.location}}</td>
				<td style="width: 150px;">{{obj.campus}}</td>
				<td style="width: 150px;">{{obj.user}}</td>
				<td style="width: 150px;">{{obj.comment}}</td>
				<td id="updateDate" style="width: 250px;">{{obj.updatedate}}</td>
				<td style="width: 150px;">
					<a href="./update_view_KoiMaterial?id={{obj.id}}&type={{obj.type}}">Edit</a>
					<a href="./deleteKoiMaterial?id={{obj.id}}&type={{obj.type}}" onclick="return delConfirm();" class="w3-right">Remove</a>
				</td>
			</tr>
		</table>
	</div>
</div>
<script>
var app = angular.module("myComputerList", []);
app.controller("myCtrl", function($scope) {
	$scope.objects = ${objects};

	$scope.campus = ["Market", "Kent"];
	$scope.location = ["Accounting", "Admission", "Academic", "Reception", "Marketing", "Board Room", "Ricard Office", "Print Bay",
						 "Student Canteen", "Lecture Office", "IT Office", "101", "102","103", "104", "105", "106", "107", "108"];
	$scope.brand = ["APPLE", "ACER", "DELL", "HP", "LENOVO", "SAMSUNG", "SONY","LG", "TOSHIBA"];

	$scope.update = function(computer) {
		$scope.master = angular.copy(computer);
	};

	$scope.reset = function() {
		  $scope.computer = angular.copy($scope.master);
	};

	$scope.reset();

	$scope.nextId = function(type, user) {
		if(type === 'staff') {
			i = $scope.objects.length + 1;
			return "HE-10" + i;
		} else if (type == 'student') {
			i = $scope.objects.length + 1;
			return "HE-20" + i;
		}
	}
	
	$scope.nextIndex = function() {
		return $scope.objects.length + 1;
	}
	$scope.getRandomSpan = function(){
		return Math.floor((Math.random()*6)+230);
	}
	$scope.clearSearch = function() {
		$scope.searchAll = null;
	}
	// Tab Menu
	$scope.tab = 1;

	$scope.setTab = function(newTab){
		$scope.tab = newTab;
		$scope.reset();
	};

	$scope.isSet = function(tabNum){
		return $scope.tab === tabNum;
	};
});

function myFunction() {
	document.getElementById("search").value = "";
}
function delConfirm() {
	console.log(confirm("Are you sure to deleteComputer?"));
	return $.confirm("Are you sure?");
}

function lastEdit() {
	var x = document.lastModified;
	document.getElementById("updateDate").innerHTML = x;
}

function markBroken() {
	stockId.style.opacity = "1.0";
}
</script>
</body>
</html>
