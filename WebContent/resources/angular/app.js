  var app = angular.module("myComputerList", []);
  app.controller("myCtrl", function($scope) {
	  $scope.master = {};
	  $scope.pcs= $list;

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
	  $scope.memory = ["4GB",
		  			   "8GB",
		  			   "16GB",
		  			   "8GB DDR4 2400Mhz"];
		  				  
	  $scope.update = function(computer) {
	  	$scope.master = angular.copy(computer);
	  };
      
      $scope.reset = function() {
    	  $scope.computer = angular.copy($scope.master);
      };
      
      $scope.reset();
      
      $scope.nextId = function() {
    	  i = $scope.pcs.length + 1;
    	  return "H-" + i;
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
    	          .title('Would you like to delete your debt?')
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
	console.log(confirm("Are you sure to delete?"));
	return $.confirm("Are you sure?");
}

function lastEdit() {
    var x = document.lastModified;
    document.getElementById("updateDate").innerHTML = x;
}

function markBroken() {
	stockId.style.opacity = "1.0";
}

function itMode() {
    var it_1 = document.getElementById('it_1');
    var it_2 = document.getElementById('it_2');
    var it_3 = document.getElementById('it_3');
    var it_4 = document.getElementById('it_4');
    var it_5 = document.getElementById('it_5');
    var it_6 = document.getElementById('it_6');
    var it_7 = document.getElementById('it_7');
    
    var parent = it_1.parentNode;
    
    parent.removeChild(it_1);
    parent.removeChild(it_2);
    parent.removeChild(it_3);
    parent.removeChild(it_4);
    parent.removeChild(it_5);
    parent.removeChild(it_6);
    parent.removeChild(it_7);
    
    console.log("Parent" + parent);

}