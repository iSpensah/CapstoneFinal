/**
 * 
 */

var current = new Date();
window.onload = (event) => {
	
	var date = current.getFullYear()+'-'+(current.getMonth()+1)+'-'+current.getDate();
	var time = current.getHours() + '-' + current.getMinutes() + '-' + current.getSeconds();
	
	current = date + " " + time;
	
	document.getElementById("date").value = current;
};
