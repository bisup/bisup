package mail;

import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;
 
@Component
public class SendEmail {
	
	public void sendCode(String address, String key, int state) throws MessagingException{
        // ���� ���� ����
        String host = "smtp.gmail.com"; //�̸��� ����
        String user = "bisup3@gmail.com";// �̸��� ����
        String password = "hbbpxcgmjnogdfxr"; //�̸��� ���� ���
        String subject = null;
        String code = null;
        String content = null;
        
        // ���� ����
        String recipient = address;
        if (state == 1) {
	        subject = "������� �����Ͻ� ���� �����մϴ�."; /*�̸����� ����*/
	        code = "http://localhost:8088/bisup/bisup_login/certifyKey.do?key=" + key; /*Ű���� Ű �Ķ���Ϳ� �Է�*/
	        content = "�� �ּҸ� Ŭ���Ͻø� ȸ�������� �Ϸ�˴ϴ�."; /*������ �޼���*/
    	}
        
        //properties ����
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        
        // ���� ����
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session); /*������ ������ ���� MimeMessageŸ�� ���� ����*/
 
        // ���� ����
        msg.setSubject(subject); /*�̸��� ���� ����*/
        msg.setText(code + "\n" + content); /*�̸��� ���� ���� :: Ű���� ���Ե� ���� �ּҿ� �޼��� ����*/
        msg.setFrom(new InternetAddress(user)); /*������� �̸��� �ּ� ����*/
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); /*�޴»�� �ּҸ� �߰�*/
 
        // �߼� ó��
        Transport transport = session.getTransport("smtps");
        transport.connect(host, user, password);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();     
    }
	
	public void sendId(String address,String content) throws MessagingException{
        // ���� ���� ����
        String host = "smtp.gmail.com"; //�̸��� ����
        String user = "bisup3@gmail.com";// �̸��� ����
        String password = "hbbpxcgmjnogdfxr"; //�̸��� ���� ���
        String subject = null;
        String recipient = address; 
        //properties ����
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        // ���� ����
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session); /*������ ������ ���� MimeMessageŸ�� ���� ����*/
        // ���� ����
        msg.setSubject("������� �����Ͻ� ��й�ȣ�� ���̵� �Դϴ�"); /*�̸��� ���� ����*/
        msg.setText(content); /*�̸��� ���� ���� :: ���̵� ��� �޼��� ����*/
        msg.setFrom(new InternetAddress(user)); /*������� �̸��� �ּ� ����*/
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); /*�޴»�� �ּҸ� �߰�*/
 
        // �߼� ó��
        Transport transport = session.getTransport("smtps");
        transport.connect(host, user, password);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();     
    }
}