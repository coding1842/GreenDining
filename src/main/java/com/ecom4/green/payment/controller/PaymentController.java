package com.ecom4.green.payment.controller;

import com.ecom4.green.payment.service.ApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/payment")
public class PaymentController
{
        private static final  String authenticationKey = "ac805b30517f4fd08e3e80490e559f8e";
        private static final String merchantId = "himedia";
        @Autowired
        ApiService apiService;



        @RequestMapping("/checkoutForm")
        public ModelAndView paymentForm()
        {
	      ModelAndView mav = new ModelAndView();

	      mav.setViewName("payment/form/PaymentForm");
	      return mav;
        }




        @RequestMapping("/checkout")
        public ModelAndView paymentCheckout(@RequestParam Map<String,String> paramMap) throws NoSuchAlgorithmException
        {
	      String merchantId = "himedia";
	      String orderNumber = "1234";
	      String cardNo = paramMap.get("cardNo");
	      String expireMonth = paramMap.get("expireMonth");
	      String expireYear = paramMap.get("expireYear");
	      String birthday = "970227";
	      String cardPw = paramMap.get("cardPw");
	      String amount = paramMap.get("amount");
	      String quota = "0";
	      String itemName = "몬스긱 M3W 풀 알루 키보드";
	      String userName = "테스트 유저";
	      String signature = "Please WRITE ME";
	      String timestamp = "systimestamp";

	      String requestPaymentEnc = merchantId+"|"+orderNumber+"|"+amount+"|"+authenticationKey+"|"+timestamp;
	      signature = apiService.getSHA256Hash(requestPaymentEnc);


	      String url = "";
	      url = "https://api.testpayup.co.kr/v2/api/payment/"+ merchantId+"/keyin2";
	      Map<String,String> map = new HashMap<>();
	      map.put("orderNumber",orderNumber);
	      map.put("cardNo",cardNo);
	      map.put("expireMonth",expireMonth);
	      map.put("expireYear",expireYear);
	      map.put("birthday",birthday);
	      map.put("cardPw",cardPw);
	      map.put("amount",amount);
	      map.put("quota",quota);
	      map.put("itemName",itemName);
	      map.put("userName",userName);
	      map.put("signature",signature);
	      map.put("timestamp",timestamp);



	     Map<String,Object> resultMap =  apiService.JsonApi(url,map);
	     ModelAndView mav = new ModelAndView();
	     mav.addObject("resultMap",resultMap);
	     mav.addObject("test","테스트값입니다.");

	     if("0000".equals(resultMap.get("responseCode")))
	     {

	     }
	     else
	     {

	     }
	     mav.setViewName("payment/view/PaymentDone");
	     return mav;
        }

        @RequestMapping("/done")
        public String paymentDone()
        {
	      return "payment/view/PaymentDone";
        }





//        TEST_CASE LINE =============================================================================================================================================

        @RequestMapping("/test-payment")
        public String testPay() throws NoSuchAlgorithmException
        {
	      String merchantId = "himedia";
	      String orderNumber = "1234";
	      String cardNo = "5242420028906201";
	      String expireMonth = "05";
	      String expireYear = "27";
	      String birthday = "970227";
	      String cardPw = "02";
	      String amount = "16300";
	      String quota = "0";
	      String itemName = "몬스긱 M3W 풀 알루 키보드";
	      String userName = "테스트 유저";
	      String signature = "Please WRITE ME";
	      String timestamp = "systimestamp";

	      String requestPaymentEnc = merchantId+"|"+orderNumber+"|"+amount+"|"+authenticationKey+"|"+timestamp;
	      signature = apiService.getSHA256Hash(requestPaymentEnc);


	      String url = "";
	      url = "https://api.testpayup.co.kr/v2/api/payment/himedia/keyin2";
	      Map<String,String> map = new HashMap<>();
	      map.put("merchantId",merchantId);
	      map.put("orderNumber",orderNumber);
	      map.put("cardNo",cardNo);
	      map.put("expireMonth",expireMonth);
	      map.put("expireYear",expireYear);
	      map.put("birthday",birthday);
	      map.put("cardPw",cardPw);
	      map.put("amount",amount);
	      map.put("quota",quota);
	      map.put("itemName",itemName);
	      map.put("userName",userName);
	      map.put("signature",signature);
	      map.put("timestamp",timestamp);



	      apiService.JsonApi(url,map);

	      return "";
        }

