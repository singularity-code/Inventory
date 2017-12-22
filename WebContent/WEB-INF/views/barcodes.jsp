<!DOCTYPE html>
<html>
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

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:100px;margin-top:43px;">
	<table id="mainTable" class="">
			<tr height="28px"></tr>
			<tr ng-repeat="obj in list | filter:$ctrl.query as filtered ">
				<td width="250px"><a href="https://www.barcodesinc.com/generator/"><img src="https://www.barcodesinc.com/generator/image.php?code={{obj.id}}&style=197&type=C128B&width=200&height=56&xres=1&font=3" alt="the barcode printer: free barcode generator" border="0"></a></td>
				<td width="250px"><a href="https://www.barcodesinc.com/generator/"><img src="https://www.barcodesinc.com/generator/image.php?code={{obj.id}}&style=197&type=C128B&width=200&height=56&xres=1&font=3" alt="the barcode printer: free barcode generator" border="0"></a></td>
				<td width="250px"><a href="https://www.barcodesinc.com/generator/"><img src="https://www.barcodesinc.com/generator/image.php?code={{obj.id}}&style=197&type=C128B&width=200&height=56&xres=1&font=3" alt="the barcode printer: free barcode generator" border="0"></a></td>
			</tr>
	</table>
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
				return "HL-100" + nextNum;
			} else {
				return "HL-10" + nextNum;
			}
		} else if (type == 'studentDesktop') {
			if(length < 100) {
				return "HL-100" + nextNum;
			} else {
				return "HL-10" + nextNum;
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
</script>

</body>
</html>
