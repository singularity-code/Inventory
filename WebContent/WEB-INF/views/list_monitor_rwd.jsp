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
.NEW {
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
	<a href="./list_monitor" class="w3-bar-item w3-button w3-padding  w3-blue"><i class="fa fa-tv fa-fw"></i>Monitor</a>
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
					<td><i class="fa fa-tv w3-xxlarge"></i></td>
					<td><h3	>MONITOR : {{filtered.length}}</h3></td>
				</tr>
			</table>
			<input type="search" id="search" placeholder="Enter Keyword..." style="width: 400px; height: 40px;" ng-model="$ctrl.query"/>
			<select id="selectCampus" style="width: 200px; height: 40px;" onchange=selectCampus()>
				<option>Market</option>
				<option>Kent</option>
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
				<input class="simple-form" type="text" name="type" readonly="readonly" value="Monitor">
				<input class="simple-form" type="text" placeholder="Name" ng-model="koiMaterial.name" name="name" required/>
				<input class="simple-form" type="text" placeholder="User" ng-model="koiMaterial.user" name="user" required/>
				<p>
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
				<th>
				<th onclick="sortTable(1)">Idx</th>
				<th onclick="sortTable(2)">S/N</th>
				<th onclick="sortTable(3)">ID</th>
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
				<th>
				<th><button id="btnExport" onclick="exportToExcel()" style="width: 120px; height: 28px;"><i class="fa fa-file-excel-o fa-fw"></i> Export</button></th>
			</tr>
			<tr class={{obj.status}} id={{obj.id}} ng-repeat="obj in list | filter:$ctrl.query as filtered ">
				<td><i class="fa fa-tv w3-large"></i></td>
				<td>{{obj.index}}</td>
				<td>{{obj.sn}}</td>
				<td>{{obj.id}}</td>
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
				return "HM-100" + nextNum;
			} else {
				return "HM-10" + nextNum;
			}
		} else if (type == 'studentDesktop') {
			if(length < 100) {
				return "HM-100" + nextNum;
			} else {
				return "HM-10" + nextNum;
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
function selectCampus() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("selectCampus");
	filter = input.value.toUpperCase();
	table = document.getElementById("mainTable");
	tr = table.getElementsByTagName("tr");
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[8];
		if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
					tr[i].style.display = "none";
			}
		}
	}
}
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
