package com.maple.base.util;

import com.maple.base.bean.common.MailEnum;
import com.maple.base.bean.sys.MailContent;
import com.maple.base.mapper.sys.MailContentMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Objects;

/**
 * @author ZhangFZ
 * Mq发送邮件信息
 */
@Service
public class EmailUtil {

    @Value("${spring.mail.username}")
    private String from;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private MailContentMapper mailContentMapper;



    @Async
    public void sendEmail(MailContent msg){
        try {
            // 定义邮件信息
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(from);
            msg.setSendFrom(from);
            helper.setTo(msg.getSendTo());
            if(msg.getSubject() == null){
                helper.setSubject("无主题");
                msg.setSubject("无主题");
            }else{
                helper.setSubject(msg.getSubject());
            }
            if(StringUtils.isNotBlank(msg.getCcTo())){
                helper.setCc(msg.getCcTo());
            }

            if(StringUtils.isNotBlank(msg.getContent())){
                helper.setText(msg.getContent(), true);
            }else{
                helper.setText("");
            }

            // 如果存在附件，定义邮件的附件
            if(StringUtils.isNotBlank(msg.getAttachment())){
                FileSystemResource file = new FileSystemResource(msg.getAttachment());
                System.out.println(file.getFilename());
                helper.addAttachment(Objects.requireNonNull(file.getFilename()), file);



            }
            mailSender.send(message);
            // 修改状态为发送
            msg.setStatus(MailEnum.MailStatus.SEND.code);
        } catch (Exception e) {
            e.printStackTrace();
            // 修改状态为发送
            msg.setComment(e.getMessage());
            msg.setStatus(MailEnum.MailStatus.SEND_FAILED.code);
        } finally {
            if(StringUtils.isBlank(msg.getTempId())){
                msg.setTempId("无模板");
            }
            if(StringUtils.isBlank(msg.getRefId())){
                msg.setRefId("无RefId");
            }
            if(StringUtils.isBlank(msg.getVersion())){
                msg.setVersion("1.0");
            }
            msg.setUpdateTime(new Date());
            mailContentMapper.insert(msg);
        }
    }
}
