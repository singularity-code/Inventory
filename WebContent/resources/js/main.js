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
				return "HD-100" + nextNum;
			} else {
				return "HD-10" + nextNum;
			}
		} else if (type == 'studentDesktop') {
			if(length < 100) {
				return "HD-100" + nextNum;
			} else {
				return "HD-10" + nextNum;
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

function selectUser() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("selectUser");
	filter = input.value.toUpperCase();
	table = document.getElementById("mainTable");
	tr = table.getElementsByTagName("tr");
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[9];
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
	$(".chgStatToOk").click(function () {
		var id = this.closest('tr').id;
		var element = document.getElementById(id);
		element.style.color = "#4169E1";
	});
	$(".chgStatToNotUsing").click(function () {
		var id = this.closest('tr').id;
		var element = document.getElementById(id);
		element.style.setProperty("text-decoration", "line-through");
		element.style.color = "red";
	});
	$(".chgStatToBrokenBtn").click(function () {
		var id = this.closest('tr').id;
		var element = document.getElementById(id);
		element.style.setProperty("text-decoration", "line-through");
		element.style.color = "orange";
	});
	$(".chgStatToDiscardBtn").click(function () {
		var id = this.closest('tr').id;
		var element = document.getElementById(id);
		element.style.setProperty("text-decoration", "line-through");
		element.style.color = "grey";
	});
});
</script>