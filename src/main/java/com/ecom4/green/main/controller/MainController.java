package com.ecom4.green.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {
        @Autowired
        SaleService saleService;
	
	@RequestMapping("/")
	public String index(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
	        String main = null;
		main = "Main";
		model.addAttribute("main", main);
		return "Index";
	}

	@RequestMapping("/np/best-item")
	public String bestProductList(HttpServletRequest req, HttpServletResponse resp , Model model, @RequestParam(required = false,defaultValue = "0") int category, @PageableDefault(size = 25,page = 0)Pageable pageable)
	{
	        String main = null;
	        main = "public/view/BestItemList";
	        Page<SaleDTO> salePage = null;

	        Map<String,Object> dataMap = new HashMap<>();
	        dataMap.put("category",category);
	        dataMap.put("pageable",pageable);
	        salePage = saleService.getSalePage(dataMap);

	        model.addAttribute("category",category);
	        model.addAttribute("salePage",salePage);
	        model.addAttribute("main", main);
	        return "Index";
	}

        @RequestMapping("/np/best-region")
        public String bestRegionList(HttpServletRequest req, HttpServletResponse resp , Model model,@RequestParam(value = "category" ,required = false,defaultValue = "0") int region, @PageableDefault(size = 25,page = 0)Pageable pageable)
        {
	      String main = null;
	      main = "public/view/BestRegionList";
	      Page<SaleDTO> salePage = null;

	      Map<String,Object> dataMap = new HashMap<>();
	      dataMap.put("region",region);
	      dataMap.put("pageable",pageable);
	      salePage = saleService.getSalePage(dataMap);

	      model.addAttribute("region",region);
	      model.addAttribute("salePage",salePage);
	      model.addAttribute("main", main);
	      return "Index";
        }


        @RequestMapping("/np/search")
        public String search(@RequestParam(value = "category",defaultValue = "0" ,required = false) int category,
		         @RequestParam(value = "region",defaultValue = "0" ,required = false) int region,
		         @RequestParam(value = "keyword",defaultValue = "" ,required = false) String keyword,
		         @PageableDefault(value = 25,page = 0) Pageable pageable,
		         HttpServletRequest req, HttpServletResponse resp , Model model)
        {
	      String main = null;
	      main = "public/view/Search";
	      Page<SaleDTO> salePage = null;
	      Map<String,Object> dataMap = new HashMap<>();
	      dataMap.put("category",category);
	      dataMap.put("region",region);
	      dataMap.put("keyword",keyword);
	      dataMap.put("pageable",pageable);
	      salePage = saleService.getSalePage(dataMap);

	      model.addAttribute("salePage",salePage);
	      model.addAttribute("category",category);
	      model.addAttribute("region",region);
	      model.addAttribute("keyword",keyword);
	      model.addAttribute("main", main);
	      return "Index";
        }

}
