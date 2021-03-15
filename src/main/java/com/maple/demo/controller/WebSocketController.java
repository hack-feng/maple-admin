package com.maple.demo.controller;

import com.maple.demo.bean.sys.vo.MessageVo;
import com.maple.demo.util.R;
import com.maple.demo.util.WebSocketServer;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author ZhangFZ
 * @date 2020/9/29 10:33
 **/
@RequestMapping("/socket")
@RestController
public class WebSocketController {

    @Autowired
    private WebSocketServer webSocketServer;

    @ApiOperation("test")
    @RequestMapping("/push/{toUserId}")
    public R pushToWeb(String message, @PathVariable Long toUserId) {
        MessageVo messageInfo = new MessageVo();
        messageInfo.setContent(message);
        messageInfo.setReceiverId(toUserId);
        messageInfo.setIsRead(0);
        webSocketServer.sendInfo(messageInfo);
        return R.ok();
    }
}
