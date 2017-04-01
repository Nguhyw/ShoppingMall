<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.ItemsDAO"%>
<%@ page import="entity.Items"%>
<%@ page import="java.net.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'details.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <h1>商品详情</h1>
    <hr>
     <%
    	ItemsDAO itemsDao = new ItemsDAO();	
    	Items item = new Items();
    	item = itemsDao.getItemsById(Integer.parseInt(request.getParameter("id")));
     %>
    <center>
    	<table width="750" height="60" cellpadding="0" cellspacing="0" border="0">
    		<tr>
	    		<td width="70%" valign="top">
	    		<%
	    		if(item!=null) 
	    		{
	    		%>
	    			<table>
		               <tr>
		                 <td rowspan="4"><img src="pic/<%=item.getPicture() %>" width="200" height="160"/></td>
		               </tr>
		               <tr>
		                 <td><B><%=item.getName() %></B></td> 
		               </tr>
		               <tr>
		                 <td>产地：<%=item.getCity() %></td>
		               </tr>
		               <tr>
		                 <td>价格：<%=item.getPrice() %>￥</td>
		               </tr> 
             		</table>
             		<%
             		}
             		 %>
	    		</td>
	    		<%
	    		String list ="";
              //从客户端获得Cookies集合
              Cookie[] cookies = request.getCookies();
              //遍历这个Cookies集合
	    		if(cookies!=null&&cookies.length>0){
		    		for(Cookie c:cookies){
		    			if(c.getName().equals("ListViewCookie")){
		    				list = c.getValue();
		    			}
		    		}
	    		}
	
	    		list += request.getParameter("id")+",";
	    		
	    		//超过一千条就清除
	    		String[] arr = list.split(",");
	    		if(arr!=null&&arr.length>0){
	    			if(arr.length>=1000){
	    				list="";
	    			}
	    		}
	    		
	    		Cookie cookie = new Cookie("ListViewCookie",list);
	    		cookie.setMaxAge(60*60*24); 
	    		response.addCookie(cookie);

	    	
	    		 %>
	    		<td width="30%" bgcolor="#EEE" align="center">
	    			<br><b>您浏览过的商品</b><br>
	    			<%
	    				ArrayList<Items> viewList = new ArrayList<Items>();
		    		 	viewList = itemsDao.getViewList(list);
		    		 	if(viewList!=null && viewList.size()>0){
		    		 		for(Items it :viewList){
	    			 %>
	    			<div>
	    				<dl>
	    					<dt>
	    						<a href="details.jsp?id=<%=it.getId()%>" ><img src="pic/<%=it.getPicture() %>" width="120" height="90" border="1"/></a>
	    					</dt>
	    					<dd><%=it.getName() %></dd>
	    					<dd>产地：<%=it.getCity() %>&nbsp;&nbsp;价格：<%=it.getPrice() %>￥</dd>
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
