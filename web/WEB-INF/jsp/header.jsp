<%-- 
    Author     : Ishan Ayesha
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <c:out value="${page}"></c:out></title>

            <link rel="stylesheet" href="https://bootswatch.com/flatly/bootstrap.css" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="<c:url value="resources/css/style.css" />">

        <!--SweetAlert-->
        <link href="<c:url value="resources/sweetalert/sweetalert2.min.css" />" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="<c:url value="resources/sweetalert/sweetalert2.min.js" />"></script>        


    </head>

    <body>

        <nav class="navbar navbar-inverse" style="background-color: #7E74B6;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a style="font-weight: bold" class="navbar-brand" href="index.htm">HR Manager</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="${page == 'role' ? 'active' : ''}">
                        <a  href="roles.htm">Roles</a>
                    </li>
                    <li class="${page == 'task' ? 'active' : ''}">
                        <a  href="tasks.htm">Tasks</a>
                    </li>
                    <li class="${page == 'employee' ? 'active' : ''}">
                        <a  href="employee.htm">Employees</a>
                    </li>                    
                </ul>

                <ul class="nav navbar-nav" style="float: right">
                    <li  class="${page == 'employee' ? 'active' : ''}">
                        <a style="font-weight: bold" href="login.htm">Logout</a>
                    </li>                    
                </ul>                        

            </div>
        </nav>


        <div class="container" style="min-height: 500px;">