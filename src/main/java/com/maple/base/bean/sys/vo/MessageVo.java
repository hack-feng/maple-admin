package com.maple.base.bean.sys.vo;

import com.maple.base.bean.sys.Message;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author ZhangFZ
 * @date 2020/9/29 13:15
 **/
@EqualsAndHashCode(callSuper = true)
@Data
public class MessageVo extends Message {

    private Integer unReadCount;

}
