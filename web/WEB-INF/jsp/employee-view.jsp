<%-- 
    Author     : Ishan Ayesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>


<script>

    function editRole()
    {
        var role = $('#role').val();

        if (role == "0")
        {
            $("#errRoleEdit").show();
        } else
        {
            swal(
                    'Success!',
                    'Role Changed Successfully!',
                    'success'
                    );

            setTimeout(function () {
                document.getElementById("editRole").submit();
            }, 1300);

        }
    }

    function closeEditRole()
    {
        $("#errRoleEdit").hide();
    }

    function editEmp()
    {
        var name = $('#name').val();

        if (name == "")
        {
            $("#errEmpName").show();
        } else
        {
            swal(
                    'Success!',
                    'Employee name Changed Successfully!',
                    'success'
                    );

            setTimeout(function () {
                document.getElementById("editEmp").submit();
            }, 1300);
        }
    }

    function closeEditEmp()
    {
        $("#errEmpName").hide();
    }


    function addTask()
    {
        var task = $('#task').val();

        if (task == "0")
        {
            $("#errTask").show();
        } else
        {
            swal(
                    'Success!',
                    'Task added Successfully!',
                    'success'
                    );

            setTimeout(function () {
                document.getElementById("addTasks").submit();
            }, 1300);
        }
    }

    function closeAddTask()
    {
        $("#errTask").hide();
    }

    function removeTask()
    {

    }

</script>    



<div class="row">
    <div style="min-height: 200px; background-image: url(<c:url value="resources/images/wall_other.jpg" />);">        
        <div class="col-md-12">
            <h1> Employee Details</h1>

            <div class="row">

                <div class="col-md-4">
                    <img style="width: 40%" src="<c:url value="resources/images/emp.png" />">                  
                </div>

                <div class="col-md-4">
                    <h3> Name -  <c:out value="${employee.getName()}"></c:out>  

                        </h3>

                        <h3> Role -  <c:out value="${employee.getRole().getTitle()}"></c:out>  </h3>
                    <h3> Tasks Assigned -  <c:out value="${employee.getTasks().size()}"></c:out>  </h3>

                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-info " style="margin-top:1%" 
                                data-toggle="modal" data-target="#editModal"> EDIT</button>
                        <button class="btn btn-default " style="margin-top:1%" 
                                data-toggle="modal" data-target="#changeRole"> Change Role</button>

                        <button class="btn btn-success " style="margin-top:1%" 
                                data-toggle="modal" data-target="#addTask"> Add Task</button>                          
                    </div>

                </div>
            </div>
            <br>
        </div>
        <div class="row">

            <div class="col-md-12">
                <h3>Task List</h3>
                <hr>
                <table class="table table-hover table-striped table-condensed">
                    <thead>
                    <th>ID</th>
                    <th>Task Description</th>
                    <th style="width:90px"></th>
                    </thead>
                    <tbody>
                    <c:forEach var="task" items="${employee.getTasks()}">
                        <tr>
                            <td> <c:out value="${task.getId()}"></c:out> </td>
                            <td> <c:out value="${task.getDescription()}"></c:out> </td>
                                <td> 
                                    <button type="button" class="btn btn-xs btn-block form-control btn-danger" 
                                            onclick="remove(${task.getId()})"> Remove </button>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>

        </div>
    </div>

    <div class="modal fade" id="changeRole">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Change Employee Role</h4>
                </div>
                <form id="editRole" class="form-horizontal" action="eview.htm"  method="post">
                    <div class="modal-body">
                        <input type="hidden" name="_method" value="CHANGE_ROLE">
                        <input type="hidden" name="id" value="${employee.getId()}">
                        <div class="form-group">
                            <label for="" class="col-md-4 control-label">Select Role</label>
                            <div class="col-md-8">
                                <select id="role" type="text" name="role" class="form-control">
                                    <option value="0" ${employee.getRole() == null? 'selected':''}>No Role</option>
                                    <c:if test="${employee.getRole() != null}">
                                        <option value="${employee.getRole().getId()}" selected><c:out value="${employee.getRole().getTitle()}"></c:out></option>
                                    </c:if>
                                    <c:forEach var="role" items="${roles}">
                                        <c:if test="${role.getEmployee() == null}">
                                            <option value="${role.getId()}"> <c:out value="${role.getTitle()}"></c:out> </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <p style="display: none;color: red;" id="errRoleEdit">*Please enter a valid role</p>    
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button onclick="closeEditRole()" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button onclick="editRole()" type="button" class="btn btn-primary">Save</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>

    <div class="modal fade" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Edit Employee</h4>
                </div>
                <form id="editEmp" class="form-horizontal" action="eview.htm"  method="post">
                    <div class="modal-body">
                        <input type="hidden" name="_method" value="PATCH">

                        <input type="hidden" name="id" value="${employee.getId()}">
                        <div class="form-group">
                            <label for="" class="col-md-4 control-label">Employee Name</label>
                            <div class="col-md-8">
                                <input id="name" type="text" name="name" value="${employee.getName()}" class="form-control">
                                <p style="display: none;color: red;" id="errEmpName">*Please enter a valid name</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button onclick="closeEditEmp()" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button onclick="editEmp()" type="button" class="btn btn-primary">Save</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>

    <div class="modal fade" id="addTask">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add Employee Task</h4>
                </div>
                <form id="addTasks" class="form-horizontal" action="eview.htm"  method="post">
                    <div class="modal-body">
                        <input type="hidden" name="_method" value="ADD_TASK">
                        <input type="hidden" name="id" value="${employee.getId()}">
                        <div class="form-group">
                            <label for="" class="col-md-4 control-label">Select Task</label>
                            <div class="col-md-8">
                                <select id="task" type="text" name="task" class="form-control">
                                    <option value="0"  >Select Task</option>

                                    <c:forEach var="task" items="${tasks}">

                                        <option value="${task.getId()}"> <c:out value="${task.getDescription()}"></c:out> </option>

                                    </c:forEach>
                                </select>
                                <p style="display: none;color: red;" id="errTask">*Please select a task</p>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button onclick="closeAddTask()" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button onclick="addTask()" type="button" class="btn btn-primary">Save</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>

    <div class="modal fade" id="taskDelete">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Confirm Action</h4>
                </div>
                <form id="removeTask" class="form-horizontal" action="eview.htm"  method="post">
                    <div class="modal-body">
                        <p>Are you sure you want to remove this task from this employee?</p>
                        <input type="hidden" name="_method" value="REMOVE_TASK">

                        <input type="hidden" name="id" value="${employee.getId()}">
                        <input type="hidden" name="task" id="taskid">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button onclick="removeTask()" type="button" class="btn btn-danger">Remove</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>

</div>                 

<script>

    function remove(id) {

        $("#taskid").val(id);
        //$("#taskDelete").modal("show");

        swal({
            title: 'Are you sure?',
            text: "You want to remove this task from this employee?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, remove it!'
        }).then(function () {
            swal(
                    'Deleted!',
                    'Task has been removed.',
                    'success'
                    )

            setTimeout(function () {
                document.getElementById("removeTask").submit();
            }, 1300);
        })

    }

</script>                    



<%@include file="footer.jsp" %>