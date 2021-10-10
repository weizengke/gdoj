
var IE6 = (navigator.userAgent.indexOf("MSIE 6")>=0) ? true : false;
if(IE6){
	$(function(){
		$("<div><p><br /><strong>Sorry! This page doesn't support Internet Explorer 6.</strong><br /><br />If you'd like to read our content please <a href='http://getfirefox.org'>upgrade your browser</a>.</p>"
				+"<p><br /><strong>You can use chrome , firefox or IE7! Thanks for your understanding!</strong></p>"
		)
		.css({
			backgroundColor: '#f8f8f8',
			'top': '50%',
			'left': '50%',
			marginLeft: -210,
			marginTop: -100,
			width: 410,
			paddingRight: 10,
			height: 200,
			'position': 'absolute',
			zIndex: 6000
		})
		.appendTo("body");
	});	
};

function getOs()   
{   
    var OsObject = "";   
    if(navigator.userAgent.indexOf("MSIE")>0) {   
         return "MSIE";   
    }   
    if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){   
         return "Firefox";   
    }   
    if(isSafari=navigator.userAgent.indexOf("Safari")>0) {   
         return "Safari";   
    }    
    if(isCamino=navigator.userAgent.indexOf("Camino")>0){   
         return "Camino";   
    }   
    if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0){   
         return "Gecko";   
    }   
 }   

