-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 07 2024 г., 08:27
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `fronthub`
--
CREATE DATABASE IF NOT EXISTS `fronthub` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fronthub`;

-- --------------------------------------------------------

--
-- Структура таблицы `answer`
--

CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL,
  `answer_text` varchar(255) NOT NULL,
  `correct` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `answer`
--

INSERT INTO `answer` (`answer_id`, `question_id`, `user_id`, `data_id`, `answer_text`, `correct`) VALUES
(1, 1, 1, 1, 'To create a new branch, use the command \"git branch branch_name\"', 1),
(2, 2, 2, 3, 'Matplotlib is a popular data visualization library in Python', 0),
(3, 3, 3, 2, 'You can use Firebase for user authentication in mobile apps', 1),
(4, 4, 4, 2, 'Cross-validation is used to assess the performance of a machine learning model', 0),
(5, 5, 5, 3, 'Jenkins is a popular tool for implementing continuous integration', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`) VALUES
(1, 'main'),
(2, 'development'),
(3, 'feature_branch_123'),
(4, 'hotfix_branch'),
(5, 'release_branch_v1.0');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Web Development'),
(2, 'Mobile App Development'),
(3, 'web development studios'),
(4, 'IT departments of banks, mobile operators, marketplaces'),
(5, 'Developing and maintaining the user interface');

-- --------------------------------------------------------

--
-- Структура таблицы `commit`
--

