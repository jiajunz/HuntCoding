$(document).ready(function(){

	$('.my-code-area').ace({ theme: 'chrome', lang: 'java', initialContent:"stub" });
	$("#hc-coding-panel-python").hide();

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

	$(".hc-select-inactive").click(function() {
		var tmp = $("#hc-select-active").html();
		var selected = $(this).html();
		$("#hc-select-active").html(selected);
		$(this).html(tmp);
		$("#hc-coding-panel-"+tmp).hide();
		//$("#hc-coding-panel-"+tmp+" textarea").hide();

		// remove the if of the textarea
		//$("#hc-coding-panel-"+tmp+" textarea").removeAttr('id');
		$("#hc-coding-panel-"+selected).show();
		// add id
		//$("#hc-coding-panel-"+selected+" textarea").attr('id','submission_code');
		//$("#hc-coding-panel-"+selected+" textarea").show();
		$("#hc-coding-panel-"+selected+" .my-code-area").ace({ lang: selected});

	});

});