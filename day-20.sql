-- SQL Advent Calendar - Day 20
-- Title: Hot Cocoa Break Logs
-- Difficulty: medium
--
-- Question:
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--

-- Table Schema:
-- Table: cocoa_logs
--   log_id: INT
--   break_id: INT
--   cocoa_id: INT
--
-- Table: break_schedule
--   break_id: INT
--   location_id: INT
--
-- Table: cocoa_types
--   cocoa_id: INT
--   cocoa_name: VARCHAR
--
-- Table: locations
--   location_id: INT
--   location_name: VARCHAR
--

-- My Solution:

-- need logged break, cocoa_name, location_name

SELECT cl.break_id, 
       cl.cocoa_id, 
       bs.location_id,
       ct.cocoa_name,
       l.location_name
FROM cocoa_logs cl
  
LEFT JOIN break_schedule bs ON bs.break_id = cl.break_id
LEFT JOIN cocoa_types ct ON ct.cocoa_id = cl.cocoa_id
LEFT JOIN locations l ON l.location_id = bs.location_id;
