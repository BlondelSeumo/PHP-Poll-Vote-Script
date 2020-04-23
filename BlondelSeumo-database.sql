-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2017 at 01:38 PM
-- Server version: 5.5.54-0+deb8u1
-- PHP Version: 7.0.17-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `propolls`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `ID` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`ID`, `title`, `message`) VALUES
(1, 'Forgot Your Password', 'Dear [NAME],\r\n<br /><br />\r\nSomeone (hopefully you) requested a password reset at [SITE_URL].\r\n<br /><br />\r\nTo reset your password, please follow the following link: [EMAIL_LINK]\r\n<br /><br />\r\nIf you did not reset your password, please kindly ignore  this email.\r\n<br /><br />\r\nYours, <br />\r\n[SITE_NAME]'),
(2, 'Email Activation', 'Dear [NAME],\r\n<br /><br />\r\nSomeone (hopefully you) has registered an account on [SITE_NAME] using this email address.\r\n<br /><br />\r\nPlease activate the account by following this link: [EMAIL_LINK]\r\n<br /><br />\r\nIf you did not register an account, please kindly ignore  this email.\r\n<br /><br />\r\nYours, <br />\r\n[SITE_NAME]');

-- --------------------------------------------------------

--
-- Table structure for table `home_stats`
--

CREATE TABLE `home_stats` (
  `ID` int(11) NOT NULL,
  `google_members` int(11) NOT NULL DEFAULT '0',
  `facebook_members` int(11) NOT NULL DEFAULT '0',
  `twitter_members` int(11) NOT NULL DEFAULT '0',
  `total_members` int(11) NOT NULL DEFAULT '0',
  `new_members` int(11) NOT NULL DEFAULT '0',
  `active_today` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_stats`
--

INSERT INTO `home_stats` (`ID`, `google_members`, `facebook_members`, `twitter_members`, `total_members`, `new_members`, `active_today`, `timestamp`) VALUES
(1, 0, 0, 0, 0, 0, 0, 1485527432);

-- --------------------------------------------------------

--
-- Table structure for table `ipn_log`
--

CREATE TABLE `ipn_log` (
  `ID` int(11) NOT NULL,
  `data` text NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(500) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_block`
--

CREATE TABLE `ip_block` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `reason` varchar(1000) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) NOT NULL DEFAULT '',
  `username` varchar(500) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(500) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `email` varchar(500) NOT NULL DEFAULT '',
  `processor` varchar(255) NOT NULL,
  `hash` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_plans`
--

CREATE TABLE `payment_plans` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hexcolor` varchar(6) NOT NULL DEFAULT '',
  `fontcolor` varchar(6) NOT NULL DEFAULT '',
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `days` int(11) NOT NULL DEFAULT '0',
  `sales` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `votes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_plans`
--

