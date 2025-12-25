-- SQL Advent Calendar - Day 18
-- Title: 12 Days of Data - Progress Tracking
-- Difficulty: hard
--
-- Question:
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--

-- Table Schema:
-- Table: daily_quiz_scores
--   subject: VARCHAR
--   quiz_date: DATE
--   score: INTEGER
--

-- My Solution:

WITH fl_dates AS (
        SELECT subject,
               MIN(quiz_date) AS first_quiz_date,
               MAX(quiz_date) AS last_quiz_date
        FROM   daily_quiz_scores
        GROUP BY subject)


SELECT fl.subject, fs.score AS first_score, ls.score AS last_score
FROM  fl_dates fl

LEFT JOIN daily_quiz_scores fs ON fs.quiz_date = fl.first_quiz_date AND fs.subject = fl.subject
LEFT JOIN daily_quiz_scores ls ON ls.quiz_date = fl.last_quiz_date AND ls.subject = fl.subject;
