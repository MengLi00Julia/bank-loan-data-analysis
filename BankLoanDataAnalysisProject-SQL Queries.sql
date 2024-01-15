/*
BANK LOAN DATA ANALYSIS PROJECT
*/



/*
Part 1: BANK LOAN REPORT | SUMMARY
*/

/*
1.Primary KPI¡¦s:
*/

-- 1.Total Loan Applications
-- Calculates the total number of applications.
SELECT COUNT(id) AS Total_Applications 
FROM bank_loan_data

-- 2.MTD Loan Applications
-- Calculates the total number of loan applications in December 2021. (MTD - Month to Date).
SELECT COUNT(id) AS MTD_Total_Applications 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- 3.PMTD Loan Applications
-- Calculates the total number of loan applications for the previous month (PMTD - Previous Month to Date).
SELECT COUNT(id) AS PMTD_Total_Applications 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

-- 4.Total Funded Amount
-- Calculates the total funded amount across all loan applications.
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank_loan_data

-- 5.MTD Total Funded Amount
-- Calculates the Month-to-Date (MTD) total funded amount in December 2021.
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- 6.PMTD Total Funded Amount
-- Calculates the total funded amount for the previous month (PMTD - Previous Month to Date).
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

-- 7.Total Amount Received
-- Calculates the total amount collected from loan payments.
SELECT SUM(total_payment) AS Total_Amount_Collected 
FROM bank_loan_data

-- 8.MTD Total Amount Received
-- Calculates the Month-to-Date (MTD) total amount collected from loan payments in December 2021.
SELECT SUM(total_payment) AS MTD_Total_Amount_Collected 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- 9.PMTD Total Amount Received
-- Calculates the Previous Month-to-Date (PMTD) total amount collected from loan payments.
SELECT SUM(total_payment) AS PMTD_Total_Amount_Collected 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

-- 10.Average Interest Rate
-- Calculates the average interest rate across all loan applications.
SELECT AVG(int_rate)*100 AS Avg_Int_Rate 
FROM bank_loan_data

-- 11.MTD Average Interest
-- Calculates the Month-to-Date (MTD) average interest rate for loan applications in December 2021.
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- 12.PMTD Average Interest
-- Calculates the Previous Month-to-Date (PMTD) average interest rate for loan applications.
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

-- 13.Avg DTI
-- Calculates the average Debt-to-Income Ratio (DTI) across all loan applications.
SELECT AVG(dti)*100 AS Avg_DTI 
FROM bank_loan_data

-- 14.MTD Avg DTI
-- Calculates the Month-to-Date (MTD) average Debt-to-Income Ratio (DTI) for loan applications in December 2021.
SELECT AVG(dti)*100 AS MTD_Avg_DTI 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

-- 15.PMTD Avg DTI
-- Calculates the Previous Month-to-Date (PMTD) average Debt-to-Income Ratio (DTI) for loan applications.
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


/*
2.GOOD LOAN ISSUED
*/

--1.Good Loan Percentage
-- Calculates the percentage of loans that are 'Fully Paid' or 'Current'.
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

-- 2.Good Loan Applications
-- Counts the number of loan applications that are classified as 'Fully Paid' or 'Current'
SELECT COUNT(id) AS Good_Loan_Applications 
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- 3.Good Loan Funded Amount
-- Calculates the total funded amount for loan applications that are classified as 'Fully Paid' or 'Current'
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount 
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- 4.Good Loan Amount Received
-- Calculates the total amount received from the customers for loan applications that are classified as 'Fully Paid' or 'Current'
SELECT SUM(total_payment) AS Good_Loan_amount_received 
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


/*
3.BAD LOAN ISSUED
*/

--1.Bad Loan Percentage
-- Calculates the percentage of loans that are 'Charged Off'.
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

-- 2.Bad Loan Applications
-- Counts the number of loan applications that are classified as 'Charged Off'
SELECT COUNT(id) AS Bad_Loan_Applications 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- 3.Bad Loan Funded Amount
-- Calculates the total funded amount for loan applications that are classified as 'Charged Off'
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- 4.Bad Loan Amount Received
-- Calculates the total amount received from the customers for loan applications that are classified as 'Charged Off'
SELECT SUM(total_payment) AS Bad_Loan_amount_received 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'


/*
4.LOAN STATUS
*/

-- 1. 
-- Retrieves loan status statistics, including counts, total amount received, 
-- total funded amount, average interest rate, and average Debt-to-Income Ratio (DTI).
SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM
    bank_loan_data
GROUP BY
    loan_status

-- 2.
-- Retrieves Month-to-Date (MTD) loan status statistics for December 2021, including total amount received and total funded amount.
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM 
	bank_loan_data
WHERE 
	MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY 
	loan_status 



/*
Part 2: BANK LOAN REPORT | OVERVIEW
*/

/*
1. MONTHLY OVERVIEW
*/

-- Retrieves monthly overview statistics, including the month number, month name, 
-- total loan applications, total funded amount, and total amount received.
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	bank_loan_data
GROUP BY 
	MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY 
	MONTH(issue_date)


/*
2. STATEWISE OVERVIEW
*/

-- Retrieves statewise overview statistics, including the state name, 
-- total loan applications, total funded amount, and total amount received.
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	bank_loan_data
GROUP BY 
	address_state
ORDER BY 
	address_state


/*
3. LOAN TERM OVERVIEW
*/

-- -- Retrieves loan term overview statistics, including the term (duration), 
-- total loan applications, total funded amount, and total amount received.
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	bank_loan_data
GROUP BY 
	term
ORDER BY 
	term


/*
4. EMPLOYEE LENGTH OVERVIEW
*/

-- Retrieves employee length overview statistics, including the employee length, 
-- total loan applications, total funded amount, and total amount received.
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	bank_loan_data
GROUP BY 
	emp_length
ORDER BY 
	emp_length


/*
5. PURPOSE OVERVIEW
*/

-- Retrieves purpose overview statistics, including the loan purpose, 
-- total loan applications, total funded amount, and total amount received.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	bank_loan_data
GROUP BY 
	purpose
ORDER BY 
	purpose


/*
6. HOME OWNERSHIP OVERVIEW
*/

-- Retrieves home ownership overview statistics, including the home ownership status, 
-- total loan applications, total funded amount, and total amount received.
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	bank_loan_data
GROUP BY 
	home_ownership
ORDER BY 
	home_ownership
