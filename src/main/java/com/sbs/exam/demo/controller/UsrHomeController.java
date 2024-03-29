package com.sbs.exam.demo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.exam.demo.service.MemberService;

@Controller
public class UsrHomeController {
	@RequestMapping("/usr/home/main")
	public String showMain() {
		return "usr/home/main";
	}
	@RequestMapping("/usr/home/m.main")
	public String mshowMain() {
		return "usr/home/m.main";
	}
	
	@RequestMapping("/usr/article/test")
	public String mshowTest() {
		return "usr/article/test";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}

	@RequestMapping("/webapp/sitemap.xml")
	public String showSitemap() {
		return "redirect:sitemap.xml";
	}
/*
	@RequestMapping("/webapp/robots.txt")
	public String showRobots() {
		return "redirect:robots.txt";
	}
*/
	@RequestMapping(value = { "/webapp/Robots.txt", "/Robots.txt", "/robots.txt" })
	public void robots(
	        HttpServletRequest request, HttpServletResponse response)
	                throws IOException {
	    response.getWriter().write("User-agent: *\nAllow: /\n#DaumWebMasterTool:b95a0c409465e0987709a93397179e195281ffafd100375360aa073492c8856d:IXoE9Sbxr5AafkHJRCBgzw==");
	}
	
	@RequestMapping("/webapp/ads.txt")
	public String Ads() {
		return "redirect:ads.txt";
	}
}
