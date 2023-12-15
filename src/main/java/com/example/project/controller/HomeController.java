package com.example.project.controller;


import com.example.project.model.Account;
import com.example.project.repository.IAccountRepository;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@AllArgsConstructor
public class HomeController {

    private final IAccountRepository accountRepository;
    private final HttpSession httpSession;

    @GetMapping(value = {"/", "/index"})
    public String index(Model model) {
        var user = httpSession.getAttribute("user");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "index";
    }

    @GetMapping(value = "/logout")
    public String logout() {
        httpSession.removeAttribute("user");
        return "redirect:/index";
    }

    @GetMapping(value = "/register")
    public String register() {
        return "register";
    }

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }


    @PostMapping(value = "/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        System.out.println(username + " " + password);
        var user = accountRepository.findByUsername(username);
        System.out.println(user);
        if (user != null) {
            if(user.getPassword().equals(password)) {
                httpSession.setAttribute("user", user);
                return "redirect:/index";
            }
        }
        model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng");
        return "login?error";
    }

    @PostMapping(value = "/register")
    public String register(@ModelAttribute Account account, Model model) {
        var user = accountRepository.findByUsername(account.getUsername());
        if (user != null) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại");
            return "register?error";
        }
        accountRepository.save(account);
        return "redirect:/login";
    }
}
