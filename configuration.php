<?php
class JConfig {
	public $offline = '0';
	public $offline_message = 'Este sitio está cerrado por tareas de mantenimiento.<br /> Por favor, inténtelo nuevamente más tarde.';
	public $sitename = 'JCG';
	public $editor = 'tinymce';
	public $list_limit = '20';
	public $access = '1';
	public $debug = '0';
	public $debug_lang = '0';
	public $dbtype = 'mysqli';
	public $host = 'localhost';
	public $user = 'root';
	public $password = '8i8o11ag';
	public $db = '_jcg';
	public $dbprefix = 'jcg_';
	public $live_site = '';
	public $secret = 'CyZDCE3fhzm5XKUr';
	public $gzip = '0';
	public $error_reporting = '-1';
	public $helpurl = 'http://help.joomla.org/proxy/index.php?option=com_help&amp;keyref=Help{major}{minor}:{keyref}';
	public $ftp_host = '127.0.0.1';
	public $ftp_port = '21';
	public $ftp_user = '';
	public $ftp_pass = '';
	public $ftp_root = '';
	public $ftp_enable = '0';
	public $offset = 'UTC';
	public $offset_user = 'UTC';
	public $mailer = 'mail';
	public $mailfrom = 'lazurdia.tpp@gmail.com';
	public $fromname = 'JCG';
	public $sendmail = '/usr/sbin/sendmail';
	public $smtpauth = '0';
	public $smtpuser = '';
	public $smtppass = '';
	public $smtphost = 'localhost';
	public $smtpsecure = 'none';
	public $smtpport = '25';
	public $caching = '0';
	public $cache_handler = 'file';
	public $cachetime = '15';
	public $MetaDesc = '';
	public $MetaKeys = '';
	public $MetaTitle = '1';
	public $MetaAuthor = '1';
	public $sef = '1';
	public $sef_rewrite = '0';
	public $sef_suffix = '0';
	public $unicodeslugs = '0';
	public $feed_limit = '10';
	public $log_path = '/var/www/joomla/logs';
	public $tmp_path = '/var/www/joomla/tmp';
	public $lifetime = '15';
	public $session_handler = 'database';
}