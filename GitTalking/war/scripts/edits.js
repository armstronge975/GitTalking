//everything placed in a document ready function. only executes after page finishes loading.
$(document).ready(function(){
	
	//edit profile info on timeline
	$("#btnEdit").click(function(){
		var newInfo
		if(this.value == "Edit Profile Information") {
			this.value = "Click Again When Done"
			newInfo = document.createElement("textarea");
			var oldInfo = $("#about").text();
			$("#about").append(newInfo);
			newInfo.value = oldInfo;
		}
		else {
			var newTxt = newInfo.value;
			$("#about").text(newTxt);
			newInfo.remove();
			this.value="Edit Profile Information";
		}
	});
	
	
});