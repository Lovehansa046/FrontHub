DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `FindRepositoryByCommitId`(IN commit_id_param INT)
BEGIN
    SELECT r.repository_id, r.data_id, r.branch_id, r.commit_id, r.title, r.description
    FROM Repository r
    WHERE r.commit_id = commit_id_param;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowAnswersByUserId`(IN user_id_param INT)
BEGIN
    SELECT a.answer_id, a.answer_text, a.correct
    FROM Answer a
    WHERE a.user_id = user_id_param;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowQuestionsByUserId`(IN user_id_param INT)
BEGIN
    SELECT q.question_id, q.question_text, q.completed, q.QuestionTitle
    FROM Question q
    WHERE q.user_id = user_id_param;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowUserRepositories`(IN `user_id_param` INT)
BEGIN
    SELECT r.repository_id, r.data_id, r.branch_id, r.commit_id, r.title, r.description
    FROM Repository r
    JOIN userreposotoryconnect ur ON r.repository_id = ur.repository_id
    WHERE ur.user_id = user_id_param;
END$$
DELIMITER ;
