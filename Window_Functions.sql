-- WINDOW FUNCTIONS --

/*

- Window Function 

  Applies aggregate, ranking and analytic functions over 
  particular window; for example sum, avg or row_number


- Expression

  Is the name of the column that we want the window function operated on.
  This may not be necessary depending on what window function is used


- OVER

  Is just to signify that this is a window function


- PARTITION BY
  
  Divides the rows into the partitions so we can specify which row to use
  to compute the window function


- ORDER BY

  Is used so that we can order the rows within each partition.
  This is optional and does not have to be specified


- ROWS

  Can be used if we want to further limit the rows withing our partition.
  This is optional and usually not used

*/


CREATE DATABASE Earth


CREATE TABLE test_data
(
    new_id  INT,
    new_cat VARCHAR(20)
);

INSERT INTO test_data (new_id, new_cat) VALUES
(100, 'Agni'),
(200, 'Agni'),
(500, 'Dharti'),
(700, 'Dharti'),
(200, 'Vayu'),
(300, 'Vayu'),
(500, 'Vayu');



--------------     Aggregate Functions     --------------


SELECT new_id, new_cat,

       SUM(new_id)       OVER (PARTITION BY new_cat) AS [Total],
       AVG(new_id * 1.0) OVER (PARTITION BY new_cat) AS [Average],
       COUNT(new_id)     OVER (PARTITION BY new_cat) AS [Count],
       MIN(new_id)       OVER (PARTITION BY new_cat) AS [Min],
       MAX(new_id)       OVER (PARTITION BY new_cat) AS [Max]
FROM test_data
ORDER BY new_cat, new_id;


/* 
   ROWS between unbounded preceding and unbounded  following which will give  
   a single output based on all input values/partition (if used)
*/


SELECT new_id, new_cat,
       SUM(new_id) OVER (ORDER BY new_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Total],
       AVG(new_id * 1.0) OVER (ORDER BY new_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Average],
       COUNT(new_id) OVER (ORDER BY new_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Count],
       MIN(new_id) OVER (ORDER BY new_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Min],
       MAX(new_id) OVER (ORDER BY new_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Max]
FROM test_data;


--------------     Ranking Functions     --------------


SELECT new_id,
ROW_NUMBER() OVER (ORDER BY new_id) AS [ROW_NUMBER],
RANK() OVER (ORDER BY new_id) AS [RANK],
DENSE_RANK() OVER (ORDER BY new_id) AS [DENSE_RANK],
PERCENT_RANK() OVER (ORDER BY new_id) AS [PERCENT_RANK]
FROM test_data


--------------     Aanalytic Functions     --------------

/*
If u just want the single last value from whole column,
*/


SELECT new_id,
FIRST_VALUE(new_id) OVER(ORDER BY new_id) AS "FIRST_VALUE",
LAST_VALUE(new_id) OVER(ORDER BY new_id) AS "LAST_VALUE",
LEAD(new_id) OVER(ORDER BY new_id) AS "LEAD",
LAG(new_id) OVER(ORDER BY new_id) AS "LAG"
FROM test_data



