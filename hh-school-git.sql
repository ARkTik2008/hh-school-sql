-- 1. Разработать схему данных для резюме, вакансий, откликов и работодателей. 
CREATE TABLE areas (
    area_id     serial primary key,
    area_name   text not NULL
);

CREATE TABLE person (
    person_id   serial primary key,
    fullname    text not NULL,
    gender      char,
    birthdate   date
);

CREATE TABLE cv (
    cv_id               serial primary key,
    person_id           integer not NULL references person (person_id),
    position            text not NULL,
    compensation_from   integer,
    compensation_to     integer
);

CREATE TABLE employer (
    employer_id     serial primary key,
    employer_name   text not NULL,
    area_id         integer not NULL references areas (area_id)
);

CREATE TABLE vacancy (
    vacancy_id          serial primary key,
    employer_id         integer not NULL references employer (employer_id),
    position_name       text not NULL,
    compensation_from   integer,
    compensation_to     integer,
    compensation_gross  boolean,
    creation_date       date
);

CREATE TABLE response (
    response_id     serial primary key,
    vacancy_id      integer not NULL references vacancy (vacancy_id),
    person_id       integer not NULL references person (person_id),
    response_date   date not NULL
);

-- 2. Заполнить таблицы данными 
INSERT INTO public.areas (area_id, area_name)
VALUES
    (1, 'Москва'),
    (2, 'Санкт-Петербург'),
    (3, 'Казань'),
    (4, 'Екатеринбург'),
    (5, 'Рязань');

INSERT INTO public.person (fullname, gender, birthdate)
VALUES
    ('Суханова Ягетта Станиславовна','F','1971-03-14'),
    ('Шилова Гелла Богдановна', 'F', '1973-05-03'),
    ('Городецка Жанна Леонидовна', 'F', '1975-07-21'),
    ('Боброва Капитолина Ивановна', 'F', '1977-05-17'),
    ('Майборода Шарлота Вадимовна', 'F', '1979-03-28'),
    ('Захарова Алиса Владимировна', 'F', '1980-03-22'),
    ('Лукашенко Алла Ярославовна', 'F', '1980-04-03'),
    ('Одинцова Чилита Васильевна', 'F', '1980-11-09'),
    ('Смирнова Инна Юхимовна', 'F', '1981-06-22'),
    ('Бутко Тамара Ивановна', 'F', '1982-05-17'),
    ('Коновалов Йонас Юхимович', 'M', '1982-10-11'),
    ('Худобяк Жерар Леонидович', 'M', '1989-09-25'),
    ('Лобанов Динар Михайлович', 'M', '1989-11-24'),
    ('Мазайло Назар Дмитриевич', 'M', '1990-11-21'),
    ( 'Красинец Роберт Брониславович', 'M', '1991-03-06' ),
    ('Носов Чарльз Иванович', 'M', '1992-02-20'),
    ('Фёдоров Артём Иванович', 'M', '1992-04-27'),
    ('Бачей Кир Викторович', 'M', '1992-06-22'),
    ('Кравчук Яромир Леонидович', 'M', '1992-11-17'),
    ('Самсонов Гавриил Артёмович', 'M', '1992-11-24');

INSERT INTO public.cv ( person_id, "position", compensation_from, compensation_to )
VALUES
    (1, 'Бизнес-аналитик', 50333, 53708),
    (1, 'Администратор базы данных', 10231, 56508),
    (2, 'Судья', 52005, 66129),
    (3, 'Цветочница', 80177, 82194),
    (4, 'Заведующий складом', 50974, 83071),
    (5, 'Кондитер', 90262, 94979),
    (6, 'Налоговый инспектор', 123545, 128770),
    (7, 'Культуролог', 134379, 136562),
    (8, 'Почвовед', 125179, 137822),
    (9, 'Телохранитель', 147404, 167886),
    (10, 'Педиатр', 157767, 176995),
    (11, 'Пекарь', 150239, 180039),
    (12, 'Оториноларинголог (ЛОР)', 200441, 202824),
    (13, 'Редактор', 200081, 211680),
    (14, 'Визажист', 220301, 224898),
    (15, 'Реставратор', 222973, 235419),
    (16, 'Дегустатор', 249391, 249616);

INSERT INTO public.employer (employer_name, area_id)
VALUES
    ('Ксениум', 1),
    ('НовоБиз', 1),
    ('МузТон', 1),
    ('АСДС', 1),
    ('КредитМигом', 1),
    ('Железная-Мебель', 2),
    ('СРО Родина', 2),
    ('ИнфоСофт', 2),
    ('Связьэнергосервис', 2),
    ('Веб-студия AktualWeb', 2),
    ('Комиссионный магазин Визит', 3),
    ('Полиэдр', 3),
    ('MagORa Systems', 3),
    ('АБСОЛЮТ', 4),
    ('DekoSait', 4),
    ('Руско', 4),
    ('Выездной компьютерный сервис Vega', 5),
    ('СМАРТТЕХНОЛОДЖИ', 5);

