-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT `name`, `surname`, `date_of_birth` 
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990
ORDER BY `date_of_birth` ASC


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT `name`, `cfu`
FROM `courses`
WHERE `cfu` > 10
ORDER BY `cfu` ASC


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE DATEDIFF(CURDATE(), `date_of_birth`) / 365.25 > 30 -- il .25 l'ho messo per contare gli anni bisestili, altrimenti mi contava i giorni dei neo-trentenni dal 26 dicembre 1993
ORDER BY `date_of_birth` DESC;

-- 3.1 questa variante è più precisa e mostra anche gli students che hanno compiuto 30 anni nel giorno corrente

SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) >= 30
ORDER BY `date_of_birth` DESC;



-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT `period`, `year`
FROM `courses`
WHERE `period`= 'I semestre' AND `year`='1'


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT `hour`
FROM `exams`
WHERE `hour` >= '14:00' AND `date` = '2020/06/20'
ORDER BY `hour` ASC;


-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT `name` 
FROM `degrees`
WHERE `level`= 'magistrale'
ORDER BY `name` ASC



-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT  COUNT(*) as `number_of_departments` 
FROM `departments` 