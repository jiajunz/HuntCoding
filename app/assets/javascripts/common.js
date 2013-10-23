function change_submission_result_color(){
    if($("#submission-result").html() !== undefined) {
    if($("#submission-result").html().trim() == "Passed") {
    $("#submission-result").css("color","#33CC66");
    }else if ($("#submission-result").html().trim() == "Pending") {
    $("#submission-result").css("color","#33CCFF");
    }else {
            $("#submission-result").css("color","#FF0033");
        }
    }
}

function run_judge_submission(id){
    $(".get-result").hide();
    //ajax
    $.ajax({
        url:'/judgesubmission',
    data: {"id":id},
    dataType:"json",
    type:"POST",
    }).success(function(data){
        $("#submission-result").html(data["result"]);
        var psstr = "Testcase pass/fail: passed "+data["passed"] + " of " + data["total"] + "tests";
        $(".get-result #pass-fail").html(psstr);
        success_perc = data["passed"]*100/data["total"];
        fail_perc = 100 - success_perc;
        $(".progress .bar-success").css("width",success_perc+"%");
        $(".progress .bar-danger").css("width",fail_perc+"%");
        $("#submission-detail p").html(data["detail"]);
        $(".result-pending").hide();
        $(".get-result").show();
       if((data["result"] != "Passed") && (data["result"] != "Incorrect Answer")) {
            $(".get-result #pass-fail").hide();
        }
        change_submission_result_color();
       });
}