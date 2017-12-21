<!DOCTYPE html>
<html>
<title>KOI Inventory v0.5</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<style>
html,body,h1,h2,h3,h4,h5 {
	font-family: "Raleway", sans-serif
}
table, tr, td {
	text-align: center;
}
.simple-form {
	width: 60%;
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
</style>
<body class="w3-light-grey" ng-app="myComputerList" ng-controller="myCtrl">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>Menu</button>
<span class="w3-bar-item w3-right">KOI Inventory v0.4</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:200px;" id="mySidebar"><br>
	<div class="w3-container w3-row">
		<div class="w3-col s4">
		<a href="./"><img class="" src='resources/img/koi_logo.png' style="width:50px;height:40px;" align="middle"></a>
	</div>
	 <div class="w3-col s8 w3-bar">
		<span>Hi, <strong>Michael</strong></span><br>
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
	<a href="./list_itEtc" class="w3-bar-item w3-button w3-padding"><i class="fa fa-database fa-fw"></i>IT ETC</a>
	<a href="./list_etc" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cubes fa-fw"></i>ETC</a>
	<a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>Settings</a><br><br>
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
					<td><i class="fa fa-desktop w3-xxlarge"></i></td>
					<td><h3	>PRINTER : {{filtered.length}}</h3></td>
				</tr>
			</table>
			<input type="search" id="search" placeholder="Enter Keyword..." style="width: 400px; height: 40px;" ng-model="$ctrl.query"/>
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
				<input class="simple-form" type="text" name="type" readonly="readonly" value="Printer">
				<input class="simple-form" type="text" placeholder="Name" ng-model="koiMaterial.name" name="name" required/>
				<input class="simple-form" type="text" placeholder="User" ng-model="koiMaterial.user" name="user" required/>
				<p>
				<select class="simple-form" ng-model="koiMaterial.status" name="status" required>
					<option value="" disabled selected >Status</option>
					<option ng-repeat="x in status">{{x}}</option>
				</select>
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
		<table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<th>Barcode</th>
				<th>Idx</th>
				<th>S/N</th>
				<th>ID</th>
				<th>Type</th>
				<th>Brand</th>
				<th>Previous</th>
				<th>Location</th>
				<th>Campus</th>
				<th>User</th>
				<th>Update Date</th>
				<th>Comment</th>
			</tr>
			<tr ng-repeat="obj in list | filter:$ctrl.query as filtered ">
				<td style="width: 180px;"><a href="https://www.barcodesinc.com/generator/"><img src="https://www.barcodesinc.com/generator/image.php?code={{obj.id}}&style=197&type=C128B&width=154&height=50&xres=1&font=3" alt="the barcode printer: free barcode generator" border="0"></a></td>
				<td>{{obj.index}}</td>
				<td>{{obj.sn}}</td>
				<td>{{obj.id}}</td>
				<td>{{obj.type}}</td>
				<td>{{obj.brand}}</td>
				<td>{{obj.previous}}</td>
				<td>{{obj.location}}</td>
				<td>{{obj.campus}}</td>
				<td>{{obj.user}}</td>
				<td id="updateDate">{{obj.updatedate}}</td>
				<td>{{obj.comment}}</td>
				<td>
					<a href="./update_view_KoiMaterial?id={{obj.id}}&type={{obj.type}}">Edit</a>
					<a href="./deleteKoiMaterial?id={{obj.id}}&type={{obj.type}}" onclick="return delConfirm();" class="w3-right">Remove</a>
				</td>
				<td>
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
	$scope.location = ["Accounting", "Admission", "Academic", "Reception", "Marketing", "Board Room", "Ricard Office", "Print Bay",
						 "Student Canteen", "Lecture Office", "IT Office", "Library", "Libarray PrintBay", "Quiet Room",
						 "Server Room", "IT Store Room", "Marketing Store Room",
						 "M101&102","M103", "M104", "M105", "M106", "M107", "M108",
						 "K101&102", "K103", "K105", "K106"];
	$scope.brand = ["APPLE", "ACER", "DELL", "HP", "LENOVO", "SAMSUNG", "SONY","LG", "TOSHIBA"];

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
				return "EP-100" + nextNum;
			} else {
				return "EP-10" + nextNum;
			}
		} else if (type == 'studentDesktop') {
			if(length < 100) {
				return "EP-100" + nextNum;
			} else {
				return "EP-10" + nextNum;
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

function toggle() {
	var x = document.getElementById("toggleTarget");
	if (x.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
}

function clearSearch() {
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

//Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

//Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

//Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
	if (mySidebar.style.display === 'block') {
		mySidebar.style.display = 'none';
		overlayBg.style.display = "none";
	} else {
		mySidebar.style.display = 'block';
		overlayBg.style.display = "block";
	}
}

//Close the sidebar with the close button
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
