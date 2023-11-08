package com.ecom4.green.data;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.domain.Pageable;

@Builder
@Data
public class RequestPageList<T>
{
        private T data;
        private Pageable pageable;
}
