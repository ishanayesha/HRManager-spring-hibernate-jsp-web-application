<%-- 
    Author     : Ishan Ayesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>




<script type="text/javascript">
    
    function addTask()
    {
        var description=$('#description').val();
        
        if(description=="")
        {
            $("#errTaskAdd").show();
        }
        else
        {
            document.getElementById("addTask").submit();
        }
          

    }
    
    function closeAddTask()
    {
        $("#errTaskAdd").hide();
    }
    
    
    
    function editTask()
    {
        var description=$('#desc').val();
        
        if(description=="")
        {
            $("#errTaskEdit").show();
        }
        else
        {
            document.getElementById("editTask").submit();
        }
    }
          
    function closeEditTask()
    {
        $("#errTaskEdit").hide();
    }
        

</script>



<div style="min-height: 150px; background-image: url(<c:url value="resources/images/wall_other.jpg" />);">
    <div class="row">
        <div class="col-md-12">
            <h1>Tasks  
                <button class="btn btn-info pull-right" style="margin-top:1%" data-toggle="modal" data-target="#addModal"> 
                    Add Task</button></h1>
        </div>

    </div>
    <br>
    
</div>
    <br>
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
    
    <table class="table table-hover table-striped table-condensed">
        <thead>
        <th>ID</th>
        <th>Task Description</th>
        <th style="width:90px"></th>
        </thead>
        <tbody>
            <c:forEach var="task" items="${tasks}">
                <tr>
                    <td> <c:out value="${task.getId()}"></c:out> </td>
                    <td> <c:out value="${task.getDescription()}"></c:out> </td>
                        <td>  
                            <button type="button" style="color: white; background-color: #2B5896" class="btn btn-xs btn-block form-control"
                                    onclick="edit(${task.getId()}, '${task.getDescription()}')"> Edit </button>
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
                    <h4 class="modal-title">Add Task</h4>
                </div>
                <form id="addTask" class="form-horizontal" action="task.htm"  method="post">
                    <div class="modal-body">
                        <input type="hidden" name="_method" value="POST">
                        <div class="form-group">
                            <label for="" class="col-md-4 control-label">Description</label>
                            <div class="col-md-8">
                                <textarea id="description" type="text" name="desc" class="form-control" required="true"></textarea>
                                <p style="display: none;color: red;" id="errTaskAdd">*Please enter a valid task</p>
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


    <div class="modal fade" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Edit Task</h4>
                </div>
                <form id="editTask" class="form-horizontal" action="task.htm"  method="post">
                    <div class="modal-body">
                        <input type="hidden" name="_method" value="PUT">
                        <div class="form-group">
                            <label for="" class="col-md-4 control-label">Task ID</label>
                            <div class="col-md-8">
                                <input type="text" name="id" id="taskid" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-md-4 control-label"> Description</label>
                            <div class="col-md-8">
                                <textarea type="text" name="desc" id="desc" class="form-control"></textarea>
                                <p style="display: none;color: red;" id="errTaskEdit">*Please enter a valid task</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button onclick="closeEditTask()" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button onclick="editTask()" type="button" class="btn btn-primary">Save</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>



<script>

    function edit(id, desc) {

        $("#desc").val(desc);
        $("#taskid").val(id);
        $("#editModal").modal("show");
    }

</script>

<%@include file="footer.jsp" %>