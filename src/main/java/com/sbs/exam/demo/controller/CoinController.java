package com.sbs.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CoinController {
	@RequestMapping("/usr/coin/coinmain")
	public String coinMain() {
		return "usr/coin/coinmain";
	}
	@RequestMapping("/usr/coin/binance")
	public String binance() {
		return "usr/coin/binance";
	}
	@RequestMapping("/usr/coin/bitmex")
	public String bitmex() {
		return "usr/coin/bitmex";
	}
	@RequestMapping("/usr/coin/bybit")
	public String bybit() {
		return "usr/coin/bybit";
	}
	@RequestMapping("usr/coin/moonxbt")
	public String moonxbt() {
		return "usr/coin/moonxbt";
	}
	@RequestMapping("usr/coin/bitget")
	public String bitget() {
		return "usr/coin/bitget";
	}

}
