<?php

if (isset($_GET['submit'])) {
    $name = $_GET['fullname'];
    $email = $_GET['email'];
    $subject = $_GET['CONTACT FORM, READ URGENTLY'];
    $message = $_GET['message'];
    $to = "rudlingjoe@gmail.com";
    $headers = "From: .$email";
    
    
    mail($to, $subject, $message, $headers);));
}