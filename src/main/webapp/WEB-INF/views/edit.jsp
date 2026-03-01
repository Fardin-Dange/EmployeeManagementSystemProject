<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>

<style>
body{
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg,#667eea,#764ba2);
    margin:0;
}

.card{
    width: 420px;
    margin: 70px auto;
    background: white;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.25);
}

h2{
    text-align:center;
    margin-bottom:20px;
}

label{
    font-weight:600;
}

input{
    width:100%;
    padding:10px;
    margin-top:6px;
    margin-bottom:15px;
    border-radius:6px;
    border:1px solid #ccc;
}

button{
    width:100%;
    padding:12px;
    background:#667eea;
    color:white;
    border:none;
    border-radius:6px;
    font-size:15px;
    cursor:pointer;
}

button:hover{
    background:#5563d6;
}
</style>
</head>

<body>

<div class="card">

    <h2>Edit Employee</h2>

    <!-- ✅ IMPORTANT: hidden id -->
    <form action="saveEdit" method="post">

        <input type="hidden" name="id" value="${employee.id}">

        <label>Name</label>
        <input type="text" name="ename" value="${employee.name}" required>

        <label>Role</label>
        <input type="text" name="erole" value="${employee.role}" required>

        <label>Salary</label>
        <input type="number" name="salary" value="${employee.salary}" required>

        <button type="submit">Update Employee</button>

    </form>

</div>

</body>
</html>