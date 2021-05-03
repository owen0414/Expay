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
	
	@GetMapping("history")
	public String History() {
		
		return "frontend/history";
		
	}
	
	@GetMapping("quota")
	public String Quota() {
		
		return "frontend/quota";
		
	}
	
	@GetMapping("payment_notification")
	public String PaymentNotification() {
		
		return "frontend/paymentNotification";
		
	}
	
	@GetMapping("user/login")
	public String Login() {
		
		return "frontend/login";
		
	}
	
	@GetMapping("user/register")
	public String Register() {
		
		return "frontend/register";
		
	}
	
	@GetMapping("user/register/member")
	public String memberRegister() {
		
		return "frontend/memberRegister";
		
	}
	
	@GetMapping("user/register/shop")
	public String shopRegister() {
		
		return "frontend/shopRegister";
		
	}
	
	@GetMapping("user/payment_password")
	public String paymentPassword() {
		
		return "frontend/payment_password";
		
	}
}
