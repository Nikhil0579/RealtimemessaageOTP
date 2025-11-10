<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register with OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
<div class="card p-4 shadow-lg" style="width: 25rem;">
    <h3 class="text-center mb-3">Register</h3>
    <form action="/register" method="post">
        <div class="mb-3">
            <input type="text" name="name" class="form-control" placeholder="Enter Name" required>
        </div>
        <div class="mb-3">
            <input type="text" name="phone" class="form-control" placeholder="Enter Phone (with country code)" required>
        </div>
        <button class="btn btn-primary w-100">Send OTP</button>
    </form>
</div>
</body>
</html>
