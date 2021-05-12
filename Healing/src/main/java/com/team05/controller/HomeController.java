package com.team05.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.rosuda.REngine.Rserve.RConnection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team05.command.ProductVO;
import com.team05.search.service.SearchService;


@Controller
public class HomeController {
	
	@Autowired
	SearchService searchService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		ArrayList<ProductVO> productlist=searchService.reviewRank();
		System.out.println(productlist.toString());
		model.addAttribute("productlist", productlist);
		return "home";
	}
	
}
