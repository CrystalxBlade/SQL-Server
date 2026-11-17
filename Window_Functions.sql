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


