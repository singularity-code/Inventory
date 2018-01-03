<!DOCTYPE html>
<html>
<title>KOI Inventory</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Lato", sans-serif}
	.reportRowSection {
		text-align: center;
	}
.NOT_IN_USE {
	text-decoration: line-through;
	color: red;
}
.OK {
	color: green;
}
</style>
<body class="w3-light-grey" ng-app="myComputerList" ng-controller="myCtrl">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>Menu</button>
<span class="w3-bar-item w3-right">KOI Inventory</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:200px;" id="mySidebar"><br>
<div class="w3-container w3-row">
	<div class="w3-col s4">
	<a href="./"><img class="" src='resources/img/koi_logo.png' style="width:50px;height:40px;" align="middle"></a>
	</div>
</div>
<hr>
<div class="w3-container">
	<h5>Inventory</h5>
</div>
<div class="w3-bar-block">
	<a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>Close Menu</a>
	<a href="./list_all" class="w3-bar-item w3-button w3-padding"><i class="fa fa-database fa-fw"></i>All</a><br>
	<a href="./list_desktop" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-desktop fa-fw"></i>Desktop</a>
	<a href="./list_laptop" class="w3-bar-item w3-button w3-padding"><i class="fa fa-laptop fa-fw"></i>Laptop</a>
	<a href="./list_monitor" class="w3-bar-item w3-button w3-padding"><i class="fa fa-tv fa-fw"></i>Monitor</a>
	<a href="./list_printer" class="w3-bar-item w3-button w3-padding"><i class="fa fa-print fa-fw"></i>Printer</a>
	<a href="./list_mac" class="w3-bar-item w3-button w3-padding"><i class="fa fa-desktop fa-fw"></i>Mac</a>
	<a href="./list_telephone" class="w3-bar-item w3-button w3-padding"><i class="fa fa-fax fa-fw"></i>Telephone</a>
	<a href="./list_itEtc" class="w3-bar-item w3-button w3-padding"><i class="fa fa-tv fa-fw"></i>IT ETC</a>
	<a href="./list_etc" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cubes fa-fw"></i>ETC</a>
	<a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>Settings</a><br><br>
	<a href="./barcodes" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>Barcodes</a><br><br>
</div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:200px;margin-top:43px;">

<!-- Header -->
<header class="w3-container" style="padding-top:22px">
	<h3>CAPEX Report</h3>
	<h5>{{today}}</h5>
</header>

<div class="w3-row-padding w3-margin-bottom">
	<div class="w3-quarter">
		<div class="w3-container w3-red w3-padding-16">
			<div class="w3-left"><i class="fa fa-desktop w3-xxxlarge"></i></div>
			<div class="w3-right">
			<h3>{{totalDesktopMap.total}}</h3>
			</div>
			<div class="w3-clear"></div>
			<h4>Desktops</h4>
		</div>
	</div>
	<div class="w3-quarter">
		<div class="w3-container w3-blue w3-padding-16">
			<div class="w3-left"><i class="fa fa-laptop w3-xxxlarge"></i></div>
			<div class="w3-right">
			<h3>{{totalLaptopMap.total}}</h3>
			</div>
			<div class="w3-clear"></div>
			<h4>Laptops</h4>
		</div>
	</div>
	<div class="w3-quarter">
		<div class="w3-container w3-teal w3-padding-16">
			<div class="w3-left"><i class="fa fa-line-chart w3-xxxlarge"></i></div>
			<div class="w3-right">
				<h3>{{totalStudentComSummary.ratio}}</h3>
			</div>
			<div class="w3-clear"></div>
			<h4>Ratio</h4>
		</div>
	</div>
</div>

