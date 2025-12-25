-- SQL Advent Calendar - Day 3
-- Title: The Grinch's Best Pranks Per Target
-- Difficulty: hard
--
-- Question:
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--

-- Table Schema:
-- Table: grinch_prank_ideas
--   prank_id: INTEGER
--   target_name: VARCHAR
--   prank_description: VARCHAR
--   evilness_score: INTEGER
--   created_at: TIMESTAMP
--

-- My Solution:

WITH my_cte AS (
  SELECT *,
  DENSE_RANK() OVER(PARTITION BY target_name ORDER BY evilness_score DESC) AS rank_id
  FROM grinch_prank_ideas
  ), 

cte_1 AS (
  SELECT *
  FROM my_cte
  WHERE rank_id = 1
), 

max_cte AS(
  SELECT *,
    MAX(created_at) OVER(PARTITION BY target_name) AS max_created_at
  FROM cte_1
  GROUP BY target_name, prank_description, created_at)

SELECT target_name, prank_description
FROM max_cte
WHERE created_at = max_created_at;
