package com.sbs.exam.demo.controller;

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

}
