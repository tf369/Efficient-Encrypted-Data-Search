<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ENDAS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-yanone.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
    <!--
.style1 {font-size: 14px}
.style2 {font-size: 24}
.style3 {font-size: 26px; }
.style4 {
	font-size: 24;
	font-weight: bold;
	color: #666666;
}
-->
</style>

       
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            if (request.getParameter("msg") != null) {%>
        <script>alert('Login Successfully');</script>
        <%}
            if (request.getParameter("msg1") != null) {%>
        <script>alert('File Upload Successfully');</script>  
        <%}
            if (request.getParameter("msg2") != null) {
        %>   
        <script>alert('File Deleted Successfully');</script>
        <%}
            if (request.getParameter("momsg") != null) {%>
        <script>alert('Modified Successfully');</script>
        <%}
            if (request.getParameter("moemsg") != null) {%>
        <script>alert('Modified Failed');</script>
        <%}
        %>
        
        <div class="main">
  <div class="header">
    <div class="header_resize">
      
      <div class="menu_nav">
        <ul>
          <li class="active"></li>
          <li class="style1">
           <div align="left"><a href="index.jsp"><span>Home</span></a></div>
		  <li><a href="ownerlogin.html"><span>Data Owner</span></a></li>
		  <li><a href="userlogin.html"><span>User Login</span></a></li>
		  <li><a href="adminlogin.html"><span>Admin</span></a></li>
                  <li><a href="cloudserver.html"><span>Cloud Server</span></a></li>
                  <li><a href="registration.html"><span>Registration</span></a></li>
                  
          </li>
        </ul>
      </div>
        
      <div class="clr"></div>
      <div class="logo">
       <h1><a href="index.jsp">ENDAS<span></span> <small>Efficient Encrypted Data Search as a Mobile Cloud Service</small></a></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="320" alt="" /></a> </div>
        <div class="clr"></div>
      </div> 
      
      <div class="content">
    <div class="content_resize">
      <div class="mainbar">
                
                     <center><h1 style="display: block;">File Details</h1></center><hr>
                    <center>
                        <table border="1" style="text-align: center">
                            <tr>
                                <th>File Name</th>
                                <th>Keyword</th>
                                <th>File Type</th>
                                <th>Upload Date</th>
                                <th>File Size</th>
                                <th>Rank</th>
                                <th>Download</th>
                            </tr>
                            <tr>
                                <%
                                String uname = session.getAttribute("email").toString();
                                ResultSet rs = null;
                                    try {
                                        con = Dbconnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from files where owner ='" + uname + "'");
                                        while (rs.next()) {%>
                                <td><%=rs.getString("filename")%></td>
                                <td><%=rs.getString("keyword")%></td>
                                <td><%=rs.getString("filetype")%></td>
                                <td><%=rs.getString("CDate")%></td>
                                <td><%=rs.getString("Size") + "Bytes"%></td>
                                <td><%=rs.getString("frank")%></td>
                                <td><a href="download?<%=rs.getString("filename")%>,<%=uname%>" style="text-decoration: none">Download</a></td>
                            </tr>
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </table>
                    </center><br />
                </div>
            </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Data Owner  Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="ownerdetails.jsp">Owner Details </a></li>
            <li><a href="fileupload.jsp">File Upload</a></li>
            <li><a href="filedetails.jsp">File Details</a></li>
            <li><a href="fresponse.jsp">Request File</a></li>
            <li><a href="prequest.jsp">Password</a></li>
            <li><a href="index.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
            <div id="footer" style="color: white"><br /><br />
                <center>Copyright &COPY; 2015-2016</center>
            </div>
        </div>
    </body>
</html>

