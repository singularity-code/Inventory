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
<title>KOI Inventory</title>
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
	<div style="float:left; margin:auto; width:48%">
		<div style="text-align: left;">
			<h3>Previous</h3>
		</div>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="reportRowH1">Computers</th>
				<th colspan="2" class="reportRowH2">Market</th>
				<th colspan="2" class="reportRowH2">Kent Lv1</th>
				<th colspan="2" class="reportRowH2">Kent Lv5</th>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td class="reportRowSection">T0216</td>
				<td class="reportRowSection">T0316</td>
				<td class="reportRowSection">T0216</td>
				<td class="reportRowSection">T0316</td>
				<td class="reportRowSection">T0216</td>
				<td class="reportRowSection">T0316</td>
			</tr>
			<tr>
				<td class="reportRowH1">Desktop</td>
				<td>{{totalMarketTv}}</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="reportRowH1">Laptop</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="reportRowH1">Apple iMac</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="reportRowH1">Tablet</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="reportRowH1">Total</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<br/>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="reportRowH1">Classroom, Library & Student Lounge</th>
				<th colspan="2" class="reportRowH2">Market</th>
				<th colspan="2" class="reportRowH2">Kent Lv1</th>
				<th colspan="2" class="reportRowH2">Kent Lv5</th>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Total</td>
			</tr>
			<tr>
				<td class="reportRowH1">Tv</td>
				<td class="reportRowSection">{{totalTvMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalTvMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalTvMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Bar Code Reader</td>
				<td class="reportRowSection">{{totalBarcodeReMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Data Projector</td>
				<td class="reportRowSection">{{totalProjectorMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalProjectorMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalProjectorMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Microwave</td>
				<td class="reportRowSection">{{totalMicrowaveMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.total}}</td>
			</tr>
		</table>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="reportRowH1">Office</th>
				<th colspan="2" class="reportRowH2">Market</th>
				<th colspan="2" class="reportRowH2">Kent Lv1</th>
				<th colspan="2" class="reportRowH2">Kent Lv5</th>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Total</td>
			</tr>
			<tr>
				<td class="reportRowH1">Telephone</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">Printer</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">Shreder</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">Laminator</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">Fax</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">EFTPOS Machine</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
						<tr>
				<td class="reportRowH1">DSLR Camera</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
						<tr>
				<td class="reportRowH1">EFTPOS Machine</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
		</table>
	</div>
	<div style="float:right; margin:auto; width:48%">
		<div style="text-align: left;">
			<h3>{{today}} <a href="./makeBackupJsonFile">Backup</a></h3>
		</div>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="reportRowH1">Computers</th>
				<th colspan="2" class="reportRowH2">Market</th>
				<th colspan="2" class="reportRowH2">Kent Lv1</th>
				<th colspan="2" class="reportRowH2">Kent Lv5</th>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td class="reportRowSection">T0216</td>
				<td class="reportRowSection">T0316</td>
				<td class="reportRowSection">T0216</td>
				<td class="reportRowSection">T0316</td>
				<td class="reportRowSection">T0216</td>
				<td class="reportRowSection">T0316</td>
			</tr>
			<tr>
				<td class="reportRowH1">Desktop</td>
				<td id="marketStudent1" class="reportRowSection">{{totalDesktopMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalDesktopMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalDesktopMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Laptop</td>
				<td id="marketStudent2" class="reportRowSection">{{totalLaptopMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalLaptopMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalLaptopMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Apple iMac</td>
				<td id="marketStudent3" class="reportRowSection">{{totalMacMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalMacMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalMacMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Tablet</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="reportRowH1">Total</td>
				<td>{{marketStudentTotal}}</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<br/>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="reportRowH1">Classroom, Library & Student Lounge</th>
				<th colspan="2" class="reportRowH2">Market</th>
				<th colspan="2" class="reportRowH2">Kent Lv1</th>
				<th colspan="2" class="reportRowH2">Kent Lv5</th>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Total</td>
			</tr>
			<tr>
				<td class="reportRowH1">Tv</td>
				<td class="reportRowSection">{{totalTvMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalTvMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalTvMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Bar Code Reader</td>
				<td class="reportRowSection">{{totalBarcodeReMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalBarcodeReMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Data Projector</td>
				<td class="reportRowSection">{{totalProjectorMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalProjectorMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalProjectorMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Microwave</td>
				<td class="reportRowSection">{{totalMicrowaveMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.total}}</td>
			</tr>
		</table>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="reportRowH1">Office</th>
				<th colspan="2" class="reportRowH2">Market</th>
				<th colspan="2" class="reportRowH2">Kent Lv1</th>
				<th colspan="2" class="reportRowH2">Kent Lv5</th>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
				<td colspan="2" class="reportRowH2">Lecturer/Staff</td>
			</tr>
			<tr>
				<td class="reportRowH1"></td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Lecture/Staff</td>
				<td class="reportRowSection">Student</td>
				<td class="reportRowSection">Total</td>
			</tr>
			<tr>
				<td class="reportRowH1">Telephone</td>
				<td class="reportRowSection">{{totalTelephoneMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Printer</td>
				<td class="reportRowSection">{{totalPrinterMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalPrinterMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalPrinterMap.total}}</td>
			</tr>
			<tr>
				<td class="reportRowH1">Shreder</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">Laminator</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">Fax</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
			<tr>
				<td class="reportRowH1">EFTPOS Machine</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
						<tr>
				<td class="reportRowH1">DSLR Camera</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
			</tr>
						<tr>
				<td class="reportRowH1">EFTPOS Machine</td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
				<td class="reportRowSection"></td>
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
	$scope.desktops = ${desktops};
	$scope.today = new Date().toDateString();
	
	$scope.totalDesktopMap = ${totalDesktopMap};
	$scope.totalEtcMap = ${totalEtcMap};
	$scope.totalItEtcMap = ${totalItEtcMap};
	$scope.totalLaptopMap = ${totalLaptopMap};
	$scope.totalMacMap = ${totalMacMap};
	$scope.totalMonitorMap = ${totalMonitorMap};
	$scope.totalPrinterMap = ${totalPrinterMap};
	$scope.totalTelephoneMap = ${totalTelephoneMap};
	
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
