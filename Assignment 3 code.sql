--Task 1
create table projects(
	Task_id INT PRIMARY KEY,
	Start_Date DATE,
	End_Date DATE
);
drop table assignment3;

INSERT INTO projects (Task_ID, Start_Date, End_Date) VALUES
(1, '2015-10-01', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10-30', '2015-10-31');

WITH projectGroups AS (
    SELECT 
        Task_ID,
        Start_Date,
        End_Date,
        CASE 
            WHEN LAG(End_Date) OVER (ORDER BY End_Date) IS NULL 
                 OR (End_Date - LAG(End_Date) OVER (ORDER BY End_Date)) > 1
            THEN 1 
            ELSE 0 
        END AS is_project_start
    FROM projects
),
projectNumbers AS (
    SELECT 
        Task_ID,
        Start_Date,
        End_Date,
        SUM(is_project_start) OVER (ORDER BY End_Date ROWS UNBOUNDED PRECEDING) AS project_num
    FROM projectGroups
),
projectBounds AS (
    SELECT 
        project_num,
        MIN(Start_Date) AS project_Start,
        MAX(End_Date) AS project_End
    FROM projectNumbers
    GROUP BY project_num
)
SELECT 
    project_Start,
    project_End
FROM projectBounds
ORDER BY 
    (project_End - project_Start) ASC,
    project_Start ASC;

--Task 2
CREATE TABLE Students (
    ID INTEGER,
    Name VARCHAR(50)
);

CREATE TABLE Friends (
    ID INTEGER,
    Friend_ID INTEGER
);

CREATE TABLE Packages (
    ID INTEGER,
    Salary DECIMAL(10,2)
);

INSERT INTO Students (ID, Name) VALUES
(1, 'Ashley'),
(2, 'Samantha'),
(3, 'Julia'),
(4, 'Scarlet');

INSERT INTO Friends (ID, Friend_ID) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 1);

INSERT INTO Packages (ID, Salary) VALUES
(1, 15.20),
(2, 10.06),
(3, 11.55),
(4, 12.12);

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages p_student ON s.ID = p_student.ID
JOIN Packages p_friend ON f.Friend_ID = p_friend.ID
WHERE p_friend.Salary > p_student.Salary
ORDER BY p_friend.Salary;

--Task 3

CREATE TABLE Functions (
    X INTEGER,
    Y INTEGER
);

INSERT INTO Functions (X, Y) VALUES
(20, 20),
(20, 20),
(20, 21),
(23, 22),
(22, 23),
(21, 20);

SELECT DISTINCT f1.X, f1.Y
FROM Functions f1
JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X
WHERE f1.X <= f1.Y  -- To avoid duplicate symmetric pairs and handle X=Y case
ORDER BY f1.X;

--Task 4

CREATE TABLE Contests (
    contest_id INTEGER,
    hacker_id INTEGER,
    name VARCHAR(50)
);
 
CREATE TABLE Colleges (
    college_id INTEGER,
    contest_id INTEGER
);

CREATE TABLE Challenges (
    challenge_id INTEGER,
    college_id INTEGER
);

CREATE TABLE View_Stats (
    challenge_id INTEGER,
    total_views INTEGER,
    total_unique_views INTEGER
);

CREATE TABLE Submission_Stats (
    challenge_id INTEGER,
    total_submissions INTEGER,
    total_accepted_submissions INTEGER
);

INSERT INTO Contests (contest_id, hacker_id, name) VALUES
(66406, 17973, 'Rose'),
(66556, 79153, 'Angela'),
(94828, 80275, 'Frank');

INSERT INTO Colleges (college_id, contest_id) VALUES
(11219, 66406),
(32473, 66556),
(56685, 94828);

INSERT INTO Challenges (challenge_id, college_id) VALUES
(18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 56685);

INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES
(47127, 26, 19),
(47127, 15, 14),
(18765, 43, 10),
(18765, 72, 13),
(75516, 35, 17),
(60292, 11, 10),
(72974, 41, 15),
(75516, 75, 11);

INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES
(75516, 34, 12),
(47127, 27, 10),
(47127, 56, 18),
(75516, 74, 12),
(75516, 83, 8),
(72974, 68, 24),
(72974, 82, 14),
(47127, 28, 11);

SELECT 
    c.contest_id,
    c.hacker_id, 
    c.name,
    COALESCE(SUM(ss.total_submissions), 0) AS total_submissions,
    COALESCE(SUM(ss.total_accepted_submissions), 0) AS total_accepted_submissions,
    COALESCE(SUM(vs.total_views), 0) AS total_views,
    COALESCE(SUM(vs.total_unique_views), 0) AS total_unique_views
FROM Contests c
LEFT JOIN Colleges col ON c.contest_id = col.contest_id
LEFT JOIN Challenges ch ON col.college_id = ch.college_id
LEFT JOIN Submission_Stats ss ON ch.challenge_id = ss.challenge_id
LEFT JOIN View_Stats vs ON ch.challenge_id = vs.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING COALESCE(SUM(ss.total_submissions), 0) > 0 
    OR COALESCE(SUM(ss.total_accepted_submissions), 0) > 0
    OR COALESCE(SUM(vs.total_views), 0) > 0
    OR COALESCE(SUM(vs.total_unique_views), 0) > 0
ORDER BY c.contest_id;

--Task 5

CREATE TABLE Hackers (
    hacker_id INTEGER,
    name VARCHAR(50)
);

CREATE TABLE Submissions (
    submission_date DATE,
    submission_id INTEGER,
    hacker_id INTEGER,
    score INTEGER
);

INSERT INTO Hackers (hacker_id, name) VALUES
(15758, 'Rose'),
(20703, 'Angela'),
(36396, 'Frank'),
(38289, 'Patrick'),
(44065, 'Lisa'),
(53473, 'Kimberly'),
(62529, 'Bonnie'),
(79722, 'Michael');

INSERT INTO Submissions (submission_date, submission_id, hacker_id, score) VALUES
('2016-03-01', 8494, 20703, 0),
('2016-03-01', 22403, 53473, 15),
('2016-03-01', 23965, 79722, 60),
('2016-03-01', 30173, 36396, 70),
('2016-03-02', 34928, 20703, 0),
('2016-03-02', 38740, 15758, 60),
('2016-03-02', 42769, 79722, 25),
('2016-03-02', 44364, 79722, 60),
('2016-03-03', 45440, 20703, 0),
('2016-03-03', 49050, 36396, 70),
('2016-03-03', 50273, 79722, 5),
('2016-03-04', 50344, 20703, 0),
('2016-03-04', 51360, 44065, 90),
('2016-03-04', 54404, 53473, 65),
('2016-03-04', 61533, 79722, 45),
('2016-03-05', 72852, 20703, 0),
('2016-03-05', 74546, 38289, 0),
('2016-03-05', 76487, 62529, 0),
('2016-03-05', 82439, 36396, 10),
('2016-03-05', 90006, 36396, 40),
('2016-03-06', 90404, 20703, 0);

WITH daily_submissions AS (
    SELECT 
        submission_date,
        hacker_id,
        COUNT(*) AS daily_submission_count
    FROM Submissions
    GROUP BY submission_date, hacker_id
),
unique_hackers_per_day AS (
    SELECT 
        submission_date,
        COUNT(DISTINCT hacker_id) AS unique_hackers
    FROM Submissions
    GROUP BY submission_date
),
max_submissions_per_day AS (
    SELECT 
        ds.submission_date,
        ds.hacker_id,
        ds.daily_submission_count,
        ROW_NUMBER() OVER (
            PARTITION BY ds.submission_date 
            ORDER BY ds.daily_submission_count DESC, ds.hacker_id ASC
        ) as rn
    FROM daily_submissions ds
)
SELECT 
    uhd.submission_date,
    uhd.unique_hackers,
    mspd.hacker_id,
    h.name
