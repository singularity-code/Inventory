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