INSERT INTO public.vacancy
(employer_id, position_name, compensation_from, compensation_to, compensation_gross, creation_date) 
VALUES
    (1, 'Web-интегратор', 76000, 94000, false, '2020-06-20'),
    (2, 'Биолог', 84000, 101000, false, '2020-03-05'),
    (3, 'Кинодраматург', 84000, 110000, false, '2020-04-05'),
    (4, 'Постановщик трюков', 91000, 110000, false, '2020-05-15'),
    (5, 'Полицейский', NULL, NULL, false, '2020-04-23'),
    (6, 'Дизайнер рекламы', NULL,NULL , false, '2020-04-28'),
    (7, 'Библиограф', NULL, NULL, false, '2020-06-20'),
    (8, 'Андролог', NULL, NULL, false, '2020-07-13'),
    (9, 'Почвовед',NULL , NULL, false, '2020-07-15'),
    (10, 'Социолог',NULL , NULL, true, '2020-08-24'),
    (11, 'Менеджер по рекламе', NULL, NULL, true, '2020-09-15'),
    (12, 'Офтальмолог', NULL,NULL , true, '2020-10-20'),
    (13, 'Животновод',NULL , NULL, true, '2020-10-27'),
    (14, 'Плотник',NULL ,NULL , true, '2020-10-30'),
    (15, 'Водитель', NULL, NULL, true, '2020-11-12');

INSERT INTO public.response (vacancy_id, person_id, response_date)
VALUES
    (1, 1, '2020-11-02'),
    (2, 2, '2020-11-03'),
    (3, 3, '2020-11-04'),
    (4, 4, '2020-11-05'),
    (5, 5, '2020-11-10'),
    (6, 6, '2020-11-12'),
    (7, 7, '2020-11-13'),
    (8, 8, '2020-11-16'),
    (9, 9, '2020-11-19'),
    (10, 10, '2020-11-20'),
    (11, 11, '2020-11-25'),
    (12, 12, '2020-11-26'),
    (13, 13, '2020-11-27'),
    (14, 14, '2020-11-30'),
    (15, 15, '2020-12-01'),
    (14, 16, '2020-12-09'),
    (13, 17, '2020-12-10');

--3. Вывести название вакансии, город, в котором опубликована вакансия (можно просто area_id), 
--имя работодателя для первых 10 вакансий у которых не указана зарплата, сортировать по дате создания вакансии от новых к более старым.
SELECT
    v.position_name,
    e.area_id,
    e.employer_name
FROM public.vacancy v
JOIN public.employer e ON e.employer_id = v.employer_id
WHERE
    (v.compensation_from IS NULL OR v.compensation_from = 0) 
    AND (v.compensation_to IS NULL OR v.compensation_to = 0)
ORDER BY
    v.creation_date desc
LIMIT 10; 

--4. Вывести среднюю максимальную зарплату в вакансиях, среднюю минимальную и среднюю среднюю (compensation_to - compensation_from) в одном запросе. 
    --Значения должны быть указаны до вычета налогов.
SELECT
    avg(c.compensation_from),
    AVG(c.compensation_to),
    avg(c.compensation_to - c.compensation_from)
FROM
    (
        SELECT
            CASE
                WHEN compensation_gross IS false THEN compensation_to / 0.87
                ELSE compensation_to
            END AS compensation_to,
            CASE
                WHEN compensation_gross IS false THEN compensation_from / 0.87
                ELSE compensation_from
            END AS compensation_from
        FROM
            vacancy v
    ) AS c;

-- 5. Вывести топ-5 компаний, получивших максимальное количество откликов на одну вакансию, в порядке убывания откликов. 
-- Если более 5 компаний получили одинаковое максимальное количество откликов, отсортировать по алфавиту и вывести только 5.
SELECT
    e.employer_name,
    count(r.vacancy_id) AS vac_count
FROM response r
RIGHT JOIN vacancy v ON r.vacancy_id = v.vacancy_id
JOIN employer e ON v.employer_id = e.employer_id
GROUP BY
    e.employer_id
ORDER BY vac_count desc, e.employer_name
LIMIT 5; 
    
-- 6. Вывести медианное количество вакансий на компанию. Использовать percentile_cont.
SELECT
    v2.id,
    PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY (v2.vac_count)) AS median
FROM
    (
        SELECT
            e.employer_id AS id,
            count(r.vacancy_id) AS vac_count
        FROM response r
        JOIN vacancy v ON r.vacancy_id = v.vacancy_id
        JOIN employer e ON v.employer_id = e.employer_id
        GROUP BY e.employer_id
    ) AS v2
GROUP BY v2.id
ORDER BY median desc, v2.id; 
    
-- 7. Вывести минимальное и максимальное время от создания вакансии до первого отклика для каждого города.
WITH days_of_first_response AS (
	SELECT
		v.vacancy_id, 
		v.employer_id,
		MIN(r.response_date - v.creation_date) AS first_response_days
	FROM response r
	JOIN vacancy v ON r.vacancy_id = v.vacancy_id
	GROUP BY v.vacancy_id
	ORDER BY v.vacancy_id
)
SELECT
    e.area_id,
    MAX(dfr.first_response_days) AS days_max,
    MIN(dfr.first_response_days) AS days_min
FROM response r
JOIN days_of_first_response dfr ON r.vacancy_id = dfr.vacancy_id
JOIN employer e ON dfr.employer_id = e.employer_id
GROUP BY e.area_id
ORDER BY e.area_id;
