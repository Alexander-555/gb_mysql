DELIMITER //

CREATE FUNCTION fibonacci (digit INT)
RETURNS int DETERMINISTIC
BEGIN
    RETURN 
    (
		WITH RECURSIVE fibonacci (n, fib_n, next_fib_n) AS
		    (
		      SELECT 1, 0, 1
		      UNION ALL
		      SELECT n + 1, next_fib_n, fib_n + next_fib_n
			    FROM fibonacci WHERE n < 10
		    )
		    SELECT next_fib_n FROM fibonacci WHERE n = digit
    );
END//

DELIMITER ;
