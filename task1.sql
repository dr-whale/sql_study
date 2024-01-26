-- Задание 1: Создание функции для форматирования количества секунд в дни, часы, минуты и секунды
CREATE FUNCTION FormatSeconds(seconds INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(255);

    SET days = FLOOR(seconds / (24 * 60 * 60));
    SET seconds = seconds - (days * 24 * 60 * 60);
    SET hours = FLOOR(seconds / (60 * 60));
    SET seconds = seconds - (hours * 60 * 60);
    SET minutes = FLOOR(seconds / 60);
    SET secs = seconds - (minutes * 60);

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
    
    RETURN result;
END;

-- Пример использования функции для заданных секунд
SELECT FormatSeconds(123456); -- Выведет '1 days 10 hours 17 minutes 36 seconds'