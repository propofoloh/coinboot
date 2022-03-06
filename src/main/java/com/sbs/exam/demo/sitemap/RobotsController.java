package com.sbs.exam.demo.sitemap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RobotsController {

    @RequestMapping(value = "/robots.txt", method = RequestMethod.GET)
    public String getRobots(HttpServletRequest request) {
        return "User-agent: *\n" +
                "Disallow: /admin\n";
    }
}