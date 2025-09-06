CREATE DATABASE IF NOT EXISTS COMPANY;
USE COMPANY;
CREATE TABLE IF NOT EXISTS PROJECTS (
	PROJECT_ID INT NOT NULL,
    PROJECT_TITLE VARCHAR(255),
    PROJECT_DEPT_NO CHAR(3),
    PROJECT_LEAD VARCHAR(255),
    PROJECT_START_DATE DATE,
    PROJECT_END_DATE DATE,
    PRIMARY KEY (PROJECT_ID)
) ENGINE=INNODB;

ALTER TABLE PROJECTS
ADD COLUMN BUDGET DECIMAL(12,2) AFTER PROJECT_END_DATE;

UPDATE PROJECTS SET BUDGET = 500000.00 WHERE PROJECT_ID = 121334;
UPDATE PROJECTS SET BUDGET = 300000.00 WHERE PROJECT_ID = 121335;
UPDATE PROJECTS SET BUDGET = 450000.00 WHERE PROJECT_ID = 121336;
UPDATE PROJECTS SET BUDGET = 600000.00 WHERE PROJECT_ID = 121337;
UPDATE PROJECTS SET BUDGET = 250000.00 WHERE PROJECT_ID = 121338;
UPDATE PROJECTS SET BUDGET = 700000.00 WHERE PROJECT_ID = 121339;
UPDATE PROJECTS SET BUDGET = 800000.00 WHERE PROJECT_ID = 121340;
UPDATE PROJECTS SET BUDGET = 750000.00 WHERE PROJECT_ID = 121341;
UPDATE PROJECTS SET BUDGET = 550000.00 WHERE PROJECT_ID = 121342;
UPDATE PROJECTS SET BUDGET = 640000.00 WHERE PROJECT_ID = 121343;

