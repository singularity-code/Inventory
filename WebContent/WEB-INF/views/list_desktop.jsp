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
		<h3>Total : {{filtered.length}} Desktop</h3>
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
		<table id="switchTable" align="center" ng-repeat="obj in desktops | filter:$ctrl.query as filtered ">
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
				<td id="updateDate" style="width: 250px;">{{switch.updatedate}}</td>
				<td style="width: 150px;">
					<a href="./update_view_KoiMaterial?id={{obj.id}}&type={{obj.type}}"><i class="material-icons w3-xlarge">border_color</i></a>
					<a href="./deleteKoiMaterial?id={{obj.id}}&type={{obj.type}}" onclick="return delConfirm();" class="w3-right"><i class="material-icons w3-xlarge">close</i></a>
				</td>
			</tr>
		</table>
	</div>
	<div ng-show="isSet('create-computer')">
		<div>
			<h3>Create New Computer</h3>
		</div>
		<div>
			<form novalidate class="simple-form" action="./create_computer" method="post" name="form">
				<input type="text" name="id" readonly="readonly" value={{nextId('Computer')}}>

				<select ng-model="computer.campus" name="campus">
				<option value="" disabled selected >Campus</option>
				<option ng-repeat="x in campus">{{x}}</option></select>

				<select ng-model="computer.previous" name="previous">
				<option value="" disabled selected>Previous</option>
				<option ng-repeat="x in location">{{x}}</option></select>

				<select ng-model="computer.location" name="location" required>
				<option value="" disabled selected>Location</option>
				<option ng-repeat="x in location">{{x}}</option></select>

				<select ng-model="computer.type" name="type">
				<option value="" disabled selected>Type</option>
				<option value="Desktop">Desktop</option>
				<option value="Laptop">Laptop</option>
				</select>

				<select ng-model="computer.domain" name="domain">
				<option value="" disabled selected>Domain</option>
				<option value="KOI">KOI</option>
				<option value="STDKOI">STDKOI</option>
				</select>

				<selectng-model="computer.role" name="role">
				<option value="" disabled selected>Role</option>
				<option value="Staff">Staff</option>
				<option value="Student">Student</option>
				</select>

				<select ng-model="computer.os" name="os">
				<option value="" disabled selected>OS</option>
				<option value="Win7">Win7</option>
				<option value="Win10 Home">Win10 Home</option>
				<option value="Win10 Pro">Win10 Pro</option>
				<option value="Linux">Linux</option>
				</select>

				<select ng-model="computer.license" name="license">
				<option value="" disabled selected>License</option>
				<option value="Active">Active</option>
				<option value="Inactive">Inactive</option>
				</select>

				<select ng-model="computer.machineOnly" name="machineOnly">
				<option value="" disabled selected>Machine Only</option>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select>

				<select ng-model="computer.status" name="status">
				<option value="" disabled selected>Status</option>
				<option value="Active">Active</option>
				<option value="Inactive">Inactive</option>
				</select>

				<select ng-model="computer.officeActive" name="officeActive">
				<option value="" disabled selected>Office Activation</option>
				<option value="Active">Active</option>
				<option value="Inactive">Inactive</option>
				</select>

				<select ng-model="computer.bitDef" name="bitDef">
				<option value="" disabled selected>BitDefender</option>
				<option value="Active">Active</option>
				<option value="Inactive">Inactive</option>
				</select>

				<select ng-model="computer.brand" name="brand">
				<option value="" disabled selected>Brand</option>
				<option ng-repeat="x in brand">{{x}}</option></select>

				<select ng-model="computer.cpu" name="cpu">
				<option value="" disabled selected>CPU</option>
				<option ng-repeat="x in cpu">{{x}}</option></select>

				<select ng-model="computer.memory" name="memory">
				<option value="" disabled selected>Memory</option>
				<option ng-repeat="x in memory">{{x}}</option></select>

				<input type="text" placeholder="Computer Name" ng-model="computer.name"name="name" required/>
				<input type="text" placeholder="User" ng-model="computer.user" name="user" required/>
				<input type="text" placeholder="IP Address" ng-model="computer.ip" name="ip" required/>
				<input type="text" placeholder="Model" ng-model="computer.model" name="comModel" required/>
				<input type="text" placeholder="Serial No." ng-model="computer.serialNo" name="serialNumber" required/>
				<input type="text" placeholder="Product No." ng-model="computer.productNo" name="productNumber" required/>
				<input type="text" placeholder="Bios" ng-model="computer.bios" name="bios" required/>
				<input type="text" placeholder="Purchase Date" ng-model="computer.purchaseDate" name="purchaseDate" required/>
				<p style="color:red" ng-show="form.name.$invalid || form.user.$invalid || form.ip.$invalid || form.comModel.$invalid ||
												form.serialNumber.$invalid || form.productNumber.$invalid || form.bios.$invalid ||
												form.purchaseDate.$invalid">Please enter all fields</p>
				<p align="center">
				<input type="button" ng-click="reset()" value="Reset" />
				<input type="submit" ng-click="update(computer)"
					 ng-disabled="form.name.$invalid || form.user.$invalid || form.ip.$invalid || form.comModel.$invalid || form.serialNumber.$invalid ||
					 form.productNumber.$invalid || form.bios.$invalid || form.purchaseDate.$invalid" value="Create"/>
				</p>
			</form>
			<pre>computer_draft = {{computer | json}}</pre>
		</div>
	</div>
</div>
<script>
var app = angular.module("myComputerList", []);
app.controller("myCtrl", function($scope) {
	$scope.desktops = ${desktops};

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

	$scope.showConfirm = function(ev) {
			// Appending dialog to document.body to cover sidenav in docs app
			var confirm = $mdDialog.confirm()
				.title('Would you like to deleteComputer your debt?')
				.textContent('All of the banks have agreed to forgive you your debts.')
				.ariaLabel('Lucky day')
				.targetEvent(ev)
				.ok('Please do it!')
				.cancel('Sounds like a scam');

			$mdDialog.show(confirm).then(function() {
			$scope.status = 'You decided to get rid of your debt.';
			}, function() {
			$scope.status = 'You decided to keep your debt.';
			});
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
