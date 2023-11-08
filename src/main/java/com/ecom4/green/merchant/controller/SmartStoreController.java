package com.ecom4.green.merchant.controller;

import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/smartstore")
public class SmartStoreController
{

        @Autowired
        SaleService saleService;


        @GetMapping("")
        public String testStore(HttpServletRequest req, HttpServletResponse resp , Model model)
        {

                String main = null;
                main = "smartstore/view/Main";
                model.addAttribute("main", main);
                return "Index";
        }

//       특정 스토어  메인으로 view
        @GetMapping("/{store-name}")
        public String smartStorePage(HttpServletRequest req, HttpServletResponse resp , Model model)
        {

                String main = null;
                main = "smartstore/view/Main";
                model.addAttribute("main", main);
                return "Index";
        }

//        ?page= 페이지 번호 RequestParam하면 자동으로 pageable로 들어감
        @GetMapping("/{store-name}/list")
        public String smartStoreItemList(HttpServletRequest req, HttpServletResponse resp , Model model ,
                                         @RequestParam("category") int category, @RequestParam("keyword")  String keyword , @PageableDefault(size = 10,page = 0) Pageable pageable)
        {


                Page<SaleDTO> saleList =  null;
                String main = null;
                if(keyword == null)
                {
                        saleList = saleService.getSaleList(category,pageable);
                }
                else
                {
                        saleList = saleService.getSaleList(category,keyword,pageable);

                }
                main = "smartstore/view/ItemList";

                model.addAttribute("saleList",saleList);
                model.addAttribute("main", main);
                return "Index";
        }


}
