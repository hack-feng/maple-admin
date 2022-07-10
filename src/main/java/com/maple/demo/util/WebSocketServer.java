package com.maple.demo.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.maple.demo.bean.sys.Message;
import com.maple.demo.bean.sys.vo.MessageVo;
import com.maple.demo.service.sys.IMessageService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author ZhangFZ
 * @date 2020/9/29 10:30
 **/
@ServerEndpoint("/socket/{userId}")
@Component
@Slf4j
public class WebSocketServer {
    /**静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。*/
    private static int onlineCount = 0;
    /**concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。*/
    private static ConcurrentHashMap<String,WebSocketServer> webSocketMap = new ConcurrentHashMap<>();
    /**与某个客户端的连接会话，需要通过它来给客户端发送数据*/
    private Session session;
    /**接收userId*/
    private String userId = null;

    @Autowired
    private IMessageService messageService;

    /**
     * 连接建立成功调用的方法*/
    @OnOpen
    public void onOpen(Session session,@PathParam("userId") String userId) {
        this.session = session;
        this.userId=userId;
        if(webSocketMap.containsKey(userId)){
            webSocketMap.remove(userId);
            webSocketMap.put(userId,this);
            //加入set中
        }else{
            webSocketMap.put(userId,this);
            //加入set中
            addOnlineCount();
            //在线数加1
        }

        try {
            sendMessageText("连接成功");
        } catch (IOException e) {
            log.error("用户:"+userId+",网络异常!!!!!!");
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        if(webSocketMap.containsKey(userId)){
            webSocketMap.remove(userId);
            //从set中删除
            subOnlineCount();
        }
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
    public void onMessage(String message) {
        log.info("用户消息:"+userId+",报文:"+message);
        //可以群发消息
        //消息保存到数据库、redis
        if(StringUtils.isNotBlank(message)){
            try {
                //解析发送的报文
                JSONObject jsonObject = JSON.parseObject(message);
                //追加发送人(防止串改)
                jsonObject.put("fromUserId",this.userId);
                String toUserId=jsonObject.getString("toUserId");
                //传送给对应toUserId用户的websocket
                if(toUserId != null && webSocketMap.containsKey(toUserId)){
                    webSocketMap.get(toUserId).sendMessageText(jsonObject.toJSONString());
                }else{
                    log.error("请求的userId:"+toUserId+"不在该服务器上");
                    //否则不在这个服务器上，发送到mysql或者redis
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    @OnError
    public void onError(Throwable error) {
        log.error("用户错误:"+this.userId+",原因:"+error.getMessage());
        error.printStackTrace();
    }

    /**
     * 实现服务器主动推送
     */
    private void sendMessageText(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
    }

    /**
     * 实现服务器主动推送
     */
    private void sendMessage(MessageVo message) throws IOException {
        this.session.getBasicRemote().sendText(JSONObject.toJSONString(message));
    }


    /**
     * 发送自定义消息
     * */
    public void sendInfo(MessageVo messageInfo) {
        if(messageInfo.getReceiverId() == null){
            return;
        }
        messageInfo.setIsRead(0);
        messageService.save(messageInfo);
        QueryWrapper<Message> qw = new QueryWrapper<>();
        qw.eq("receiver_id", messageInfo.getReceiverId());
        qw.eq("is_read", 0);
        int count = messageService.count(qw);
        messageInfo.setUnReadCount(count);
        if(messageInfo.getReceiverId() != null && webSocketMap.containsKey(String.valueOf(messageInfo.getReceiverId()))){
            try {
                webSocketMap.get(String.valueOf(messageInfo.getReceiverId())).sendMessage(messageInfo);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            log.error("用户"+ messageInfo.getReceiverId()+",不在线！");
        }
    }

    private static synchronized int getOnlineCount() {
        return onlineCount;
    }

    private static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }

    private static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }
}
