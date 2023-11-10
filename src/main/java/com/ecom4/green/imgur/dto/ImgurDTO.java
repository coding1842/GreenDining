package com.ecom4.green.imgur.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ImgurDTO
{
        private int id;
        private int group_id;
        private String imgur_id;
        private String path;
}
