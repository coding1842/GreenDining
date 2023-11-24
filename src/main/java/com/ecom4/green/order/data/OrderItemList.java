package com.ecom4.green.order.data;

import com.ecom4.green.order.dto.OrderItemDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OrderItemList {
    private List<OrderItemDTO> orderItemDTOList;
}
