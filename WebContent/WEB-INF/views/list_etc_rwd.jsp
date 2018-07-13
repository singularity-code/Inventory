<!DOCTYPE html>
<html>
<title>KOI Inventory</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/koiInventory.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet" >

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
	<a href="./list_desktop" class="w3-bar-item w3-button w3-padding"><i class="fa fa-desktop fa-fw"></i>Desktop</a>
	<a href="./list_laptop" class="w3-bar-item w3-button w3-padding"><i class="fa fa-laptop fa-fw"></i>Laptop</a>
	<a href="./list_monitor" class="w3-bar-item w3-button w3-padding"><i class="fa fa-tv fa-fw"></i>Monitor</a>
	<a href="./list_printer" class="w3-bar-item w3-button w3-padding"><i class="fa fa-print fa-fw"></i>Printer</a>
	<a href="./list_telephone" class="w3-bar-item w3-button w3-padding"><i class="fa fa-fax fa-fw"></i>Telephone</a>
	<a href="./list_itEtc" class="w3-bar-item w3-button w3-padding"><i class="fa fa-database fa-fw"></i>IT ETC</a>
	<a href="./list_etc" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-cubes fa-fw"></i>ETC</a>
	</div>
</nav>
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:200px;margin-top:43px;">
	<div class="w3-panel">
	<div class="w3-row-padding" style="margin:0 -16px">
	<!-- MenuBar (on top) -->
	<div class="center">
		<div align="left" style="margin-bottom: 15px; margin-top: 25px;">
			<table>
				<tr>
					<td><i class="fa fa-cubes w3-xxlarge"></i></td>
					<td><h3	>OTHER EQUIPMENT : {{filtered.length}}</h3></td>
				</tr>
			</table>
			<input type="search" id="search" placeholder="Enter Keyword..." style="width: 400px; height: 40px;" ng-model="$ctrl.query"/>
			<select id="selectCampus" style="width: 200px; height: 40px;" onchange=selectCampus()>
				<option>Sort By Campus</option>
				<option>Market</option>
				<option>Kent</option>
			</select>
			<select id="selectUser" style="width: 200px; height: 40px;" onchange=selectUser()>
				<option>Sort By User</option>
				<option>Students</option>
				<option>Lecturer</option>
			</select>
			<button class="button_small" ng-click="setTab(1)" style="width: 100px; height: 40px;">Search</button>
			<button class="button_small" onclick="clearSearch()" style="width: 100px; height: 40px;">Clear</button>
			<button onclick="toggle()" style="width: 100px; height: 40px;">Create</button>
		</div>
	</div>
		<div id="toggleTarget" style="display: none;">
			<div>
				<h3 class="">Create New</h3>
			</div>
			<form action="./create_koiMaterial" method="post" name="form">
				<input class="simple-form" type="text" name="index" readonly="readonly" value={{nextIndex()}}>
				<input class="simple-form" type="text" name="id" readonly="readonly" value={{nextId('staffDesktop')}}>
				
				<input class="simple-form" type="text" placeholder="Name" ng-model="koiMaterial.name" name="name" required/>
				<input class="simple-form" type="text" placeholder="User" ng-model="koiMaterial.user" name="user" required/>
				<p>
				<select class="simple-form" ng-model="koiMaterial.type" name="type" required>
					<option value="" disabled selected >Type</option>
					<option ng-repeat="x in type">{{x}}</option>
				</select>
				<input class="simple-form" type="text"  name="status" readonly="readonly" value="NEW"/>
				<select class="simple-form" ng-model="koiMaterial.campus" name="campus" required>
					<option value="" disabled selected >Campus</option>
					<option ng-repeat="x in campus">{{x}}</option>
				</select>
				<select class="simple-form" ng-model="koiMaterial.location" name="location" required>
					<option value="" disabled selected>Location</option>
					<option ng-repeat="x in location">{{x}}</option>
				</select>
				<select class="simple-form" ng-model="koiMaterial.brand" name="brand" required>
					<option value="" disabled selected>Brand</option>
					<option ng-repeat="x in brand">{{x}}</option>
				</select>
				<input class="simple-form" type="text" placeholder="Comment" ng-model="koiMaterial.comment" name="comment" size="25"  maxlength="25" required/>
				<p align="left">
					<span style="color:red" ng-show="form.name.$invalid || form.user.$invalid || form.status.$invalid  || form.brand.$invalid  || form.comment.$invalid 
						|| form.campus.$invalid || form.location.$invalid">Please enter all fields</span>
					<input type="submit" ng-click="createGeneral(koiMaterial)" 
						ng-disabled="form.name.$invalid || form.user.$invalid || form.status.$invalid  || form.brand.$invalid  || form.comment.$invalid 
						|| form.campus.$invalid || form.location.$invalid" value="Create"/>
					<input type="button"  onclick="toggle()" value="Close" />
				</p>
			</form>
			<pre>koiMaterial_draft = {{koiMaterial | json}}</pre>
		</div>
		<div class="w3-container">
		<table id="mainTable" class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<th onclick="sortTable(1)">Idx</th>
				<th width="80px" onclick="sortTable(2)">S/N</th>
				<th width="120px" onclick="sortTable(3)">ID</th>
				<th onclick="sortTable(4)">Type</th>
				<th onclick="sortTable(5)">Brand</th>
				<th onclick="sortTable(6)">Previous</th>
				<th onclick="sortTable(7)">Location</th>
				<th onclick="sortTable(8)">Campus</th>
				<th onclick="sortTable(9)">User</th>
				<th onclick="sortTable(10)">Status</th>
				<th onclick="sortTable(10)">Update Date</th>
				<th>Comment</th>
				<th>
				<th>
				<th>
				<th><button id="btnExport" onclick="exportToExcel()" style="width: 120px; height: 28px;"><i class="fa fa-file-excel-o fa-fw"></i> Export</button></th>
			</tr>
			<tr class={{obj.status}} id={{obj.id}} ng-repeat="obj in list | filter:$ctrl.query as filtered ">
				<td>{{obj.index}}</td>
				<td width="80px">{{obj.sn}}</td>
				<td width="120px">{{obj.id}}</td>
				<td>{{obj.type}}</td>
				<td>{{obj.brand}}</td>
				<td>{{obj.previous}}</td>
				<td>{{obj.location}}</td>
				<td>{{obj.campus}}</td>
				<td>{{obj.user}}</td>
				<td>{{obj.status}}</td>
				<td id="updateDate">{{obj.updatedate}}</td>
				<td>{{obj.comment}}</td>
				<td><a href="./update_view_KoiMaterial?id={{obj.id}}&type={{obj.type}}">Edit</a></td>
				<td><a type="checkbox" href="./chgStatToOk?id={{obj.id}}&type={{obj.type}}" class="chgStatToOkBtn" style="width: 50px; height: 25px;"><i class="fa fa-check fa-fw"></i></a></td>
				<td><a type="checkbox" href="./chgStatToNotUsing?id={{obj.id}}&type={{obj.type}}" class="chgStatToNotUsing" style="width: 50px; height: 25px;"><i class="fa fa-close fa-fw"></i></a></td>
				<td><a type="checkbox" href="./chgStatToBroken?id={{obj.id}}&type={{obj.type}}" class="chgStatToBrokenBtn" style="width: 50px; height: 25px;"><i class="fa fa-wrench fa-fw"></i></a></td>
				<td><a type="checkbox" href="./chgStatToDiscard?id={{obj.id}}&type={{obj.type}}" class="chgStatToDiscardBtn" style="width: 50px; height: 25px;"><i class="fa fa-trash-o fa-fw"></i></a></td>
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
</div>
<script>
var app = angular.module("myComputerList", []);
app.controller("myCtrl", function($scope) {
	$scope.list = ${objects};
	
	$scope.status = ["Brand New", "Good", "Not Good", "Malfunction", "Broken", "Not Using"]
	$scope.campus = ["Market", "Kent"];
	$scope.type = ["Projector", "Microwave", "TV", "Advertisement Board", "Fan", "Barcode Reader", "Refridgerator", "Laminator", "Board Alarm Sensor",
					"MIC", "Music Player", "Wine Refrigerator", "Mobile Phone", "EFTPOS Machine", "Monitor Stand", "FAX", "DSLR", "Fiber Optical Cable",
					"Air Conditioner", "CCTV", "Hand Dryer", "Coffee Machine"];
	$scope.location = ["Office", "Office(Accounting)", "Office(Admission)", "Office(Academic)", "Reception", "Office(Marketing)", "Board Room", "Ricard Office", "Print Bay",
		"Student Canteen", "Student Lounge", "Staff Kitchen","Lecture Office", "IT Office", "Server Room", "Marketing Store Room",
		"CR101&102", "CR101", "CR102", "CR103", "CR104", "CR105", "CR106", "CR107", "CR108", 
		"CR501", "CR502", "CR503", "CR504", "CR505", "CR506"];
	
	$scope.brand = ["APPLE", "ACER", "DELL", "HP", "LENOVO", "SAMSUNG", "SONY", "LG", "TOSHIBA", "PANASONC", "TEAC", "MITEL",
		"TP-LINK","NETGEAR","CISCO", "SMEG","OMEGA","Royal Severeign","WESTING"];

	$scope.update = function(computer) {
		$scope.master = angular.copy(computer);
	};

	$scope.close = function() {
			$scope.computer = angular.copy($scope.master);
	};

	$scope.nextId = function(type, user) {
		var length = $scope.list.length;
		var nextNum = length + 1;
		if(type === 'staffDesktop') {
			if(length < 100) {
				return "GE-100" + nextNum;
			} else {
				return "GE-10" + nextNum;
			}
		} else if (type == 'studentDesktop') {
			if(length < 100) {
				return "GE-100" + nextNum;
			} else {
				return "GE-10" + nextNum;
			}
		}
	}
	
	$scope.nextIndex = function() {
		return $scope.list.length + 1;
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
	};

	$scope.isSet = function(tabNum){
		return $scope.tab === tabNum;
	};
});
</script>

</body>
</html>
