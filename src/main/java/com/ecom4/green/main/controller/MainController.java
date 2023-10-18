package com.ecom4.green.main.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String MainPage(HttpServletRequest req, HttpServletResponse resp, Model model)
    {
        MemberDTO ssKey = null;
        String url = "Index";
        HttpSession session
        return url;
    }
}
