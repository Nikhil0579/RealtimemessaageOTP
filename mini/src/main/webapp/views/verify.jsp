<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Verify OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
<div class="card p-4 shadow-lg" style="width: 25rem;">
    <h3 class="text-center mb-3">Verify OTP</h3>
    <p class="text-center text-success">${message}</p>
    <form action="/verify" method="post">
        <input type="hidden" name="phone" value="${phone}">
        <div class="mb-3">
            <input type="text" name="otp" class="form-control" placeholder="Enter OTP" required>
        </div>
        <button class="btn btn-success w-100">Verify</button>
    </form>
</div>
</body>
</html>
