-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT `name`, `surname`, `date_of_birth` 
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990
ORDER BY `date_of_birth` ASC


-- Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT `name`, `cfu`
FROM `courses`
WHERE `cfu` > 10
ORDER BY `cfu` ASC


-- Selezionare tutti gli studenti che hanno più di 30 anni

SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE DATEDIFF(CURDATE(), `date_of_birth`) / 365.25 > 30 -- il .25 l'ho messo per contare gli anni bisestili, altrimenti mi contava i giorni dei neo-trentenni dal 26 dicembre 1993
ORDER BY `date_of_birth` DESC;

-- questa variante è più precisa e mostra anche gli students che hanno compiuto 30 anni nel giorno corrente

SELECT `name`, `surname`, `date_of_birth`
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) >= 30
ORDER BY `date_of_birth` DESC;



-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT `period`, `year`
FROM `courses`
WHERE `period`= 'I semestre' AND `year`='1'