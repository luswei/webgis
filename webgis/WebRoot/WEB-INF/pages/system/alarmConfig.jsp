
<%@ include file="/common/taglibs.jsp"%>
<!--分页查询共用的页面-->
<%@ include file="/common/common.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript" src="<%=jsPath%>/jquery/jquery.timers.js"></script><!--定时器-->
<script>


$().ready(function() {
	

	 $("#cbCheckAllAlarm").click(function() {
                $('input[name="alarmEnable"]').attr("checked",this.checked);
				//$(".paramInput").attr("disabled", this.checked == false);
      });
	   $("#cbCheckAllSound").click(function() {
                $('input[name="alarmSoundEnable"]').attr("checked",this.checked);
      });

	   $("#cbCheckAllPopup").click(function() {
                $('input[name="alarmPopupEnable"]').attr("checked",this.checked);
      });

});
</script>
 <BODY>
	<form id="entityForm" name="entityForm" action='<%=ApplicationPath%>/system/configAlarm.action' method="POST">
				<!--修改和查询的标志-->
        <input type="hidden"  name="operation"  id="operation" value="modify"/>
        <input type="hidden"  name="vehicleId"  id="vehicleId" value=""/>
  <table width="60%"  class="TableBlock">
					<tbody><tr>
						<td colspan="6" style="font-weight: bold; background: #EFEFEF;" height="25">报警类型列表
						<span style="color:red;background:blue;">${message}</span>
											
						<input type="submit" name="modify"  id="btnModify" value="保存修改" class="button gray medium"/>
						</td>
					</tr>
					<tr class="TableHeader">
                          <TD>报警代码</TD>
                          <TD>报警类型</TD>
                          <TD>报警来源</TD>
						  <TD><input type="checkbox" id="cbCheckAllAlarm" />启用报警 </TD>		
						  <TD><input type="checkbox" id="cbCheckAllSound" />报警声音 </TD>	
						  <TD><input type="checkbox" id="cbCheckAllPopup" />报警弹窗 </TD>			
					</tr>
					  <s:iterator value="alarmConfigs" id="alarmConfig" status="status">  
					<tr>
					  <td >
						  ${alarmConfig.alarmType}
						</td>
						<td >
						  ${alarmConfig.name}
						</td>
						<td >
						  ${alarmConfig.alarmSource}
						</td>
										
						<td >
						 <s:if test="%{#alarmConfig.enabled==true}">
						      <input type="checkbox" id="alarmConfig_${alarmConfig.entityId}" name="alarmEnable" value="${alarmConfig.entityId}" checked/>
						</s:if>						
                        <s:else>
						       <input type="checkbox" id="alarmConfig_${alarmConfig.entityId}" name="alarmEnable" value="${alarmConfig.entityId}" />
						</s:else>
						</td>
											
						<td >
						 <s:if test="%{#alarmConfig.soundEnabled==true}">
						      <input type="checkbox" id="alarmConfig_${alarmConfig.entityId}" name="alarmSoundEnable" value="${alarmConfig.entityId}" checked/>
						</s:if>						
                        <s:else>
						       <input type="checkbox" id="alarmConfig_${alarmConfig.entityId}" name="alarmSoundEnable" value="${alarmConfig.entityId}" />
						</s:else>
						</td>				
						<td >
						 <s:if test="%{#alarmConfig.popupEnabled==true}">
						      <input type="checkbox" id="alarmConfig_${alarmConfig.entityId}" name="alarmPopupEnable" value="${alarmConfig.entityId}" checked/>
						</s:if>						
                        <s:else>
						       <input type="checkbox" id="alarmConfig_${alarmConfig.entityId}" name="alarmPopupEnable" value="${alarmConfig.entityId}" />
						</s:else>
						</td>
						
						<!--
						<td>
						  <image src="<%=ApplicationPath%>/image/accept.gif" style="cursor:hand"
						  onclick=""></image>
						</td>
						-->
					</tr>
					</s:iterator>  

				
					
				</tbody></table>
		</form>
 </BODY>
</HTML>
