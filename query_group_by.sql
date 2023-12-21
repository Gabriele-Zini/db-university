-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT  YEAR(`enrolment_date`), COUNT(`id`) AS `num_enrollment`
FROM `students`
GROUP BY YEAR(`enrolment_date`);


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT  `office_address`, COUNT(`id`) AS `num_teachers`
FROM `teachers`
GROUP BY `office_address`;


-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT   `courses`.`name`, `exams`.`date`, AVG( `exam_student`.`vote`) AS `vote_avg`
FROM `exams`
INNER JOIN `exam_student`
ON `exam_student`.`exam_id`=`exams`.`id`
INNER JOIN `courses`
ON `courses`.`id`=`exams`.`course_id`
GROUP BY  `exams`.`id`
ORDER BY  AVG( `exam_student`.`vote`) ASC;



-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT  `departments`.`name`, COUNT(`degrees`.`department_id`) AS `num_of_degrees`
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id`=`departments`.`id`
GROUP BY  `degrees`.`department_id`;