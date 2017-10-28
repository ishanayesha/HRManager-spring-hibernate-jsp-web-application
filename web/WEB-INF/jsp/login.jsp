<%-- 
    Document   : login
    Created on : Oct 25, 2017, 11:11:22 AM
    Author     : Ishan Ayesha
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    

        <link rel="stylesheet" href="https://bootswatch.com/flatly/bootstrap.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="<c:url value="resources/css/newcss.css" />">        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>

        <div style="height: 500px" class="login">
		<div style="height: 450px" class="login-screen">
                        <div class="app-title">
				<h1>HR Manager</h1>
			</div>			
                    
                        <div class="app-title">
				<h2>Login</h2>
			</div>

			<div class="login-form">
				<div class="control-group">
				<input type="text" class="login-field" value="" placeholder="username" id="login-name">
				<label class="login-field-icon fui-user" for="login-name"></label>
				</div>

				<div class="control-group">
				<input type="password" class="login-field" value="" placeholder="password" id="login-pass">
				<label class="login-field-icon fui-lock" for="login-pass"></label>
				</div>

                            <a onclick="login()" class="btn btn-primary btn-large btn-block" href="#">login</a>
                            <p style="padding: 10px;display: none; color: red" id="err">*Please enter correct username and password</p>
			</div>
                    
                    
		</div>
	</div>
        
    </body>
</html>



<script>
    function login()
    {
        var name=$('#login-name').val();
        var pwd=$('#login-pass').val();
        
        if(name!="" && pwd!="")
        {
            window.location.href = "http://localhost:8080/HRManager/index.htm";
        }
        else
        {
            $('#err').show();
        }
    }
    
</script>