$(document).ready(function(){$(".show-description").click(function(){$(".problem-description").is(":visible")?($(".problem-description").hide(),$(".show-description").html("show")):($(".problem-description").show(),$(".show-description").html("hide"))}),$(".hc-select-inactive").click(function(){var i=$("#hc-select-active").html(),e=$(this).html();$("#hc-select-active").html(e),$(this).html(i),$("#hc-coding-panel-"+i).hide(),$("#hc-coding-panel-"+e).show(),$("#hc-coding-panel-"+e+" .my-code-area").ace({lang:e})}),$("#submission-detail a").click(function(){"show details"==$(this).html().trim()?($("#submission-detail p").show(),$(this).html("hide details")):($("#submission-detail p").hide(),$(this).html("show details"))}),$(".toggle-dw").click(function(){$(".toggle-dw i").hasClass("icon-certificate")?($(".toggle-dw i").attr("class","icon-adjust"),$("div .code-dark").attr("class","code-white")):($(".toggle-dw i").attr("class","icon-certificate"),$("div .code-white").attr("class","code-dark"))}),$(".my-code-area").ace({theme:"chrome",lang:"java"}),$("#hc-coding-panel-python").hide();var i=$(".my-code-area").data("ace");if(i&&i.editor){var e=i.editor.ace;e.renderer.setShowPrintMargin(!1),e.renderer.setHScrollBarAlwaysVisible(!1)}"Passed"==$("#submission-result").html().trim()?$("#submission-result").css("color","#33CC66"):"Pending"==$("#submission-result").html().trim()?$("#submission-result").css("color","#33CCFF"):$("#submission-result").css("color","#FF0033"),$("#submission-detail p").hide(),prettyPrint()});