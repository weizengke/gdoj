<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags"%> 
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
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  </head>
  
  <body>
  <jsp:include  page="../head.jsp" ></jsp:include> 
 
  <div id="body">
   	<div id="content">
   		<div id="nav-content" >	
  <a href="admin">Admin</a>
     	<a href="admin/problemset">Problems</a>
     	<a href="admin/problemset/status">Status</a>
     	<a href="admin/contests">Contests</a>
     	<a href="admin/user">Users</a>
     	</div>
     	<div style="text-align: right;width: 650px;margin: 0px;">
     		<div  style="float: left;">请勿使用中文名,可上传一个只包含测试用例的Zip压缩包(Zip压缩包中不含文件夹)，系统会自动解压</div>
     		 <form action="admin/UploadFile"  enctype="multipart/form-data" method="post" name="form1">
				 <input type="hidden" name="problemId" value="<s:property value="problemId"/>">
				<div style="float: left;">
				<ul style="text-align: left;">     
                  <li>
                  <input type="file" name="file">
				  <input type="file" name="file">
				  </li>
				  <li style="text-align:left;">
	                  <small><a class="add-file-row" href="javascript:void(0)">继续添加...</a></small>
	                  &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="upload">
	              </li>  
				</ul>	
				 </div>		
	 		 </form>
	 		 <br style="clear: both;">
	 		<div class="click-me" style="float: left;background-color: red;">点击这里显示或隐藏文件列表</div>
	 		<br style="clear: both;">
     		<div class="file-list" style="display: none;">
	     		<div style="float: left;">
				<s:iterator value="inputFiles" status="st">
					<a href="admin/showTestFile?problemId=<s:property value="problemId"/>&inputFilesName=<s:property value="name"/>"><s:property value="name"/></a>
					<br/>
				</s:iterator>
				</div>
				<div style="text-align: right;width: 300px;">
				<s:iterator value="outputFiles" status="st">
					<a href="admin/showTestFile?problemId=<s:property value="problemId"/>&inputFilesName=<s:property value="name"/>"><s:property value="name"/></a>
					<br/>
				</s:iterator>
				</div>
			</div>
<script type="text/javascript">
$(document).ready(function() {  
	 $("a.add-file-row").click(function() {
        var currentLi = $(this).parent().parent();
        var li = $("<li></li>");                	
        var input1 = $("<input  type=\"file\" name=\"file\"/>");     
       	input1.appendTo(li);  	
       	var input2 = $("<input  type=\"file\" name=\"file\"/>");     
       	input2.appendTo(li);
        $("<span>&nbsp;</span>").appendTo(li);
        li.insertBefore(currentLi);
	});

	$(".click-me").click(function(){
  		$(".file-list").slideToggle("slow");
	});
})
</script>
     	</div>	
     	
     	<div>
	     	<div class="probleminfo" style="margin: 0 auto;">
		     	<s:iterator value="inputString" status="st">
		     	<div class="sample-test">
								<div class="input"><div class="title">Input<s:property value="#st.index+1"/></div>
									<div class="sample-input"><s:property value="inputString[#st.index]" escape="false"/></div>
								</div>					
									<div class="output"><div class="title">Output<s:property value="#st.index+1"/></div>
									<div class="sample-output"><s:property value="outputString[#st.index]" escape="false"/></div>
								</div>
				</div>
				</s:iterator>
			</div>	
			
     	</div>
     		
   	</div>
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
