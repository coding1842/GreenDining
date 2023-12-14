package com.ecom4.green.imgur.controller;


import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.imgur.dto.ImgurDTO;
import com.ecom4.green.imgur.service.ImgurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/imgur")
public class ImgurController
{
       private static String CLIENT_ID = "898c7032bf09d08";
       private static String ACCESS_TOKEN = "a0605e178d954c9385bf21a5767f1888c61a124b";
       @Autowired
        ImgurService imgurService;

       @Autowired
        AuthService authService;

       @GetMapping("/test-form")
       public String uploadTestForm()
       {
	     return "test/form/ImageUploadForm";
       }
        @PostMapping("/upload")
        public ResponseEntity<?> uploadImageList(@RequestParam ("fileList") MultipartFile[] fileList) throws IOException {


	      int r = 0;

	      RestTemplate restTemplate = new RestTemplate();
	      List<ImgurDTO> imgurDTOList = new ArrayList<>();

	      HttpHeaders headers = new HttpHeaders();
	      headers.setContentType(MediaType.MULTIPART_FORM_DATA);
	      headers.set("Authorization", "Client-ID " + CLIENT_ID);

	      for (MultipartFile file : fileList)
	      {
		    MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
		    body.add("image", new ByteArrayResource(file.getBytes()));

		    HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

		    ResponseEntity<String> response = restTemplate.postForEntity("https://api.imgur.com/3/image", requestEntity, String.class);

		    try
		    {
			  // 응답 JSON 파싱
			  JSONObject jsonObject = new JSONObject(response.getBody());

			  // 업로드된 이미지 URL 추출
			  String path = jsonObject.getJSONObject("data").getString("link");
			  String imgur_id = jsonObject.getJSONObject("data").getString("id");


			 ImgurDTO imgurDTO = new ImgurDTO();

			  imgurDTO.setImgur_id(imgur_id);
			  imgurDTO.setPath(path);
			  imgurDTOList.add(imgurDTO);
		    }
		    catch (Exception e)
		    {
			  e.printStackTrace();
		    }
	      }
	      try
	      {
		    r = imgurService.insertImageList(imgurDTOList);


	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
		    return new ResponseEntity<>("업로드 실패",HttpStatus.BAD_REQUEST);
	      }


	      Map<String,Object> resp = new HashMap<>();
	      resp.put("image_group_id", imgurService.selectMaxGroupId());

	      return new ResponseEntity<>(resp,HttpStatus.OK);

        }

//        원래 group_id을 가진 이미지 업로드 삭제하고 , 해당 group_id로 다시 재 삽입
        @PostMapping("/update/{image_group_id}")
		public ResponseEntity<?> updateImageList(@RequestParam ("fileList") MultipartFile[] fileList, @PathVariable("image_group_id") int image_group_id) throws IOException
        {
	      int r = 0;


	      RestTemplate restTemplate = new RestTemplate();
	      List<ImgurDTO> imgurDTOList = new ArrayList<>();

	      HttpHeaders headers = new HttpHeaders();
	      
	      
	      if(image_group_id != 0)
	      {
		      headers.setContentType(MediaType.APPLICATION_JSON);
		      headers.set("Authorization", "Bearer " + ACCESS_TOKEN);
		 
		      List<ImgurDTO> deleteList = imgurService.selectImageList(image_group_id);
		      int result = imgurService.deleteImageList(image_group_id);
	
		      HttpEntity<String> deleteEntity = new HttpEntity<>(headers);
		      for(ImgurDTO imgurDTO : deleteList)
		      {
			    String imgur_id = imgurDTO.getImgur_id();
			    restTemplate.exchange("https://api.imgur.com/3/image/" + imgur_id, HttpMethod.DELETE,deleteEntity ,Void.class);
		      }
	      }
	      for (MultipartFile file : fileList)
	      {
		    MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
		    
		    body.add("image", new ByteArrayResource(file.getBytes()));
		    headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		    headers.set("Authorization", "Client-ID " + CLIENT_ID);
		    HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

		    ResponseEntity<String> response = restTemplate.postForEntity("https://api.imgur.com/3/image", requestEntity, String.class);

		    try
		    {
			  // 응답 JSON 파싱
			  JSONObject jsonObject = new JSONObject(response.getBody());

			  // 업로드된 이미지 URL 추출
			  String path = jsonObject.getJSONObject("data").getString("link");
			  String imgur_id = jsonObject.getJSONObject("data").getString("id");


			  ImgurDTO imgurDTO = new ImgurDTO();

			  imgurDTO.setImgur_id(imgur_id);
			  imgurDTO.setPath(path);
			  imgurDTO.setGroup_id(image_group_id);
			  imgurDTOList.add(imgurDTO);
		    }
		    catch (Exception e)
		    {
			  e.printStackTrace();
		    }
	      }
	      try
	      {
		    r = imgurService.insertImageList(imgurDTOList);

	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
		    return new ResponseEntity<>("업로드 실패",HttpStatus.BAD_REQUEST);
	      }


	      Map<String,String> resp = new HashMap<>();
	      resp.put("image_group_id", Integer.toString(imgurService.selectMaxGroupId()));

	      return new ResponseEntity<>(resp,HttpStatus.OK);



        }

//        단일 삭제  현재 사용안함 보류중
        /*@GetMapping("/delete/{image_id}")
        public ResponseEntity<?> deleteImage(@PathVariable("image_id") int image_id) {

	      RestTemplate restTemplate = new RestTemplate();

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Client-ID " + CLIENT_ID);

	      HttpEntity<String> deleteEntity = new HttpEntity<>(headers);

	      restTemplate.exchange("https://api.imgur.com/3/image/" + image_id, HttpMethod.DELETE, deleteEntity, Void.class);

	      return new ResponseEntity<>("이미지 단일 삭제",HttpStatus.OK);

        }*/
//        다중 삭제
        @PostMapping("/delete/{image_group_id}")
        public  ResponseEntity<?> deleteImageList(@PathVariable("image_group_id") int image_group_id) {

	      RestTemplate restTemplate = new RestTemplate();

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Client-ID " + CLIENT_ID);

	      HttpEntity<String> deleteEntity = new HttpEntity<>(headers);


	      List<ImgurDTO> imgurDTOList = imgurService.selectImageList(image_group_id);
	      int result = imgurService.deleteImageList(image_group_id);

	      for(ImgurDTO imgurDTO : imgurDTOList)
	      {
		    String imgur_id = imgurDTO.getImgur_id();
		    restTemplate.exchange("https://api.imgur.com/3/image/" + imgur_id, HttpMethod.DELETE, deleteEntity, Void.class);
	      }

	      return new ResponseEntity<>("이미지 다중 삭제",HttpStatus.OK);

        }

        // s
        @PostMapping("/delete/sale-clear")
        public  ResponseEntity<?> deleteImageSaleClear() {

	      RestTemplate restTemplate = new RestTemplate();

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Client-ID " + CLIENT_ID);

	      HttpEntity<String> requestEntity = new HttpEntity<>(headers);


	      List<ImgurDTO> imgurDTOList = imgurService.selectImageAll();

	      for(ImgurDTO imgurDTO : imgurDTOList)
	      {
		    String imgur_id = imgurDTO.getImgur_id();
		    restTemplate.exchange("https://api.imgur.com/3/image/" + imgur_id, HttpMethod.DELETE, requestEntity, Void.class);
	      }

	      return new ResponseEntity<>("업로드 이미지 전부 삭제",HttpStatus.OK);
        }


}
