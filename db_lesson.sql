Q1
CREATE TABLE departments(
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE people ADD department_id INT UNSIGNED NULL AFTER email;

Q3
 INSERT INTO departments(name)
  VALUES
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

  INSERT INTO people (name, email, department_id, age, gender)
  VALUES
  ('TESTMAN1', 'tm1@bw.co.jp', 1, 25, 1),     /*p_id:7*/
  ('TESTWOMAN1', 'tw1@bw.co.jp', 1, 23, 2),   /*p_id:8*/
  ('TESTMAN2', 'tm2@bw.co.jp', 1, 30, 1),     /*p_id:9*/
  ('TESTMAN3', 'tm3@bw.co.jp', 2, 26, 1),     /*p_id:10*/
  ('TESTMAN4', 'tm4@bw.co.jp', 2, 33, 1),     /*p_id:11*/
  ('TESTMAN5', 'tm5@bw.co.jp', 2, 38, 1),     /*p_id:12*/
  ('TESTWOMAN2', 'tw2@bw.co.jp', 2, 24, 2),   /*p_id:13*/
  ('TESTWOMAN3', 'tw3@bw.co.jp', 3, 35, 2),   /*p_id:14*/
  ('TESTMAN6', 'tm6@bw.co.jp', 4, 44, 1),     /*p_id:15*/
  ('TESTUK', NULL, 5, NULL, NULL);            /*p_id:16*/

INSERT INTO reports (person_id, content)
  VALUES
  (9,'営業担当活動日報01'),    /*r_id:13*/
  (9,'営業担当活動日報02'),    /*r_id:14*/
  (7,'営業担当活動日報03'),    /*r_id:15*/
  (12,'開発担当活動日報01'),   /*r_id:16*/
  (11,'営業担当活動日報02'),   /*r_id:17*/
  (12,'営業担当活動日報03'),   /*r_id:18*/
  (10,'営業担当活動日報04'),   /*r_id:19*/
  (14,'経理担当活動日報01'),   /*r_id:20*/
  (15,'人事担当活動日報01'),   /*r_id:21*/
  (16,'情シス担当活動日報01'); /*r_id:22*/

Q4
UPDATE people
SET department_id = CASE person_id
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 4
    WHEN 4 THEN 3
    WHEN 6 THEN 5
END
WHERE department_id IS NULL;

Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
テーブル'people'内で
カラム名'department_id'の値が'1'と一致するレコードの
カラム名'name', 'email', 'age'の値を
カラム名 'created_at'の値の昇順で取得する。

Q7
SELECT name FROM people 
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
OR (age BETWEEN 40 AND 49 AND gender = 1);

Q8
SELECT people.*
FROM people
INNER JOIN departments
ON people.department_id = departments.department_id
WHERE departments.department_id = 1
ORDER BY people.age ASC;

Q9
SELECT AVG(people.age) AS average_age
FROM people
INNER JOIN departments
ON people.department_id = departments.department_id
WHERE departments.department_id = 2
AND people.gender = 2;

Q10
SELECT people.name, departments.name, reports.content
FROM people
INNER JOIN departments
ON people.department_id = departments.department_id
INNER JOIN reports
ON people.person_id = reports.person_id;

Q11
SELECT people.name
FROM people
LEFT JOIN reports
ON people.person_id = reports.person_id
WHERE reports.person_id IS NULL;