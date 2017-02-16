<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.AddressException" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="java.util.Properties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    String to = "dodolin.e.l@gmail.com";
    String from = "johni5@mosk.ru";
    String sbj = "Проверка рассылки";
    String body = "Кодировка в порядке";
    Properties props = new Properties();

    try {
        Message msg = new MimeMessage(Session.getDefaultInstance(props, null));
        msg.setFrom(new InternetAddress(from));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject(sbj);
        msg.setText(body);
        Transport.send(msg);
%>Письмо успешно отправлено!<%
    } catch (AddressException e) {
%>Bad address [<%=e.getMessage()%>]<%
} catch (MessagingException e) {
%>Bad message [<%=e.getMessage()%>]<%
} catch (Exception e) {
%>Unknown error [<%=e.getMessage()%>]<%
    }
%>

<br/>
<br/>
<br/>
<a href="send.jsp">Back</a>