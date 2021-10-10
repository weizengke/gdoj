var popTimes = 0;

$(document).ready(function(){
	$(document).on("click",".view-source",function(){
		$(".pop-inner-div p.pop-div-note").html("<img src='img/loader.gif'>");
		$(".pop-inner-div p.pop-div-content").html(""); 
		$(".pop-inner-div .pop-div-source").html("");			
		 var solutionId = $(this).attr("solutionId");	 
		 var scrollTop = window.pageYOffset||document.documentElement.scrollTop || document.body.scrollTop;
		 var topPosInner = 60 + scrollTop;
		 document.getElementById('pop-inner-div').style.top= topPosInner +'px';
		 document.getElementById('pop-div').style.top= scrollTop +'px';

		 document.documentElement.style.overflowY = 'hidden';
		 $(".pop-div").fadeIn(); 
		 $(".pop-inner-div").fadeIn();
		popTimes++;

		 var opt="";
		 $.getJSON("viewsource",{solutionId: solutionId},function(json){
			 	if (json.success != true) {
	            	$(".pop-inner-div p.pop-div-note").html("<b>"+json["error"]+"</b>");
	            	return false;
	            }
	         	$(".pop-inner-div p.pop-div-note").html("");
	         	
	         	opt+="By:<b><a style='color:#00C;' href='profile/"+json.solution.username+"'"
	         			+ " class='rated-user user-rate-" + json.solution.user.rate + " user-tip'"
	         			+ " user='" + json.solution.username +"'>" 
	         			+ json.solution.username+ "</a></b>, ";
	
				if(json.solution.contest_id>0){
					opt+="At <a style='color:#00C;' title='"+json.contestTitle+"' href='contest/"+json.solution.contest_id+"/problem/"+ json.problemId +"'>" + json.problemId + ". " + json.problemTitle + "</a>";
				}else{
					opt+="At <a style='color:#00C;' href='problemset/problem/"+ json.problemId +"'>" + json.problemId + ". " + json.problemTitle + "</a>";
				}										
	         	
	         	opt+=", <span class='";
	         	if(json.solution.verdict==5){
	         		opt+="verdict_ac";
	         	}else if(json.solution.verdict==3){
	         		opt+="verdict_ce";
	         	}else if(json.solution.verdict==10){
	         		opt+="verdict_pe";
	         	}else if(json.solution.verdict < 5){
	         		opt+="verdict_prev";
	         	}else{
	         		opt+="verdict_other";
	         	}
	         	opt+="'>";
	         	
	         	if(json.solution.verdict==3){
	         		opt+="<a style='color:#00C;' solutionId='"+ json.solution.solution_id +"' class='viewCompileInfo' href='view-compileinfo/"+ json.solution.solution_id + "'>" + json.verdict + "</a>";
	         	}else {
	         		opt+=json.verdict ;
					if(json.solution.verdict==5){
					}
					else if(json.solution.verdict==4){
						opt += " on test "+json.solution.testcase;
					}else if(json.solution.verdict>5){
						opt += " on test "+json.solution.testcase;
					}						
	         	}		         	 		
	         	opt+="</span>";
	         	opt+="&nbsp;&nbsp;<a title='Open at new window' href='view-source/"+json.solutionId+"' target='_blank' >#</a>"
	         	opt+="<hr>";
	         	opt+="<pre class='prettyprint'>";
	            opt+=json.solutionSource.source;
	            opt+="</pre>";
				$(".pop-inner-div .pop-div-source").html(opt);
				
				opt="<h5>Judge Log:</h5>" ;
				opt+="<pre class='prettyprint'>";
				opt+=json.judgeLog;
	            opt+="</pre>";
				
				$(".pop-inner-div .pop-div-judgelog").html(opt);
	   			prettyPrint();	
	   		 }); 
	   		 return false;
	    });

	$(document).on("click",".viewCompileInfo",function(){
		$(".pop-inner-div p.pop-div-note").html("<img src='img/loader.gif'>");
		$(".pop-inner-div p.pop-div-content").html(""); 
		$(".pop-inner-div .pop-div-source").html("");			
		var solutionId = $(this).attr("solutionId");
		var scrollTop = window.pageYOffset||document.documentElement.scrollTop || document.body.scrollTop;
		var topPosInner = 60 + scrollTop;
		document.getElementById('pop-inner-div').style.top= topPosInner +'px';
		document.getElementById('pop-div').style.top= scrollTop +'px';

		popTimes++;
		$(".pop-div").fadeIn(); 
		$(".pop-inner-div").fadeIn();
		document.documentElement.style.overflowY = 'hidden';
		 var opt="";
		 $.getJSON("viewcompileinfo",{solutionId: solutionId},function(json){ 	
            if (json.success != true) {
            	$(".pop-inner-div p.pop-div-note").html("<b>"+json["error"]+"</b>");
            	return false;
            }
         	$(".pop-inner-div p.pop-div-note").html("");
         	opt+="<a title='Open at new window'style='color:#00C;' href='view-compileinfo/"+ json.solutionId + "'  target='_blank'>#"+ json.solutionId +"</a>";
            opt+="<pre class='code'>";
            opt+=json.errorInfo;
           	opt+="</pre><br>";
			$(".pop-inner-div .pop-div-source").html(opt);
   		 }); 
   		 return false;
	});

	$(".pop-div").click(function(){
		$(".pop-inner-div p.pop-div-content").html("");
		$(".pop-inner-div .pop-div-source").html("");
		$(".pop-inner-div .pop-div-judgelog").html("");
		$(".pop-div").fadeOut();
		$(".pop-inner-div").fadeOut();

		if (popTimes > 0) {
			popTimes--;
		}
		if (popTimes == 0){
			document.documentElement.style.overflowY = 'scroll';
		}
	});

	$(".view-submit-log").bind("dblclick", function() {
		var username = $(this).parent().attr("username");
		var problemId = $(this).attr("problemId");
		var contestId= $(this).attr("contestId");
		var scrollTop = window.pageYOffset||document.documentElement.scrollTop || document.body.scrollTop;
		var topPosInner = 60 + scrollTop;
		document.getElementById('pop-standing-inner-div').style.top= topPosInner +'px';
		document.getElementById('pop-standing-div').style.top= scrollTop +'px';

		document.documentElement.style.overflowY = 'hidden';
		$(".pop-standing-div").fadeIn();
		$(".pop-standing-inner-div").fadeIn();
		popTimes++;

		$(".pop-standing-inner-div p.pop-standing-div-note").html("<img src='img/loader.gif'>");
		$(".pop-standing-inner-div .pop-standing-div-source").html("");
		$.getJSON("api/submission/query",{pageSize:100, contestId: contestId,problemId:problemId,contestOnly:1,username:username},function(json){
			if (json.success != true) {
				$(".pop-standing-inner-div p.pop-standing-div-note").html("<b>"+json["error"]+"</b>");
				return false;
			}
			$(".pop-standing-inner-div p.pop-standing-div-note").html("");
			var opt="<pre class='submissions'>";

			$.each(json.solutions, function(i, event) {
				opt+="&nbsp;"+json.solutions[i].timeSinceContestStart+" &nbsp;&nbsp;";

				if(problemId!=""){
					opt+="<a href='contest/"+contestId+"/problem/"+json.solutions[i].problemNum+"' target='_blank'>"+json.solutions[i].problemNum+"</a>&nbsp;&nbsp; ";
				}

				opt+="<span style=\"color:";

				if(json.solutions[i].status_description=="Accepted"){
					opt+="green;font-weight:bold;\">";
				}else if(json.solutions[i].status_description=="Compilation Error"){
					opt+="#000;\">";
				}
				else{
					opt+="#00A;\">";
				}
				opt+=json.solutions[i].status_description+"&nbsp;&nbsp;</span>  &rarr; ";
				opt+="<a solutionId=\""+json.solutions[i].solution_id+"\" class=\"view-source\" href=\"view-source/"+json.solutions[i].solution_id+"\" target=\"_blank\">#"+json.solutions[i].solution_id+"</a><br/>";

			});
			opt+="</pre><br>";
			$(".pop-standing-inner-div .pop-standing-div-source").html(opt);
		});
	});

	$(".pop-standing-div").click(function(){
		$(".pop-standing-inner-div p.pop-standing-div-content").html("");
		$(".pop-standing-inner-div .pop-standing-div-source").html("");
		$(".pop-standing-div").fadeOut();
		$(".pop-standing-inner-div").fadeOut();

		if (popTimes > 0) {
			popTimes--;
		}
		if (popTimes == 0){
			document.documentElement.style.overflowY = 'scroll';
		}
	});

	$("a.re-judge").click(function() {
		if(confirm('WARNING! Do you really want to rejudge this submission?')){
		} else {
			return false;
		}
	}); 
});