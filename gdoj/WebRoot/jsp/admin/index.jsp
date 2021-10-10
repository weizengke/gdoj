<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Online Judge System</title>
	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="expires" content="-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System fof ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	<link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/gdoj.js"></script>
	<link rel="stylesheet" href="js/xterm/xterm.css">
    <script src="js/xterm/xterm.js"></script>
</head>

<body>
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<jsp:include page="/jsp/admin/head.jsp"></jsp:include>
			<div>
				<a href="admin/statistic-chart">统计</a><br />
				<a href="admin/home-edit">编辑页面</a><br />
				<a href="admin/recent-action">生成RecentAction页面</a>(自动生成)<br />
				<a href="admin/topUsers">生成Top10页面</a>(自动生成)<br />
				<a href="admin/OpenPath.action?type=OJ_PATH&path=OJ_TMP">查看输出文件目录</a><br />
				<a href="admin/OpenPath.action?type=OJ_WEB&path=upload/file">查看上传文件目录</a><br />
				<form id="runcmd" method="post" action="admin/operate!runcmd.action">
					<input id="cmdline" style="width: 256px;" name="cmdline" maxlength="256" />
					<input id="sub" style="width: 86px;" type="Submit" value="Run" />
				</form><br>
				<form enctype="multipart/form-data" method="post" action="admin/operate!upload.action">
					<div class="shiftUp">
						<span class="fielderror">
							<s:fielderror>
								<s:param>tip</s:param>
							</s:fielderror>
						</span>
					</div>
					<input type="file" name="file" value="Choose File" /><input id="sub" type="Submit"
						style="width: 86px;" value="上传" />
					<s:property value="tip" />
				</form><br>

			</div>
			Telnet : <input id="term_ip" style="width: 128px;" maxlength="32" value="127.0.0.1"/>
			<input id="term_connect" style="width: 86px;" type="Submit" value="connect" />
			<div id="terminal"></div>
<script>
	let term = new Terminal({
		cursorStyle: 'underline', //光标样式
		cursorBlink: true, // 光标闪烁
		convertEol: true, //启用时，光标将设置为下一行的开头
		disableStdin: false, //是否应禁用输入。
		theme: {
			foreground: 'yellow', //字体
			background: '#060101', //背景色
			cursor: 'help',//设置光标
		}
	});

	term.open(document.getElementById('terminal'));

	var websocket;

	function connect() {
		var ip = document.getElementById('term_ip').value;
		term.writeln('Connecting to '+ip);
		websocket = new WebSocket("ws://127.0.0.1/gdoj/ws/websocket/" + ip);
		websocket.onopen = function (evt) {
			websocket.onmessage = function (evt) {//接受到数据
				term.write(evt.data);//把接收的数据写到这个插件的屏幕上
			}
			websocket.onclose = function (evt) {//websocket关闭
				term.writeln("Session closed.");
				$('#term_connect').removeAttr("disabled");
				//term.destroy();//屏幕关闭
			}
			websocket.onerror = function (evt) {//失败额处理
				if (typeof console.log == "function") {
					term.writeln('Connecting to '+ip + "failed.");
					$('#term_connect').removeAttr("disabled");
				}
			}
		}
	};

	var close = function () {//关闭websocket
		websocket.close();
	};
    
    function runFakeTerminal() {
        term.prompt = () => {
            term.write('\r\n~$ ');
        };

        //prompt(term);

        term.onKey(e => {
            const printable = !e.domEvent.altKey && !e.domEvent.altGraphKey && !e.domEvent.ctrlKey && !e.domEvent.metaKey;
			websocket.send(e.key);

            if (e.domEvent.keyCode === 13) {
				//prompt(term);
            } else if (e.domEvent.keyCode === 8) {
                // Do not delete the prompt
                if (term._core.buffer.x > 2) {
                    term.write('\b \b');
                }
            } else if (printable) {
				// close local echo
				//term.write(e.key);
            }
        });
    }

    function prompt(term) {
        term.write('\r\n~$ ');
    }

    runFakeTerminal();

	$("#term_connect").click(function () {
		$('#term_connect').attr('disabled', 'disabled');
		connect();
	});

</script>
		</div>
		<jsp:include page="/jsp/footer.jsp"></jsp:include>
	</div>
</body>
</html>
