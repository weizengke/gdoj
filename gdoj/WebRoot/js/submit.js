var editor = null;
var submitting = false;
var username = document.getElementById('username').value;
var langMap = new Array();
/* 
language0=All
language1=MS C++
language2=MS C
language3=GNU C++
language4=GNU C
language5=Java
language6=C#
language7=F#
language8=Pascal
language9=Python
language10=Ruby
language11=Perl
language12=Lua
language13=Tcl
language14=Pike
language15=Haskell
language16=PHP
language17=BrainFuck
language18=Befunge
language19=GO
language20=Scala
language21=JavaScript
language22=Groovy
language23=Objective-c
*/
langMap[0] = "null";
langMap[1] = "cpp";
langMap[2] = "cpp";
langMap[3] = "cpp";
langMap[4] = "cpp";
langMap[5] = 'java';
langMap[6] = "csharp";
langMap[7] = "fsharp";
langMap[8] = "pascal";
langMap[9] = "python";
langMap[10] = "ruby";
langMap[11] = "perl";
langMap[12] = "lua";
langMap[13] = "tcl";
langMap[14] = "pike";
langMap[15] = "perl";
langMap[16] = "php";
langMap[17] = "java";
langMap[18] = "java";
langMap[19] = "go";
langMap[20] = "java";
langMap[21] = "javascript";
langMap[22] = "java";
langMap[23] = "objective-c";

var themeTbl = new Array();
themeTbl[0] = "vs";
themeTbl[1] = "vs-dark";
themeTbl[2] = "hc-black";

