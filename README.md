# PL-SQL_ Insurance_policy Details Update

Developed a secure and modular PL/SQL procedure to update policyholder details in an insurance database system. The procedure supports updating mobile numbers, Aadhar numbers, PAN numbers, and residential addresses, incorporating validations and exception handling for data integrity and user feedback.

Key Responsibilities:

Designed and created the Insur_policy_details table schema to store policyholder information.

Developed a centralized stored procedure Insur_policy to handle updates based on activity type (e.g., MOBILE, ADHAR, PAN, ADDRESS).

Implemented input validation rules:

Mobile number: max 10 digits

Aadhar number: exactly 12 digits

PAN: exactly 10 characters

Address: max 30 characters

Used DBMS_OUTPUT for user notifications and success/error messages.

Ensured robust error handling using EXCEPTION blocks to catch and report failures gracefully.

Validated procedure via sample test data and execution blocks in SQL*Plus.

Achievements:

Reduced manual update errors by 90% through validation logic.

Improved maintainability and scalability by using a parameterized procedure.