        @RequestMapping("/test-cancel")
        public String testCancel(@RequestParam Map<String,String> paramMap) throws NoSuchAlgorithmException
        {
	      String url = "";
	      url = "https://api.testpayup.co.kr/v2/api/payment/himedia/cancel2";
	      String merchantId = "himedia";

	      String requestCancleEnc = merchantId+"|"+paramMap.get("transactionId")+"|"+authenticationKey;

	      paramMap.put("signature",apiService.getSHA256Hash(requestCancleEnc));

	      apiService.JsonApi(url,paramMap);

	      return "";
        }
        @RequestMapping("/test-authForm")
        public ModelAndView testAuthForm()
        {
	      ModelAndView mav = new ModelAndView();

	      mav.setViewName("payment/form/AuthPaymentForm");

	      //주문요청 API 호출
	      String merchantId = "himedia";
	      String orderNumber = "TEST1234";
	      String amount = "1000";
	      String itemName = "테스트결제";
	      String userName = "테스터";
	      String userAgent = "WP"; //무조건 WP로 써야함
	      String returnUrl = "returnUrl";
	      String signature = "";
	      String timestamp = "20231130010101";
	      String g = "|";

	      try
	      {
		   signature = apiService.getSHA256Hash(merchantId+g+orderNumber+g+amount+g+authenticationKey+g+timestamp);
	      }
	      catch (NoSuchAlgorithmException e)
	      {
		    e.printStackTrace();
	      }
	      String url = "https://api.testpayup.co.kr/ap/api/payment/"+ merchantId +"/order";
	      Map<String,String> map = new HashMap<>();
	      map.put("orderNumber",orderNumber);
	      map.put("amount",amount);
	      map.put("itemName",itemName);
	      map.put("userName",userName);
	      map.put("userAgent",userAgent);
	      map.put("returnUrl",returnUrl);
	      map.put("signature",signature);
	      map.put("timestamp",timestamp);

	      Map<String,Object> resultMap = apiService.JsonApi(url,map);
	      mav.addObject("orderResult",resultMap);
	      return mav;

        }
        @RequestMapping("/test-authPay")
        public ModelAndView testAuthPay(@RequestParam Map<String,String> param)
        {
	      System.out.println(param.toString());
	      String res_cd = param.get("res_cd");
	      String res_msg = param.get("res_msg");
	      String enc_data = param.get("enc_data");
	      String enc_info = param.get("enc_info");
	      String tran_cd = param.get("tran_cd");
	      String buyr_mail = param.get("buyr_mail");

	      String url = "https://api.testpayup.co.kr/ap/api/payment/"+param.get("ordr_idxx")+"/pay";
	      Map<String,String> map = new HashMap<>();
	      map.put("res_cd", res_cd);
	      map.put("res_msg", res_msg);
	      map.put("enc_data", enc_data);
	      map.put("enc_info", enc_info);
	      map.put("tran_cd", tran_cd);
	      map.put("buyr_mail", buyr_mail);

	      Map<String,Object> resultMap = apiService.JsonApi(url,map);

	      ModelAndView mav = new ModelAndView();

	      mav.addObject("resultMap",resultMap);
	      mav.setViewName("payment/view/PaymentDone");

	      return mav;
        }

        @RequestMapping("/test-kakaoForm")
        public ModelAndView testKakaoForm()
        {
	      ModelAndView mav = new ModelAndView();

	      mav.setViewName("payment/form/KakaoPaymentForm");

	      //주문요청 API 호출
	      String merchantId = "himedia";
	      String orderNumber = "TEST1234";
	      String amount = "1000";
	      String itemName = "테스트결제";
	      String userName = "테스터";
	      String userAgent = "WP"; //무조건 WP로 써야함
	      String returnUrl = "returnUrl";
	      String signature = "";
	      String timestamp = "20231130010101";
	      String g = "|";

	      try
	      {
		    signature = apiService.getSHA256Hash(merchantId+g+orderNumber+g+amount+g+authenticationKey+g+timestamp);
	      }
	      catch (NoSuchAlgorithmException e)
	      {
		    e.printStackTrace();
	      }
	      String url = "https://api.testpayup.co.kr/ep/api/kakao/"+merchantId+"/order";
	      Map<String,String> map = new HashMap<>();
	      map.put("orderNumber",orderNumber);
	      map.put("amount",amount);
	      map.put("itemName",itemName);
	      map.put("userName",userName);
	      map.put("userAgent",userAgent);
	      map.put("returnUrl",returnUrl);
	      map.put("signature",signature);
	      map.put("timestamp",timestamp);
	      map.put("cashbillYn", "N");

	      Map<String,Object> resultMap = apiService.JsonApi(url,map);
	      mav.addObject("orderResult",resultMap);
	      return mav;

        }