<div class="w3-panel">
	<div class="w3-row-padding" style="margin:0 -16px">
	<div id="mainTable" class="w3-threequarter">
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr><h4><i class="fa fa-desktop w3-text-red w3-xlarge"></i> Computers (Lecture/Staff)</h4>
				<th><button id="btnExport" onclick="exportToExcel()"><i class="fa fa-file-excel-o fa-fw"></i>Export</button></th>
				<th style="text-align: center;">Market</th>
				<th style="text-align: center;">Kent Lv1</th>
				<th style="text-align: center;">Kent Lv5</th>
				<th style="text-align: center;">Total</th>
			</tr>
			<tr>
				<td class="">Desktop</td>
				<td style="text-align: center;" id="marketStudent1" >{{totalDesktopMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalDesktopMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalDesktopMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalDesktopMap.totalByStaff}}</td>
			</tr>
			<tr>
				<td class="">Laptop</td>
				<td style="text-align: center;" id="marketStudent2" >{{totalLaptopMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalLaptopMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalLaptopMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalLaptopMap.totalByStaff}}</td>
			</tr>
			<tr>
				<td class="">Apple iMac</td>
				<td style="text-align: center;" id="marketStudent3" >{{totalMacMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalMacMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalMacMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalMacMap.totalByStaff}}</td>
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
				<td style="text-align: center;">{{totalComputerMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalComputerMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalComputerMap.kentL5Staff}}</td>
				<td style="text-align: center;">-</td>
			</tr>
		<br>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr><h4><i class="fa fa-laptop w3-text-blue w3-xlarge"></i> Computers (Students)</h4>
				<th></th>
				<th style="text-align: center;">Market</th>
				<th style="text-align: center;">Kent Lv1</th>
				<th style="text-align: center;">Kent Lv5</th>
				<th style="text-align: center;">Total</th>
			</tr>
			<tr>
				<td class="">Desktop</td>
				<td style="text-align: center;"id="marketStudent1" >{{totalDesktopMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalDesktopMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalDesktopMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalDesktopMap.totalByStudent}}</td>
			</tr>
			<tr>
				<td class="">Laptop</td>
				<td style="text-align: center;"id="marketStudent2" >{{totalLaptopMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalLaptopMap.kentL1Student}}</td>
				<td style="text-align: center;" >{{totalLaptopMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalLaptopMap.totalByStudent}}</td>
			</tr>
			<tr>
				<td class="">Apple iMac</td>
				<td style="text-align: center;"id="marketStudent3" >{{totalMacMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalMacMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalMacMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalMacMap.totalByStudent}}</td>
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
				<td style="text-align: center;">{{totalComputerMap.marketStudent}}</td>
				<td style="text-align: center;" >{{totalComputerMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalComputerMap.kentL5Student}}</td>
				<td style="text-align: center;">-</td>
			</tr>
		</table>
		<br/>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr><h4><i class="fa fa-graduation-cap w3-text-green w3-xlarge"></i> Classroom, Library & Student Lounge</h4>
				<th></th>
				<th style="text-align: center;"colspan="2" >Market</th>
				<th style="text-align: center;"colspan="2" >Kent Lv1</th>
				<th style="text-align: center;"colspan="2" >Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th style="text-align: center;">Lecture/Staff</th>
				<th style="text-align: center;">Student</th>
				<th style="text-align: center;">Lecture/Staff</th>
				<th style="text-align: center;">Student</th>
				<th style="text-align: center;">Lecture/Staff</th>
				<th style="text-align: center;">Student</th>
				<th style="text-align: center;">Total</th>
			</tr>
			<tr>
				<td class="">Tv</td>
				<td style="text-align: center;">{{totalTvMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalTvMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalTvMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalTvMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalTvMap.kentL5Staff}}</td>
				<td style="text-align: center;" >{{totalTvMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalTvMap.total}}</td>
			</tr>
			<tr>
				<td class="">Bar Code Reader</td>
				<td style="text-align: center;">{{totalBarcodeMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalBarcodeMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalBarcodeMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalBarcodeMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalBarcodeMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalBarcodeMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalBarcodeMap.total}}</td>
			</tr>
			<tr>
				<td class="">Data Projector</td>
				<td style="text-align: center;">{{totalProjectorMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalProjectorMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalProjectorMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalProjectorMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalProjectorMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalProjectorMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalProjectorMap.total}}</td>
			</tr>
			<tr>
				<td class="">Microwave</td>
				<td style="text-align: center;">{{totalMicrowaveMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalMicrowaveMap.marketStudent}}</td>
				<td style="text-align: center;" >{{totalMicrowaveMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalMicrowaveMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalMicrowaveMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalMicrowaveMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalMicrowaveMap.total}}</td>
			</tr>
		</table>
		<br/>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr><h4><i class="fa fa-group w3-text-purple w3-xlarge"></i> Office</h4>
				<th>Office</th>
				<th style="text-align: center;" colspan="2" >Market</th>
				<th style="text-align: center;" colspan="2" >Kent Lv1</th>
				<th style="text-align: center;" colspan="2" >Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th style="text-align: center;">Lecture/Staff</th>
				<th style="text-align: center;">Student</th>
				<th style="text-align: center;">Lecture/Staff</th>
				<th style="text-align: center;">Student</th>
				<th style="text-align: center;">Lecture/Staff</th>
				<th style="text-align: center;">Student</th>
				<th style="text-align: center;">Total</th>
			</tr>
			<tr>
				<td>Telephone</td>
				<td style="text-align: center;">{{totalTelephoneMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalTelephoneMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalTelephoneMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalTelephoneMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalTelephoneMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalTelephoneMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalTelephoneMap.total}}</td>
			</tr>
			<tr>
				<td>Printer</td>
				<td style="text-align: center;">{{totalPrinterMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalPrinterMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalPrinterMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalPrinterMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalPrinterMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalPrinterMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalPrinterMap.total}}</td>
			</tr>
			<tr>
				<td class="">Shreder</td>
				<td style="text-align: center;">{{totalShrederMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalShrederMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalShrederMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalShrederMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalShrederMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalShrederMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalShrederMap.total}}</td>
			</tr>
			<tr>
				<td class="">Laminator</td>
				<td style="text-align: center;">{{totalLaminatorMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalLaminatorMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalLaminatorMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalLaminatorMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalLaminatorMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalLaminatorMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalLaminatorMap.total}}</td>
			</tr>
			<tr>
				<td class="">Fax</td>
				<td style="text-align: center;">{{totalFaxMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalFaxMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalFaxMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalFaxMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalFaxMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalFaxMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalFaxMap.total}}</td>
			</tr>
			<tr>
				<td class="">EFTPOS Machine</td>
				<td style="text-align: center;">{{totalEFTPOSMap.marketStaff}}</td>
				<td style="text-align: center;">{{totalEFTPOSMap.marketStudent}}</td>
				<td style="text-align: center;">{{totalEFTPOSMap.kentL1Staff}}</td>
				<td style="text-align: center;">{{totalEFTPOSMap.kentL1Student}}</td>
				<td style="text-align: center;">{{totalEFTPOSMap.kentL5Staff}}</td>
				<td style="text-align: center;">{{totalEFTPOSMap.kentL5Student}}</td>
				<td style="text-align: center;">{{totalEFTPOSMap.total}}</td>
			</tr>
			<tr>
				<td class="">DSLR Camera</td>
				<td ></td>
				<td ></td>
				<td ></td>
				<td ></td>
				<td ></td>
				<td ></td>
				<td ></td>
			</tr>
		</table>
	</div>
	</div>
