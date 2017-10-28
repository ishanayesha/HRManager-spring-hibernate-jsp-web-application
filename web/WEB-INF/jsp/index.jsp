<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>


<div class="row" >
    <div class="col-md-12">
        <h2>Welcome to HR Manager Application.</h2>
        <div style="min-height: 400px; background-image: url(<c:url value="resources/images/wall.jpg" />);">

            <br>
            <br>

            
            <br>
            
            <div style="font-weight: bold;">
                <p style="border-radius: 0px 33px; padding: 1%;width: 40%;background:linear-gradient(to right, black, #312E47);"><a style="color: white;padding: 2%" href="roles.htm">Employees Roles Management</a></p>
                <br>
                <p style="border-radius: 0px 33px; padding: 1%;width: 40%;background:linear-gradient(to right, black, #312E47);"><a style="color: white;padding: 2%" href="tasks.htm">Employees Tasks Management</a></p>
                <br>
                <p style="border-radius: 0px 33px; padding: 1%;width: 40%;background:linear-gradient(to right, black, #312E47);"><a style="color: white;padding: 2%" href="employee.htm">Employee Management</a></p>
            </div>
        </div>
    </div>

</div>     


<%@include file="footer.jsp" %>    