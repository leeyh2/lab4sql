--Yu Lee, Lab 4 Part 1
SET SERVEROUTPUT ON;
DECLARE
    REVIEW_ID CONSTANT VARCHAR2(26):= 20;
    greeting VARCHAR2(20) :=  'Greeting!';
    reviewer VARCHAR2(128) := '';
BEGIN
    SELECT REVIEWERNAME INTO reviewer
        FROM REVIEWS
            WHERE ENTRYID = REVIEW_ID;
    DBMS_OUTPUT.PUT_LINE(greeting || ' '|| reviewer);        
END;

--Yu Lee, Lab 4 Part 2
CREATE OR REPLACE PROCEDURE Review_Output(ENT_NUM NUMBER) IS
    message VARCHAR2(50):= 'The Following Review: ';
    full_review VARCHAR2(4000):= '';
BEGIN
    SELECT REVIEWTEXT INTO full_review
        FROM REVIEWS
            WHERE ENTRYID = ENT_NUM;
     DBMS_OUTPUT.PUT_LINE(message || ' '|| ENT_NUM || ' ' || full_review);   
END;
/
BEGIN
    Review_Output(4);
END;

--Yu Lee, Lab 4 Part 3
CREATE OR REPLACE FUNCTION Review_Output_Fn(ENT_NUM NUMBER) RETURN VARCHAR2 IS
 message VARCHAR2(50):= 'The Following Review: ';
    full_review VARCHAR2(4000):= '';
BEGIN
    SELECT REVIEWTEXT INTO full_review
        FROM REVIEWS
            WHERE ENTRYID = ENT_NUM;
     RETURN(message || ' '|| full_review);   
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(Review_Output_Fn(4));
END;
--Yu Lee, Lab 4 Part 4
CREATE OR REPLACE PROCEDURE Calculate_Age_Bracket(age NUMBER)IS

BEGIN
    IF age>= 20 AND age <= 120 THEN
        DBMS_OUTPUT.PUT_LINE('ADULT');
    ELSIF age>= 13 AND age <= 19 THEN
        DBMS_OUTPUT.PUT_LINE('TEENAGER');
    ELSIF age>= 0 AND age <= 12 THEN
        DBMS_OUTPUT.PUT_LINE('CHILD');   
    ELSE
        DBMS_OUTPUT.PUT_LINE('You are too old or not born');  
    END IF;
END;

/
EXECUTE Calculate_Age_Bracket(49);
--Yu Lee, Lab 4 Part 5
CREATE OR REPLACE FUNCTION Calculate_Age_Bracket_Cs(age NUMBER)  RETURN VARCHAR2 IS

BEGIN
    CASE 
        WHEN age>=0 AND age<=12 THEN
            RETURN('CHILD');
        WHEN age>=13 AND age<=19 THEN
            RETURN('TEENAGER');
        WHEN age>=20 AND age<=120 THEN
            RETURN('ADULT');
        ELSE
            RETURN('INVALID AGE!!');
        END CASE;
END;

/
BEGIN
DBMS_OUTPUT.PUT_LINE(Calculate_Age_Bracket_Cs(49)); 
END;  

--Yu Lee, Lab 4 Part 6
CREATE OR REPLACE PROCEDURE Print_Numbers(numbers NUMBER) IS 
    counter INTEGER := 1;
BEGIN
    WHILE counter <= numbers LOOP 
        DBMS_OUTPUT.PUT_LINE(counter);
        counter := counter + 1; 
        
    END LOOP;
END;
/
EXECUTE Print_Numbers(60);

CREATE OR REPLACE PROCEDURE Print(numbers NUMBER) IS 
    counter INTEGER := 1;
BEGIN
    FOR counter IN 1..numbers LOOP 
        DBMS_OUTPUT.PUT_LINE(counter);
     
    END LOOP;
END;
/
EXECUTE Print(60);