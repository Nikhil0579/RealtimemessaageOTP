<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital Mini Clinic</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }

        /* Header Styles */
        header {
            background: linear-gradient(135deg, #1a73e8, #0d47a1);
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo {
            width: 50px;
            height: 50px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .logo-icon {
            color: #1a73e8;
            font-weight: bold;
            font-size: 24px;
        }

        .clinic-name {
            font-size: 24px;
            font-weight: 600;
        }

        .tagline {
            font-size: 14px;
            opacity: 0.9;
        }

        /* Navigation Styles */
        nav {
            display: flex;
            background: white;
            padding: 0 30px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .nav-item {
            padding: 15px 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            border-bottom: 3px solid transparent;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .nav-item i {
            margin-right: 8px;
            font-size: 18px;
        }

        .nav-item:hover {
            background-color: #f1f8ff;
            border-bottom: 3px solid #1a73e8;
        }

        .nav-item.active {
            border-bottom: 3px solid #1a73e8;
            color: #1a73e8;
        }

        /* Main Container Styles */
        .container {
            display: flex;
            min-height: calc(100vh - 130px);
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: white;
            padding: 20px 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.05);
        }

        .sidebar-item {
            padding: 15px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            border-left: 4px solid transparent;
        }

        .sidebar-item i {
            margin-right: 12px;
            font-size: 18px;
            width: 24px;
            text-align: center;
        }

        .sidebar-item:hover {
            background-color: #f1f8ff;
            border-left: 4px solid #1a73e8;
        }

        .sidebar-item.active {
            background-color: #e8f0fe;
            border-left: 4px solid #1a73e8;
            color: #1a73e8;
            font-weight: 500;
        }

        /* Content Area Styles */
        .content {
            flex: 1;
            padding: 25px;
            background: #f9fafb;
        }

        .content-header {
            margin-bottom: 25px;
        }

        .content-header h2 {
            color: #1a73e8;
            font-size: 24px;
            margin-bottom: 5px;
        }

        .content-header p {
            color: #666;
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #1a73e8;
            display: flex;
            align-items: center;
        }

        .card-title i {
            margin-right: 10px;
            font-size: 20px;
        }

        .card-content {
            color: #555;
        }

        /* Emergency Section */
        .emergency-section {
            background: white;
            border-radius: 8px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .emergency-title {
            color: #e53935;
            font-size: 22px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .emergency-title i {
            margin-right: 10px;
        }

        .emergency-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .emergency-item {
            background: #ffebee;
            border-left: 4px solid #e53935;
            padding: 15px;
            border-radius: 4px;
        }

        .emergency-item h4 {
            color: #c62828;
            margin-bottom: 8px;
        }

        /* Feedback Message */
        .success-message {
            background: #e8f5e9;
            border-left: 4px solid #43a047;
            padding: 10px 15px;
            margin-bottom: 20px;
            color: #2e7d32;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                order: 2;
            }

            nav {
                overflow-x: auto;
                white-space: nowrap;
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<header>
    <div class="logo-container">
        <div class="logo">
            <span class="logo-icon">DMC</span>
        </div>
        <div>
            <div class="clinic-name">Digital Mini Clinic</div>
            <div class="tagline">Your Health, Our Priority</div>
        </div>
    </div>
    <div class="user-info">
        <i class="fas fa-user-circle"></i> User Profile
    </div>
</header>

<nav>
    <div class="nav-item active"><i class="fas fa-tachometer-alt"></i> Dashboard</div>
    <div class="nav-item"><i class="fas fa-ambulance"></i> Emergency</div>
    <div class="nav-item"><i class="fas fa-phone-alt"></i> Helpline</div>
    <div class="nav-item"><i class="fas fa-info-circle"></i> About</div>
    <div class="nav-item"><i class="fas fa-comments"></i> Chatus</div>
    <div class="nav-item"><i class="fas fa-sign-out-alt"></i> Logout</div>
</nav>

<div class="container">
    <div class="sidebar">
        <div class="sidebar-item active"><i class="fas fa-ambulance"></i> Emergency</div>
        <div class="sidebar-item"><i class="fas fa-lightbulb"></i> Suggestion</div>
        <div class="sidebar-item"><i class="fas fa-hospital"></i> Near Hospital</div>
        <div class="sidebar-item"><i class="fas fa-user-md"></i> Chat with Doctor</div>
        <div class="sidebar-item"><i class="fas fa-user-md"></i> Medical campaign</div>
        <div class="sidebar-item"><i class="fas fa-sign-out-alt"></i> Logout</div>
    </div>

    <div class="content">
        <div class="content-header">
            <h2>Dashboard</h2>
            <p>Welcome to Digital Mini Clinic management system</p>
        </div>

        <!-- ✅ Success Message -->
        <c:if test="${not empty successMsg}">
            <div class="success-message">${successMsg}</div>
        </c:if>

        <div class="dashboard-cards">
            <div class="card">
                <div class="card-title"><i class="fas fa-user-injured"></i> Patient Overview</div>
                <div class="card-content">
                    <p>Total Patients: 142</p>
                    <p>New Today: 8</p>
                    <p>Appointments: 12</p>
                </div>
            </div>

            <div class="card">
                <div class="card-title"><i class="fas fa-stethoscope"></i> Medical Staff</div>
                <div class="card-content">
                    <p>Doctors: 5</p>
                    <p>Nurses: 8</p>
                    <p>Available: 10</p>
                </div>
            </div>

            <div class="card">
                <div class="card-title"><i class="fas fa-pills"></i> Pharmacy</div>
                <div class="card-content">
                    <p>Medicines: 245</p>
                    <p>Low Stock: 12</p>
                    <p>Orders: 5</p>
                </div>
            </div>
        </div>

        <div class="emergency-section">
            <h2 class="emergency-title"><i class="fas fa-first-aid"></i> Useful in Emergency</h2>
            <div class="emergency-grid">
                <div class="emergency-item"><h4>CPR Instructions</h4><p>Step-by-step guide for Cardiopulmonary Resuscitation</p></div>
                <div class="emergency-item"><h4>First Aid for Bleeding</h4><p>How to control bleeding and apply pressure</p></div>
                <div class="emergency-item"><h4>Choking Response</h4><p>Heimlich maneuver for adults and children</p></div>
                <div class="emergency-item"><h4>Allergic Reaction</h4><p>Using epinephrine auto-injectors and emergency care</p></div>
                <div class="emergency-item"><h4>Burn Treatment</h4><p>First, second, and third-degree burn care</p></div>
                <div class="emergency-item"><h4>Poison Control</h4><p>Emergency steps for poisoning incidents</p></div>
            </div>
        </div>

        <!-- ✅ Feedback Form -->
        <div class="card mt-4">
            <div class="card-title"><i class="fas fa-comment-dots"></i> Share Your Suggestion</div>
            <div class="card-content">
                <form action="/submitFeedback" method="post">
                    <div style="margin-bottom: 10px;">
                        <label for="name" style="font-weight: 500;">Your Name:</label><br>
                        <input type="text" id="name" name="name"
                               style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" required>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <label for="message" style="font-weight: 500;">Your Message:</label><br>
                        <textarea id="message" name="message" rows="4"
                                  style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"
                                  placeholder="Type your suggestion..." required></textarea>
                    </div>
                    <button type="submit"
                            style="background-color: #1a73e8; color: white; border: none;
                                   padding: 10px 20px; border-radius: 5px; cursor: pointer;">
                        Submit
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const navItems = document.querySelectorAll('.nav-item');
        navItems.forEach(item => {
            item.addEventListener('click', function() {
                navItems.forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            });
        });

        const sidebarItems = document.querySelectorAll('.sidebar-item');
        sidebarItems.forEach(item => {
            item.addEventListener('click', function() {
                sidebarItems.forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            });
        });
    });
</script>
</body>
</html>