CREATE TABLE `commit` (
  `commit_id` int(11) NOT NULL,
  `commit_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `commit`
--

INSERT INTO `commit` (`commit_id`, `commit_text`) VALUES
(1, 'Initial commit'),
(2, 'Added new feature'),
(3, 'Fixed bug #123'),
(4, 'Refactored code'),
(5, 'Merged feature branch');

-- --------------------------------------------------------

--
-- Структура таблицы `data_storage`
--

CREATE TABLE `data_storage` (
  `data_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `data_storage` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `data_storage`
--

INSERT INTO `data_storage` (`data_id`, `path`, `data_storage`) VALUES
(1, '/files/data_A', 0x2f706174682f746f2f7265616c69737469635f66696c655f412e747874),
(2, '/files/data_B', 0x2f706174682f746f2f7265616c69737469635f66696c655f422e646f6378),
(3, '/files/data_C', 0x2f706174682f746f2f7265616c69737469635f66696c655f432e6a7067),
(4, '/files/data_D', 0x2f706174682f746f2f7265616c69737469635f66696c655f442e706466),
(5, '/files/data_E', 0x2f706174682f746f2f7265616c69737469635f66696c655f452e786c7378);

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL,
  `question_text` varchar(255) NOT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `QuestionTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`question_id`, `user_id`, `data_id`, `question_text`, `completed`, `QuestionTitle`) VALUES
(1, 1, 2, 'How to create a new branch?', 1, 'How to create a new branch?'),
(2, 2, 3, 'What is the best data visualization library?', 0, 'What is the best data visualization library?'),
(3, 3, 4, 'How to handle user authentication in mobile apps?', 1, 'How to handle user authentication in mobile apps?'),
(4, 3, 5, 'What is the purpose of cross-validation?', 0, 'What is the purpose of cross-validation?'),
(5, 2, 1, 'How to implement continuous integration?', 1, 'How to implement continuous integration?');

-- --------------------------------------------------------

--
-- Структура таблицы `questioncategoryconnect`
--

CREATE TABLE `questioncategoryconnect` (
  `category_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `questioncategoryconnect`
--

INSERT INTO `questioncategoryconnect` (`category_id`, `question_id`) VALUES
(1, 1),
(2, 1),
(4, 3),
(3, 5),
(5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `repository`
--

CREATE TABLE `repository` (
  `repository_id` int(11) NOT NULL,
  `data_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `commit_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `repository`
--

INSERT INTO `repository` (`repository_id`, `data_id`, `branch_id`, `commit_id`, `title`, `description`) VALUES
(1, 1, 1, 1, 'HTML5 & CSS3. HTML5 и CSS3', 'fundamental technologies'),
(2, 2, 2, 2, 'Flex и Grid CSS.', 'Flex и Grid CSS.'),
(3, 3, 3, 3, 'Bootstrap 4', 'Bootstrap 4'),
(4, 4, 4, 4, 'Bootstrap 5.3', 'Bootstrap 5.3'),
(5, 5, 5, 5, 'CSS preprocessors', 'CSS preprocessors');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `permissions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `permissions`) VALUES
(1, 'Admin', 'admin_permissions'),
(2, 'User', 'user_permissions'),
(3, 'Moderator', 'moderator_permissions');

-- --------------------------------------------------------

--
-- Структура таблицы `userreposotoryconnect`
--

CREATE TABLE `userreposotoryconnect` (
  `user_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `userreposotoryconnect`
--

INSERT INTO `userreposotoryconnect` (`user_id`, `repository_id`) VALUES
(1, 3),
(2, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_name`, `hashed_password`, `token`, `role_id`) VALUES
(1, 'John_Doe', 'c4ca4238a0b923820dcc509a6f75849b', 'e5e9fa1ba31ecd1ae84f75caaa474f3a', 2),
(2, 'Alice_Smith', 'c81e728d9d4c2f636f067f89cc14862c', 'f7b3d4ebc32c1b1f1630816fa75f4b3b', 1),
(3, 'Bob_Johnson', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 'd76f7d5a96a19841f4c6791a6e4eb2e5', 1),
(4, 'Eva_Brown', 'a87ff679a2f3e71d9181a67b7542122c', 'b858cb282617fb0956d960215c8e84d9', 3),
(5, 'Charlie_White', 'e4da3b7fbbce2345d7772b0674a318d5', '2510c39011c5be704182423e3a695e91', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `data_id` (`data_id`);

--
-- Индексы таблицы `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `commit`
--
ALTER TABLE `commit`
  ADD PRIMARY KEY (`commit_id`);

--
-- Индексы таблицы `data_storage`
--
ALTER TABLE `data_storage`
  ADD PRIMARY KEY (`data_id`);

--
-- Индексы таблицы `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `data_id` (`data_id`);

--
-- Индексы таблицы `questioncategoryconnect`
--
ALTER TABLE `questioncategoryconnect`
  ADD KEY `category_id` (`category_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Индексы таблицы `repository`
--
ALTER TABLE `repository`
  ADD PRIMARY KEY (`repository_id`),
  ADD KEY `data_id` (`data_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `commit_id` (`commit_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `userreposotoryconnect`
--
ALTER TABLE `userreposotoryconnect`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `repository_id` (`repository_id`);

--
-- Индексы таблицы `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answer`
--
ALTER TABLE `answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `commit`
--
ALTER TABLE `commit`
  MODIFY `commit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `data_storage`
--
ALTER TABLE `data_storage`
  MODIFY `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `repository`
--
ALTER TABLE `repository`
  MODIFY `repository_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`data_id`) REFERENCES `data_storage` (`data_id`);

--
-- Ограничения внешнего ключа таблицы `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`data_id`) REFERENCES `data_storage` (`data_id`);

--
-- Ограничения внешнего ключа таблицы `questioncategoryconnect`
--
ALTER TABLE `questioncategoryconnect`
  ADD CONSTRAINT `questioncategoryconnect_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `questioncategoryconnect_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Ограничения внешнего ключа таблицы `repository`
--
ALTER TABLE `repository`
  ADD CONSTRAINT `repository_ibfk_1` FOREIGN KEY (`data_id`) REFERENCES `data_storage` (`data_id`),
  ADD CONSTRAINT `repository_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `repository_ibfk_3` FOREIGN KEY (`commit_id`) REFERENCES `commit` (`commit_id`);

--
-- Ограничения внешнего ключа таблицы `userreposotoryconnect`
--
ALTER TABLE `userreposotoryconnect`
  ADD CONSTRAINT `userreposotoryconnect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `userreposotoryconnect_ibfk_2` FOREIGN KEY (`repository_id`) REFERENCES `repository` (`repository_id`);

--
-- Ограничения внешнего ключа таблицы `user_table`
--
ALTER TABLE `user_table`
  ADD CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
