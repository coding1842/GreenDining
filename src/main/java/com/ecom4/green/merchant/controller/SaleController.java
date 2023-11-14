package com.ecom4.green.merchant.controller;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import com.ecom4.green.merchant.service.ProductService;
import com.ecom4.green.merchant.service.SaleService;
import com.ecom4.green.merchant.wrapper.SaleForm;
import com.ecom4.green.user.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item")
public class SaleController
{
        @Autowired
        AuthService authService;
        @Autowired
        SaleService saleService;

        @Autowired
        ProductService productService;
        @GetMapping("/list")
        public String getProductList(HttpSession session ,HttpServletRequest req,HttpServletResponse resp, Model model ,@RequestParam("category") int category, @RequestParam("keyword")  String keyword , @PageableDefault(size = 10,page = 0) Pageable pageable) {


                String main = null;
                String url = null;
                Page<SaleDTO> saleList = null;

                if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
                {
                        Map<String, Object> dataMap = null;
                        dataMap.put("category", category);
                        dataMap.put("keyword", keyword);
                        dataMap.put("pageable", pageable);
                        dataMap.put("merchant_id", authService.getCurrentUser(session).getRole());

                        saleList = saleService.getSaleList(dataMap);
                }
                else
                {
                        url = "redirect:/";
                        return url;
                }


                main = "smartstore/view/SaleList";
                model.addAttribute("saleList",saleList);
                model.addAttribute("main", main);
                return "Index";
        }
        @GetMapping("/write")
        public String insertSaleForm(HttpServletRequest req,
                                        HttpServletResponse resp,
                                        Model model, HttpSession session) {
                String main = null;
                String url = null;
                List<ProductDTO> productDTOList = new ArrayList<>();
                if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
                {
                        main = "smartstore/form/InsertSale";
                        productDTOList = productService.getProductList(authService.getCurrentUser(session).getId());
                }
                else
                {
                        url = "redirect:/auth/login";
                        return url;
                }

                model.addAttribute("main", main);
                model.addAttribute("productList",productDTOList);
//                model.addAttribute("merchant_id",authService.getCurrentUser(session).getId());
                return "Index";
        }
        //	상품 등록
        @PostMapping("/write")
        public String insertSale(HttpServletRequest req,
                                 HttpServletResponse resp,
                                 Model model ,@ModelAttribute SaleForm saleForm, HttpSession session) {
                String url = null;

                SaleDTO saleDTO = saleForm.getSaleDTO();
                List<SaleProductDTO> saleProductDTOList = saleForm.getSaleProductDTOList();

                if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
                {
                        try
                        {
                                saleService.insertSale(saleDTO);
                                saleService.insertSaleProductList(saleProductDTOList);
                        }
                        catch(Exception e)
                        {
                                e.printStackTrace();
                        }
                        url = "redirect:/item/list";
                }
                else
                {
                        url = "redirect:/";
                }

                return url;
        }

        //	상품 수정 폼으로 이동
        @GetMapping("/write/{sale-id}")
        public String updateSaleForm(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model,@PathVariable("sale-id") int saleID ) {

                String main = null;
                String url = null;
                SaleDTO saleDTO = new SaleDTO();

                if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
                {
                        saleDTO = saleService.getSale(saleID);
                        main = "smartstore/form/UpdateSale";
                }
                else
                {
                        url = "redirect:/";
                        return url;
                }


                model.addAttribute("sale" , saleDTO );
//	        테스트에서는 비활성화
//	        model.addAttribute("merchant_id",authService.getCurrentUser(session).getId());
                model.addAttribute("main", main);
                return "Index";
        }
        //	상품 수정 요청
        @PatchMapping("/write/{sale-id}")
        public String updateSale(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model, SaleDTO saleDTO ) throws Exception
        {

                String main = null;
                String url = null;




                if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
                {
                        saleService.updateSale(saleDTO);
                        url = "redirect:/item/list";
                }
                else
                {
                        url = "redirect:/";
                        return url;
                }

                return url;
        }

        //	상품 삭제
        @PostMapping("/delete/{sale-id}")
        public String deleteProduct(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model,@PathVariable("sale-id") int saleID ) throws Exception
        {


                String url = null;



                if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
                {
                        saleService.deleteSale(saleID);
                        url = "redirect:/sale/list";
                }
                else
                {
                        url = "redirect:/";
                }

                return url;
        }

}
