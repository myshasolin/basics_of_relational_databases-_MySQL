-- Определить кто больше поставил лайков (всего): мужчины или женщины.


-- выводим пол из таблицы profiles, группируем вывод по полу, подсчитывая количество строк для каждого
-- группируем результат по убыванию и выводим только верхнюю строчку - этот пол больше лайков и поставил

SELECT 
	CASE (p.gender)
		WHEN 'm' THEN 'монсеньёры'
		ELSE 'мадамы'
	END AS пол,
	COUNT(l.id) AS лайков
FROM profiles AS p
JOIN likes AS l ON p.user_id = l.user_id 
GROUP BY пол
ORDER BY лайков DESC
LIMIT 1;