$(document).ready(function () {
	require(['vs/editor/editor.main'], function () {
		$(".theme-picker").change(function() {
			changeTheme();
		});
		$(".fontsize-picker").change(function() {
			changeFontsize();
		});	
		$(".lang-choice").change(function() {
			changeLanguage();
		});		
		$(".wordwrap-column").change(function() {
			changeWordWrap();
		});
	});

	var problemId = document.getElementById('problemId').value;
	var contestId = document.getElementById('contestId').value;	
	var name = username + "_lang_" + contestId + "_" + problemId;
	var language = 'cpp'
	var lang = window.localStorage.getItem(name);
	if (lang != null) {
		language = langMap[lang];
	}
	
	name = username + "_ide_theme";
	var theme = window.localStorage.getItem(name);
	if (theme == null) {
		theme = '0';
	}
	$('#theme-picker').val(theme);

	name = username + "_ide_fontsize";
	var fontSize = window.localStorage.getItem(name);
	if (fontSize == null) {
		fontSize = '13';
	}
	$('#fontsize-picker').val(fontSize);
	
	name = username + "_ide_wordwrapcolume";
	var wordwrapcolume = window.localStorage.getItem(name);
	if (wordwrapcolume == null) {
		wordwrapcolume = '80';
	}
	$('#wordwrap-column').val(wordwrapcolume);
	var wordwrapminified = 'true';
	var wordwrap = 'wordWrapColumn';
	if (wordwrapcolume == '0') {
		wordwrapminified = 'false';
		wordwrap = 'off';
	}
	
	editor = monaco.editor.create(document.getElementById("source"), {
		value: [].join('\n'),
		language: language,
		fontSize: fontSize+"px",
		theme: themeTbl[theme],
		wordWrap: wordwrap,
		wordWrapColumn: wordwrapcolume,
		wordWrapMinified: wordwrapminified,
	});
	
	function changeTheme() {
		var newTheme = document.getElementById('theme-picker').value;
		monaco.editor.setTheme(themeTbl[newTheme]);
		var name = username + "_ide_theme";
		window.localStorage.setItem(name, newTheme);
	}
	
	function changeFontsize() {
		var fontSize = document.getElementById('fontsize-picker').value;
		editor.updateOptions({
			fontSize: fontSize+"px"
		});
		var name = username + "_ide_fontsize";
		window.localStorage.setItem(name, fontSize);
	}
	
	function changeLanguage(langIndex) {
		var lang = document.getElementById('select_lang').value;
		editor.updateOptions({
			language: langMap[lang],
		});
	}
	
	function changeWordWrap() {
		var wordWrap = 'wordWrapColumn';
		var wordWrapMinified = 'true';
		var wordWrapColumn = document.getElementById('wordwrap-column').value;
		if (wordWrapColumn == '0') {
			wordWrap = 'off';
			wordWrapMinified = 'false';
		}
		editor.updateOptions({
			wordWrap: wordWrap,
			wordWrapColumn: wordWrapColumn,
			wordWrapMinified: wordWrapMinified,
		});
		
		name = username + "_ide_wordwrapcolume";
		window.localStorage.setItem(name, wordWrapColumn);		
	}
	
	function getElementById(id) {
		return document.getElementById(id);
	}

	var oBox = getElementById("problem-box");
	var oLeft = getElementById("problem-box-left");
	var oRight = getElementById("problem-box-right");
	var oDragbar = getElementById("problem-drag-bar");
	var oTestBox = getElementById("test-box");
	var oHeaderNavbar = getElementById("header-navbar");
	var oBottombarLeft = getElementById("bottom-bar-left");
	var oBottombarRight = getElementById("bottom-bar-right");
	var oIdeBoxNav = getElementById("ide-box-nav");
	var oTestBoxNavbar = getElementById("test-box-nav");
	var oTestInput = getElementById("input");
	var oTestOutput = getElementById("output");
	var oSrc = getElementById("source");
	var oProblemContent = getElementById("problem-content");
	var oIdeBox = getElementById("ide-box");

	function refleshSize() {
		oLeft.style.height = window.innerHeight - oHeaderNavbar.offsetHeight - oIdeBoxNav.offsetHeight + "px";
		oRight.style.height = window.innerHeight - oHeaderNavbar.offsetHeight + "px";
		oRight.style.left = oDragbar.offsetLeft + oDragbar.offsetWidth + "px";
		oRight.style.width = window.innerWidth - oDragbar.offsetLeft - oDragbar.offsetWidth + "px";
		oProblemContent.style.height = window.innerHeight - oHeaderNavbar.offsetHeight -
			oBottombarLeft.offsetHeight - oIdeBoxNav.offsetHeight + "px";
		oBottombarLeft.style.width = oDragbar.offsetLeft + "px";
		oBottombarRight.style.width = window.innerWidth - oDragbar.offsetLeft - oDragbar.offsetWidth + "px";
		oSrc.style.top = oHeaderNavbar.offsetHeight + oIdeBoxNav.offsetHeight + "px";
		oSrc.style.width = window.innerWidth - oDragbar.offsetLeft - oDragbar.offsetWidth + "px";
		oSrc.style.height = window.innerHeight - oHeaderNavbar.offsetHeight - oTestBox.offsetHeight -
		oBottombarRight.offsetHeight - oIdeBoxNav.offsetHeight + "px";
		oTestInput.style.width = window.innerWidth - oDragbar.offsetLeft - oDragbar.offsetWidth - 39 + "px";
		oTestOutput.style.width = window.innerWidth - oDragbar.offsetLeft - oDragbar.offsetWidth - 39 + "px";
		oIdeBox.style.height = window.innerHeight - oHeaderNavbar.offsetHeight -
			oIdeBoxNav.offsetHeight - oBottombarRight.offsetHeight + "px";
		if (editor) {
			editor.layout();
		}
	}

	window.onload = function () {
		refleshSize();
		oDragbar.onmousedown = function (e) {
			var disX = (e || event).clientX;
			oDragbar.left = oDragbar.offsetLeft;

			document.onmousemove = function (e) {
				var iT = oDragbar.left + ((e || event).clientX - disX);
				var e = e || window.event, tarnameb = e.target || e.srcElement;
				var maxT = oBox.clientWidth - oDragbar.clientWidth;
				oDragbar.style.margin = 0;
				iT < 0 && (iT = 0);
				iT > maxT && (iT = maxT);

				if (iT <= 400 || oBox.clientWidth - iT - 1 <= 350) {
					return false
				}

				oDragbar.style.left = oLeft.style.width = iT + "px";
				oRight.style.width = oBox.clientWidth - iT - oDragbar.offsetWidth + "px";
				oSrc.style.width = oBox.clientWidth - iT - oDragbar.offsetWidth + "px";
				oBottombarLeft.style.width = iT + "px";
				oBottombarRight.style.width = oBox.clientWidth - iT - oDragbar.offsetWidth + "px";
				oTestInput.style.width = window.innerWidth - oDragbar.offsetLeft - oDragbar.offsetWidth - 40 + "px";
				oTestOutput.style.width = window.innerWidth - oDragbar.offsetLeft - oDragbar.offsetWidth - 40 + "px";
				if (editor) {
					editor.layout();
				}
				return false
			};

			document.onmouseup = function () {
				document.onmousemove = null;
				document.onmouseup = null;
				oDragbar.releaseCapture && oDragbar.releaseCapture()
			};
			oDragbar.setCapture && oDragbar.setCapture();
			return false
		};
		oTestBoxNavbar.onmousedown = function (e) {
			var disY = (e || event).clientY;
			oTestBoxNavbar.top = oTestBoxNavbar.offsetTop;
			
			document.onmousemove = function (e) {
				var iT = oTestBoxNavbar.top + ((e || event).clientY - disY);
				var e = e || window.event, tarnameb = e.target || e.srcElement;
				var maxT = oBox.clientHeight;
				oTestBoxNavbar.style.margin = 0;
				iT < 0 && (iT = 0);
				iT > maxT && (iT = maxT);
				if (iT <= oHeaderNavbar.clientHeight + oIdeBoxNav.clientHeight) {
					return false
				}
				if (oBox.clientHeight - iT <= oBottombarRight.clientHeight + oTestBoxNavbar.clientHeight) {
					return false
				}
				
				oTestBoxNavbar.style.top = iT + "px";
				oTestBox.style.height = oBox.clientHeight - iT - oTestBoxNavbar.clientHeight - oBottombarRight.clientHeight + "px";
				oTestInput.style.height  = oBox.clientHeight - iT - oTestBoxNavbar.clientHeight - oBottombarRight.clientHeight - 20 + "px";
				oTestOutput.style.height  = oBox.clientHeight - iT - oTestBoxNavbar.clientHeight - oBottombarRight.clientHeight - 40 + "px";
				oSrc.style.height =  iT - oHeaderNavbar.clientHeight - oIdeBoxNav.clientHeight + "px";

				if (editor) {
					editor.layout();
				}
				return false
			};

			document.onmouseup = function () {
				document.onmousemove = null;
				document.onmouseup = null;
				oTestBoxNavbar.releaseCapture && oTestBoxNavbar.releaseCapture()
			};
			oTestBoxNavbar.setCapture && oTestBoxNavbar.setCapture();
			return false
		};		
	};
	window.onresize = function () {
		refleshSize();
	}

	var oInputMenu = document.getElementById("test-nav-tab-input");
	var oOutputMenu = document.getElementById("test-nav-tab-output");
	var oInputBox = document.getElementById("test-box-tb-input");
	var oOutputBox = document.getElementById("test-box-tb-output");
	function tabShowSwitch(input) {
		if (input == 1) {
			oInputBox.style.display = "inline";
			oOutputBox.style.display = "none";
			oInputMenu.setAttribute("class", "test-box-nav-tab test-box-nav-tab-cur");
			oOutputMenu.setAttribute("class", "test-box-nav-tab");
		} else {
			oInputBox.style.display = "none";
			oOutputBox.style.display = "inline";
			oInputMenu.setAttribute("class", "test-box-nav-tab");
			oOutputMenu.setAttribute("class", "test-box-nav-tab test-box-nav-tab-cur");
		}
	}
	oInputMenu.addEventListener("click", function () {
		tabShowSwitch(1);
	});
	oOutputMenu.addEventListener("click", function () {
		tabShowSwitch(0);
	});	

	function StatusQueryAckProc(data) {
		for ( var i = 0; i < 1; i++) {
			if (data.status[i].verdictId > 5) {
				var status_description = "";
				if (data.status[i].testCase > 0) {
					status_description = data.status[i].status_description + " on test " + data.status[i].testCase;
				} else {
					status_description = data.status[i].status_description;
				}
				$("#output-status").html("<span style='color: red'>" + status_description + "</span>" + 
				"<span style='color: grey'>" + ", time: " + data.status[i].time + " ms" +
					", memory: " + data.status[i].memory + " kb." + "</span>");
				document.getElementById('output').value = "";
				return true;
			}
			if (data.status[i].verdictId == 5) {
				$("#output-status").html("<span style='color: green'>" + data.status[i].status_description + "</span>" + 
				"<span style='color: grey'>" + ", time: " + data.status[i].time + " ms" +
					", memory: " + data.status[i].memory + " kb." + "</span>");
				document.getElementById('output').value = "";
				return true;
			}
			
			/* running */
			if (data.status[i].verdictId == 4) {
				if (data.status[i].testCase > 0) {
					document.getElementById('output').value = data.status[i].status_description + " on test "
															  + data.status[i].testCase;
				} else {
					document.getElementById('output').value = data.status[i].status_description;
				}
				return false;
			}

			if (data.status[i].verdictId == 3) {
				$("#output-status").html("<span style='color: blue'>" + data.status[i].status_description + "</span>");
				
				$.getJSON("viewcompileinfo",{solutionId: data.status[i].solutionId},function(json){ 	
					if (json.success != true) {
						document.getElementById('output').value = "Get compile infomation failed."
						return false;
					}
					document.getElementById('output').value = json.errorInfo;
				}); 
				return true;
			}
			if (data.status[i].verdictId < 3) {
				document.getElementById('output').value = data.status[i].status_description;
				return false;
			}
		}
		return false;
	}

	function SubmitCheck(sessionId) {
		a = new Array();
    	a.push( sessionId );
                   
    	if( a.length > 0 ){
    		$.ajax({type : "POST",
				url : "api/status/query",
				data : "ids=" + a.join(','),
				dataType : 'json',
				success : function(data) {
					var res = StatusQueryAckProc(data);
					if (res == false) {
						setTimeout(function () { SubmitCheck(sessionId); }, 2000);
					} else {
						$("#submitsolution").removeAttr("disabled");
					}
    			}
    		});
    	}
	}
	function TestCheck(sessionId, cnt) {
		if (cnt > 0) {
			cnt = cnt - 1;
			if (cnt == 0) {
				$("#output-status").html("<span style='color: red'>" + "Test timeout, please try again." + "</span>");
				$('#runsolution').removeAttr("disabled");
				return true;
			}

			if (cnt % 2 == 0) {
				setTimeout(function () { TestCheck(sessionId, cnt); }, 1000);
			} else {
				$.post(
					"api/submit/check", { sessionId: sessionId }, function (data) {
						if (data.success != true) {
							setTimeout(function () { TestCheck(sessionId, cnt); }, 1000);
						} else {
							if (data.result.verdict == "Compilation Error") {
								$("#output-status").html("<span style='color: blue'>" + data.result.verdict + "</span>");
								document.getElementById('output').value = data.result.compile_error;
							} else if (data.result.verdict == "Accepted"){
								$("#output-status").html("<span style='color: green'>" + "Run finish" + "</span>" + 
								"<span style='color: grey'>" + ", time: " + data.result.time + " ms" +
									", memory: " + data.result.memory + " kb." + "</span>");
								document.getElementById('output').value = data.result.output;
							} else {
								$("#output-status").html("<span style='color: red'>" + data.result.verdict + "</span>" + 
								"<span style='color: grey'>" + ", time: " + data.result.time + " ms" +
									", memory: " + data.result.memory + " kb." + "</span>");
								document.getElementById('output').value = data.result.output;
							}
							$("#runsolution").removeAttr("disabled");
						}
					},
					"json"
				);
			}
		}
	};

	$(".run-solution").click(function () {
		$('#runsolution').attr('disabled', 'disabled');

		tabShowSwitch(0);
		consoleSwitch(1);
		SaveCode();
		$("#output-status").html("<img src='img/loader.gif'>");
		document.getElementById('output').value = "";

		var source = editor.getValue();
		var input = document.getElementById('input').value;
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;
		var language = document.getElementById('select_lang').value;
		$.post("api/submit/test", { submit: 0, contestId: contestId, problemId: problemId, language: language, source: source, input: input }, function (data) {
			if (data.success != true) {
				$("#output-status").html("<span style='color: red'>" + "Testing failed, " + data.error  + "</span>");
				$("#runsolution").removeAttr("disabled");
			} else {
				setTimeout(function () { TestCheck(data.sessionId, 60); }, 1000);
			}
		}, "json");
		return false;
	});
	$(".submit-solution").click(function () {
		$('#submitsolution').attr('disabled', 'disabled');
		SaveCode();
		tabShowSwitch(0);
		consoleSwitch(1);
		$("#output-status").html("<img src='img/loader.gif'>");
		document.getElementById('output').value = "";
		
		var source = editor.getValue();
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;
		var language = document.getElementById('select_lang').value;
		$.post("api/submit", { submit: 1, contestId: contestId, problemId: problemId, language: language, source: source }, function (data) {
			if (data.success != true) {				
				$("#output-status").html("<span style='color: red'>" + "Submit failed, " + data.error  + "</span>");
				$('#submitsolution').removeAttr("disabled");
			} else {
				//document.getElementById('output').value = "Submit solution successfully.";
				//window.location = "problemset/status";
				showStatusTab(1);
				$("#output-status").html("<span style='color: green'>" + "Submit solution successfully." + "</span>");
				$('#submitsolution').removeAttr("disabled");
			}
		}, "json");
		return false;
	});
	$(".submit-contest-solution").click(function () {
		$('#submitsolution').attr('disabled', 'disabled');
		SaveCode();
		tabShowSwitch(0);
		consoleSwitch(1);
		$("#output-status").html("<img src='img/loader.gif'>");
		document.getElementById('output').value = "";

		var source = editor.getValue();
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;
		var language = document.getElementById('select_lang').value;
		$.post("api/submit", { submit: 1, contestId: contestId, problemId: problemId, language: language, source: source }, function (data) {
			if (data.success != true) {
				consoleSwitch(1);
				$("#output-status").html("<span style='color: red'>" + "Submit failed, " + data.error + "</span>");
				$("#submitsolution").removeAttr("disabled");
			} else {
				//window.location = "contest/" + contestId + "/status";
				showStatusTab(1);
				oLoader.style.display = "none";
				$("#output-status").html("<span style='color: green'>" + "Submit solution successfully." + "</span>");
				$('#submitsolution').removeAttr("disabled");
			}
		}, "json");
		return false;
	});

	/* listenning  code  change */
	editor.onDidChangeModelContent(function (e) {

	});

	/* load the last language option */
	function LoadLanguage() {
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;	
		var name = username + "_lang_" + contestId + "_" + problemId;
		var lang_opt = window.localStorage.getItem(name);
		if (lang_opt != null) {
			$('#select_lang').val(lang_opt);
		}
	}
	function SaveLanguage() {
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;	
		var lang = document.getElementById('select_lang').value;
		var name = username + "_lang_" + contestId + "_" + problemId;
		window.localStorage.setItem(name, lang);	
	}
	LoadLanguage();
	SaveLanguage();
	
	function LoadCode() {
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;
		var language = document.getElementById('select_lang').value;
		var name = username + "_code_" + contestId + "_" + problemId + "_" + language;
		var source = window.localStorage.getItem(name);
		if (source == null) {
			source = "";
		}
		editor.setValue(source);
	}
	/* read code from cookie */
	LoadCode();
	$("#select_lang").change(function (e) {	
		SaveLanguage();	
		LoadCode();
	});	
	function SaveCode() {
		var source = editor.getValue();
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;
		var language = document.getElementById('select_lang').value;
		var name = username + "_code_" + contestId + "_" + problemId + "_" + language;
		window.localStorage.setItem(name, source);
	}
	/* auto save code to cookie */
	function SaveCodeTimer() {
		SaveCode();
		setTimeout(function () { SaveCodeTimer(); }, 5000);
	}
	setTimeout(function () { SaveCodeTimer(); }, 5000);

	/* console menu */
	var on = 0;
	var oConsoleCaert = document.getElementById("consoleCaert");
	var oConsoleMenu = document.getElementById("consoleMenu");
	function consoleSwitch(forceOn) {
		if (on == 1 && forceOn == 0) {
			oTestBox.style.display = "none";
			oConsoleCaert.setAttribute("class", "caret-down");
			oSrc.style.height = window.innerHeight - oHeaderNavbar.offsetHeight -
				oBottombarRight.offsetHeight - oIdeBoxNav.offsetHeight + "px";
			on = 0;
		} else {
			oTestBox.style.display = "inline";
			oConsoleCaert.setAttribute("class", "caret-up");
			oSrc.style.height = window.innerHeight - oHeaderNavbar.offsetHeight - oTestBox.offsetHeight -
				oBottombarRight.offsetHeight - oIdeBoxNav.offsetHeight + "px";
			on = 1;
		}
		if (editor) {
			editor.layout();
		}
	}

	oConsoleMenu.addEventListener("click", function () {
		consoleSwitch(0);
	});
	
	$(".ide-setting").click(function() {				
		var scrollTop = window.pageYOffset||document.documentElement.scrollTop || document.body.scrollTop;
		var topPosInner = 60 + scrollTop;
		var leftPosIner = ($(document.body).width() - 672)/2;
	    document.getElementById('pop-inner-div-ide-setting').style.top= topPosInner +'px';
	    document.getElementById('pop-inner-div-ide-setting').style.left= leftPosIner +'px';
		document.getElementById('pop-div-ide-setting').style.top= scrollTop +'px';
		document.documentElement.style.overflowY = 'hidden';

		$(".pop-div-ide-setting").fadeIn(); 
		$(".pop-inner-div-ide-setting").fadeIn(); 
		return false;
	});
	$(".pop-div-ide-setting").click(function(){
		$(".pop-div-ide-setting").fadeOut(); 
		$(".pop-inner-div-ide-setting").fadeOut(); 
		document.documentElement.style.overflowY = 'scroll';
	});
	var timeFormatSeconds = function(time) {
		var d = time ? new Date(time) : new Date();
		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		var day = d.getDate();
		var hours = d.getHours();
		var min = d.getMinutes();
		var seconds = d.getSeconds();

		if (month < 10) month = '0' + month;
		if (day < 10) day = '0' + day;
		if (hours < 10) hours = '0' + hours;
		if (min < 10) min = '0' + min;
		if (seconds < 10) seconds = '0' + seconds;
		return (year + '-' + month + '-' + day + ' ' + hours + ':' + min);
	}

	var showStatus = 0;
	var showProblem = 1;
	var oLoader = document.getElementById("problem-status-loader");
	var oProblemInfo = document.getElementById("problem-information");
	var oProblemStatus = document.getElementById("problem-status");
	function showProblemTab() {
		oProblemStatus.style.display = "none";
		oProblemInfo.style.display = "inline";
		showStatus = 0;
		showProblem = 1;
	}
	var statusOver = 0;
	var fromSolutionId = 2147483647;
	function showStatusTab(force) {
		if (statusOver == 0) {
			oLoader.style.display = "inline";
		}
		if (force == 1) {
			fromSolutionId = 2147483647;
			statusOver = 0;
			$(".status tr:gt(0)").remove();
		}

		oProblemInfo.style.display = "none";
		oProblemStatus.style.display = "inline";
		showStatus = 1;
		showProblem = 0;
		var opt="";
		var problemId = document.getElementById('problemId').value;
		var contestId = document.getElementById('contestId').value;
		$.getJSON("api/submission/query",{pageSize:100, problemId:problemId, contestId:contestId, fromSolutionId:fromSolutionId, username:username},function(json){
			if (json.success != true) {
				return false;
			}
			if (json.solutions.length == 0 && statusOver == 0 && fromSolutionId == 2147483647) {
				statusOver = 1;
				var htmlList = "";
				htmlList += '<tr><td class=\"left-item dark\" colSpan=\"20\" style=\"text-align: left;\">There is no records.</td></tr>';
				$(".status tr:last").after(htmlList);
			}

			for ( var i = 0; i < json.solutions.length; i++) {
				fromSolutionId = json.solutions[i].solution_id;
				var htmlList = "";
				if (i%2 == 0) {
					htmlList += '<tr class=\"dark\">';
				} else {
					htmlList += '<tr>';
				}
				htmlList += '<td class=\"left-item verdict';
				if (json.solutions[i].verdict == 5) {
					htmlList += ' verdict_ac';
				} else if (json.solutions[i].verdict == 3) {
					htmlList += ' verdict_ce';
				} else if (json.solutions[i].verdict == 10) {
					htmlList += ' verdict_pe';
				} else if (json.solutions[i].verdict < 5) {
					htmlList += ' verdict_prev';
				} else {
					htmlList += ' verdict_other';
				}
				htmlList += '\" id=status_' + json.solutions[i].solution_id ;
				htmlList += ' status='+ json.solutions[i].verdict ;
				htmlList += ' manual=0 ';

				htmlList += '><a solutionId=' + json.solutions[i].solution_id + ' class=\"view-source\" href=\"view-source/' +
							json.solutions[i].solution_id + '\" title=\"source\" target=\"_blank\">' +
							json.solutions[i].status_description +'</a></td>';
				htmlList += '<td class=\"time\">'+ json.solutions[i].time +' ms</td>';
				htmlList += '<td class=\"memory\">'+ json.solutions[i].memory +' kb</td>';
				htmlList += '<td class=\"language\">'+ json.solutions[i].language_name +'</td>';
				htmlList += '<td class=\"date\" title=\"'+ timeFormatSeconds(json.solutions[i].submit_date)+ '\">' +
					         json.solutions[i].friendlySubmitDate +'</td>';
				$(".status tr:last").after(htmlList);
			}

			OnlineJudge.statusReflesh();
		});
	}

	var oProblemContentNav= document.getElementById("problem-box-nav-content");
	var oProblemStatusNav= document.getElementById("problem-box-nav-status");
	oProblemContentNav.addEventListener("click", function () {
		showProblemTab();
		oProblemContentNav.setAttribute("class", "nav_menu current");
		oProblemStatusNav.setAttribute("class", "nav_menu");
	});
	oProblemStatusNav.addEventListener("click", function () {
		showStatusTab(0);
		oLoader.style.display = "none";
		oProblemStatusNav.setAttribute("class", "nav_menu current");
		oProblemContentNav.setAttribute("class", "nav_menu");
	});

	var flag = 0;
	function updateTable(scrollTop) {
		showStatusTab(0);
		flag = 0;
		oLoader.style.display = "none";
		document.querySelector('.problem-content').scrollTop = scrollTop;
	};
	document.querySelector('.problem-content').addEventListener("scroll", function () {
		if (showStatus == 0) {
			return false;
		}
		var clientHeight = this.clientHeight;
		var scrollTop = this.scrollTop;
		var scrollHeight = this.scrollHeight;
		if (scrollHeight - scrollTop - clientHeight <= 3) {
			if (flag == 0) {
				flag = 1;
				this.scrollTop = scrollTop - 10;
				oLoader.style.display = "inline";
				setTimeout(function () { updateTable(scrollTop); }, 500);
			}
		}
	});
});