-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name`, `students`.`surname`, `degrees`.`name` AS `degrees_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id`=`degrees`.`id`
WHERE `degrees`.`name`= 'Corso di Laurea in Economia'


-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`.`name` AS `degree_name`, `departments`.`name` AS `department_name`
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id`=`departments`.`id`
WHERE `departments`.`name`= 'Dipartimento di Neuroscienze' AND `degrees`.`level`= 'magistrale'

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT  `teachers`.`name`, `teachers`.`surname`, `courses`.`name` AS `course_name`
FROM `teachers` 
INNER JOIN `course_teacher`
ON `course_teacher`.`teacher_id`=`teachers`.`id`
INNER JOIN `courses`
ON `course_teacher`.`course_id`=`courses`.`id`
WHERE `teachers`.`id`=44;


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`surname`, `students`.`name`, `degrees`.*, `departments`.*
FROM `students` 
JOIN `degrees`
ON `students`.`degree_id`=`degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id`=`departments`.`id`
ORDER BY  `students`.`surname` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `degree_name`, `courses`.`name` AS `course_name`,`teachers`.`name`, `teachers`.`surname`
FROM `teachers` 
JOIN `course_teacher`
ON `course_teacher`.`teacher_id`=`teachers`.`id`
JOIN `courses`
ON `course_teacher`.`course_id`=`courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id`=`degrees`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `departments`.`name`, `teachers`.`surname`, `teachers`.`name`
FROM `teachers` 
JOIN `course_teacher`
ON `course_teacher`.`teacher_id`=`teachers`.`id`
JOIN `courses`
ON `course_teacher`.`course_id`=`courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id`=`degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id`=`departments`.`id`
WHERE `departments`.`name`= 'Dipartimento di Matematica'
ORDER BY `teachers`.`surname` ASC;

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto persuperare ciascuno dei suoi esami

SELECT  `students`.`surname`, `students`.`name`, `courses`.`name` AS `course_name`, COUNT(`courses`.`name`) AS `num_try` 
FROM `students`
INNER JOIN `exam_student`
ON `exam_student`.`student_id`= `students`.`id`
INNER JOIN `exams`
ON `exam_student`.`exam_id`= `exams`.`id`
INNER JOIN `courses`
ON `exams`.`course_id`=`courses`.`id`
GROUP BY `students`.`name`, `students`.`surname`, `courses`.`name`
ORDER BY `students`.`surname`;

-- nel caso si volesse scremare solo quelli che hanno passato l'esame

SELECT  `students`.`surname`, `students`.`name`, `courses`.`name` AS `course_name`, COUNT(`courses`.`name`) AS `num_try`,  MAX(`exam_student`.`vote`)  AS `max_vote`
FROM `students`
INNER JOIN `exam_student`
ON `exam_student`.`student_id`= `students`.`id`
INNER JOIN `exams`
ON `exam_student`.`exam_id`= `exams`.`id`
INNER JOIN `courses`
ON `exams`.`course_id`=`courses`.`id`
GROUP BY `students`.`name`, `students`.`surname`, `courses`.`name`
HAVING MAX(`exam_student`.`vote`) >=18
ORDER BY `students`.`surname`;
