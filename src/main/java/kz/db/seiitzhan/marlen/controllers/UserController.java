package kz.db.seiitzhan.marlen.controllers;

import kz.db.seiitzhan.marlen.entity.User;
import kz.db.seiitzhan.marlen.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserRepository userRepository;

    @GetMapping
    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    @GetMapping("/{user-id}")
    public User getUser(@PathVariable("user-id") Integer userId) {
        if (userId == null) return null;
        if (!userRepository.existsById(userId))
            throw new RuntimeException("no user with such id");
        return userRepository.findById(userId)
                .orElseThrow();
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        return Optional.ofNullable(user)
                .map(a -> {
                    user.setUserId(null);
                    return a;
                })
                .map(userRepository::save)
                .orElseThrow();
    }

    @DeleteMapping("/{user-id}")
    public void deleteUser(@PathVariable("user-id") Integer userId) {
        if (userId == 0) return ;
        if (!userRepository.existsById(userId))
            throw new RuntimeException("no user with such id");
        userRepository.deleteById(userId);
    }

    @PutMapping("/{user-id}")
    public User updateUser(@PathVariable("user-id") Integer userId, @RequestBody User user) {
        if (userId == null || user == null) return null;
        user.setUserId(userId);
        if (!userRepository.existsById(userId))
            throw new RuntimeException("User not found");
        return Optional.of(user)
                .map(userRepository::save)
                .orElseThrow();
    }
}
