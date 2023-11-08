package com.ecom4.green.imgur.controller;


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
        public String uploadImage(@RequestParam ("fileList") MultipartFile[] fileList, @RequestParam("saleID") int saleID) throws IOException {

	      RestTemplate restTemplate = new RestTemplate();
	      List<String> imgUrlList = new ArrayList<>();

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
			  String imageUrl = jsonObject.getJSONObject("data").getString("link");
			  String imageID = jsonObject.getJSONObject("data").getString("id");



			  imgUrlList.add(imageUrl);
		    }
		    catch (Exception e)
		    {
			  e.printStackTrace();
		    }
	      }
	      int r = 0;
	      r = imgurService.InsertImageList(imgUrlList,saleID);




	      return "이미지 저장완료";

        }
        @DeleteMapping("/delete/{imageId}")
        public String deleteImage(@PathVariable String imageId) {

	      String CLIENT_ID = "898c7032bf09d08";
	      RestTemplate restTemplate = new RestTemplate();

	      HttpHeaders headers = new HttpHeaders();
	      headers.set("Authorization", "Client-ID " + CLIENT_ID);

	      HttpEntity<String> requestEntity = new HttpEntity<>(headers);

	      restTemplate.exchange("https://api.imgur.com/3/image/" + imageId, HttpMethod.DELETE, requestEntity, Void.class);

	      return "이미지 삭제 완료";
        }


}
