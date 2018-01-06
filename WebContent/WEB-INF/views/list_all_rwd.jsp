<!DOCTYPE html>
<html>
<title>KOI Inventory</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
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
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}
.NOT_USING {
	text-decoration: line-through;
	color: orange;
}
.OK {
	font-weight: bold;
	color: #4169E1;
}
.BROKEN {
	text-decoration: line-through;
	color: red;
}
.DISCARD {
	text-decoration: line-through;
	color: grey;
}
</style>
<body class="w3-light-grey" ng-app="myComputerList" ng-controller="myCtrl">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
	<button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
	<span class="w3-bar-item w3-right">KOI Inventory</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:200px;" id="mySidebar"><br>
	<div class="w3-container w3-row">
		<div class="w3-col s4">
			<a href="./"><img class="" src='resources/img/koi_logo.png' style="width:50px;height:40px;" align="middle"></a>
	</div>
	 <div class="w3-col s8 w3-bar">
		<span>Hi, <strong>Michael</strong></span><br>
<!--			 <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
		<a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
		<a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a> -->
	</div>
	</div>
	<hr>
	<div class="w3-container">
	<h5>Inventory</h5>
	</div>
	<div class="w3-bar-block">
	<a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>Close Menu</a>
	<a href="./list_all" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-database fa-fw"></i>All</a><br>
	<a href="./list_desktop" class="w3-bar-item w3-button w3-padding"><i class="fa fa-desktop fa-fw"></i>Desktop</a>
	<a href="./list_laptop" class="w3-bar-item w3-button w3-padding"><i class="fa fa-laptop fa-fw"></i>Laptop</a>
	<a href="./list_monitor" class="w3-bar-item w3-button w3-padding"><i class="fa fa-tv fa-fw"></i>Monitor</a>
	<a href="./list_printer" class="w3-bar-item w3-button w3-padding"><i class="fa fa-print fa-fw"></i>Printer</a>
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
					<td><i class="fa fa-database w3-xxlarge"></i></td>
					<td><h3	>Total : {{list.length}}</h3></td>
					<td><h3>Found : {{filtered.length}}</h3></td>
				</tr>
			</table>
			<input type="search" id="search" placeholder="Enter Keyword..." style="width: 400px; height: 40px;" ng-model="$ctrl.query"/>
			<button class="button_small" onclick="myFunction()" style="width: 100px; height: 40px;">Clear</button>
			<button ng-click="setTab('create-koiMaterial')" style="width: 100px; height: 40px;">Create</button>
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
		<table id="mainTable" class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
			<tr>
				<th>
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
				<th><button id="btnExport" onclick="exportToExcel()" style="width: 120px; height: 28px;"><i class="fa fa-file-excel-o fa-fw"></i> Export</button></th>
				<th>
				<th>
				<th>
				<th>
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
				<td></td>
				<td></td>
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

	<div class="w3-container">
	<h5>Recent Comments</h5>
	<div class="w3-row">
		<div class="w3-col m2 text-center">
<!--				 <img class="w3-circle" src="/w3images/avatar3.png" style="width:96px;height:96px"> -->
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
	$scope.list = ${objects};

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
function sortTable(n) {
	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
	table = document.getElementById("mainTable");
	switching = true;
	//Set the sorting direction to ascending:
	dir = "asc"; 
	/*Make a loop that will continue until
	no switching has been done:*/
		while (switching) {
		//start by saying: no switching is done:
			switching = false;
			rows = table.getElementsByTagName("TR");
			/*Loop through all table rows (except the
			first, which contains table headers):*/
			for (i = 1; i < (rows.length - 1); i++) {
			//start by saying there should be no switching:
			shouldSwitch = false;
			/*Get the two elements you want to compare,
			  one from current row and one from the next:*/
			x = rows[i].getElementsByTagName("TD")[n];
			y = rows[i + 1].getElementsByTagName("TD")[n];
			/*check if the two rows should switch place,
			based on the direction, asc or desc:*/
			if (dir == "asc") {
				if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
				//if so, mark as a switch and break the loop:
				shouldSwitch= true;
				break;
				}
			} else if (dir == "desc") {
				if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
				//if so, mark as a switch and break the loop:
				shouldSwitch= true;
				break;
				}
			}
			}
			if (shouldSwitch) {
			/*If a switch has been marked, make the switch
			and mark that a switch has been done:*/
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			//Each time a switch is done, increase this count by 1:
			switchcount ++;	
			} else {
			/*If no switching has been done AND the direction is "asc",
			set the direction to "desc" and run the while loop again.*/
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
			}
		}
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
$( document ).ready(function() {
	$(".toggleDelBtn").click(function () {
		var id = this.closest('tr').id;
		var element = document.getElementById(id);
		element.style.setProperty("text-decoration", "line-through");
		element.style.color = "red";
	});
});
</script>

</body>
</html>