FROM unique_hackers_per_day uhd
JOIN max_submissions_per_day mspd ON uhd.submission_date = mspd.submission_date
JOIN Hackers h ON mspd.hacker_id = h.hacker_id
WHERE mspd.rn = 1  
ORDER BY uhd.submission_date;

--Task 6

CREATE TABLE STATION (
    ID BIGINT,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N BIGINT,
    LONG_W BIGINT
);

INSERT INTO STATION VALUES 
(1, 'New York', 'NY', 40.7128, 74.0060),
(2, 'Los Angeles', 'CA', 34.0522, 118.2437),
(3, 'Chicago', 'IL', 41.8781, 87.6298),
(4, 'Houston', 'TX', 29.7604, 95.3698),
(5, 'Phoenix', 'AZ', 33.4484, 112.0740),
(6, 'Philadelphia', 'PA', 39.9526, 75.1652),
(7, 'San Antonio', 'TX', 29.4241, 98.4936),
(8, 'San Diego', 'CA', 32.7157, 117.1611),
(9, 'Dallas', 'TX', 32.7767, 96.7970),
(10, 'San Jose', 'CA', 37.3382, 121.8863),
(11, 'Austin', 'TX', 30.2672, 97.7431),
(12, 'Jacksonville', 'FL', 30.3322, 81.6557),
(13, 'Fort Worth', 'TX', 32.7555, 97.3308),
(14, 'Columbus', 'OH', 39.9612, 82.9988),
(15, 'Charlotte', 'NC', 35.2271, 80.8431);

SELECT * FROM STATION ORDER BY ID;

SELECT 
    'Extreme Values' as info,
    MIN(LAT_N) as min_latitude,
    MAX(LAT_N) as max_latitude,
    MIN(LONG_W) as min_longitude,
    MAX(LONG_W) as max_longitude
FROM STATION;

SELECT 'Min Latitude Point' as point_type, CITY, STATE, LAT_N, LONG_W
FROM STATION 
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION)
UNION ALL
SELECT 'Max Latitude Point' as point_type, CITY, STATE, LAT_N, LONG_W
FROM STATION 
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION)
UNION ALL
SELECT 'Min Longitude Point' as point_type, CITY, STATE, LAT_N, LONG_W
FROM STATION 
WHERE LONG_W = (SELECT MIN(LONG_W) FROM STATION)
UNION ALL
SELECT 'Max Longitude Point' as point_type, CITY, STATE, LAT_N, LONG_W
FROM STATION 
WHERE LONG_W = (SELECT MAX(LONG_W) FROM STATION);

WITH extreme_points AS (
    SELECT 
        MIN(LAT_N) as min_lat,
        MAX(LAT_N) as max_lat,
        MIN(LONG_W) as min_long,
        MAX(LONG_W) as max_long
    FROM STATION
),
points AS (
    SELECT 
        min_lat as p1_lat,
        min_long as p1_long,
        max_lat as p2_lat,
        max_long as p2_long
    FROM extreme_points
),
calculation_details AS (
    SELECT 
        p1_lat,
        p1_long,
        p2_lat,
        p2_long,
        ABS(p2_lat - p1_lat) as lat_difference,
        ABS(p2_long - p1_long) as long_difference,
        ABS(p2_lat - p1_lat) + ABS(p2_long - p1_long) as manhattan_distance
    FROM points
)
SELECT 
    'P1 Coordinates' as description,
    CAST(p1_lat AS VARCHAR(20)) as value1,
    CAST(p1_long AS VARCHAR(20)) as value2,
    CAST(NULL AS VARCHAR(20)) as result
FROM calculation_details
UNION ALL
SELECT 
    'P2 Coordinates' as description,
    CAST(p2_lat AS VARCHAR(20)) as value1,
    CAST(p2_long AS VARCHAR(20)) as value2,
    CAST(NULL AS VARCHAR(20)) as result
FROM calculation_details
UNION ALL
SELECT 
    'Latitude Difference' as description,
    CAST(lat_difference AS VARCHAR(20)) as value1,
    CAST(NULL AS VARCHAR(20)) as value2,
    CAST(NULL AS VARCHAR(20)) as result
