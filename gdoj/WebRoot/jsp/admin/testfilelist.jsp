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
  	<script type="text/javascript" src="js/gdoj.js"></script>
  </head>
  
  <body>
  <jsp:include  page="/jsp/head.jsp" ></jsp:include> 
   	<div class="container">
        <div class="content">  
   		<jsp:include  page="/jsp/admin/head.jsp" ></jsp:include> 
     	<div style="margin: 0px;">
     		<div >
     		请勿使用中文名<br>
     		1. 可直接上传in和out文件(文件名需要相同,如data1.in, data1.out)<br>
     		2. 或者上传一个只包含测试用例的Zip压缩包(Zip压缩包中不含文件夹)，系统会自动解压</div>
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
	                  &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="开始上传">
	              </li>  
				</ul>	
				 </div>		
	 		 </form>
	 		<br style="clear: both;">
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
	     		Total testcase <s:property value="testFiles.size"/>:
		     	<s:iterator value="testFiles" status="st">
		     	<div class="sample-test">
					<div class="input">
						<div class="title"><s:property value="testFiles[#st.index].inFileName" escape="false"/></div>
						<div class="sample-input"><s:property value="testFiles[#st.index].inputString" escape="false"/></div>
					</div>					
					<div class="output">
						<div class="title"><s:property value="testFiles[#st.index].outFileName" escape="false"/></div>
						<div class="sample-output"><s:property value="testFiles[#st.index].outputString" escape="false"/></div>
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
