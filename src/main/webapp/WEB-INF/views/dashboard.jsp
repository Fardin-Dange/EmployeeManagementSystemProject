<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMS Dashboard</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg,#667eea,#764ba2);
    margin: 0;
}

.container {
    width: 420px;
    margin: 60px auto;
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.25);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

label {
    font-weight: bold;
}

input {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 12px;
    background: #667eea;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #5563d6;
}

.link-btn {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #667eea;
    font-weight: bold;
}
</style>
</head>

<body>

<!-- ✅ SUCCESS POPUP -->
<c:if test="${msg != null and fn:trim(msg) != ''}">
    <script>
        alert("${msg}");
    </script>
</c:if>

<!-- ❌ ERROR POPUP -->
<c:if test="${error != null and fn:trim(error) != ''}">
    <script>
        alert("${error}");
    </script>
</c:if>

<div class="container">

    <h2>Welcome to EMS Dashboard</h2>

    <form action="addEmp" method="post">

        <label for="name">Name</label>
        <input type="text" id="name" name="ename" required>

        <label for="role">Role</label>
        <input type="text" id="role" name="erole" required>

        <label for="salary">Salary</label>
        <input type="number" id="salary" name="salary" required>

        <button type="submit">Add Employee</button>
    </form>

    <a class="link-btn" href="getAllEmp">View All Employees →</a>

</div>

</body>
</html>