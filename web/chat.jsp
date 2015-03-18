<%-- 
    Document   : main
    Created on : Jan 8, 2011, 4:42:27 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
      <style type="text/css">
       #u { text-align: left;}
       label {text-align: left;}
       #n { text-align: left;}
      </style>
  </head>

  <body>
      
    <c:if test="${pageContext.request.method=='POST'}">
        <c:choose>
        <c:when test="${param.send!=null}">
          <c:set var="chat" value="${chat}<left><b>${sessionScope.user}</b></left> : <i>${param.text}<br /></i>"
           scope="application" />
        </c:when>
        <c:when test="${param.clear!=null}">
          <c:set var="chat" value="" scope="application" />
        </c:when>
      </c:choose>
    </c:if>

    <table border="0">
      <tbody>
        <tr>
          <td>
            <h3 id ="u">User:
                <c:out value="${sessionScope.fname}" />
            </h3>

            <hr />
          </td>
        </tr>

        <tr>
          <td>
            <c:out value="${chat}" escapeXml="false" />
          </td>
        </tr>

        <tr>
          <td>
            <hr />

            <form method="post">
           <label id="m">Message:</label>
             <input type="text" name="text" size="15"/></br>
            <input type="submit" name="send" value="Send"/>
            <input type="submit" name="refresh" value="Refresh"/>
            <input type="submit" name="clear" value="Clear"/>
            <input type="hidden" name="uid"
            value="<c:out value="${param.uid}"/>" />

            <br />
            </form>
          </td>
        </tr>
      </tbody>
    </table>
  </body>
</html>