FROM calculation_details
UNION ALL
SELECT 
    'Longitude Difference' as description,
    CAST(long_difference AS VARCHAR(20)) as value1,
    CAST(NULL AS VARCHAR(20)) as value2,
    CAST(NULL AS VARCHAR(20)) as result
FROM calculation_details
UNION ALL
SELECT 
    'Manhattan Distance' as description,
    CAST(NULL AS VARCHAR(20)) as value1,
    CAST(NULL AS VARCHAR(20)) as value2,
    CAST(ROUND(manhattan_distance, 4) AS VARCHAR(20)) as result
FROM calculation_details;

--Task 7

CREATE TABLE NUMBERS (
    NUM BIGINT PRIMARY KEY
);

INSERT INTO NUMBERS (NUM)
SELECT generate_series(2, 1000);

WITH primes AS (
    SELECT NUM
    FROM NUMBERS
    WHERE NUM = 2
    UNION
    SELECT n1.NUM
    FROM NUMBERS n1
    WHERE n1.NUM > 2 
    AND n1.NUM % 2 != 0
    AND NOT EXISTS (
        SELECT 1
        FROM NUMBERS n2
        WHERE n2.NUM > 2 
        AND n2.NUM <= SQRT(n1.NUM)
        AND n2.NUM % 2 != 0
        AND n1.NUM % n2.NUM = 0
    )
)
SELECT STRING_AGG(CAST(NUM AS TEXT), '&' ORDER BY NUM) as prime_numbers
FROM primes;

WITH RECURSIVE 
numbers AS (
    SELECT 2 as n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 1000
),
primes AS (
    SELECT n
    FROM numbers
    WHERE n = 2
    UNION
    SELECT n1.n
    FROM numbers n1
    WHERE n1.n > 2 
    AND n1.n % 2 != 0
    AND NOT EXISTS (
        SELECT 1
        FROM numbers n2
        WHERE n2.n > 2 
        AND n2.n <= SQRT(n1.n)
        AND n2.n % 2 != 0
        AND n1.n % n2.n = 0
    )
)
SELECT STRING_AGG(CAST(n AS TEXT), '&' ORDER BY n) as prime_numbers
FROM primes;

--Task 8

CREATE TABLE OCCUPATIONS (
    Name VARCHAR(50),
    Occupation VARCHAR(20)
);

INSERT INTO OCCUPATIONS VALUES ('Samantha', 'Doctor'),
('Julia', 'Actor'),
('Maria', 'Actor'),
('Meera', 'Singer'),
('Ashely', 'Professor'),
('Ketty', 'Professor'),
('Christeen', 'Professor'),
('Jane', 'Actor'),
('Jenny', 'Doctor'),
('Priya', 'Singer');

WITH ranked_names AS (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) as row_num
    FROM OCCUPATIONS
),
all_rows AS (
    SELECT DISTINCT row_num FROM ranked_names
)
SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) as Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) as Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) as Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) as Actor
FROM ranked_names
RIGHT JOIN all_rows ON ranked_names.row_num = all_rows.row_num
GROUP BY all_rows.row_num
ORDER BY all_rows.row_num;

--Task 9

CREATE TABLE BST (
    N INTEGER,
    P INTEGER
);

INSERT INTO BST VALUES
(1, 2),
(3, 2),
(6, 8),
(9, 8),
(2, 5),
(8, 5),
(5, null);

SELECT N,
       CASE 
           WHEN P IS NULL THEN 'Root'
           WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
           ELSE 'Inner'
       END AS node_type
FROM BST
ORDER BY N;

--Task 10

CREATE TABLE Company (
    company_code VARCHAR(10),
    founder VARCHAR(50)
);

