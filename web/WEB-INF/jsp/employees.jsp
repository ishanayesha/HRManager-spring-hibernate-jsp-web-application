<%-- 
    Author     : Ishan Ayesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>

<div style="min-height: 150px; background-image: url(<c:url value="resources/images/wall_other.jpg" />);">
    <div class="row">
        <div class="col-md-12">
            <h1>Employees  
                <button class="btn btn-info pull-right" style="margin-top:1%" data-toggle="modal" data-target="#addModal"> 
                    Add Employee</button></h1>
        </div>

    </div>
</div>


<script type="text/javascript">

    function addEmp()
    {
        var name = $('#name').val();
        var role = $('#role').val();
        var check=true;

        if (name == "")
        {
            $("#errEmpName").show();
            check=false;
        } 
        else
        {
            $("#errEmpName").hide();
        }
        
        if (role == "0")
        {
            $("#errEmpRole").show();
            check=false;
            
        }
        else
        {
            $("#errEmpRole").hide();
        }
        if(check)
        {
            document.getElementById("addEmp").submit();
        }


    }

    function closeAddEmp()
    {
        $("#errEmpName").hide();
        $("#errEmpRole").hide();
    }

</script>



<c:if test="${flag}">
    <script>
        var message = "${message}";
        swal(
                'Success!',
                message,
                'success'
                );
    </script>

</c:if>
<br>
<table class="table table-hover table-striped table-condensed">
    <thead>
    <th>ID</th>
    <th>Employee Description</th>
    <th>Role</th>
    <th style="width:90px"></th>

</thead>
<tbody>
    <c:forEach var="employee" items="${employees}">
        <tr>
            <td> <c:out value="${employee.getId()}"></c:out> </td>
            <td> <c:out value="${employee.getName()}"></c:out> </td>
            <td>  <c:out value="${employee.getRole().getTitle()}"></c:out> </td>
                <td>  
                    <a  href="eview.htm?id=${employee.getId()}" 
                    style="color: white; background-color: #2B5896" class="btn btn-xs btn-block form-control" > View </a>
            </td>

        </tr>
    </c:forEach>
</tbody>

</table>


<div class="modal fade" id="addModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Add Employee</h4>
            </div>
            <form id="addEmp" class="form-horizontal" action="employee.htm"  method="post">
                <div class="modal-body">
                    <input type="hidden" name="_method" value="POST">
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label">Employee Name</label>
                        <div class="col-md-8">
                            <input id="name" type="text" name="name" class="form-control">
                            <p style="display: none;color: red;" id="errEmpName">*Please enter a valid name</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label">Employee Role</label>
                        <div class="col-md-8">
                            <select id="role" type="text" name="role" class="form-control">
                                <option value="0" selected>No Role</option>
                                <c:forEach var="role" items="${roles}">
                                    <c:if test="${role.getEmployee() == null}">
                                        <option value="${role.getId()}"> <c:out value="${role.getTitle()}"></c:out> </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <p style="display: none;color: red;" id="errEmpRole">*Please select a role</p>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button onclick="closeAddEmp()" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="addEmp()" type="button" class="btn btn-primary">Save</button>
                </div>
            </form> 
        </div>
    </div>
</div>




<%@include file="footer.jsp" %>