</div>
<hr>
<!-- Footer -->
<footer class="w3-container w3-padding-16 w3-light-grey">
	<p>Powered by Raspberry Pi, Java, Spring Framework <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

<!-- End page content -->
</div>
<script>
var app = angular.module("myComputerList", []);
app.controller("myCtrl", function($scope) {
	$scope.desktops = ${desktops};
	$scope.today = new Date().toUTCString();
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

// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
	if (mySidebar.style.display === 'block') {
		mySidebar.style.display = 'none';
		overlayBg.style.display = "none";
	} else {
		mySidebar.style.display = 'block';
		overlayBg.style.display = "block";
	}
}

// Close the sidebar with the close button
function w3_close() {
	mySidebar.style.display = "none";
	overlayBg.style.display = "none";
}
function exportToExcel() {
	var htmls = "";
	var uri = 'data:application/vnd.ms-excel;base64,';
	var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'; 
	var base64 = function(s) {
		return window.btoa(unescape(encodeURIComponent(s)))
	};

	var format = function(s, c) {
		return s.replace(/{(\w+)}/g, function(m, p) {
			return c[p];
		})
	};

	htmls =  $('#mainTable').prop('outerHTML');

	var ctx = {
		worksheet : 'Worksheet',
		table : htmls
	}

	var link = document.createElement("a");
	link.download = "export.xls";
	link.href = uri + base64(format(template, ctx));
	link.click();
}
</script>

</body>
</html>
