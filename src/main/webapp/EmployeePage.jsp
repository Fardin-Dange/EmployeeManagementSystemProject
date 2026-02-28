<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee List</title>

<style>
*{
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(135deg,#667eea,#764ba2);
    margin: 0;
}

/* ===== HEADER ===== */
.header {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(8px);
    padding: 15px 30px;
    color: white;
    font-size: 22px;
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.back-btn {
    background: white;
    color: #667eea;
    border: none;
    padding: 8px 16px;
    border-radius: 6px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.25s;
}

.back-btn:hover {
    background: #f1f3ff;
}

/* ===== CARD ===== */
.container {
    width: 92%;
    max-width: 950px;
    margin: 35px auto;
    background: #ffffff;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.25);
}

/* ===== TABLE ===== */
table {
    width: 100%;
    border-collapse: collapse;
    overflow: hidden;
    border-radius: 10px;
}

th {
    background: #667eea;
    color: white;
    padding: 14px;
    font-size: 15px;
}

td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #eee;
}

tr:hover {
    background: #f6f8ff;
    transition: 0.2s;
}

/* ===== BUTTONS ===== */
.btn {
    padding: 7px 14px;
    border-radius: 6px;
    text-decoration: none;
    color: white;
    font-size: 13px;
    font-weight: 600;
}

.edit-btn {
    background: #28a745;
}

.edit-btn:hover {
    background: #218838;
}

.delete-btn {
    background: #dc3545;
    border: none;
    cursor: pointer;
    color: white;
}

.delete-btn:hover {
    background: #c82333;
}

/* ===== EMPTY STATE ===== */
.empty {
    text-align: center;
    padding: 30px;
    color: #777;
    font-weight: 500;
}
</style>
</head>

<body>

<!-- ✅ SUCCESS -->
<c:if test="${msg != null and fn:trim(msg) != ''}">
    <script>alert("${msg}");</script>
</c:if>

<!-- ❌ ERROR -->
<c:if test="${error != null and fn:trim(error) != ''}">
    <script>alert("${error}");</script>
</c:if>

<!-- ===== HEADER ===== -->
<div class="header">
    <div>Employee List</div>

    <form action="dashboard" method="get" style="margin:0;">
        <button class="back-btn">← Dashboard</button>
    </form>
</div>

<!-- ===== CARD ===== -->
<div class="container">

    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Role</th>
            <th>Salary</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <!-- ✅ EMPTY LIST -->
        <c:if test="${empty EmpList}">
            <tr>
                <td colspan="6" class="empty">
                    No employees found
                </td>
            </tr>
        </c:if>

        <!-- ✅ DATA -->
        <c:forEach var="emp" items="${EmpList}">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.name}</td>
                <td>${emp.role}</td>
                <td>${emp.salary}</td>

                <td>
                    <a class="btn edit-btn"
                       href="editEmployeePage?id=${emp.id}">
                       Edit
                    </a>
                </td>

                <td>
                    <!-- ✅ FIXED (no button inside anchor bug) -->
                    <form action="deleteEmployee" method="get" style="margin:0;">
                        <input type="hidden" name="id" value="${emp.id}">
                        <button class="btn delete-btn"
                                onclick="return confirm('Delete this employee?')">
                            Delete
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>

    </table>

</div>

</body>
</html>