INSERT INTO `payment_plans` (`ID`, `name`, `hexcolor`, `fontcolor`, `cost`, `days`, `sales`, `description`, `votes`) VALUES
(2, 'BASIC', '68aa9b', 'FFFFFF', '3.00', 30, 12, 'This is the basic plan which gives you a introduction to our Premium Plans', 5),
(3, 'Professional', '416375', 'FFFFFF', '7.99', 90, 5, 'Get all the benefits of basic at a cheaper price and gain content for longer.', 1000),
(4, 'LIFETIME', '578465', 'FFFFFF', '300.00', 0, 3, 'Become a premium member for life and have access to all our premium content.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `poll_themes`
--

CREATE TABLE `poll_themes` (
  `ID` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `css_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_themes`
--

INSERT INTO `poll_themes` (`ID`, `name`, `css_code`) VALUES
(1, 'Default Theme', '.user-poll { border: 1px solid #000000; border-radius: 4px; padding: 10px; width: 350px; background: #FFF; }\r\n.poll-voting-box { float: right; }\r\n.answer-poll { padding: 10px; }\r\n.answer-poll:hover { background: #cce0ec; }\r\n.answer-label { width: 100%; }\r\n.answer-image { float: left;margin-right: 10px; }\r\n.poll-expire { font-size: 11px; background: #ece2e7; padding: 5px; border-radius: 4px; float: left;  }'),
(2, 'Blue Theme', '.user-poll { border: 2px solid #000000; border-radius: 4px; padding: 10px; width: 350px; background: #60c2ed;  }\r\n.poll-voting-box { float: right; }\r\n.answer-poll { padding: 10px; background: #FFFFFF; border-radius: 4px; margin-bottom: 10px;}\r\n.answer-poll:hover { background: #cce0ec; }\r\n.answer-label { width: 100%; }\r\n.answer-image { float: left;margin-right: 10px; }\r\n.poll-expire { font-size: 11px; background: #ece2e7; padding: 5px; border-radius: 4px; float: left;  }');

-- --------------------------------------------------------

--
-- Table structure for table `reset_log`
--

CREATE TABLE `reset_log` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site_layouts`
--

CREATE TABLE `site_layouts` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `layout_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_layouts`
--

INSERT INTO `site_layouts` (`ID`, `name`, `layout_path`) VALUES
(1, 'Basic', 'layout/layout.php'),
(2, 'Titan', 'layout/titan_layout.php'),
(3, 'Light Blue', 'layout/blue_light_layout.php'),
(4, 'Dark Fire', 'layout/dark_fire_layout.php');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `ID` int(11) NOT NULL,
  `site_name` varchar(500) NOT NULL DEFAULT '',
  `site_desc` varchar(500) NOT NULL DEFAULT '',
  `upload_path` varchar(500) NOT NULL DEFAULT '',
  `upload_path_relative` varchar(500) NOT NULL DEFAULT '',
  `site_email` varchar(500) NOT NULL DEFAULT '',
  `site_logo` varchar(1000) NOT NULL DEFAULT 'logo.png',
  `register` int(11) NOT NULL DEFAULT '0',
  `disable_captcha` int(11) NOT NULL DEFAULT '0',
  `date_format` varchar(25) NOT NULL DEFAULT '',
  `avatar_upload` int(11) NOT NULL DEFAULT '1',
  `file_types` varchar(500) NOT NULL DEFAULT '',
  `twitter_consumer_key` varchar(255) NOT NULL DEFAULT '',
  `twitter_consumer_secret` varchar(255) NOT NULL DEFAULT '',
  `disable_social_login` int(11) NOT NULL DEFAULT '0',
  `facebook_app_id` varchar(255) NOT NULL DEFAULT '',
  `facebook_app_secret` varchar(255) NOT NULL DEFAULT '',
  `google_client_id` varchar(255) NOT NULL DEFAULT '',
  `google_client_secret` varchar(255) NOT NULL DEFAULT '',
  `file_size` int(11) DEFAULT '0',
  `paypal_email` varchar(1000) NOT NULL DEFAULT '',
  `paypal_currency` varchar(100) NOT NULL DEFAULT '',
  `payment_enabled` int(11) NOT NULL DEFAULT '0',
  `payment_symbol` varchar(5) NOT NULL DEFAULT '$',
  `global_premium` int(11) NOT NULL DEFAULT '0',
  `country_tracking` int(11) NOT NULL DEFAULT '0',
  `auto_updating` int(11) NOT NULL DEFAULT '0',
  `default_votes` int(11) NOT NULL DEFAULT '250',
  `enable_ads` int(11) NOT NULL DEFAULT '0',
  `install` int(11) NOT NULL DEFAULT '1',
  `login_protect` int(11) NOT NULL DEFAULT '0',
  `activate_account` int(11) NOT NULL DEFAULT '0',
  `logo_option` int(11) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `default_user_role` int(11) NOT NULL,
  `google_recaptcha` int(11) NOT NULL,
  `google_recaptcha_secret` varchar(255) NOT NULL,
  `google_recaptcha_key` varchar(255) NOT NULL,
  `stripe_secret_key` varchar(255) NOT NULL,
  `stripe_publish_key` varchar(255) NOT NULL,
  `checkout2_accountno` int(11) NOT NULL,
  `checkout2_secret` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`ID`, `site_name`, `site_desc`, `upload_path`, `upload_path_relative`, `site_email`, `site_logo`, `register`, `disable_captcha`, `date_format`, `avatar_upload`, `file_types`, `twitter_consumer_key`, `twitter_consumer_secret`, `disable_social_login`, `facebook_app_id`, `facebook_app_secret`, `google_client_id`, `google_client_secret`, `file_size`, `paypal_email`, `paypal_currency`, `payment_enabled`, `payment_symbol`, `global_premium`, `country_tracking`, `auto_updating`, `default_votes`, `enable_ads`, `install`, `login_protect`, `activate_account`, `logo_option`, `layout`, `default_user_role`, `google_recaptcha`, `google_recaptcha_secret`, `google_recaptcha_key`, `stripe_secret_key`, `stripe_publish_key`, `checkout2_accountno`, `checkout2_secret`) VALUES
(1, 'ProPolls', 'Welcome to ProPolls', '/var/www/public_html', 'uploads', 'test@test.com', 'logo.png', 0, 0, 'd/m/Y', 1, 'gif|png|jpg|jpeg', '', '', 0, '', '', '', '', 1028, '', 'USD', 1, '$', 0, 1, 1, 888, 0, 1, 0, 0, 0, 'layout/titan_layout.php', 7, 0, '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_level` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(25) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `first_name` varchar(25) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `last_name` varchar(25) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `avatar` varchar(1000) NOT NULL DEFAULT 'default.png',
  `joined` int(11) NOT NULL DEFAULT '0',
  `joined_date` varchar(10) NOT NULL DEFAULT '',
  `online_timestamp` int(11) NOT NULL DEFAULT '0',
  `oauth_provider` varchar(40) NOT NULL DEFAULT '',
  `oauth_id` varchar(1000) NOT NULL DEFAULT '',
  `oauth_token` varchar(1500) NOT NULL DEFAULT '',
  `oauth_secret` varchar(500) NOT NULL DEFAULT '',
  `email_notification` int(11) NOT NULL DEFAULT '1',
  `aboutme` varchar(1000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `points` decimal(10,2) NOT NULL DEFAULT '0.00',
  `premium_time` int(11) NOT NULL DEFAULT '0',
  `premium_planid` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `activate_code` varchar(255) NOT NULL DEFAULT '',
  `user_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_events`
--

CREATE TABLE `user_events` (
  `ID` int(11) NOT NULL,
  `IP` varchar(500) NOT NULL DEFAULT '',
  `event` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `ID` int(11) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `default` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`ID`, `name`, `default`) VALUES
(1, 'Default Group', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_users`
--

CREATE TABLE `user_group_users` (
  `ID` int(11) NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_polls`
--

CREATE TABLE `user_polls` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `question` text NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `show_results` int(11) NOT NULL DEFAULT '0',
  `ip_restricted` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `updated` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(255) NOT NULL DEFAULT '',
  `vote_type` int(11) NOT NULL DEFAULT '0',
  `votes_today` int(11) NOT NULL DEFAULT '0',
  `votes_today_timestamp` int(11) NOT NULL DEFAULT '0',
  `votes_month` int(11) NOT NULL DEFAULT '0',
  `votes_month_timestamp` int(11) NOT NULL DEFAULT '0',
  `themeid` int(11) NOT NULL DEFAULT '0',
  `cookie_restricted` int(11) NOT NULL DEFAULT '0',
  `user_restricted` int(11) NOT NULL,
  `public` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_poll_answers`
--

CREATE TABLE `user_poll_answers` (
  `ID` int(11) NOT NULL,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `answer` varchar(500) NOT NULL DEFAULT '',
  `image` varchar(500) NOT NULL DEFAULT '',
  `votes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_poll_countries`
--

CREATE TABLE `user_poll_countries` (
  `ID` int(11) NOT NULL,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `country` varchar(100) NOT NULL DEFAULT '',
  `votes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_poll_votes`
--

CREATE TABLE `user_poll_votes` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `answerid` int(11) NOT NULL DEFAULT '0',
  `IP` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `date_stamp` varchar(60) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `admin` int(11) NOT NULL DEFAULT '0',
  `admin_settings` int(11) NOT NULL DEFAULT '0',
  `admin_members` int(11) NOT NULL DEFAULT '0',
  `admin_payment` int(11) NOT NULL DEFAULT '0',
  `banned` int(11) NOT NULL,
  `poll_creator` int(11) NOT NULL,
  `admin_poll` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`ID`, `name`, `admin`, `admin_settings`, `admin_members`, `admin_payment`, `banned`, `poll_creator`, `admin_poll`) VALUES
(1, 'Admin', 1, 0, 0, 0, 0, 0, 0),
(2, 'Member Manager', 0, 0, 1, 0, 0, 0, 0),
(3, 'Admin Settings', 0, 1, 0, 0, 0, 0, 0),
(4, 'Admin Payments', 0, 0, 0, 1, 0, 0, 0),
(6, 'Banned', 0, 0, 0, 0, 1, 0, 0),
(7, 'Member', 0, 0, 0, 0, 0, 1, 0),
(8, 'Admin Poll Manager', 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_stats`
--

CREATE TABLE `user_stats` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `polls` int(11) NOT NULL DEFAULT '0',
  `poll_votes` int(11) NOT NULL DEFAULT '0',
  `poll_votes_today` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `home_stats`
--
ALTER TABLE `home_stats`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ipn_log`
--
ALTER TABLE `ipn_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ip_block`
--
ALTER TABLE `ip_block`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payment_plans`
--
ALTER TABLE `payment_plans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `poll_themes`
--
ALTER TABLE `poll_themes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reset_log`
--
ALTER TABLE `reset_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `site_layouts`
--
ALTER TABLE `site_layouts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_events`
--
ALTER TABLE `user_events`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_group_users`
--
ALTER TABLE `user_group_users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_polls`
--
ALTER TABLE `user_polls`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_poll_answers`
--
ALTER TABLE `user_poll_answers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_poll_countries`
--
ALTER TABLE `user_poll_countries`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_poll_votes`
--
ALTER TABLE `user_poll_votes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_stats`
--
ALTER TABLE `user_stats`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `home_stats`
--
ALTER TABLE `home_stats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ipn_log`
--
ALTER TABLE `ipn_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ip_block`
--
ALTER TABLE `ip_block`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_plans`
--
ALTER TABLE `payment_plans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `poll_themes`
--
ALTER TABLE `poll_themes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reset_log`
--
ALTER TABLE `reset_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `site_layouts`
--
ALTER TABLE `site_layouts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_events`
--
ALTER TABLE `user_events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_group_users`
--
ALTER TABLE `user_group_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_polls`
--
ALTER TABLE `user_polls`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_poll_answers`
--
ALTER TABLE `user_poll_answers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_poll_countries`
--
ALTER TABLE `user_poll_countries`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_poll_votes`
--
ALTER TABLE `user_poll_votes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_stats`
--
ALTER TABLE `user_stats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
