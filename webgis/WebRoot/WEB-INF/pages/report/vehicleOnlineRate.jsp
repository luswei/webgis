<%@ page language="java" pageEncoding="UTF-8"%>
<!--分页查询共用的页面-->
<%@ include file="/common/paginateUtil.jsp"%>
<!--日期控件-->
<%@ include file="/common/dateUtil.jsp"%>
  
</head>

		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				  var now = Utility.now();
				  $("#endDate").val(now);
				  var now = Utility.now(-1);
				  $("#startDate").val(now);
				 
					//  $("#intervalType").lookup({category:"ReportType"}); //统计类型下拉框
				 
				$("#btnQuery").click(function(){
				        Utility.loadGridWithParams();
				});
				Utility.loadGridWithParams();
				//创建下拉部门树
				Utility.createDepTree("depId");
				  

			} );
		</script>
<body>	
		   <div id="toolbar">
			<form id="queryForm" action="<%=ApplicationPath%>/report/vehicleOnlineRate.action" method="post">
			   <input type="hidden" name="queryId" value="selectVehicleOnlineRate" />		   
			   <input type="hidden" name="fileName" value="车辆上线率" />	        
			  <table width="100%"  class="TableBlock">
			   			   <tr>
			   <td> 车牌号码: </td>
			    <td>			    <input type="text" name="plateNo" size="10"  id="plateNo">   </td>
            <td>车辆组:</td>
			    <td>			
				<select id="depId" name="depId" style="width:200px;"></select>
				</td>
				<!--
            <td>统计类型</td>
			    <td>	<select id="intervalType"  name="intervalType"></select>   </td>-->
            </tr>
 <tr>
			   <td> 统计日期 </td>
			    <td colspan="3">			    <input type="text" name="startDate" id="startDate"  size="17"  class="datetimepicker" value="">
              至<input type="text" name="endDate" size="17"   id="endDate"  class="datetimepicker" value="">  
		 <a id="btnQuery" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a>&nbsp;
		   <a id="btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" >重置</a>&nbsp;
		   <a id="btnExport" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-excel'" onclick="Utility.excelExport('<%=ApplicationPath%>/data/excelExport.action');">导出</a><!--调用utility.js-->
        </td>
    </tr>
		</table>
		</form>	 
		
  </div>
			<table id="queryGrid" class="easyui-datagrid" title="" style="width:100%;"
						data-options="pagination:true,pageSize:15,singleSelect:true,rownumbers:true,striped:true,fitColumns: true,
						pageList: [15, 20, 50, 100, 150, 200],fit:true,toolbar:'#toolbar',
						url:'<%=ApplicationPath%>/report/vehicleOnlineRate.action',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'plateNo'"  width="15%">车牌号</th>
							<th data-options="field:'plateColor'"  width="5%">车牌颜色</th>
							<th data-options="field:'depName'"  width="15%">车组</th>
							<th data-options="field:'onlineTime'"  width="15%">上线时间</th>
							<th data-options="field:'offlineTime'"  width="15%">离线时间</th>
							<th data-options="field:'totalTime'"  width="15%">总时间</th>
							<th data-options="field:'onlineRate'"  width="15%">上线率(%)</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>					
				</table>

</body>

