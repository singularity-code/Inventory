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
	<a href="./list_desktop" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-desktop fa-fw"></i>Desktop</a>
	<a href="./list_laptop" class="w3-bar-item w3-button w3-padding"><i class="fa fa-laptop fa-fw"></i>Laptop</a>
	<a href="./list_monitor" class="w3-bar-item w3-button w3-padding"><i class="fa fa-tv fa-fw"></i>Monitor</a>
	<a href="./list_printer" class="w3-bar-item w3-button w3-padding"><i class="fa fa-print fa-fw"></i>Printer</a>
	<a href="./list_mac" class="w3-bar-item w3-button w3-padding"><i class="fa fa-desktop fa-fw"></i>Mac</a>
	<a href="./list_telephone" class="w3-bar-item w3-button w3-padding"><i class="fa fa-fax fa-fw"></i>Telephone</a>
	<a href="./list_itEtc" class="w3-bar-item w3-button w3-padding"><i class="fa fa-database fa-fw"></i>IT ETC</a>
	<a href="./list_etc" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cubes fa-fw"></i>ETC</a>
	<a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>Settings</a><br><br>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <div class="w3-panel">
	<div class="w3-row-padding" style="margin:0 -16px">
	<!-- MenuBar (on top) -->
	<div class="center">
		<div align="left" style="margin-bottom: 15px; margin-top: 25px;">
			<input type="search" id="search" placeholder="Say Anything..." style="width: 400px; height: 40px;" ng-model="$ctrl.query"/>
			<button class="button_small" ng-click="setTab(1)" style="width: 100px; height: 40px;">Search</button>
			<button class="button_small" onclick="myFunction()" style="width: 100px; height: 40px;">Clear</button>
			<button ng-click="setTab('create-koiMaterial')" style="width: 100px; height: 40px;">Create</button>
			<a href="./" class="button_back"><i class="fa fa-reply fa-fw"></i></a>
			<h3>Total : {{filtered.length}}</h3>
		</div>
	</div>
	  <div ng-show="isSet('create-koiMaterial')">
		<div>
			<h3 class="">Create New</h3>
		</div>
		<div>
			<form novalidate class="simple-form" action="./create_koiMaterial" method="post" name="form">
				<input type="text" name="index" readonly="readonly" value={{nextIndex()}}>
				<input type="text" name="id" readonly="readonly" value={{nextId('staffDesktop')}}>
				<input type="text" placeholder="Name" ng-model="koiMaterial.name" name="name" required/>
				<input type="text" placeholder="User" ng-model="koiMaterial.user" name="user" required/>
				<input type="text" placeholder="Status" ng-model="koiMaterial.status" name="status" required/>
				<input type="text" name="type" readonly="readonly" value="Desktop">
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
	<div class="w3-container">
		<h5>DESKTOP</h5>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<td style="width: 170px;"><b>Barcode</b></td>
				<td style="width: 50px;"><b>Idx</b></td>
				<td style="width: 100px;"><b>S/N</b></td>
				<td style="width: 100px;"><b>ID</b></td>
				<td style="width: 100px;"><b>Type</b></td>
				<td style="width: 100px;"><b>Brand</b></td>
				<td style="width: 150px;"><b>Previous</b></td>
				<td style="width: 150px;"><b>Location</b></td>
				<td style="width: 150px;"><b>Campus</b></td>
				<td style="width: 150px;"><b>User</b></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white" ng-repeat="obj in desktops | filter:$ctrl.query as filtered ">
			<tr id="">
				<td style="width: 170px;"><a href="https://www.barcodesinc.com/generator/"><img src="https://www.barcodesinc.com/generator/image.php?code={{obj.id}}&style=197&type=C128B&width=154&height=50&xres=1&font=3" alt="the barcode printer: free barcode generator" border="0"></a></td>
				<td style="width: 50px;">{{obj.index}}</td>
				<td style="width: 100px;">{{obj.sn}}</td>
				<td style="width: 100px;">{{obj.id}}</td>
				<td style="width: 100px;">{{obj.type}}</td>
				<td style="width: 100px;">{{obj.brand}}</td>
				<td style="width: 150px;">{{obj.previous}}</td>
				<td style="width: 150px;">{{obj.location}}</td>
				<td style="width: 150px;">{{obj.campus}}</td>
				<td style="width: 150px;">{{obj.user}}</td>
				<td style="width: 150px;">
					<a href="./update_view_KoiMaterial?id={{obj.id}}&type={{obj.type}}">Edit</a>
					<a href="./deleteKoiMaterial?id={{obj.id}}&type={{obj.type}}" onclick="return delConfirm();" class="w3-right">Remove</a>
				</td>
			</tr>
			<tr>
				<td id="updateDate" style="width: 250px;">{{obj.updatedate}}</td>
				<td style="width: 300px;">{{obj.comment}}</td>
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
		<p>Test Test Test</p><br>
	  </div>
	</div>
  </div>
  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
	<p>Powered by Raspberry Pi, Java, Spring Framework, Angular1.6, <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
  </footer>

  <!-- End page content -->
</div>
<script>
var app = angular.module("myComputerList", []);
app.controller("myCtrl", function($scope) {
	$scope.desktops = ${objects};

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
	$scope.memory = ["4GB","8GB","16GB","8GB DDR4 2400Mhz"];

	$scope.update = function(computer) {
		$scope.master = angular.copy(computer);
	};

	$scope.reset = function() {
		  $scope.computer = angular.copy($scope.master);
	};

	$scope.reset();

	$scope.nextId = function(type, user) {
		if(type === 'staffDesktop') {
			i = $scope.desktops.length + 1;
			return "HD-10" + i;
		} else if (type == 'studentDesktop') {
			i = $scope.desktops.length + 1;
			return "HD-20" + i;
		}
	}
	
	$scope.nextIndex = function() {
		return $scope.desktops.length + 1;
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
