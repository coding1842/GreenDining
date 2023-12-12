package com.ecom4.green.merchant.dto;

import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.user.dto.AddressDTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeliveryListDTO {
	private OrdersDTO ordersDTO;
    private AddressDTO addressDTO;

    public DeliveryListDTO(OrdersDTO ordersDTO, AddressDTO addressDTO) {
        this.ordersDTO = ordersDTO;
        this.addressDTO = addressDTO;
    }
}
