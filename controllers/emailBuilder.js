import 'dotenv/config';
import { MailerSend, EmailParams, Sender, Recipient } from "mailersend";

const mailerSend = new MailerSend({
	apiKey: "mlsn.902d4af14067bd43274f1652a7a03b1e383137939abe3ad08ced09ebf5d973fa",
});

const sentFrom = new Sender("jalopez81@hotmail.com", "jalopez81");

const recipients = [
	new Recipient("jorge0481rd@gmail.com", "jorge0481rd"),
];

const emailParams = new EmailParams()
	.setFrom(sentFrom)
	.setTo(recipients)
	.setReplyTo(sentFrom)
	.setSubject("This is a Subject")
	.setHtml("<strong>This is the HTML content</strong>")
	.setText("This is the text content");

await mailerSend.email.send(emailParams);
