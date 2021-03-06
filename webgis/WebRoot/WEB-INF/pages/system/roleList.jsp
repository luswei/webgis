<%@ page language="java" pageEncoding="UTF-8"%>
<!--分页查询共用的页面-->
<%@ include file="/common/paginateUtil.jsp"%>
  
</head>

		<script type="text/javascript" charset="utf-8">
			//删除表格的某一行，删除后，会自动刷新表格			
			function getDeleteActionColumn(value, rowData, rowIndex)
			{  
				
				var entityId = rowData.roleId;
				var html =  "<img style='cursor: pointer;' src='<%=imgPath%>/cross.gif' onclick=\"Utility.deleteEntity('deleteRole.action','" +entityId+"');\"/>";
							//alert(html);
				return html;
			}
			//编辑列
			function getEditActionColumn(value, rowData, rowIndex)
			{
				var entityId = rowData.roleId;
				var html =  "<a href=\"javascript:InfoWindow.viewRole('" + entityId+ "');\">" +" 编辑</a>";
				return html;
			}

			

			$(document).ready(function() {
				$("#btnQuery").click(function(){
				        Utility.loadGridWithParams();
				});
				Utility.loadGridWithParams();
			} );
		</script>
<body>
				
			<div id="toolbar">	
			
			<form id="queryForm" action="<%=ApplicationPath%>/system/roleList.action">
			   <input type="hidden" name="queryId" value="selectRoles" />		   
			  <table width="100%"  class="TableBlock">
			   			   <tr>
				   <td> 名称 </td>
					<td>			    <input type="text" name="name" size="10"  id="name">   
				 
		   <a id="btnQuery" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a>&nbsp;
		   <a id="btnReset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" >重置</a>&nbsp;
		   <a id="btnNew" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="InfoWindow.viewRole(0);" >新增</a>
		   </td>
            </tr>
		</table>
		</form>	 
		
  </div>
			   <table id="queryGrid" class="easyui-datagrid" title="" style="width:100%;"
						data-options="pagination:true,pageSize:15,singleSelect:true,rownumbers:true,striped:true,fitColumns: true,
						pageList: [15, 20, 50, 100, 150, 200],fit:true,toolbar:'#toolbar',
						url:'<%=ApplicationPath%>/system/roleList.action',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'name'" width="15%">名称</th>
							<th data-options="field:'createDate'" width="12%">创建时间</th>
							<th data-options="field:'remark'" width="22%">备注</th>
							<th data-options="field:'1',formatter:getEditActionColumn" width="5%">编辑</th>
							<th data-options="field:'2',formatter:getDeleteActionColumn" width="5%">删除</th>
						</tr>
					</thead>
				</table>

</body>

