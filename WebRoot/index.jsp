<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.ItemsDAO"%>
<%@ page import="entity.Items"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		div{
			float:left;
		}
		#ShowTable{
			width:850px;
			height:60px;
			border:1px;
		}
		img{
			width:120px;
			height:90px;
		}
		#ShowTable tr td div dl dd{
			folat:left;
			
		}
	</style>
  </head>
	
  <body>
  	<h1>商品展示</h1>
    <hr>
    <%
    	ItemsDAO itemsDao = new ItemsDAO();
    	ArrayList<Items> list = itemsDao.getAllItems();
    	
     %>
    <center>
    <table id="ShowTable">
	    <tr>
	    	<td>
	    		<%
	    		if(list!=null && list.size()>0)
	    		{
	    			for(Items item: list){
	    		 %>
		    	<div>
		    		<dl>
		    			<dd>
		    			<a href="details.jsp?id=<%=item.getId() %>"><img src="pic/<%=item.getPicture() %>" width="120" height="90" border="1"/></a>
		    			</dd>
		    			<dd><%=item.getName() %></dd>
		    			<dd>数量:<%=item.getNumber() %></dd>
		    			<dd>产地:<%=item.getCity() %></dd>
		    			<dd>价格:￥<%=item.getPrice() %></dd>
		    		</dl>
		    	</div>
		    	<%
		    		}
		    	}
		    	 %>
		    	
	    	</td>
	    </tr>
    </table>
    </center>
  </body>
</html>
