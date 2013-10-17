$(document).ready(function(){
	$(".show-description").click(function() {
		if($(".problem-description").is(":visible")){
			$(".problem-description").hide();
			$(".show-description").html("show");
		}
		else{
			$(".problem-description").show();
			$(".show-description").html("hide");
		}
	});
});