-- (по желанию) Подсчитайте произведение чисел в столбце таблицы

# формируем временную таблицу и наполняем её значениями

SELECT id FROM catalogs;

CREATE TEMPORARY TABLE tbl (value INT);
INSERT tbl VALUES (1), (2), (3), (4), (5);
SELECT * FROM tbl;

# получим логарифмы значений столбца value с помощью LN(), складываем их с помощью SUM()
# а для получения результирующего значения использем экспоненциальную функцию EXP() и округляем результат
# справка - функция EXP() возвращает e, возведенный в степень числа e в степени number .

SELECT 
	ROUND(
		EXP(
			SUM(
				LN(value)
			)
		)
	) AS 'произведение чисел'
FROM tbl;
