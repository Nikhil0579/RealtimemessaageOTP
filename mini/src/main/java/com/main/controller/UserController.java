package com.main.controller;

import com.main.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // ✅ Step 1: Show Register Page
    @GetMapping("/")
    public String showRegisterPage() {
        return "register";
    }

    // ✅ Step 2: Register User and Send OTP
    @PostMapping("/register")
    public String registerUser(@RequestParam String name,
                               @RequestParam String phone,
                               Model model) {
        String msg = userService.registerUser(name, phone);
        model.addAttribute("phone", phone);
        model.addAttribute("message", msg);
        return "verify"; // show verify.jsp
    }

    // ✅ Step 3: Verify OTP and Redirect to Dashboard
    @PostMapping("/verify")
    public String verifyOtp(@RequestParam String phone,
                            @RequestParam String otp,
                            Model model) {
        boolean success = userService.verifyOtp(phone, otp);

        if (success) {
            // OTP is correct → open dashboard.jsp
            model.addAttribute("userPhone", phone);
            return "dashboard"; // loads WEB-INF/jsp/dashboard.jsp
        } else {
            // OTP invalid → stay on verify.jsp with message
            model.addAttribute("phone", phone);
            model.addAttribute("message", "❌ Invalid OTP! Please try again.");
            return "verify";
        }
    }

    // ✅ Step 4: Optional Direct Dashboard Access (only if verified)
    @GetMapping("/dashboard")
    public String dashboardPage(Model model) {
        // You can add any logic here (fetch user info, etc.)
        model.addAttribute("welcomeMsg", "Welcome to your Dashboard!");
        return "dashboard";
    }
    @PostMapping("/submitFeedback")
    public String submitFeedback(@RequestParam String name,
                                 @RequestParam String message,
                                 Model model) {

        // You can save to DB later — for now, just show success message
        model.addAttribute("successMsg", "✅ Thank you, " + name + "! Your feedback has been received.");
        model.addAttribute("userPhone", ""); // Optional, if you used this variable

        return "dashboard"; // Reload the same dashboard.jsp page
    }
    

}