function html_encode(str)   
{   
  var s = "";   
  if (str.length == 0) return "";   
  s = str.replace(/&/g, "&amp;");   
  s = s.replace(/</g, "&lt;");   
  s = s.replace(/>/g, "&gt;");   
  //s = s.replace(/ /g, "&nbsp;");   
  s = s.replace(/\'/g, "&#39;");   
  s = s.replace(/\"/g, "&quot;");   
  //s = s.replace(/\n/g, "<br>");   
  return s;   
}   

function html_decode(str)   
{   
  var s = "";   
  if (str.length == 0) return "";   
  s = str.replace(/&gt;/g, "&");   
  s = s.replace(/&lt;/g, "<");   
  s = s.replace(/&gt;/g, ">");   
  s = s.replace(/&nbsp;/g, " ");   
  s = s.replace(/&#39;/g, "\'");   
  s = s.replace(/&quot;/g, "\"");   
  s = s.replace(/<br>/g, "\n");   
  return s;   
}  

function OnlineJudge(){
	this.saveUrl = function(){
		var url = location.href; 
		$.ajax({
		    type: "POST",
		    url: "jsp/setsession.jsp", 
		    data: "url="+url,
		    success: function(){
		    }
		});
	}
	
    this.setCookie = function(name, value, exdays) {
    	var d = new Date();
    	d.setTime(d.getTime()+(exdays*24*60*60*1000));
    	var expires = "expires="+d.toGMTString();
        document.cookie = name + "=" + escape(value) + "; " + expires;
    };

    this.getCookie = function(name) {
        var prefix = name + "=";
        var from = document.cookie.indexOf(prefix);
        if (from < 0) {
            return null;
        } else {
            var to = document.cookie.indexOf(";", from + prefix.length);
            if (to < 0) {
                to = document.cookie.length;
            }
            return unescape(document.cookie.substring(from + prefix.length, to));
        }
    };
	this.pingEx = function(interval, count) {
		if (count < 1000){
			$.post("ping", function(result){}, "json");
			setTimeout(function () { OnlineJudge.pingEx(interval * 2, count + 1); }, interval);
		}
	}
	this.ping = function() {
	     var count = 0;
	     var interval = 30000;
	     $.post("ping", function(result){}, "json");
		 setTimeout(function () { OnlineJudge.pingEx(interval * 2, count + 1); }, interval);
    };
    
    this.updateMails = function(seconds, count){
    	if (0 == seconds%60) {
    		$.post("new-mail-count", function(json) {    
    	        if (json.success == true) {   
    	        	count = json.nCount;   
    	        	$(".new-mail-count").html("("+count+")");         
    	        }	
    	    }, "json");
    		seconds = 1;
    	}
        if (count>0) {
            if (0 == seconds%2) {
       			$("#mails_nav").attr('src', 'img/mail_unread.png');
    	   	} else{
    	   		$("#mails_nav").attr('src', 'img/mail.png');
    	   	}
        }
    	setTimeout(function(){OnlineJudge.updateMails(seconds + 1, count);}, 1000);
    }

    this.statusReflesh = function(){
    	var loader = "&nbsp; <img alt='Loading...' src='img/loader.gif' style='vertical-align: middle;'/>";	
    	a = new Array();
    	for(var i = 1; i<5; i++){
    		if(i!=3){
    			 var results = $('.verdict[status='+i+'][manual=0]').each(function(i, el){
    	             var zz = $(el).attr('id').substring(7);
    	             a.push( zz );
    	     	 });
    		} 
    	};
    	if( a.length > 0 ){
    		$.ajax({type : "POST",
    				url : "api/status/query",
    				data : "ids=" + a.join(','),
    				dataType : 'json',
    				success : function(data) {
    					for ( var i = 0; i < data.status.length; i++) {
    					$("#status_" + data.status[i].solutionId).attr('status',
    							data.status[i].verdictId);
    					$("#time_" + data.status[i].solutionId).html(
    							data.status[i].time + " ms");
    					$("#memory_" + data.status[i].solutionId).html(
    							data.status[i].memory + " kb");

    					if (data.status[i].verdictId == 5) {
    						$("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_ac');
    					} else if (data.status[i].verdictId == 3) {
							$("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_ce');
						} else if (data.status[i].verdictId == 10) {
    						$("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_pe');
    					} else if (data.status[i].verdictId < 5) {
    						$("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_prev');
    					} else {
							$("#status_" + data.status[i].solutionId).attr('class', 'verdict verdict_other');
						}

						var url = "<a solutionId="+data.status[i].solutionId
							+" class=\"view-source\" href=\"view-source/"
							+ data.status[i].solutionId +"\" target=\"_blank\">"
							+ data.status[i].status_description+ "</a>";
						$("#status_" + data.status[i].solutionId).html(url);
    				}

    				window.setTimeout(OnlineJudge.statusReflesh, 5000);
    			}
    		});
    	}
    }
    
    this.reload = function() {
        window.location.reload();
    };

    this.redirect = function(link) {
        window.location = link;
    };
    this.parseSeconds = function (seconds) {
        var ap = 0;
        if (seconds.length == 9) {
            ap = seconds.charAt(0) - '0';
            seconds = seconds.substring(1);
        }
        if (seconds.length == 8 && seconds.charAt(2) == ':' && seconds.charAt(5) == ':') {
            var s = (seconds.charAt(7) - '0') + 10 * (seconds.charAt(6) - '0');
            var m = (seconds.charAt(4) - '0') + 10 * (seconds.charAt(3) - '0');
            var h = (seconds.charAt(1) - '0') + 10 * (seconds.charAt(0) - '0') + 100 * ap;
            return s + 60 * m + 60 * 60 * h;
        } else {
            return 0;
        }
    };

    this.formatSS = function(seconds) {
        if (seconds <= 9) {
            return "0" + seconds;
        } else {
            return seconds;
        }
    };

    this.formatSeconds = function(seconds) {
        var s = seconds % 60;
        seconds = (seconds - s) / 60
        var m = seconds % 60;
        var h = (seconds - m) / 60
        return OnlineJudge.formatSS(h) + ":" + OnlineJudge.formatSS(m) + ":" + OnlineJudge.formatSS(s);
    };
    
    this.countdown = function () {
        var now = new Date().getTime();
        var e = $(".countdown");
        var starts = new Array();
       
        var index = 0;
        e.each(function () {
            index++;
            $(this).attr("cdid", "i" + index);
        });

        var callback = function () {
            e.each(function () {
                var textBeforeRedirect = $(this).attr("textBeforeRedirect");
                var redirectUrl = $(this).attr("redirectUrl");
                var home = $(this).attr("home");
                var noRedirection = $(this).attr("noRedirection");

                var id = $(this).attr("cdid");
                var txt = $(this).text();
                var s = OnlineJudge.parseSeconds(txt);
                if (s > 0) {
                    if (starts[id] == undefined)
                        starts[id] = s;
                    var passed = Math.floor((new Date().getTime() - now) / 1000);
                    var val = starts[id] - passed;
                    if (val >= 0) {
                        $(this).text(OnlineJudge.formatSeconds(val));
                    }
                    if (val <= 0) {
                        if (noRedirection != "true" && noRedirection != "yes") {
                            if (textBeforeRedirect) {
                            	OnlineJudge.alert(textBeforeRedirect, function () {
                                    if (redirectUrl) {
                                        window.setTimeout(OnlineJudge.redirect(redirectUrl), Math.floor(Math.random() * 2000));
                                    } else {
                                        window.setTimeout(OnlineJudge.reload, Math.floor(Math.random() * 2000));
                                    }
                                });
                            } else {
                                if (redirectUrl) {
                                    window.setTimeout(OnlineJudge.redirect(redirectUrl), Math.floor(Math.random() * 5000));
                                } else {
                                    window.setTimeout(OnlineJudge.reload, Math.floor(Math.random() * 5000));
                                }
                            }
                        } else {
                            if (textBeforeRedirect) {
                            	OnlineJudge.alert(textBeforeRedirect);
                            }
                        }
                    }
                }
            });
            window.setTimeout(callback, 1000);
        };
        window.setTimeout(callback, 0);
    };
    
    this.ratingGragh = function(username) {
    	$.get("api/rating/"+username, function(json_data) {
    		var data = new Array();
    		var rating = new Array();
    		var rating_min = 99999;
    		var rating_max = 0;
    		var rating_max_date = 0;
    		
    		if (json_data.ratingList != null) {
    			for(var i = json_data.ratingList.length - 1; i >= 0 ; i--) {	
    					if (json_data.ratingList[i].rating < rating_min) {
    						rating_min = json_data.ratingList[i].rating;
    					}
    					if (json_data.ratingList[i].rating > rating_max) {
    						rating_max = json_data.ratingList[i].rating;
    						rating_max_date = Date.parse(new Date(json_data.ratingList[i].rating_date.replace("T", " ")));
    					}
    					rating.push([
    			            Date.parse(new Date(json_data.ratingList[i].rating_date.replace("T", " "))),
    			            json_data.ratingList[i].rating,
    			            json_data.ratingList[i].delta,
    			            json_data.ratingList[i].contest_id,
    			            json_data.ratingList[i].contest_name,
    			            json_data.ratingList[i].rank,
    			            json_data.ratingList[i].rate,
    			            json_data.ratingList[i].rating_title,
    			            json_data.ratingList[i].rating_date.replace("T", " "),
    			        ]);
    			}
    		}
    		data.push(rating);
    		data.push([
    	        [
    	            rating_max_date, rating_max
    	        ]
    	    ]);
    	    
    		var datas = [
    		    {label: username, data: data[0]},
    		    {clickable: false, hoverable: false, color: "red", data: data[1]}
    		];
    		
    		var markings = [
    		    { color: '#a00', lineWidth: 1, yaxis: { from: 3000 } },
    		    { color: 'red', lineWidth: 1, yaxis: { from: 2600, to: 2999 } },
    		    { color: '#FFD700', lineWidth: 1, yaxis: { from: 2200, to: 2599 } },
    		    { color: '#FF8C00', lineWidth: 1, yaxis: { from: 2050, to: 2199 } },
    		    { color: '#FF1493', lineWidth: 1, yaxis: { from: 1900, to: 2049 } },
    		    { color: '#f8f', lineWidth: 1, yaxis: { from: 1750, to: 1899 } },
    		    { color: '#aaf', lineWidth: 1, yaxis: { from: 1600, to: 1749 } },
    		    { color: '#77ddbb', lineWidth: 1, yaxis: { from: 1400, to: 1599 } },
    		    { color: '#7f7', lineWidth: 1, yaxis: { from: 1200, to: 1399 } },
    		    { color: '#ccc', lineWidth: 1, yaxis: { from: 0, to: 1199 } },
    		];
    		
    		var options = {
    		    lines: { show: true },
    		    points: { show: true },
    		    xaxis: { mode: "time" },
    		    yaxis: { min: (rating_min == 99999) ? 1000 : (rating_min - rating_min % 100 - 300), 
    		    		 max: (rating_max == 0) ? 2000 : (rating_max + 300 - rating_max%100), 
    		    		 ticks: [1200, 1400, 1600, 1750, 1900, 2050, 2200, 2600, 3000] },
    		    grid: { hoverable: true, markings: markings }
    		};
    		
    		var plot = $.plot($("#placeholder"), datas, options);
    		
    		function showTooltip(x, y, contents) {
    		    $('<div id="tooltip">' + contents + '</div>').css( {
    		        position: 'absolute',
    		        display: 'none',
    		        top: y - 20,
    		        left: x + 10,
    		        border: '1px solid #fdd',			        
    		        padding: '2px',
    		        'line-height': '16px',
    		        'font-size' : '11px',
    		        'background-color': '#fee',
    		        opacity: 0.80
    		    }).appendTo("body").fadeIn(200);
    		}
    		
    		var ctx = plot.getCanvas().getContext("2d");
    		
    		var prev = -1;
    		$("#placeholder").bind("plothover", function (event, pos, item) {
    		    if (item) {
    		        if (prev != item.dataIndex) {
    		            $("#tooltip").remove();
    		            var params = data[item.seriesIndex][item.dataIndex];            
    		            var total = params[1];
    		            var change = params[2] > 0 ? "+" + params[2] : params[2];
    		            var contestName = params[4];
    		            var contestId = params[3];
    		            var contestUrl = "contest/" + contestId + "/standings";
    		            var rank = params[5];
    		            var rate = params[6];
    		            var title = params[7];
    		            var time = params[8];
    		            var html = "= " + total + " (" + change + "), " + "<span class='rated-user user-rate-" + rate + "'>" + title + "</span>" + "<br/>"
    		                            + "Rank: " + rank + "<br/>"
    		                            + "<a href='" + contestUrl + "' title=' at "+ time + "'>" + contestName + "</a>";
    		            
    		            showTooltip(item.pageX, item.pageY, html);
    		            setTimeout(function () {
    		                $("#tooltip").fadeOut(200);
    		                prev = -1;
    		            }, 4000);
    		            prev = item.dataIndex;
    		        }
    		    }
    		});	
    	},"json");
    };
    
    this.userTip = function() {
		$(".user-tip").poshytip({	
			className: 'tip-whitesimple',
			alignTo: 'target',		
			alignX: 'right',
			alignY: 'bottom',
			offsetX: 5,
			offsetY: -45,
			content: function(updateCallback) {
				$.post("userInfo.action", { username:$(this).attr('user')} ,function(data){
				updateCallback(data);	
				});
				return "Loading...";		
			}
		});	
	};	

	this.onlineUsers = function() {
		$.post("api/online-users", function(json) {    
	        if (json.success != true) {
		        return;
	        }	
	        var size=0;
	        var opt="";   

	       	for(var i in json.online_users){	
				if (json.online_users[i].statusFlag == 0) {
					continue;
	 	 		}
	     		size++;	
				opt+="<b><a title='" + json.online_users[i].levelTitle  + 
						", Last visit at " + json.online_users[i].lastAccessTime + 
						"' href='profile/"+json.online_users[i].username + 
						"' class='rated-user user-rate-" + json.online_users[i].level + " user-tip'" +
						" user='" + json.online_users[i].username + "'>" +
						i + "</a></b> ";	 	
			}

			$(".user-sum").html(size);
			$("div.sidebar-online-users").html(opt);
	   },"json");
	};
}
OnlineJudge = new OnlineJudge();
;


