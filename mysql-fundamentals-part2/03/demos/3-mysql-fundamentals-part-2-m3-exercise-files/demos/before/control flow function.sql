-- Example of CASE Operator
SET @Var = 1;
SELECT CASE @Var
			WHEN 1 THEN 'one'
			WHEN 2 THEN 'two' 
	   ELSE 'more' END AS Result;

SELECT 	CASE WHEN @Var = 1 THEN 'one'
		WHEN @Var = 2 THEN 'two' 
	   ELSE 'more' END AS Result;

SET @Var1 = 11;
SET @Var2 = 12;
SELECT 	CASE WHEN (@Var1 = 11 AND @Var2 = 13) THEN 'one'
		WHEN @Var2 = 12 THEN 'two' 
	   ELSE 'more' END AS Result;


-- Example of IF functions
SELECT IF(1>2,2,3);
SELECT IF(1<2,'yes','no');
SELECT IF(YEAR(NOW()) = 2012,'yes','no');

-- Example of IFNULL Function
SELECT IFNULL(1,0);
SELECT IFNULL(NULL,0);
SELECT 1/0;
SELECT IFNULL(1/0,'Yes');

-- Example of NULLIF Function
SELECT NULLIF(1,1);
SELECT NULLIF(5,2);



















