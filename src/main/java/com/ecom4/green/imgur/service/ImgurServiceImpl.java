package com.ecom4.green.imgur.service;

import com.ecom4.green.imgur.dao.ImgurDAO;
import com.ecom4.green.imgur.dto.ImgurDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class ImgurServiceImpl implements ImgurService
{
        @Autowired
        ImgurDAO imgurDAO;


        @Override
        public int insertImageList(List<ImgurDTO> imgurDTOList)
        {
	      int result = 0;
//	      그룹 아이디는 동일해야 함으로 AUTO_INCREMENT로 값을 부여할수 없으니 부여가능한 현재 그룹 아이디 최대값을 찾아서 insert메소드에 함께 보냅니다

	      result = imgurDAO.insertImageList(imgurDTOList);
	      return result;
        }

        @Override
        public List<ImgurDTO> selectImageList(int group_id)
        {
	      List<ImgurDTO> imgurDTOList = null;
	      imgurDTOList =imgurDAO.selectImageList(group_id);
	      return imgurDTOList;
        }

        @Override
        public int deleteImageList(int group_id)
        {

	      int result = imgurDAO.deleteImageList(group_id);
	      return result;
        }

        @Override
        public int selectMaxGroupId()
        {
	      return imgurDAO.selectMaxGroupId();
        }

        @Override
        public List<ImgurDTO> selectImageAll()
        {
	      return imgurDAO.selectImageAll();
        }


}
