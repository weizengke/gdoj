<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!-- Pop div -->
<div class="pop-div-ide-setting"  id="pop-div-ide-setting">
</div>
<div class="pop-inner-div-ide-setting" id="pop-inner-div-ide-setting">
  <div class="ide-setting-box">
  	<div class="title"><s:text name="ide.setting"/></div>
  	<div class="option">
  		<ul>
  			<li>
  				<div class="item-title">
  				字体设置
  				<br/><span style="color:grey">调整适合你的字体大小。</span>
  				</div>
  				<div class="item">
  					<select class="fontsize-picker" id="fontsize-picker">
						<option value="12" >12px</option>
						<option value="13" selected="selected">13px</option>
						<option value="14" >14px</option>
						<option value="15" >15px</option>
						<option value="16" >16px</option>
						<option value="18" >18px</option>	
						<option value="20" >20px</option>	
					</select>
  				</div>
  			</li>
  			<li>
  				<div class="item-title">
  				主题设置
  				<br/><span style="color:grey">切换不同的代码编辑器主题，选择适合你的语法高亮。</span>
  				</div>
  				<div class="item">
  				  	<select class="theme-picker" id="theme-picker">
						<option value="0" selected="selected">Visual Studio</option>
						<option value="1" >Visual Studio Dark</option>
						<option value="2" >High Contrast Dark</option>
					</select>
  				</div>
  			</li>  	
  			<!-- 
  			<li>
  				<div class="item-title">
  				自动换行
  				<br/><span style="color:grey">当代码超过设置的最大长度时，自动换行。</span>
  				</div>
  				<div class="item">
	  				<div class="wordwrap-switch">
				        <input type="checkbox" value="None" class="wordwrap-switch" id="wordwrap-switch" name="check" checked />
				        <label for="wordwrap-switch"></label>
	  				</div>
  				</div>
  			</li>
  			 -->
  			<li>
  				<div class="item-title">
  				行宽限制
  				<br/><span style="color:grey">设置每一行代码的最大字符个数，设置为0则不限制。</span>
  				</div>
  				<div class="item">
  				  	<select class="wordwrap-column" id="wordwrap-column">
  				  		<option value="0">0</option>
						<option value="80"  selected="selected">80</option>
						<option value="100">100</option>
						<option value="120" >120</option>
					</select>
  				</div>
  			</li> 
  		</ul>
  	</div>
  </div>
</div>