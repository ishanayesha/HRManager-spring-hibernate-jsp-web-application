<%-- 
    Author     : Ishan Ayesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>

<div style="min-height: 150px; background-image: url(<c:url value="resources/images/wall_other.jpg" />);">

<div class="row">
    <div class="col-md-12">
        <h1>Roles  <button class="btn btn-info pull-right" style="margin-top:1%" data-toggle="modal" data-target="#addModal"> Add Role</button></h1>
    </div>

</div>
</div>    



<script type="text/javascript">
    
    function addRole()
    {
        var title=$('#title').val();
        
        if(title=="")
        {
            $("#errRoleAdd").show();
        }
        else
        {
            document.getElementById("addRole").submit();
        }
          

    }
    
    function closeAddRole()
    {
        $("#errRoleAdd").hide();
    }
    
    
    
    function editRole()
    {
        var title=$('#rolename').val();
        
        if(title=="")
        {
            $("#errRoleEdit").show();
        }
        else
        {
            document.getElementById("editRole").submit();
        }
    }
          
    function closeEditRole()
    {
        $("#errRoleEdit").hide();
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
    <th>Role Name</th>
    <th style="width:90px"></th>
</thead>
<tbody>
    <c:forEach var="role" items="${roles}">
        <tr>
            <td> <c:out value="${role.getId()}"></c:out> </td>
            <td> <c:out value="${role.getTitle()}"></c:out> </td>
                <td>  
                    <button type="button" style="color: white; background-color: #2B5896" class="btn btn-xs btn-block form-control" 
                            onclick="edit(${role.getId()}, '${role.getTitle()}')"> Edit </button>
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
                <h4 class="modal-title">Add Role</h4>
            </div>
            <form id="addRole" class="form-horizontal" action="role.htm"  method="post">
                <div class="modal-body">
                    <input type="hidden" id="action" name="_method" value="POST">
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label">Role Name</label>
                        <div class="col-md-8">
                            <input id="title" type="text" name="title" class="form-control" required="true">
                            <p style="display: none;color: red;" id="errRoleAdd">*Please enter a valid role</p>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button onclick="closeAddRole()" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button onclick="addRole()" type="button" class="btn btn-primary">Save</button>
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
                <h4 class="modal-title">Edit Role</h4>
            </div>
            <form id="editRole" class="form-horizontal" action="role.htm"  method="post">
                <div class="modal-body">
                    <input type="hidden" name="_method" value="PUT">
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label">Role ID</label>
                        <div class="col-md-8">
                            <input type="text" name="id" id="roleid" class="form-control" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-md-4 control-label">Role Name</label>
                        <div class="col-md-8">
                            <input type="text" name="title" id="rolename" class="form-control">
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





<script>

    function edit(id, name) {
        console.log(id, name);
        $("#rolename").val(name);
        $("#roleid").val(id);
        $("#editModal").modal("show");
    }

</script>

<%@include file="footer.jsp" %>