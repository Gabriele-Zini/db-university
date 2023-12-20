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

