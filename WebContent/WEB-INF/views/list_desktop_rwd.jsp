<!DOCTYPE html>
<html>
<title>KOI Inventory v0.4</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey" ng-app="myComputerList" ng-controller="myCtrl">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">KOI Inventory v0.4</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img class="" src='resources/img/koi_logo.png' style="width:50px;height:40px;" align="middle">
    </div>
     <div class="w3-col s8 w3-bar">
      <span>Hi, <strong>Michael</strong></span><br>
<!--       <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a> -->
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Inventory</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="./list_desktop_rwd" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-desktop fa-fw"></i>  Desktop</a>
    <a href="./list_laptop_rwd" class="w3-bar-item w3-button w3-padding"><i class="fa fa-laptop fa-fw"></i>  Laptop</a>
    <a href="./list_monitor_rwd" class="w3-bar-item w3-button w3-padding"><i class="fa fa-tv fa-fw"></i>  Monitor</a>
    <a href="./list_printer_rwd" class="w3-bar-item w3-button w3-padding"><i class="fa fa-print fa-fw"></i>  Printer</a>
    <a href="./list_mac_rwd" class="w3-bar-item w3-button w3-padding"><i class="fa fa-desktop fa-fw"></i>  Mac</a>
    <a href="./list_telephone_rwd" class="w3-bar-item w3-button w3-padding"><i class="fa fa-fax fa-fw"></i>  Telephone</a>
    <a href="./list_itEtc_rwd" class="w3-bar-item w3-button w3-padding"><i class="fa fa-database fa-fw"></i>  IT ETC</a>
    <a href="./list_etc_rwd" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cubes fa-fw"></i> ETC</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Settings</a><br><br>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-dashboard"></i>Trimester 0317</b></h5>
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
        <div class="w3-left"><i class="fa fa-bar-chart w3-xxxlarge"></i></div>
        <div class="w3-right">
			<h3>{{totalStudentComSummary.ratio}}</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Ratio</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>{{totalStudentComSummary.noOfStd}}</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Students</h4>
      </div>
    </div>
  </div>

  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-twothird">
        <h5>CAPEX Report {{today}}</h5>
        <table class="w3-table w3-striped w3-white">
          <tr>
            <td><i class="fa fa-user w3-text-blue w3-large"></i></td>
            <td><i class="fa fa-bell w3-text-red w3-large"></i></td>
            <td><i class="fa fa-users w3-text-yellow w3-large"></i></td>
             <td><i class="fa fa-comment w3-text-red w3-large"></i></td>
             <td><i class="fa fa-bookmark w3-text-blue w3-large"></i></td>
             <td><i class="fa fa-laptop w3-text-red w3-large"></i></td>
             <td><i class="fa fa-share-alt w3-text-green w3-large"></i></td>
          </tr>
        </table>
        <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<th  rowspan="2"><i class="fa fa-laptop w3-text-red w3-large"></i>Computers (Lecture/Staff)</th>
				<th  >Market</th>
				<th  >Kent Lv1</th>
				<th  >Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th >T0316</th>
				<th >T0316</th>
				<th >T0316</th>
				<th >Total</th>
			</tr>
			<tr>
				<td class="">Desktop</td>
				<td id="marketStudent1" >{{totalDesktopMap.marketStaff}}</td>
				<td >{{totalDesktopMap.kentL1Staff}}</td>
				<td >{{totalDesktopMap.kentL5Staff}}</td>
				<td >{{totalDesktopMap.totalByStaff}}</td>
			</tr>
			<tr>
				<td class="">Laptop</td>
				<td id="marketStudent2" >{{totalLaptopMap.marketStaff}}</td>
				<td >{{totalLaptopMap.kentL1Staff}}</td>
				<td >{{totalLaptopMap.kentL5Staff}}</td>
				<td >{{totalLaptopMap.totalByStaff}}</td>
			</tr>
			<tr>
				<td class="">Apple iMac</td>
				<td id="marketStudent3" >{{totalMacMap.marketStaff}}</td>
				<td >{{totalMacMap.kentL1Staff}}</td>
				<td >{{totalMacMap.kentL5Staff}}</td>
				<td >{{totalMacMap.totalByStaff}}</td>
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
				<td >{{totalComputerMap.marketStaff}}</td>
				<td >{{totalComputerMap.kentL1Staff}}</td>
				<td >{{totalComputerMap.kentL5Staff}}</td>
				<td >-</td>
			</tr>
		</table>
		<br/>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<th rowspan="2" class=""><i class="fa fa-laptop w3-text-red w3-large"></i>Computers (Students)</th>
				<th >Market</th>
				<th >Kent Lv1</th>
				<th >Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th >T0316</th>
				<th >T0316</th>
				<th >T0316</th>
				<th >Total</th>
			</tr>
			<tr>
				<td class="">Desktop</td>
				<td id="marketStudent1" >{{totalDesktopMap.marketStudent}}</td>
				<td >{{totalDesktopMap.kentL1Student}}</td>
				<td >{{totalDesktopMap.kentL5Student}}</td>
				<td >{{totalDesktopMap.totalByStudent}}</td>
			</tr>
			<tr>
				<td class="">Laptop</td>
				<td id="marketStudent2" >{{totalLaptopMap.marketStudent}}</td>
				<td >{{totalLaptopMap.kentL1Student}}</td>
				<td >{{totalLaptopMap.kentL5Student}}</td>
				<td >{{totalLaptopMap.totalByStudent}}</td>
			</tr>
			<tr>
				<td class="">Apple iMac</td>
				<td id="marketStudent3" >{{totalMacMap.marketStudent}}</td>
				<td >{{totalMacMap.kentL1Student}}</td>
				<td >{{totalMacMap.kentL5Student}}</td>
				<td >{{totalMacMap.totalByStudent}}</td>
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
				<td >{{totalComputerMap.marketStudent}}</td>
				<td >{{totalComputerMap.kentL1Student}}</td>
				<td >{{totalComputerMap.kentL5Student}}</td>
				<td >-</td>
			</tr>
		</table>
		<br/>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<th rowspan="2" class="">Classroom, Library & Student Lounge</th>
				<th colspan="2" >Market</th>
				<th colspan="2" >Kent Lv1</th>
				<th colspan="2" >Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th >Lecture/Staff</th>
				<th >Student</th>
				<th >Lecture/Staff</th>
				<th >Student</th>
				<th >Lecture/Staff</th>
				<th >Student</th>
				<th >Total</th>
			</tr>
			<tr>
				<td class="">Tv</td>
				<td >{{totalTvMap.marketStaff}}</td>
				<td >{{totalTvMap.marketStudent}}</td>
				<td >{{totalTvMap.kentL1Staff}}</td>
				<td >{{totalTvMap.kentL1Student}}</td>
				<td >{{totalTvMap.kentL5Staff}}</td>
				<td >{{totalTvMap.kentL5Student}}</td>
				<td >{{totalTvMap.total}}</td>
			</tr>
			<tr>
				<td class="">Bar Code Reader</td>
				<td >{{totalBarcodeMap.marketStaff}}</td>
				<td >{{totalBarcodeMap.marketStudent}}</td>
				<td >{{totalBarcodeMap.kentL1Staff}}</td>
				<td >{{totalBarcodeMap.kentL1Student}}</td>
				<td >{{totalBarcodeMap.kentL5Staff}}</td>
				<td >{{totalBarcodeMap.kentL5Student}}</td>
				<td >{{totalBarcodeMap.total}}</td>
			</tr>
			<tr>
				<td class="">Data Projector</td>
				<td >{{totalProjectorMap.marketStaff}}</td>
				<td >{{totalProjectorMap.marketStudent}}</td>
				<td >{{totalProjectorMap.kentL1Staff}}</td>
				<td >{{totalProjectorMap.kentL1Student}}</td>
				<td >{{totalProjectorMap.kentL5Staff}}</td>
				<td >{{totalProjectorMap.kentL5Student}}</td>
				<td >{{totalProjectorMap.total}}</td>
			</tr>
			<tr>
				<td class="">Microwave</td>
				<td >{{totalMicrowaveMap.marketStaff}}</td>
				<td >{{totalMicrowaveMap.marketStudent}}</td>
				<td >{{totalMicrowaveMap.kentL1Staff}}</td>
				<td >{{totalMicrowaveMap.kentL1Student}}</td>
				<td >{{totalMicrowaveMap.kentL5Staff}}</td>
				<td >{{totalMicrowaveMap.kentL5Student}}</td>
				<td >{{totalMicrowaveMap.total}}</td>
			</tr>
		</table>
		<br/>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<th rowspan="2" class="">Office</th>
				<th colspan="2" >Market</th>
				<th colspan="2" >Kent Lv1</th>
				<th colspan="2" >Kent Lv5</th>
				<th></th>
			</tr>
			<tr>
				<th >Lecture/Staff</th>
				<th >Student</th>
				<th >Lecture/Staff</th>
				<th >Student</th>
				<th >Lecture/Staff</th>
				<th >Student</th>
				<th >Total</th>
			</tr>
			<tr>
				<td class="">Telephone</td>
				<td >{{totalTelephoneMap.marketStaff}}</td>
				<td >{{totalTelephoneMap.marketStudent}}</td>
				<td >{{totalTelephoneMap.kentL1Staff}}</td>
				<td >{{totalTelephoneMap.kentL1Student}}</td>
				<td >{{totalTelephoneMap.kentL5Staff}}</td>
				<td >{{totalTelephoneMap.kentL5Student}}</td>
				<td >{{totalTelephoneMap.total}}</td>
			</tr>
			<tr>
				<td class="">Printer</td>
				<td >{{totalPrinterMap.marketStaff}}</td>
				<td >{{totalPrinterMap.marketStudent}}</td>
				<td >{{totalPrinterMap.kentL1Staff}}</td>
				<td >{{totalPrinterMap.kentL1Student}}</td>
				<td >{{totalPrinterMap.kentL5Staff}}</td>
				<td >{{totalPrinterMap.kentL5Student}}</td>
				<td >{{totalPrinterMap.total}}</td>
			</tr>
			<tr>
				<td class="">Shreder</td>
				<td >{{totalShrederMap.marketStaff}}</td>
				<td >{{totalShrederMap.marketStudent}}</td>
				<td >{{totalShrederMap.kentL1Staff}}</td>
				<td >{{totalShrederMap.kentL1Student}}</td>
				<td >{{totalShrederMap.kentL5Staff}}</td>
				<td >{{totalShrederMap.kentL5Student}}</td>
				<td >{{totalShrederMap.total}}</td>
			</tr>
			<tr>
				<td class="">Laminator</td>
				<td >{{totalLaminatorMap.marketStaff}}</td>
				<td >{{totalLaminatorMap.marketStudent}}</td>
				<td >{{totalLaminatorMap.kentL1Staff}}</td>
				<td >{{totalLaminatorMap.kentL1Student}}</td>
				<td >{{totalLaminatorMap.kentL5Staff}}</td>
				<td >{{totalLaminatorMap.kentL5Student}}</td>
				<td >{{totalLaminatorMap.total}}</td>
			</tr>
			<tr>
				<td class="">Fax</td>
				<td >{{totalFaxMap.marketStaff}}</td>
				<td >{{totalFaxMap.marketStudent}}</td>
				<td >{{totalFaxMap.kentL1Staff}}</td>
				<td >{{totalFaxMap.kentL1Student}}</td>
				<td >{{totalFaxMap.kentL5Staff}}</td>
				<td >{{totalFaxMap.kentL5Student}}</td>
				<td >{{totalFaxMap.total}}</td>
			</tr>
			<tr>
				<td class="">EFTPOS Machine</td>
				<td >{{totalEFTPOSMap.marketStaff}}</td>
				<td >{{totalEFTPOSMap.marketStudent}}</td>
				<td >{{totalEFTPOSMap.kentL1Staff}}</td>
				<td >{{totalEFTPOSMap.kentL1Student}}</td>
				<td >{{totalEFTPOSMap.kentL5Staff}}</td>
				<td >{{totalEFTPOSMap.kentL5Student}}</td>
				<td >{{totalEFTPOSMap.total}}</td>
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

  <div class="w3-container">
    <h5>Recent Comments</h5>
    <div class="w3-row">
      <div class="w3-col m2 text-center">
<!--         <img class="w3-circle" src="/w3images/avatar3.png" style="width:96px;height:96px"> -->
      </div>
      <div class="w3-col m10 w3-container">
        <h4>Chris <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
        <p>Hi Michael, hope this guy do your job properly :)</p><br>
      </div>
    </div>
  </div>
  <br>
  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
    <p>Powered by Raspberry Pi, Java, Spring Framework, Angular1.6, <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
  </footer>

  <!-- End page content -->
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
$(document).ready(function() {
	console.log("Hi");
});

</script>

</body>
</html>
