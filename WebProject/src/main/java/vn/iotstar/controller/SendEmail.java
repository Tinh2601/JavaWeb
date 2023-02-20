package vn.iotstar.controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

public class SendEmail {
	
	public void SendEmail(String email , String content)throws MessagingException, UnsupportedEncodingException {
		final String fromEmail = "congyeuthuong21@gmail.com";
		// Mat khai email cua ban
		final String password = "egdqemnhrlirkwgw";
		// dia chi email nguoi nhan
		final String toEmail = email;

		final String subject = "Java Example Test";
		final String body = content;

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
		props.put("mail.smtp.port", "587"); // TLS Port
		props.put("mail.smtp.auth", "true"); // enable authentication
		props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);

		MimeMessage msg = new MimeMessage(session);
		// set message headers
		msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
		msg.addHeader("format", "flowed");
		msg.addHeader("Content-Transfer-Encoding", "8bit");

		msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));

		msg.setReplyTo(InternetAddress.parse(fromEmail, false));

		msg.setSubject(subject, "UTF-8");

		msg.setText(body, "UTF-8");

		msg.setSentDate(new Date());

		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
		Transport.send(msg);
		System.out.println("Gui mail thanh cong");
	}
	public static void main(String[] args) throws MessagingException, UnsupportedEncodingException {

		SendEmail sendEmail = new SendEmail();
		sendEmail.SendEmail("20110576@student.hcmute.edu.vn", "hello");
	}

}
