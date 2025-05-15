<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Report - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f9;
            margin: 0;
            padding: 0;
        }
        .report-details {
            max-width: 700px;
            margin: 60px auto;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.08);
        }
        h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #444;
        }
        input[type="text"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            background-color: #fdfdfd;
        }
        textarea {
            resize: vertical;
            min-height: 120px;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }
        .btn-outline,
        .btn-cancel {
            padding: 12px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-outline {
            border: 2px solid #7b5cff;
            color: #7b5cff;
            background-color: transparent;
        }
        .btn-outline:hover {
            background-color: #7b5cff;
            color: white;
        }
        .btn-cancel {
            background-color: #f44336;
            color: white;
            border: none;
        }
        .btn-cancel:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/navbar.jsp" %>
</nav>

<div class="report-details">
    <h2>Edit Community Issue Report</h2>
    <form id="editForm" action="editReport" method="post" enctype="multipart/form-data">
        <input type="hidden" name="reportId" value="${report.id}">

        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${report.title}" required>
        </div>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" required>${report.description}</textarea>
        </div>

        <div class="form-group">
            <label for="image">Update Image:</label>
            <input type="file" id="image" name="image" accept="image/*">
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-outline">Save Changes</button>
            <a href="viewReport?id=${report.id}" class="btn-cancel">Cancel</a>
        </div>
    </form>
</div>

<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>
</body>
</html>
