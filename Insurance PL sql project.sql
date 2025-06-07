================================================================================

                            Insurance_policy Details Update

--------------------------------------------------------------------------------
create table Insur_policy_details
(Praposal_no number(20),
full_name varchar2(45),
mobile number(15),
adhar number(20),
pan varchar2(10),
address varchar2(30));

INSERT INTO Insur_policy_details VALUES (12345678901234567890, 'Amit Patel', 9876543210, 123456789012, 'ABCDE1234F', '123 Main Street, City');
INSERT INTO Insur_policy_details VALUES (23456789012345678901, 'Priya Sharma', 8765432109, 234567890123, 'FGHIJ5678K', '456 Oak Avenue, Town');


select * from Insur_policy_details;

update Insur_policy_details set Praposal_no=12345678901234567890 where full_name='GANESH PATIL';  -------------------

------------------------

CREATE OR REPLACE PROCEDURE Insur_policy(
    p_Praposal_no NUMBER,
    p_new_data VARCHAR2,
    p_activity VARCHAR2
) AS
    v_length VARCHAR2(100);
    v_count NUMBER;
    p_error_message VARCHAR2(100);
BEGIN
    -- Check if the account exists
    SELECT COUNT(1) INTO v_count FROM Insur_policy_details WHERE Praposal_no = p_Praposal_no;

    IF v_count <> 0 THEN
        IF p_activity = 'ADDRESS' THEN
            -- Check address length
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length <= 30 THEN
                -- Update address
                UPDATE Insur_policy_details SET address = p_new_data WHERE Praposal_no = p_Praposal_no;
                p_error_message := 'Your address updated successfully!';
                dbms_output.put_line(p_error_message);
            ELSE
                p_error_message := 'Address length should be 30 characters or less!';
                dbms_output.put_line(p_error_message);
            END IF;
        ELSIF p_activity = 'MOBILE' THEN
            -- Check mobile number length
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length <= 10 THEN
                -- Update mobile number
                UPDATE Insur_policy_details SET mobile = p_new_data WHERE Praposal_no = p_Praposal_no;
                p_error_message := 'Your mobile number updated successfully!';
                dbms_output.put_line(p_error_message);
            ELSE
                p_error_message := 'Enter a 10-digit mobile number.';
                dbms_output.put_line(p_error_message);
            END IF;
        
         ELSIF p_activity = 'ADHAR' THEN
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length = 12 THEN
                -- Update Adhar
                UPDATE Insur_policy_details 
                SET adhar = p_new_data 
                WHERE Praposal_no = p_Praposal_no;
                p_error_message := 'Your Adhar updated successfully!';
                dbms_output.put_line(p_error_message);
            ELSE
                p_error_message := 'Enter a 12-digit Adhar number.';
                dbms_output.put_line(p_error_message);
            END IF;
            
           ELSIF p_activity = 'PAN' THEN
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length = 10 THEN
                -- Update Pan
                UPDATE Insur_policy_details 
                SET pan = p_new_data 
                WHERE Praposal_no = p_Praposal_no;
                p_error_message := 'Your PAN updated successfully!';
                dbms_output.put_line(p_error_message);
            ELSE
                p_error_message := 'Enter a 10-digit PAN number.';
                dbms_output.put_line(p_error_message);
            END IF;
        ELSE
            p_error_message := 'Invalid activity specified!';
             dbms_output.put_line(p_error_message);
        END IF;
    ELSE
        p_error_message := 'Account number is invalid. Please try with a valid account number!';
        dbms_output.put_line(p_error_message);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        p_error_message := 'Due to some technical issue, the update was not successful. Please contact the IT department!';
         dbms_output.put_line(p_error_message);
END;
/

--------------------
set serveroutput on;

exec Insur_policy(12345678901234567890,'123455885588','ADHAR');

select * from Insur_policy_details;


