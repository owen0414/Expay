package com.rest.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/")
public class PageController {

	@GetMapping("")
	public String Index() {
		
		return "frontend/index";
		
	}
	
	@GetMapping("/deposit")
	public String deposit() {
		return "frontend/deposit";
	}
	
	@GetMapping("/withdraw")
	public String withdraw() {
		return "frontend/withdraw";
	}
	
	@GetMapping("/pay")
	public String pay() {
		return "frontend/pay";
	}
	
	@GetMapping("/recieve")
	public String recieve() {
		return "frontend/recieve";
	}
	
	@GetMapping("/setting")
	public String setting() {
		return "frontend/setting";
	}
	
	@GetMapping("/shopSetting")
	public String shopSetting() {
		return "frontend/shopSetting";
	}
	
	@GetMapping("/updatePassword")
	public String updatePassword() {
		return "frontend/updatePassword";
	}
	
	@GetMapping("/help")
	public String help() {
		return "frontend/help";
	}
	
	@GetMapping("/transfer")
	public String transfer() {
		return "frontend/transfer";
	}
	
	@GetMapping("/personalPage")
	public String personalPage() {
		return "frontend/personalPage";
	}
}
