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


SELECT new_id, new_cat,

       SUM(new_id)       OVER (PARTITION BY new_cat) AS [Total],
       AVG(new_id * 1.0) OVER (PARTITION BY new_cat) AS [Average],
       COUNT(new_id)     OVER (PARTITION BY new_cat) AS [Count],
       MIN(new_id)       OVER (PARTITION BY new_cat) AS [Min],
       MAX(new_id)       OVER (PARTITION BY new_cat) AS [Max]
FROM test_data
ORDER BY new_cat, new_id;



