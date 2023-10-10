package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExampleController {

	@GetMapping("/example1")
	public String example1(Model model) {
		model.addAttribute("name", "joinair");
		return "/example1";
	}
}
