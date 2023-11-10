package com.ecom4.green.imgur.controller;


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
import java.util.List;


@Controller
@RequestMapping("/imgur")
public class ImgurController
{
       private static String CLIENT_ID = "898c7032bf09d08";

       @Autowired
        ImgurService imgurService;

       @GetMapping("/test-form")
       public String uploadTestForm()
       {
	     return "test/form/ImageUploadForm";
       }
        @PostMapping("/upload")
        public ResponseEntity<String> uploadImageList(@RequestParam ("fileList") MultipartFile[] fileList) throws IOException {

	      RestTemplate restTemplate = new RestTemplate();
	      List<ImgurDTO> imgurDTOList = new ArrayList<>();

	      for (MultipartFile file : fileList)
	      {
		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.MULTIPART_FORM_DATA);
		    headers.set("Authorization", "Client-ID " + CLIENT_ID);

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
	      int r = 0;
	      r = imgurService.insertImageList(imgurDTOList);




	      return new ResponseEntity<>("url",HttpStatus.OK);

        }

//        업데이트 보류
        @PatchMapping("/update")
		public String updateImageList(@RequestParam ("fileList") MultipartFile[] fileList, @RequestParam("group_id") int group_id) throws IOException
        {



	      return "";
        }

//        단일 삭제
        @DeleteMapping("/delete/{image_id}")
        public String deleteImage(@PathVariable("image_id") int image_id) {

	      RestTemplate restTemplate = new RestTemplate();

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Client-ID " + CLIENT_ID);

	      HttpEntity<String> requestEntity = new HttpEntity<>(headers);

	      restTemplate.exchange("https://api.imgur.com/3/image/" + image_id, HttpMethod.DELETE, requestEntity, Void.class);

	      return "이미지 삭제 완료";
        }
//        다중 삭제
        @DeleteMapping("/delete/{image_group_id}")
        public String deleteImageList(@PathVariable("image_group_id") int image_group_id) {

	      RestTemplate restTemplate = new RestTemplate();

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Client-ID " + CLIENT_ID);

	      HttpEntity<String> requestEntity = new HttpEntity<>(headers);


	      List<ImgurDTO> imgurDTOList = imgurService.selectImageList(image_group_id);
	      int result = imgurService.deleteImageList(image_group_id);

	      for(ImgurDTO imgurDTO : imgurDTOList)
	      {
		    String imgur_id = imgurDTO.getImgur_id();
		    restTemplate.exchange("https://api.imgur.com/3/image/" + imgur_id, HttpMethod.DELETE, requestEntity, Void.class);
	      }

	      return "이미지 리스트 삭제 완료";
        }


}
