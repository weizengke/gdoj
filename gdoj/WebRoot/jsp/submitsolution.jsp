<%@ page language="java" import="java.util.*,
java.io.File,
javax.xml.parsers.DocumentBuilder,
javax.xml.parsers.DocumentBuilderFactory,org.w3c.dom.Document,org.w3c.dom.NodeList" 
pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Submit Solution - Online Judge</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="keywords" content="ACM,OJ,OnlineJudge,JAVA,C++,Program Contest">
	<meta http-equiv="description" content="Online Judge System for ACM">
	<link href="css/styles.css" type="text/css" rel="stylesheet">
	
  	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
  	<script type="text/javascript" src="js/gdoj.js"></script>
  <!--  <script type="text/javascript" src="js/json.js"></script> -->	
  	<script type="text/javascript">
      $(document).ready(function() {
 
});
</script>  

  </head>

  <body>  
  <jsp:include   page="/jsp/head.jsp"></jsp:include> 
  <div id="body">
 	  <div id="sidebar"> 	          
		<jsp:include  page="/jsp/sidebar.jsp" ></jsp:include> 
        
   	  </div> <!-- End sidebar -->

            
		

     <div id="content" class="content-with-sidebar"> 	 <!-- class="content-with-sidebar" -->
     	<div id="nav-content" >	
		<a href="problemset"><s:text name="problems"/></a>
     	<a href="problemset/status"><s:text name="status"/></a>
    	 <a href="problemset/standings"><s:text name="standings"/></a>
     	</div>
	    <div class="content" style="">	    	
			
				<s:form id="submit" method="post" action="submited.action" theme="simple">
					
					<div class="info" style="width:560px;margin: 0px auto;padding:12px 12px 12px 12px;">
						<b><span style="color:red"><s:fielderror></s:fielderror></span></b>
						<b>Problem ID:&nbsp;</b><input name="problemId" style="width: 100px;" value="<s:property value="problemId"/>"> <span class="grey">Enter problem ID,like 1000</span>
						<br/>
						<b>Language&nbsp;&nbsp;:</b>
						<select id="select_lang"  style= "width:250px" name="language">
							<%
			   try {
			   		long lasting = System.currentTimeMillis();
					File f = new File("D:\\OJ\\conf\\Language.xml");
					DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
					DocumentBuilder builder = factory.newDocumentBuilder();
					Document doc = builder.parse(f);
					NodeList nl = doc.getElementsByTagName("VALUE");
					String LanguageId=new String();
					String Language=new String();
					for (int i = 0; i < nl.getLength(); i++) {	
						LanguageId=doc.getElementsByTagName("ID").item(i).getFirstChild().getNodeValue();
						Language=doc.getElementsByTagName("LANG").item(i).getFirstChild().getNodeValue();
						request.setAttribute("LanguageId",LanguageId); 
						//System.out.print("Language:"+Language);
						//System.out.println("运行时间：" + (System.currentTimeMillis() - lasting)+ "毫秒");
					
	   		 		%>		   		 			
						<s:property value="LanguageId"/><option value="<%=LanguageId%>" <s:if test="language==#request.LanguageId">selected="selected"</s:if>><%=Language %></option>
					<%
					}
				} catch (Exception e) {
				%>
													<option value="1" <s:if test="language==1">selected="selected"</s:if>>MS C++</option>
													<option value="2" <s:if test="language==2">selected="selected"</s:if>>MS C</option>
													<option value="3" <s:if test="language==3">selected="selected"</s:if>>GNU C++</option>
													<option value="4" <s:if test="language==4">selected="selected"</s:if>>GNU C</option>
													<option value="5" <s:if test="language==5">selected="selected"</s:if>>Java</option>
													<option value="8" <s:if test="language==8">selected="selected"</s:if>>Pascal</option>
				<% } %>		
						</select>
					<h5>
						Source:
					</h5>
						<textarea id="source" name="source" rows="25" style="width: 100%" ><s:property value="source"/></textarea>	
					</div>
					<div style="text-align: center;margin: 12px;">	
			    		<input id="submitsolution" type="submit" value="Submit Solution"/>
			    	</div>
				</s:form>	
<script>				
$('#submit').submit(function(){
    $('input[type=submit]', this).attr('disabled', 'disabled');
});
</script>		
			<div class="" style="margin: 6px;"></div>
					1、MS C/C++要注意的是:<br/>
					  &nbsp;&nbsp; 1)主函数必须int main(){return 0;}<br/>
					  &nbsp;&nbsp; 2)sqrt函数必须的参数必须浮点型，否则你将得到编译错误的裁判。。。。如：sqrt((double)Var)<br/>
					
					2、建议大家使用GNU，因为与VC++6比较相似。<br/>
					
					3、java的童鞋注意main函数必须被包含在一个名为Main的类中，注意是Main。否则您将无法编译通过。其他类可自定义名字<br/>
						           
	        </div>       	  	  	    
	</div>   
    <jsp:include  page="/jsp/footer.jsp" ></jsp:include>
  </div>
  </body>
</html>
