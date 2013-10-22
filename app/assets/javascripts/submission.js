$(document).ready(function(){
	$('.my-code-area').ace({ theme: 'chrome', lang: 'java'});
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

	$("#submission-detail a").click(function(){
		if($(this).html().trim()=="show details"){
			$("#submission-detail p").show();
			$(this).html("hide details");
		}
		else{
			$("#submission-detail p").hide();
			$(this).html("show details");
		}
	});

	$(".toggle-dw").click(function(){
		if($(".toggle-dw i").hasClass("icon-certificate")){
			$(".toggle-dw i").attr("class", "icon-adjust");
			$("div .code-dark").attr("class", "code-white");
		}
		else{
			$(".toggle-dw i").attr("class", "icon-certificate");
			$("div .code-white").attr("class", "code-dark");
		}

	});

    //init
	
	var decorator = $('.my-code-area').data('ace');
	if(decorator && decorator.editor){
		var aceInstance = decorator.editor.ace;
		aceInstance.renderer.setShowPrintMargin(false);
		aceInstance.renderer.setHScrollBarAlwaysVisible(false);
	}
	// change submission result color 
	if($("#submission-result").html()!==undefined){
		if( $("#submission-result").html().trim() == "Passed"){
			$("#submission-result").css("color","#33CC66");
		}else if($("#submission-result").html().trim() == "Pending"){
			$("#submission-result").css("color","#33CCFF");
		}else{
        $("#submission-result").css("color","#FF0033");
    }
	}
	$("#submission-detail p").hide();
	prettyPrint();
});