CREATE TABLE IF NOT EXISTS TASKS (
	TASK_ID INT NOT NULL AUTO_INCREMENT,
    PROJECT_ID INT NOT NULL,
    TASK_TITLE VARCHAR(255),
    ASSIGNED_TO VARCHAR(255),
    TEAM_ROLE VARCHAR(255),
    TASK_START_DATE DATE,
    TASK_END_DATE DATE,
    TASK_STATUS VARCHAR(50),
    PRIMARY KEY (TASK_ID),
    INDEX proj_id (PROJECT_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS(PROJECT_ID)
		ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS TEAMS (
	TEAM_ID INT NOT NULL AUTO_INCREMENT,
    PROJECT_ID INT NOT NULL,
    MEMBER_NAME VARCHAR(255) NOT NULL,
    TEAM_ROLE VARCHAR(255),
    EMAIL VARCHAR(255),
    JOIN_DATE DATE,
    PRIMARY KEY (TEAM_ID),
    INDEX proj_id (PROJECT_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS (PROJECT_ID)
		ON DELETE CASCADE
) ENGINE=INNODB;

INSERT INTO PROJECTS ( PROJECT_ID, PROJECT_TITLE, PROJECT_DEPT_NO, PROJECT_LEAD, PROJECT_START_DATE, PROJECT_END_DATE ) 
VALUES 
( 121334, "Admin Services", "DO1", "Shankar Shrinivasan", '2025-07-17', '2026-01-15'),
( 121335, 'Financial Audit System', 'DO2', 'Priya Menon', '2025-06-10', '2026-03-01'),
( 121336, 'HR Management Portal', 'DO3', 'Ravi Kumar', '2025-08-05', '2026-02-28'),
( 121337, 'IT Infrastructure Upgrade', 'DO1', 'Neha Sharma', '2025-09-01', '2026-04-15'),
( 121338, 'Logistics Optimization', 'DO4', 'Vikas Gupta', '2025-05-20', '2026-01-30'),
( 121339, 'Digital Workspace Setup', 'DO2', 'Amit Joshi', '2025-07-12', '2026-02-12'),
( 121340, 'Payroll Automation', 'DO3', 'Kavita Deshpande', '2025-08-25', '2026-05-20'),
( 121341, 'Cybersecurity Enhancement', 'DO4', 'Rohit Verma', '2025-06-18', '2026-02-28'),
( 121342, 'Employee Training Program', 'DO1', 'Sneha Reddy', '2025-07-30', '2026-03-15'),
( 121343, 'Operations Efficiency Drive', 'DO2', 'Arjun Iyer', '2025-09-10', '2026-06-01');

INSERT INTO TASKS ( PROJECT_ID, TASK_TITLE, ASSIGNED_TO, TEAM_ROLE, TASK_START_DATE, TASK_END_DATE, TASK_STATUS )
VALUES
(121337, 'IT Infrastructure Setup', 'Sonal Gupta', 'IT Engineer', '2025-09-02', '2025-10-02', 'In Progress'),
(121334, 'Admin Dashboard Management', 'Anita Rao', 'Project Manager', '2025-07-18', '2025-08-17', 'Completed'),
(121337, 'Network Security Audit', 'Rohit Deshmukh', 'Security Analyst', '2025-09-05', '2025-10-05', 'Pending'),
(121336, 'Employee Onboarding Module', 'Neha Kapoor', 'HR Specialist', '2025-08-06', '2025-09-05', 'In Progress'),
(121339, 'UI Design Implementation', 'Pooja Malhotra', 'UI Designer', '2025-07-15', '2025-08-14', 'Completed'),
(121335, 'Financial Data Analysis', 'Priya Nair', 'Financial Analyst', '2025-06-12', '2025-07-12', 'Completed'),
(121334, 'System Testing', 'Manoj Singh', 'Tester', '2025-07-20', '2025-08-19', 'Pending'),
(121337, 'Network Configuration', 'Vivek Sharma', 'Network Specialist', '2025-09-03', '2025-10-03', 'In Progress'),
(121339, 'Technical Architecture Review', 'Rohit Deshmukh', 'Technical Lead', '2025-07-13', '2025-08-12', 'Pending'),
(121335, 'Audit Report Preparation', 'Arun Bhatia', 'Auditor', '2025-06-15', '2025-07-15', 'Completed'),
(121335, 'Project Advisory Planning', 'Anita Rao', 'Project Advisor', '2025-06-11', '2025-07-11', 'In Progress'),
(121336, 'System Administration Setup', 'Rahul Jain', 'System Admin', '2025-08-08', '2025-09-07', 'Pending'),
(121338, 'System Architecture Planning', 'Rohit Deshmukh', 'System Architect', '2025-06-01', '2025-07-01', 'Completed'),
(121334, 'Frontend Development', 'Karan Mehta', 'Developer', '2025-07-19', '2025-08-18', 'In Progress'),
(121338, 'Operations Workflow Design', 'Meena Iyer', 'Operations Lead', '2025-05-22', '2025-06-21', 'Pending');

INSERT INTO TEAMS 
(TEAM_ID, PROJECT_ID, MEMBER_NAME, TEAM_ROLE, EMAIL, JOIN_DATE) 
VALUES
(1, 121337, 'Sonal Gupta', 'IT Engineer', 'sonal.gupta@example.com', '2025-09-02'),
(2, 121334, 'Anita Rao', 'Project Manager', 'anita.rao@example.com', '2025-07-18'),
(3, 121337, 'Rohit Deshmukh', 'Security Analyst', 'rohit.deshmukh@example.com', '2025-09-05'),
(4, 121336, 'Neha Kapoor', 'HR Specialist', 'neha.kapoor@example.com', '2025-08-06'),
(5, 121339, 'Pooja Malhotra', 'UI Designer', 'pooja.malhotra@example.com', '2025-07-15'),
(6, 121335, 'Priya Nair', 'Financial Analyst', 'priya.nair@example.com', '2025-06-12'),
(7, 121334, 'Manoj Singh', 'Tester', 'manoj.singh@example.com', '2025-07-20'),
(8, 121337, 'Vivek Sharma', 'Network Specialist', 'vivek.sharma@example.com', '2025-09-03'),
(9, 121339, 'Rohit Deshmukh', 'Technical Lead', 'rohit.deshmukh@example.com', '2025-07-13'),
(10, 121335, 'Arun Bhatia', 'Auditor', 'arun.bhatia@example.com', '2025-06-15'),
(11, 121335, 'Anita Rao', 'Project Advisor', 'anita.rao@example.com', '2025-06-11'),
(12, 121336, 'Rahul Jain', 'System Admin', 'rahul.jain@example.com', '2025-08-08'),
(13, 121338, 'Rohit Deshmukh', 'System Architect', 'rohit.deshmukh@example.com', '2025-06-01'),
(14, 121334, 'Karan Mehta', 'Developer', 'karan.mehta@example.com', '2025-07-19'),
(15, 121338, 'Meena Iyer', 'Operations Lead', 'meena.iyer@example.com', '2025-05-22');


SELECT * FROM PROJECTS;
SELECT * FROM TASKS;
DROP TABLE TASKS;
SELECT * FROM TEAMS;

SELECT P.PROJECT_TITLE, T.TASK_TITLE, T.TASK_STATUS 
FROM COMPANY.PROJECTS P
JOIN COMPANY.TASKS T ON P.PROJECT_ID = T.PROJECT_ID;



/*-- ------------------ 1 . GET NUMBER OF TASKS PER PROJECT ------------------------------------ */
SELECT 
	P.PROJECT_ID, 
    P.PROJECT_TITLE,
    COUNT(*) AS NO_OF_TASKS, 
    SUM(CASE WHEN TASK_STATUS = 'Completed' THEN 1 ELSE 0 END) AS COMPLETED_TASKS
FROM PROJECTS P
JOIN TASKS T ON P.PROJECT_ID = T.PROJECT_ID 
GROUP BY P.PROJECT_ID, P.PROJECT_TITLE; 


/* -- ------------- 2 . TOP 2 TEAM MEMBERS WITH HIGHEST NUMBER OF TASKS ---------------------------------*/
SELECT MEMBER_NAME, COUNT(*) AS PROJECTS_ASSIGNED
FROM TEAMS
GROUP BY MEMBER_NAME
ORDER BY PROJECTS_ASSIGNED DESC
LIMIT 2;


/*
SELECT TASK_END_DATE, AVG(TASK_END_DATE) AS AVG_DATE
FROM TASKS
GROUP BY TASK_END_DATE;


SELECT TASK_ID, TASK_TITLE, TASK_END_DATE  
FROM TASKS
WHERE TASK_END_DATE < (
	SELECT DATE( FROM_UNIXTIME( AVG( UNIX_TIMESTAMP(TASK_END_DATE) )) ) FROM TASKS
); */


/* ------------------------------- 3. FIND DUE DATE -------------------------------------- */
SELECT P.PROJECT_ID, P.PROJECT_TITLE, COUNT(T.TASK_END_DATE) AS TOTAL_TASKS, MAX(T.TASK_TITLE) AS EARLIEST_TASK, MAX(T.TASK_END_DATE) AS DEADLINE, MIN(T.TASK_TITLE) AS NEXT_TASK, MIN(T.TASK_END_DATE) AS DEADLINE
FROM PROJECTS P
JOIN TASKS T ON P.PROJECT_ID = T.PROJECT_ID
GROUP BY PROJECT_ID, PROJECT_TITLE;


/* ------------------------------- 4. PROJECT WITH MAX BUDGET ----------------------------*/
SELECT PROJECT_TITLE, MAX(BUDGET) 
FROM PROJECTS
GROUP BY PROJECT_TITLE
ORDER BY MAX(BUDGET) DESC
LIMIT 1;

-- USING SUBQUERY
SELECT PROJECT_ID, PROJECT_TITLE, BUDGET
FROM PROJECTS
WHERE BUDGET = (
	SELECT MAX(BUDGET) FROM PROJECTS  
);



/* -------------- PERCENTAGE OF COMPLETED TASKS PER PROJECT ------------------------*/

SELECT 
	P.PROJECT_ID, 
    COUNT(*) AS COUNT,
    COUNT(CASE WHEN T.TASK_STATUS = 'Completed' THEN 1 END) * 100.0 / COUNT(*) AS COMPLETION_PERCENTAGE
FROM PROJECTS P
JOIN TASKS T ON P.PROJECT_ID = T.PROJECT_ID
GROUP BY PROJECT_ID;


/* ------------------------------- COUNT TASKS ASSIGNED ----------------------------------- */
SELECT ASSIGNED_TO, TASK_TITLE, COUNT(ASSIGNED_TO) AS WORKING_ON
FROM TASKS
GROUP BY ASSIGNED_TO, TASK_TITLE
ORDER BY ASSIGNED_TO DESC;

/* ---------------------- POJECTS HAVING NO TASKS ASSIGNED ----------------------------------*/

INSERT INTO PROJECTS ( PROJECT_ID, PROJECT_TITLE, PROJECT_DEPT_NO, PROJECT_LEAD, PROJECT_START_DATE, PROJECT_END_DATE ) 
VALUES (121344, "Cyber Security", "D05", "Meena Iyer", '2025-08-27', null);

SELECT P.PROJECT_ID, P.PROJECT_TITLE
FROM PROJECTS P
LEFT JOIN TASKS T ON P.PROJECT_ID = T.PROJECT_ID
WHERE T.TASK_ID IS NULL;

/* ------------------------------- MODEL TRAINING ------------------------------*/
CREATE TABLE IF NOT EXISTS MODEL_TRAINING (
	TRAINING_ID INT NOT NULL AUTO_INCREMENT,
    PROJECT_ID INT NOT NULL,
    MODEL_NAME VARCHAR(255),
    ACCURACY DECIMAL(5,2),
    TRAINING_DATE DATE,
    PRIMARY KEY (TRAINING_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS(PROJECT_ID)
		ON DELETE CASCADE 
) ENGINE=INNODB;

INSERT INTO MODEL_TRAINING (PROJECT_ID, MODEL_NAME, ACCURACY, TRAINING_DATE)
VALUES
(121334, 'AdminNet v1', 92.50, '2025-07-25'),
(121334, 'AdminNet v2', 94.20, '2025-08-10'),
(121335, 'FinancePredictor', 88.75, '2025-06-20'),
(121335, 'FinancePredictor v2', 90.10, '2025-07-01'),
(121336, 'HRAnalyzer', 85.50, '2025-08-15'),
(121337, 'ITOptimizer', 93.00, '2025-09-10'),
(121337, 'ITOptimizer v2', 95.40, '2025-09-25'),
(121338, 'OpsStreamlineAI', 89.30, '2025-06-10'),
(121339, 'ProductDevAI', 91.00, '2025-07-20');

SELECT 
    MT.PROJECT_ID,
    P.PROJECT_TITLE,
    MT.MODEL_NAME,
    MT.ACCURACY
FROM MODEL_TRAINING MT
JOIN PROJECTS P ON MT.PROJECT_ID = P.PROJECT_ID
WHERE (MT.PROJECT_ID, MT.ACCURACY) IN (
    SELECT PROJECT_ID, MAX(ACCURACY)
    FROM MODEL_TRAINING
    GROUP BY PROJECT_ID
);


/* ---------------------------- DATASET LARGER THAN 10 GB  ------------------------------*/

CREATE TABLE DATA_SETS (
    DATASET_ID INT NOT NULL AUTO_INCREMENT,
    PROJECT_ID INT NOT NULL,
    DATASET_NAME VARCHAR(255),
    SIZE_GB DECIMAL(10,2),
    LAST_UPDATED DATE,
    PRIMARY KEY (DATASET_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES PROJECTS(PROJECT_ID) ON DELETE CASCADE
) ENGINE=INNODB;

INSERT INTO DATA_SETS (PROJECT_ID, DATASET_NAME, SIZE_GB, LAST_UPDATED)
VALUES
(121334, 'AdminLogs2025', 12.5, '2025-08-05'),
(121334, 'UserActivity', 8.0, '2025-07-30'),
(121335, 'Finance2025Q2', 15.0, '2025-07-28'),
(121336, 'EmployeeRecords', 9.5, '2025-08-10'),
(121337, 'ITInfraStats', 20.0, '2025-09-01'),
(121338, 'OpsMetrics', 5.5, '2025-06-15'),
(121339, 'ProductUsage', 25.0, '2025-07-18'),
(121339, 'DevLogs', 11.0, '2025-07-25');

SELECT 
    ds.project_id,
    p.PROJECT_TITLE,
    ds.dataset_name,
    ds.size_gb,
    ds.last_updated
FROM Data_Sets ds
JOIN PROJECTS p ON ds.project_id = p.PROJECT_ID
WHERE ds.size_gb > 10
  AND ds.last_updated >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);