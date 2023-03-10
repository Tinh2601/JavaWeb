<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Sign up</title>
   </head>
   <body>
   
      <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
      
      <h3>Sign up</h3>
      
      <p style="color: red;">${errorString}</p>
      
      <form method="POST" action="${pageContext.request.contextPath}/signup">
         <table border="0">
            <tr>
               <td>User name</td>
               <td><input type="text" name="code" value="${account.user}" /></td>
            </tr>
            <tr>
               <td>Password</td>
               <td><input type="password" name="name" value="${account.pass}" /></td>
            </tr>
            
            <tr>
               <td>Repeat Password</td>
               <td><input type="password" name="name" value="${account.repass}"  /></td>
            </tr>
            
            <tr>
               <td colspan="2">                   
                   <input type="submit" value="Submit" />
                   <a href="login">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
      
      <jsp:include page="_footer.jsp"></jsp:include>
      
   </body>
</html>