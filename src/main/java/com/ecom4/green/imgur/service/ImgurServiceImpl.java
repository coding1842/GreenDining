package com.ecom4.green.imgur.service;

import com.ecom4.green.imgur.dao.ImgurDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class ImgurServiceImpl implements ImgurService
{
        @Autowired
        ImgurDAO imgurDAO;

        @Override
        public int InsertImageList(List<String> imgUrlList, int saleID)
        {
	      int r = 0;
	      r = imgurDAO.InsertImageList(imgUrlList,saleID);
	      return r;
        }


}
