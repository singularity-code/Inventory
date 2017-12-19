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
<title>KOI Inventory v0.3</title>
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
		text-align: left;
	}
	.reportRowH2 {
		width: 300px;
		text-align: left;
	}
	.reportRowSection {
		width: 100px;
		text-align: left;
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
</style>
</head>
<body  ng-app="myComputerList" ng-controller="myCtrl">
<!-- Tab Menu -->
<!-- Navbar (sit on top) -->
<div class="center">
	<img class="" src='resources/img/koi_logo.png' style="width:100px;height:80px;" align="middle">
	<h3 style="text-align: center">INVENTORY</h3>
	<div class="" style="text-align: center">
		<a href="./list_desktop">Desktop</a>
		<a href="./list_laptop">Laptop</a>
		<a href="./list_monitor">Monitor</a>
		<a href="./list_mac">Mac</a>
		<a href="./list_telephone">Telephone</a>
		<a href="./list_printer">Printer</a>
		<a href="./list_itEtc">IT ETC</a>
		<a href="./list_etc">ETC</a>
	</div>
</div>
<div style="width: 95%;" class="center" >
	<div style="float: center; margin: auto; width:60%">
		<div style="text-align: right;">
			<h3>{{today}}</h3><a href="./makeBackupJsonFile">Backup</a>
		</div>
		<table style="border: none solid grey">
			<tr>
				<th  rowspan="2" class="">Computers (Lecture/Staff)</th>
				<th  class="reportRowSection">Market</th>
				<th  class="reportRowSection">Kent Lv1</th>
				<th  class="reportRowSection">Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th class="reportRowSection">T0316</th>
				<th class="reportRowSection">T0316</th>
				<th class="reportRowSection">T0316</th>
				<th class="reportRowSection">Total</th>
			</tr>
			<tr>
				<td class="">Desktop</td>
				<td id="marketStudent1" class="reportRowSection">{{allsnapshots.marketStaff}}</td>
				<td class="reportRowSection">{{allsnapshots.kentL1Student</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="">Laptop</td>
				<td id="marketStudent2" class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
		</table>
	</div>
</div>
<script>
var app = angular.module("myComputerList", []);
app.controller("myCtrl", function($scope) {
	$scope.today = new Date().toDateString();
	$scope.allSnapshots = ${allsnapshots};
	//$scope.zabbix = ${zabbix};

	$scope.update = function(computer) {
		$scope.master = angular.copy(computer);
	};

	$scope.reset = function() {
		$scope.computer = angular.copy($scope.master);
	};

	$scope.reset();

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
function lastEdit() {
	var x = document.lastModified;
	document.getElementById("updateDate").innerHTML = x;
}

</script>
</body>
</html>
