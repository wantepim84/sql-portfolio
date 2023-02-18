CREATE TABLE `app_user` (
  `ID` int PRIMARY KEY,
  `first_name` char,
  `last_name` char,
  `profile_name` varchar(255),
  `signup_date` date
);

CREATE TABLE `post` (
  `ID` int PRIMARY KEY,
  `created_by_user_ID` int,
  `created_datetime` datetime,
  `caption` varchar(255),
  `post_type` varchar(255)
);

CREATE TABLE `post_media` (
  `ID` int PRIMARY KEY,
  `post_ID` int,
  `filter_ID` int,
  `media_file` varchar(255),
  `position` varchar(255),
  `longitude` int,
  `latitude` int
);

CREATE TABLE `followers` (
  `following_user_ID` int,
  `followed_user_ID` int
);

CREATE TABLE `filter` (
  `ID` int PRIMARY KEY,
  `filter_name` char,
  `filter_details` varchar(255)
);

CREATE TABLE `post_effect` (
  `post_media_ID` int,
  `effect_ID` int,
  `scale` int
);

CREATE TABLE `effect` (
  `ID` int PRIMARY KEY,
  `effect_name` char
);

CREATE TABLE `post_media_user_tag` (
  `post_media_ID` int,
  `user_id` int PRIMARY KEY,
  `x_coordinate` int,
  `y_coordinate` int
);

CREATE TABLE `comment` (
  `ID` int PRIMARY KEY,
  `created_by_user_ID` int,
  `post_ID` int,
  `created_datetime` datetime,
  `comments` varchar(255),
  `comment_replied_to_ID` int
);

CREATE TABLE `reaction` (
  `used_ID` int,
  `post_ID` int
);

CREATE TABLE `post_type` (
  `ID` int PRIMARY KEY,
  `post_type_name` char
);

ALTER TABLE `post` ADD FOREIGN KEY (`created_by_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `post_media` ADD FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`);

ALTER TABLE `followers` ADD FOREIGN KEY (`following_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `followers` ADD FOREIGN KEY (`followed_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `post_media` ADD FOREIGN KEY (`filter_ID`) REFERENCES `filter` (`ID`);

ALTER TABLE `post_effect` ADD FOREIGN KEY (`post_media_ID`) REFERENCES `post_media` (`ID`);

ALTER TABLE `post_effect` ADD FOREIGN KEY (`effect_ID`) REFERENCES `effect` (`ID`);

ALTER TABLE `post_media_user_tag` ADD FOREIGN KEY (`post_media_ID`) REFERENCES `post_media` (`ID`);

ALTER TABLE `post_media_user_tag` ADD FOREIGN KEY (`post_media_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `comment` ADD FOREIGN KEY (`created_by_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `comment` ADD FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`);

ALTER TABLE `comment` ADD FOREIGN KEY (`comment_replied_to_ID`) REFERENCES `comment` (`ID`);

ALTER TABLE `reaction` ADD FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`);

ALTER TABLE `reaction` ADD FOREIGN KEY (`used_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `post` ADD FOREIGN KEY (`post_type`) REFERENCES `post_type` (`ID`);
