--
-- Дублирующая структура для представления `view_administrators`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `view_administrators` (
`user_id` int(11)
,`user_name` varchar(255)
,`hashed_password` varchar(255)
,`token` varchar(255)
,`role_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `view_moderator_users`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `view_moderator_users` (
`user_id` int(11)
,`user_name` varchar(255)
,`hashed_password` varchar(255)
,`token` varchar(255)
,`role_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `view_questions_web_development_category`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `view_questions_web_development_category` (
`question_id` int(11)
,`user_id` int(11)
,`data_id` int(11)
,`question_text` varchar(255)
,`completed` tinyint(1)
,`QuestionTitle` varchar(255)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `view_repository_count`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `view_repository_count` (
`total_repositories` bigint(21)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `view_users_with_role_id_2`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `view_users_with_role_id_2` (
`user_id` int(11)
,`user_name` varchar(255)
,`hashed_password` varchar(255)
,`token` varchar(255)
,`role_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Структура для представления `view_administrators`
--
DROP TABLE IF EXISTS `view_administrators`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_administrators`  AS SELECT `u`.`user_id` AS `user_id`, `u`.`user_name` AS `user_name`, `u`.`hashed_password` AS `hashed_password`, `u`.`token` AS `token`, `r`.`role_name` AS `role_name` FROM (`user_table` `u` join `role` `r` on(`u`.`role_id` = `r`.`role_id`)) WHERE `r`.`role_name` = 'Admin' ;

-- --------------------------------------------------------

--
-- Структура для представления `view_moderator_users`
--
DROP TABLE IF EXISTS `view_moderator_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_moderator_users`  AS SELECT `u`.`user_id` AS `user_id`, `u`.`user_name` AS `user_name`, `u`.`hashed_password` AS `hashed_password`, `u`.`token` AS `token`, `r`.`role_name` AS `role_name` FROM (`user_table` `u` join `role` `r` on(`u`.`role_id` = `r`.`role_id`)) WHERE `r`.`role_name` = 'Moderator' ;

-- --------------------------------------------------------

--
-- Структура для представления `view_questions_web_development_category`
--
DROP TABLE IF EXISTS `view_questions_web_development_category`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_questions_web_development_category`  AS SELECT `q`.`question_id` AS `question_id`, `q`.`user_id` AS `user_id`, `q`.`data_id` AS `data_id`, `q`.`question_text` AS `question_text`, `q`.`completed` AS `completed`, `q`.`QuestionTitle` AS `QuestionTitle` FROM (`question` `q` join `questioncategoryconnect` `qc` on(`q`.`question_id` = `qc`.`question_id`)) WHERE `qc`.`category_id` = 1 ;

-- --------------------------------------------------------

--
-- Структура для представления `view_repository_count`
--
DROP TABLE IF EXISTS `view_repository_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_repository_count`  AS SELECT count(`repository`.`repository_id`) AS `total_repositories` FROM `repository` ;

-- --------------------------------------------------------

--
-- Структура для представления `view_users_with_role_id_2`
--
DROP TABLE IF EXISTS `view_users_with_role_id_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_users_with_role_id_2`  AS SELECT `u`.`user_id` AS `user_id`, `u`.`user_name` AS `user_name`, `u`.`hashed_password` AS `hashed_password`, `u`.`token` AS `token`, `r`.`role_name` AS `role_name` FROM (`user_table` `u` join `role` `r` on(`u`.`role_id` = `r`.`role_id`)) WHERE `r`.`role_id` = 2 ;

--