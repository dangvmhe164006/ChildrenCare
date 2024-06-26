package vn.fpt.edu.model;

import java.util.Date;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class Mail {
  
    static final String from = "trangpche170234@fpt.edu.vn";
    static final String password = "igee euex jtlf fzcm";

    public static boolean sendEmail(String to, String tieuDe, String noiDung) {
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject(tieuDe);

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Quy định email nhận phản hồi
            // msg.setReplyTo(InternetAddress.parse(from, false))
            // Nội dung
            msg.setContent(noiDung, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

    public static String setInfo(Reservation r, Service s, Staff d, Children c, CategoryService cate) {
        String content = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n"
                + "<html xmlns:v=\"urn:schemas-microsoft-com:vml\">\n"
                + "\n"
                + "<head>\n"
                + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n"
                + "    <meta name=\"viewport\" content=\"width=device-width; initial-scale=1.0; maximum-scale=1.0;\" />\n"
                + "    <!--[if !mso]--><!-- -->\n"
                + "    <link href='https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700' rel=\"stylesheet\">\n"
                + "    <link href='https://fonts.googleapis.com/css?family=Quicksand:300,400,700' rel=\"stylesheet\">\n"
                + "    <!--<![endif]-->\n"
                + "\n"
                + "    <title>Material Design for Bootstrap</title>\n"
                + "\n"
                + "    <style type=\"text/css\">\n"
                + "        body {\n"
                + "            width: 100%;\n"
                + "            background-color: #ffffff;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "            -webkit-font-smoothing: antialiased;\n"
                + "            mso-margin-top-alt: 0px;\n"
                + "            mso-margin-bottom-alt: 0px;\n"
                + "            mso-padding-alt: 0px 0px 0px 0px;\n"
                + "        }\n"
                + "\n"
                + "        p,\n"
                + "        h1,\n"
                + "        h2,\n"
                + "        h3,\n"
                + "        h4 {\n"
                + "            margin-top: 0;\n"
                + "            margin-bottom: 0;\n"
                + "            padding-top: 0;\n"
                + "            padding-bottom: 0;\n"
                + "        }\n"
                + "\n"
                + "        span.preheader {\n"
                + "            display: none;\n"
                + "            font-size: 1px;\n"
                + "        }\n"
                + "\n"
                + "        html {\n"
                + "            width: 100%;\n"
                + "        }\n"
                + "\n"
                + "        table {\n"
                + "            font-size: 14px;\n"
                + "            border: 0;\n"
                + "        }\n"
                + "        /* ----------- responsivity ----------- */\n"
                + "\n"
                + "        @media only screen and (max-width: 640px) {\n"
                + "            /*------ top header ------ */\n"
                + "            .main-header {\n"
                + "                font-size: 20px !important;\n"
                + "            }\n"
                + "            .main-section-header {\n"
                + "                font-size: 28px !important;\n"
                + "            }\n"
                + "            .show {\n"
                + "                display: block !important;\n"
                + "            }\n"
                + "            .hide {\n"
                + "                display: none !important;\n"
                + "            }\n"
                + "            .align-center {\n"
                + "                text-align: center !important;\n"
                + "            }\n"
                + "            .no-bg {\n"
                + "                background: none !important;\n"
                + "            }\n"
                + "            /*----- main image -------*/\n"
                + "            .main-image img {\n"
                + "                width: 440px !important;\n"
                + "                height: auto !important;\n"
                + "            }\n"
                + "            /* ====== divider ====== */\n"
                + "            .divider img {\n"
                + "                width: 440px !important;\n"
                + "            }\n"
                + "            /*-------- container --------*/\n"
                + "            .container590 {\n"
                + "                width: 440px !important;\n"
                + "            }\n"
                + "            .container580 {\n"
                + "                width: 400px !important;\n"
                + "            }\n"
                + "            .main-button {\n"
                + "                width: 220px !important;\n"
                + "            }\n"
                + "            /*-------- secions ----------*/\n"
                + "            .section-img img {\n"
                + "                width: 320px !important;\n"
                + "                height: auto !important;\n"
                + "            }\n"
                + "            .team-img img {\n"
                + "                width: 100% !important;\n"
                + "                height: auto !important;\n"
                + "            }\n"
                + "        }\n"
                + "\n"
                + "        @media only screen and (max-width: 479px) {\n"
                + "            /*------ top header ------ */\n"
                + "            .main-header {\n"
                + "                font-size: 18px !important;\n"
                + "            }\n"
                + "            .main-section-header {\n"
                + "                font-size: 26px !important;\n"
                + "            }\n"
                + "            /* ====== divider ====== */\n"
                + "            .divider img {\n"
                + "                width: 280px !important;\n"
                + "            }\n"
                + "            /*-------- container --------*/\n"
                + "            .container590 {\n"
                + "                width: 280px !important;\n"
                + "            }\n"
                + "            .container590 {\n"
                + "                width: 280px !important;\n"
                + "            }\n"
                + "            .container580 {\n"
                + "                width: 260px !important;\n"
                + "            }\n"
                + "            /*-------- secions ----------*/\n"
                + "            .section-img img {\n"
                + "                width: 280px !important;\n"
                + "                height: auto !important;\n"
                + "            }\n"
                + "        }\n"
                + "    </style>\n"
                + "    <!--[if gte mso 9]><style type=”text/css”>\n"
                + "        body {\n"
                + "        font-family: arial, sans-serif!important;\n"
                + "        }\n"
                + "        </style>\n"
                + "    <![endif]-->\n"
                + "</head>\n"
                + "\n"
                + "\n"
                + "<body class=\"respond\" leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\">\n"
                + "    <!-- pre-header -->\n"
                + "    <table style=\"display:none!important;\">\n"
                + "        <tr>\n"
                + "            <td>\n"
                + "                <div style=\"overflow:hidden;display:none;font-size:1px;color:#ffffff;line-height:1px;font-family:Arial;maxheight:0px;max-width:0px;opacity:0;\">\n"
                + "                    Welcome to Medilab\n"
                + "                </div>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "    </table>\n"
                + "    <!-- pre-header end -->\n"
                + "    <!-- header -->\n"
                + "    <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"ffffff\">\n"
                + "\n"
                + "        <tr>\n"
                + "            <td align=\"center\">\n"
                + "                <table border=\"0\" align=\"center\" width=\"590\" cellpadding=\"0\" cellspacing=\"0\" class=\"container590\">\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td height=\"25\" style=\"font-size: 25px; line-height: 25px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td align=\"center\">\n"
                + "\n"
                + "                            <table border=\"0\" align=\"center\" width=\"590\" cellpadding=\"0\" cellspacing=\"0\" class=\"container590\">\n"
                + "\n"
                + "                                <tr>\n"
                + "                                    <td align=\"center\" height=\"70\" style=\"height:70px;\">\n"
                + "                                        <a href=\"\" style=\"display: block; border-style: none !important; border: 0 !important;\">"
                + "<img width=\"100\" border=\"0\" style=\"display: block; width: 100px;\" src=\"\" alt=\"\" /></a>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </table>\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td height=\"25\" style=\"font-size: 25px; line-height: 25px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                </table>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "    </table>\n"
                + "    <!-- end header -->\n"
                + "\n"
                + "    <!-- big image section -->\n"
                + "\n"
                + "    <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"ffffff\" class=\"bg_color\">\n"
                + "\n"
                + "        <tr>\n"
                + "            <td align=\"center\">\n"
                + "                <table border=\"0\" align=\"center\" width=\"590\" cellpadding=\"0\" cellspacing=\"0\" class=\"container590\">\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td align=\"center\" style=\"color: #343434; font-size: 24px; font-family: Quicksand, Calibri, sans-serif; font-weight:700;letter-spacing: 3px; line-height: 35px;\"\n"
                + "                            class=\"main-header\">\n"
                + "                            <!-- section text ======-->\n"
                + "\n"
                + "                            <div style=\"line-height: 35px\">\n"
                + "\n"
                + "                                Thank you for your <span style=\"color: #5caad2;\">reservation!</span>\n"
                + "\n"
                + "                            </div>\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td height=\"10\" style=\"font-size: 10px; line-height: 10px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td align=\"center\">\n"
                + "                            <table border=\"0\" width=\"40\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"eeeeee\">\n"
                + "                                <tr>\n"
                + "                                    <td height=\"2\" style=\"font-size: 2px; line-height: 2px;\">&nbsp;</td>\n"
                + "                                </tr>\n"
                + "                            </table>\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td height=\"20\" style=\"font-size: 20px; line-height: 20px;\">&nbsp;</td>\n"
                + "                    </tr>\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td align=\"left\">\n"
                + "                            <table border=\"1\" width=\"590\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"container590\">\n"
                + "                                <tr>\n"
                + "                                    <td align=\"center\" style=\"color:  #888888; font-size: 16px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 24px;\">\n"
                + "                                        <!-- section text ======-->\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            This is your reservation information:\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Reservation ID: <strong>" + r.getReservationID() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Fullname of your child: <strong>" + c.getChildName() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Date of birth: <strong>" + c.getBirthday() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Child Gender: <strong>" + c.getGender() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Parent's phone: <strong>" + c.getUser().getPhoneNumber() + "</strong>\n"
                + "                                        </p>\n"
                + "            \n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Parent's email: <strong>" + c.getUser().getAddress() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Address: <strong>" + c.getUser().getAddress() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Doctor: <strong>" + d.getStaffName() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Services: <strong>" + s.getTitle() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Appointment Date: <strong>" + r.getReservationDate() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Fee: <strong>" + r.getCost() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <p style=\"line-height: 24px; margin-bottom: 15px;\">\n"
                + "                                            Method Payment: <strong>" + r.getPayment() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        \n"
                + "                                        <p style=\"line-height: 24px; margin-bottom:20px;\">\n"
                + "                                            Status: <strong>" + r.getStatus() + "</strong>\n"
                + "                                        </p>\n"
                + "                                        <table border=\"0\" align=\"center\" width=\"180\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"5caad2\" style=\"margin-bottom:20px;\">\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td height=\"10\" style=\"font-size: 10px; line-height: 10px;\">&nbsp;</td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td align=\"center\" style=\"color: #ffffff; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 30px; letter-spacing: 2px;\">\n"
                + "                                                    <!-- main section button -->\n"
                + "\n"
                + "                                                    <div style=\"line-height: 22px;\">\n"
                + "                                                        <a href=\"http://localhost:9999/ChildrenCare/myreservation\" style=\"color: #ffffff; text-decoration: none;\">YOUR RESERVATION</a>\n"
                + "                                                    </div>\n"
                + "                                                </td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td height=\"10\" style=\"font-size: 10px; line-height: 10px;\">&nbsp;</td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                        </table>\n"
                + "                                        <p style=\"line-height: 24px\">\n"
                + "                                            Love,</br>\n"
                + "                                            The Medilab Team\n"
                + "                                        </p>\n"
                + "\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </table>\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "\n"
                + "\n"
                + "\n"
                + "\n"
                + "\n"
                + "                </table>\n"
                + "\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "\n"
                + "        <tr>\n"
                + "            <td height=\"40\" style=\"font-size: 40px; line-height: 40px;\">&nbsp;</td>\n"
                + "        </tr>\n"
                + "\n"
                + "    </table>\n"
                + "\n"
                + "    <!-- end section -->\n"
                + "   \n"
                + "\n"
                + "    <!-- end section -->\n"
                + "\n"
                + "    <!-- contact section -->\n"
                + "    <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"ffffff\" class=\"bg_color\">\n"
                + "\n"
                + "        <tr>\n"
                + "            <td height=\"60\" style=\"font-size: 60px; line-height: 60px;\">&nbsp;</td>\n"
                + "        </tr>\n"
                + "\n"
                + "        <tr>\n"
                + "            <td align=\"center\">\n"
                + "                <table border=\"0\" align=\"center\" width=\"590\" cellpadding=\"0\" cellspacing=\"0\" class=\"container590 bg_color\">\n"
                + "\n"
                + "                    <tr>\n"
                + "                        <td align=\"center\">\n"
                + "                            <table border=\"0\" align=\"center\" width=\"590\" cellpadding=\"0\" cellspacing=\"0\" class=\"container590 bg_color\">\n"
                + "\n"
                + "                                <tr>\n"
                + "                                    <td>\n"
                + "                                        <table border=\"0\" width=\"300\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;\"\n"
                + "                                            class=\"container590\">\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <!-- logo -->\n"
                + "                                                <td align=\"left\">\n"
                + "                                                    <a href=\"\" style=\"display: block; border-style: none !important; border: 0 !important;\"><img width=\"80\" border=\"0\" style=\"display: block; width: 80px;\" src=\"\" alt=\"\" /></a>\n"
                + "                                                </td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td height=\"25\" style=\"font-size: 25px; line-height: 25px;\">&nbsp;</td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td align=\"left\" style=\"color: #888888; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; line-height: 23px;\"\n"
                + "                                                    class=\"text_color\">\n"
                + "                                                    <div style=\"color: #333333; font-size: 14px; font-family: 'Work Sans', Calibri, sans-serif; font-weight: 600; mso-line-height-rule: exactly; line-height: 23px;\">\n"
                + "\n"
                + "                                                        Email us: <br/> <a href=\"mailto:\" style=\"color: #888888; font-size: 14px; font-family: 'Hind Siliguri', Calibri, Sans-serif; font-weight: 400;\">contact@medilab.com</a>\n"
                + "\n"
                + "                                                    </div>\n"
                + "                                                </td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                        </table>\n"
                + "\n"
                + "                                        <table border=\"0\" width=\"2\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;\"\n"
                + "                                            class=\"container590\">\n"
                + "                                            <tr>\n"
                + "                                                <td width=\"2\" height=\"10\" style=\"font-size: 10px; line-height: 10px;\"></td>\n"
                + "                                            </tr>\n"
                + "                                        </table>\n"
                + "\n"
                + "                                        <table border=\"0\" width=\"200\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;\"\n"
                + "                                            class=\"container590\">\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td class=\"hide\" height=\"45\" style=\"font-size: 45px; line-height: 45px;\">&nbsp;</td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td height=\"15\" style=\"font-size: 15px; line-height: 15px;\">&nbsp;</td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                            <tr>\n"
                + "                                                <td>\n"
                + "                                                    <table border=\"0\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\">\n"
                + "                                                        <tr>\n"
                + "                                                            <td>\n"
                + "                                                                <a href=\"https://www.facebook.com/mdbootstrap\" style=\"display: block; border-style: none !important; border: 0 !important;\"><img width=\"24\" border=\"0\" style=\"display: block;\" src=\"http://i.imgur.com/Qc3zTxn.png\" alt=\"\"></a>\n"
                + "                                                            </td>\n"
                + "                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\n"
                + "                                                            <td>\n"
                + "                                                                <a href=\"https://twitter.com/MDBootstrap\" style=\"display: block; border-style: none !important; border: 0 !important;\"><img width=\"24\" border=\"0\" style=\"display: block;\" src=\"http://i.imgur.com/RBRORq1.png\" alt=\"\"></a>\n"
                + "                                                            </td>\n"
                + "                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>\n"
                + "                                                            <td>\n"
                + "                                                                <a href=\"https://plus.google.com/u/0/b/107863090883699620484/107863090883699620484/posts\" style=\"display: block; border-style: none !important; border: 0 !important;\"><img width=\"24\" border=\"0\" style=\"display: block;\" src=\"http://i.imgur.com/Wji3af6.png\" alt=\"\"></a>\n"
                + "                                                            </td>\n"
                + "                                                        </tr>\n"
                + "                                                    </table>\n"
                + "                                                </td>\n"
                + "                                            </tr>\n"
                + "\n"
                + "                                        </table>\n"
                + "                                    </td>\n"
                + "                                </tr>\n"
                + "                            </table>\n"
                + "                        </td>\n"
                + "                    </tr>\n"
                + "                </table>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "\n"
                + "        <tr>\n"
                + "            <td height=\"60\" style=\"font-size: 60px; line-height: 60px;\">&nbsp;</td>\n"
                + "        </tr>\n"
                + "\n"
                + "    </table>\n"
                + "    <!-- end section -->\n"
                + "\n"
                + "    \n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        return content;
    }


}
