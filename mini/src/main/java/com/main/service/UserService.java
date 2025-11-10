package com.main.service;

import com.main.model.User;
import com.main.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.Random;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final OtpService otpService;

    public UserService(UserRepository userRepository, OtpService otpService) {
        this.userRepository = userRepository;
        this.otpService = otpService;
    }

    public String registerUser(String name, String phone) {
        // Delete any existing user with the same phone number
        Optional<User> existingUser = userRepository.findByPhone(phone);
        existingUser.ifPresent(userRepository::delete);

        // Generate and save new OTP
        String otp = String.valueOf(100000 + new Random().nextInt(900000));

        User user = new User();
        user.setName(name);
        user.setPhone(phone);
        user.setOtp(otp);
        user.setVerified(false);

        userRepository.save(user);

        return otpService.sendOtp(phone, otp);
    }

    public boolean verifyOtp(String phone, String enteredOtp) {
        Optional<User> userOpt = userRepository.findByPhone(phone);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (user.getOtp().equals(enteredOtp)) {
                user.setVerified(true);
                userRepository.save(user);
                return true;
            }
        }
        return false;
    }
}