CREATE TABLE Lead_Manager (
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

CREATE TABLE Senior_Manager (
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

CREATE TABLE Manager (
    manager_code VARCHAR(10),
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

CREATE TABLE Employee (
    employee_code VARCHAR(10),
    manager_code VARCHAR(10),
    senior_manager_code VARCHAR(10),
    lead_manager_code VARCHAR(10),
    company_code VARCHAR(10)
);

INSERT INTO Company VALUES
('C1', 'Monika'),
('C2', 'Samantha');

INSERT INTO Lead_Manager VALUES
('LM1', 'C1'),
('LM2', 'C2');

INSERT INTO Senior_Manager VALUES
('SM1', 'LM1', 'C1'),
('SM2', 'LM1', 'C1'),
('SM3', 'LM2', 'C2');

INSERT INTO Manager VALUES
('M1', 'SM1', 'LM1', 'C1'),
('M2', 'SM3', 'LM2', 'C2'),
('M3', 'SM3', 'LM2', 'C2');

INSERT INTO Employee VALUES
('E1', 'M1', 'SM1', 'LM1', 'C1'),
('E2', 'M1', 'SM1', 'LM1', 'C1'),
('E3', 'M2', 'SM3', 'LM2', 'C2'),
('E4', 'M3', 'SM3', 'LM2', 'C2');

SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS total_lead_managers,
    COUNT(DISTINCT sm.senior_manager_code) AS total_senior_managers,
    COUNT(DISTINCT m.manager_code) AS total_managers,
    COUNT(DISTINCT e.employee_code) AS total_employees
FROM Company c
LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm ON c.company_code = sm.company_code
LEFT JOIN Manager m ON c.company_code = m.company_code
LEFT JOIN Employee e ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;

--Task 11 same as task 2

--Task 12


CREATE TABLE job_family_cost (
    job_family VARCHAR(50),
    country VARCHAR(50),
    cost DECIMAL(10,2)
);

INSERT INTO job_family_cost VALUES
('Engineering', 'India', 50000),
('Engineering', 'USA', 120000),
('Marketing', 'India', 40000),
('Marketing', 'UK', 80000),
('Sales', 'India', 45000),
('Sales', 'Germany', 90000);

SELECT 
    (COUNT(CASE WHEN country = 'India' THEN 1 END) * 100.0 / COUNT(*)) AS india_percentage,
    (COUNT(CASE WHEN country != 'India' THEN 1 END) * 100.0 / COUNT(*)) AS international_percentage
FROM job_family_cost;

--Task 13

CREATE TABLE bu_monthly_data (
    month VARCHAR(20),
    cost DECIMAL(12,2),
    revenue DECIMAL(12,2)
);

INSERT INTO bu_monthly_data VALUES
('January', 100000, 150000),
('February', 120000, 180000),
('March', 110000, 165000),
('April', 130000, 200000);


SELECT 
    month,
    (cost * 100.0 / revenue) AS cost_revenue_ratio_percentage
FROM bu_monthly_data
ORDER BY month;

--Task 14

CREATE TABLE employees (
    employee_id INTEGER,
    sub_band VARCHAR(20),
    department VARCHAR(50)
);


INSERT INTO employees VALUES
(1, 'Junior', 'Engineering'),
(2, 'Senior', 'Engineering'),
(3, 'Junior', 'Marketing'),
(4, 'Mid', 'Engineering'),
(5, 'Senior', 'Sales'),
(6, 'Mid', 'Marketing'),
(7, 'Junior', 'Sales'),
(8, 'Senior', 'Engineering');

SELECT 
    sub_band,
    COUNT(*) AS headcount,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employees)) AS percentage
FROM employees
GROUP BY sub_band;

--Task 15

CREATE TABLE employees2 (
    employee_id INTEGER,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees2 VALUES
(1, 'John Smith', 85000, 'Engineering'),
(2, 'Sarah Johnson', 92000, 'Marketing'),
(3, 'Mike Brown', 78000, 'Sales'),
(4, 'Emily Davis', 95000, 'Engineering'),
(5, 'David Wilson', 88000, 'Finance'),
(6, 'Lisa Anderson', 91000, 'Marketing'),
(7, 'Tom Garcia', 83000, 'Sales'),
(8, 'Anna Martinez', 97000, 'Engineering'),
(9, 'Chris Taylor', 86000, 'Finance'),
(10, 'Jennifer Lee', 89000, 'HR');

SELECT employee_id, employee_name, salary, department
FROM employees2 e1
WHERE (
    SELECT COUNT(*)
    FROM employees2 e2
    WHERE e2.salary > e1.salary
) < 5;

--Task 16

CREATE TABLE test_table (
    id INTEGER,
    column_a INT,
    column_b INT
);
drop table test_table;
INSERT INTO test_table VALUES
(1, 10, 20),
(2, 30, 40),
(3, 50, 60);
select * from test_table;

UPDATE test_table
SET (column_a, column_b) = (column_b, column_a);

--Tash 17

CREATE USER new_user WITH PASSWORD 'password123';

GRANT ALL PRIVILEGES ON DATABASE celebaldb TO new_user;

ALTER DATABASE celebaldb OWNER TO new_user;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO new_user;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO new_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO new_user;

--Task 18

CREATE TABLE employee_cost (
    employee_id INTEGER,
    employee_name VARCHAR(50),
    cost DECIMAL(10,2),
    month VARCHAR(20),
    bu VARCHAR(50),
    weightage DECIMAL(5,2)
);

INSERT INTO employee_cost VALUES
(1, 'John Smith', 8000, 'January', 'Technology', 0.8),
(2, 'Sarah Johnson', 9000, 'January', 'Technology', 1.0),
(3, 'Mike Brown', 7500, 'January', 'Technology', 0.6),
(4, 'Emily Davis', 8500, 'February', 'Technology', 0.9),
(5, 'David Wilson', 9200, 'February', 'Technology', 1.2),
(6, 'Lisa Anderson', 7800, 'February', 'Technology', 0.7),
(7, 'Tom Garcia', 8300, 'March', 'Technology', 0.85),
(8, 'Anna Martinez', 9500, 'March', 'Technology', 1.1),
(9, 'Chris Taylor', 7200, 'March', 'Technology', 0.65);

SELECT 
    month,
    bu,
    SUM(cost * weightage) / SUM(weightage) AS weighted_average_cost
FROM employee_cost
GROUP BY month, bu
ORDER BY month;

--Task 19

CREATE TABLE employees3 (
    employee_id INTEGER,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees3 VALUES
(1, 'John Smith', 85000),
(2, 'Sarah Johnson', 92000),
(3, 'Mike Brown', 78000),
(4, 'Emily Davis', 95000),
(5, 'David Wilson', 88000),
(6, 'Lisa Anderson', 91000),
(7, 'Tom Garcia', 83000),
(8, 'Anna Martinez', 97000),
(9, 'Chris Taylor', 86000),
(10, 'Jennifer Lee', 89000);

SELECT CEIL(
    AVG(salary) - AVG(CASE WHEN salary = 0 THEN NULL ELSE salary END)
) AS error_amount
FROM employees3;

--Task 20

CREATE TABLE source_table (
    id INTEGER,
    name VARCHAR(50),
    email VARCHAR(100),
    created_date DATE
);

CREATE TABLE target_table (
    id INTEGER,
    name VARCHAR(50),
    email VARCHAR(100),
    created_date DATE
);

INSERT INTO source_table VALUES
(1, 'John Doe', 'john@email.com', '2024-01-15'),
(2, 'Jane Smith', 'jane@email.com', '2024-02-20'),
(3, 'Bob Johnson', 'bob@email.com', '2024-03-10'),
(4, 'Alice Brown', 'alice@email.com', '2024-04-05');

INSERT INTO target_table VALUES
(1, 'John Doe', 'john@email.com', '2024-01-15'),
(2, 'Jane Smith', 'jane@email.com', '2024-02-20');

INSERT INTO target_table (id, name, email, created_date)
SELECT s.id, s.name, s.email, s.created_date
FROM source_table s
LEFT JOIN target_table t ON s.id = t.id
WHERE t.id IS NULL;

select * from target_table;