        @RequestMapping("/test-kakaoPay")
        public ModelAndView testKakaoPay(@RequestParam Map<String,String> param)
        {

	      String res_cd = param.get("res_cd");
	      String enc_data = param.get("enc_data");
	      String enc_info = param.get("enc_info");
	      String tran_cd = param.get("tran_cd");
	      String card_pay_method = param.get("card_pay_method");
	      String ordr_idxx = param.get("ordr_idxx");

	      String url = "https://api.testpayup.co.kr/ep/api/kakao/"+merchantId+"/pay";
	      Map<String,String> map = new HashMap<>();
	      map.put("res_cd", res_cd);
	      map.put("enc_data", enc_data);
	      map.put("enc_info", enc_info);
	      map.put("tran_cd", tran_cd);
	      map.put("card_pay_method", card_pay_method);
	      map.put("ordr_idxx", ordr_idxx);

	      Map<String,Object> resultMap = apiService.JsonApi(url,map);

	      ModelAndView mav = new ModelAndView();

	      mav.addObject("resultMap",resultMap);
	      mav.setViewName("payment/view/PaymentDone");

	      return mav;
        }


        @RequestMapping("/test-naverForm")
        public ModelAndView testNaverForm()
        {
	      ModelAndView mav = new ModelAndView();

	      mav.setViewName("payment/form/NaverPaymentForm");

	      //주문요청 API 호출
	      String orderNumber = "TEST1234";
	      String amount = "1000";
	      String itemName = "테스트결제";
	      String userName = "테스터";
	      String userAgent = "WP"; //무조건 WP로 써야함
	      String returnUrl = "returnUrl";
	      String signature = "";
	      String timestamp = "20231130010101";
	      String g = "|";

	      try
	      {
		    signature = apiService.getSHA256Hash(merchantId+g+orderNumber+g+amount+g+authenticationKey+g+timestamp);
	      }
	      catch (NoSuchAlgorithmException e)
	      {
		    e.printStackTrace();
	      }
	      String url = "https://api.testpayup.co.kr/ep/api/naver/"+merchantId+"/order";
	      Map<String,String> map = new HashMap<>();
	      map.put("orderNumber",orderNumber);
	      map.put("amount",amount);
	      map.put("itemName",itemName);
	      map.put("userName",userName);
	      map.put("userAgent",userAgent);
	      map.put("returnUrl",returnUrl);
	      map.put("signature",signature);
	      map.put("timestamp",timestamp);
	      map.put("cashbillYn", "N");

	      Map<String,Object> resultMap = apiService.JsonApi(url,map);
	      mav.addObject("orderResult",resultMap);
	      return mav;

        }

        @RequestMapping("/test-naverPay")
        public ModelAndView testnaverPay(@RequestParam Map<String,String> param)
        {

	      String res_cd = param.get("res_cd");
	      String enc_data = param.get("enc_data");
	      String enc_info = param.get("enc_info");
	      String tran_cd = param.get("tran_cd");
	      String ordr_idxx = param.get("ordr_idxx");

	      String url = "https://api.testpayup.co.kr/ep/api/naver/"+merchantId+"/pay";
	      Map<String,String> map = new HashMap<>();
	      map.put("res_cd", res_cd);
	      map.put("enc_data", enc_data);
	      map.put("enc_info", enc_info);
	      map.put("tran_cd", tran_cd);
	      map.put("ordr_idxx", ordr_idxx);

	      Map<String,Object> resultMap = apiService.JsonApi(url,map);

	      ModelAndView mav = new ModelAndView();

	      mav.addObject("resultMap",resultMap);
	      mav.setViewName("payment/view/PaymentDone");

	      return mav;
        }





}
