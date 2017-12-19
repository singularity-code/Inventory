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
		border-collapse: collapse;
	}
	tr:hover {background-color:#f5f5f5;}
	tr:nth-child(even){background-color: #f2f2f2}
	
	table, td, th {
		border: 1px solid black;
		padding: 8px;
	}
	
	table {
		border-collapse: collapse;
		width: 100%;
	}
	
	th {
		text-align: left;
		background-color: #20B2AA;
 		color: white;
	}
	.reportRowSection {
		text-align: center;
	}
	.center {
		margin: auto;
		width: 95%;
/*		border: 0.5px solid lightgrey;*/
		padding: 10px;
		text-align:center;
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
<div style="width: 85%;" class="center" >
	<div style="float: left; margin: auto; width:40%">
		<div style="text-align: left;">
			<h3>Computer Usage Ratio</h3>
		</div>
		<table>
			<tr>
				<th>Trimester</th>
				<td>Enrolled Students</td>
				<td>Students Computers</td>
				<td>Ratio</td>
			</tr>
			<tr>
				<td>0217</td>
				<td>1905</td>
				<td>{{totalStudentComSummary.total}}</td>
				<td></td>
			</tr>
			<tr>
				<td>0317</td>
				<td>{{totalStudentComSummary.noOfStd}}</td>
				<td>{{totalStudentComSummary.total}}</td>
				<td style="width: 80px;">{{totalStudentComSummary.ratio}} %</td>
			</tr>
		</table>
	</div>
	<div style="float: right; margin: auto; width:60%">
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
				<td id="marketStudent1" class="reportRowSection">{{totalDesktopMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalDesktopMap.totalByStaff}}</td>
			</tr>
			<tr>
				<td class="">Laptop</td>
				<td id="marketStudent2" class="reportRowSection">{{totalLaptopMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalLaptopMap.totalByStaff}}</td>
			</tr>
			<tr>
				<td class="">Apple iMac</td>
				<td id="marketStudent3" class="reportRowSection">{{totalMacMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalMacMap.totalByStaff}}</td>
			</tr>
			<tr>
				<td class="">Tablet</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="">Total</td>
				<td class="reportRowSection">{{totalComputerMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalComputerMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalComputerMap.kentL5Staff}}</td>
				<td class="reportRowSection">-</td>
			</tr>
		</table>
		<br/>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="">Computers (Students)</th>
				<th class="reportRowSection">Market</th>
				<th class="reportRowSection">Kent Lv1</th>
				<th class="reportRowSection">Kent Lv5</th>
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
				<td id="marketStudent1" class="reportRowSection">{{totalDesktopMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalDesktopMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalDesktopMap.totalByStudent}}</td>
			</tr>
			<tr>
				<td class="">Laptop</td>
				<td id="marketStudent2" class="reportRowSection">{{totalLaptopMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalLaptopMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalLaptopMap.totalByStudent}}</td>
			</tr>
			<tr>
				<td class="">Apple iMac</td>
				<td id="marketStudent3" class="reportRowSection">{{totalMacMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalMacMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalMacMap.totalByStudent}}</td>
			</tr>
			<tr>
				<td class="">Tablet</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="">Total</td>
				<td class="reportRowSection">{{totalComputerMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalComputerMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalComputerMap.kentL5Student}}</td>
				<td class="reportRowSection">-</td>
			</tr>
		</table>
		<br/>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="">Classroom, Library & Student Lounge</th>
				<th colspan="2" class="reportRowSection">Market</th>
				<th colspan="2" class="reportRowSection">Kent Lv1</th>
				<th colspan="2" class="reportRowSection">Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th class="reportRowSection">Lecture/Staff</th>
				<th class="reportRowSection">Student</th>
				<th class="reportRowSection">Lecture/Staff</th>
				<th class="reportRowSection">Student</th>
				<th class="reportRowSection">Lecture/Staff</th>
				<th class="reportRowSection">Student</th>
				<th class="reportRowSection">Total</th>
			</tr>
			<tr>
				<td class="">Tv</td>
				<td class="reportRowSection">{{totalTvMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalTvMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalTvMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalTvMap.total}}</td>
			</tr>
			<tr>
				<td class="">Bar Code Reader</td>
				<td class="reportRowSection">{{totalBarcodeMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalBarcodeMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalBarcodeMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalBarcodeMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalBarcodeMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalBarcodeMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalBarcodeMap.total}}</td>
			</tr>
			<tr>
				<td class="">Data Projector</td>
				<td class="reportRowSection">{{totalProjectorMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalProjectorMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalProjectorMap.total}}</td>
			</tr>
			<tr>
				<td class="">Microwave</td>
				<td class="reportRowSection">{{totalMicrowaveMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalMicrowaveMap.total}}</td>
			</tr>
		</table>
		<br/>
		<table style="border: none solid grey">
			<tr>
				<th rowspan="2" class="">Office</th>
				<th colspan="2" class="reportRowSection">Market</th>
				<th colspan="2" class="reportRowSection">Kent Lv1</th>
				<th colspan="2" class="reportRowSection">Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th class="reportRowSection">Lecture/Staff</th>
				<th class="reportRowSection">Student</th>
				<th class="reportRowSection">Lecture/Staff</th>
				<th class="reportRowSection">Student</th>
				<th class="reportRowSection">Lecture/Staff</th>
				<th class="reportRowSection">Student</th>
				<th class="reportRowSection">Total</th>
			</tr>
			<tr>
				<td class="">Telephone</td>
				<td class="reportRowSection">{{totalTelephoneMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalTelephoneMap.total}}</td>
			</tr>
			<tr>
				<td class="">Printer</td>
				<td class="reportRowSection">{{totalPrinterMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalPrinterMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalPrinterMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalPrinterMap.total}}</td>
			</tr>
			<tr>
				<td class="">Shreder</td>
				<td class="reportRowSection">{{totalShrederMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalShrederMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalShrederMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalShrederMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalShrederMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalShrederMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalShrederMap.total}}</td>
			</tr>
			<tr>
				<td class="">Laminator</td>
				<td class="reportRowSection">{{totalLaminatorMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalLaminatorMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalLaminatorMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalLaminatorMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalLaminatorMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalLaminatorMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalLaminatorMap.total}}</td>
			</tr>
			<tr>
				<td class="">Fax</td>
				<td class="reportRowSection">{{totalFaxMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalFaxMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalFaxMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalFaxMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalFaxMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalFaxMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalFaxMap.total}}</td>
			</tr>
			<tr>
				<td class="">EFTPOS Machine</td>
				<td class="reportRowSection">{{totalEFTPOSMap.marketStaff}}</td>
				<td class="reportRowSection">{{totalEFTPOSMap.marketStudent}}</td>
				<td class="reportRowSection">{{totalEFTPOSMap.kentL1Staff}}</td>
				<td class="reportRowSection">{{totalEFTPOSMap.kentL1Student}}</td>
				<td class="reportRowSection">{{totalEFTPOSMap.kentL5Staff}}</td>
				<td class="reportRowSection">{{totalEFTPOSMap.kentL5Student}}</td>
				<td class="reportRowSection">{{totalEFTPOSMap.total}}</td>
			</tr>
			<tr>
				<td class="">DSLR Camera</td>
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
	$scope.enrolledStudent = 1703;
	$scope.totalStudentComSummary = ${totalStudentComSummary};
	
	$scope.totalDesktopMap = ${totalDesktopMap};
	$scope.totalEtcMap = ${totalEtcMap};
	$scope.totalItEtcMap = ${totalItEtcMap};
	$scope.totalLaptopMap = ${totalLaptopMap};
	$scope.totalMacMap = ${totalMacMap};
	$scope.totalMonitorMap = ${totalMonitorMap};
	$scope.totalPrinterMap = ${totalPrinterMap};
	$scope.totalTelephoneMap = ${totalTelephoneMap};
	$scope.totalTvMap = ${totalTvMap};
	$scope.totalComputerMap = ${totalComputerMap};
	
	//ETC
	$scope.totalBarcodeMap = ${totalBarcodeMap};
	$scope.totalProjectorMap = ${totalProjectorMap};
	$scope.totalMicrowaveMap = ${totalMicrowaveMap};
	$scope.totalShrederMap = ${totalShrederMap};
	$scope.totalLaminatorMap = ${totalLaminatorMap};
	$scope.totalFaxMap = ${totalFaxMap};
	$scope.totalEFTPOSMap = ${totalEFTPOSMap};
	
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
$(document).ready(function() {
	console.log("Hi");
});
</script>
</body>
</html>
