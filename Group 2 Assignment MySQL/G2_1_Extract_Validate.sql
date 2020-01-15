# DATA 620 Assignment 6.1
# Submitted By : Group 2
#                 Arun Kumar Rangaraju
#                 Dennis Orellana 
#                 Douglas Scheffler 
#                 Mark Shore
# Semester : Fall 2019
# Professor: Dr Prasanna Menta
# Script File Name: G2_1_Extract_Validate.sql
#
# Purpose: This script (2 of 4) is part of DATA 620 Assignment 6.1 
#          to merge its old product order data into a new data mart to facilitate analysis:
#           	G2_0_Business_Units.sql
#           	G2_1_Extract_Validate.sql
#               G2_2_Transform.sql
#               G2_3_Load_Export.sql
# 
# Steps:  1. Open Use prod_order_db database
#         2. Extract the cvs input files and load into staging tables (GUI Process)
#         3. Validate the data loaded into staging tables using SQL queries
#             a. Check whether the row count match with CVS files
#             b. Check whether the columns match with CVS files and imported properly 
#             c. Check the month and region values in the staging tables
#             d. Check whether any rows present in 2012 CSV/staging table with Product not present in Product_BU
#
# Prerequisites:	 1. prod_order_db database already created
#                    2. business_unit & product_BU table already created and required data loaded
#                    3. Need to create below mentioned 3 staging tables using Table Data Import Wizard
#                       GUI before running the validation SQL queries
# Output:
#                    Prod_Order_2012_Staging table
#                    Prod_Order_2013_Staging table
#                    Prod_Order_2014_Staging table
# Last Updated: Nov 3rd 2019
			
# Open/Use our database		
USE prod_order_db;			

##################### EXTRACTION - GUI Process ##########################
# Extract the cvs input files and load into staging tables
# Import 2012_product_data_students.csv using Table Data Import Wizard into Prod_Order_2012_Staging table
# Import 2013_product_data_students.csv using Table Data Import Wizard into Prod_Order_2013_Staging table
# Import 2014_product_data_students.csv using Table Data Import Wizard into Prod_Order_2014_Staging table
##########################################################################

##################### VALIDATION #############################

# Check whether the row count match with CVS files 
SELECT count(*) as 2012_row_cnt FROM Prod_Order_2012_Staging;
SELECT count(*) as 2013_row_cnt FROM Prod_Order_2013_Staging;
SELECT count(*) as 2014_row_cnt FROM Prod_Order_2014_Staging;

# Check whether the columns match with CVS files and imported properly 
SELECT * FROM Prod_Order_2012_Staging;
SELECT * FROM Prod_Order_2013_Staging;
SELECT * FROM Prod_Order_2014_Staging;

# Check the month and region values in the 2012 staging tables
SELECT Month, Region, Count(*) as cnt 
	FROM Prod_Order_2012_Staging 
	GROUP BY Month, Region
	ORDER BY Month, Region;
    
# Check the month and region values in the 2013 staging tables
SELECT Month, Region, Count(*) as cnt 
	FROM Prod_Order_2013_Staging 
	GROUP BY Month, Region
	ORDER BY Month, Region;

# Check the month and region values in the 2014 staging tables    
SELECT Month, Region, Count(*) as cnt 
	FROM Prod_Order_2014_Staging 
	GROUP BY Month, Region
	ORDER BY Month, Region;

# Check whether any rows present in 2012 CSV/staging table with Product not present in Product_BU
SELECT DISTINCT Product
FROM  Prod_Order_2012_Staging
WHERE Product not in (SELECT DISTINCT Product_Name FROM Product_BU WHERE Prod_BU_Year = 2012);

# Check whether any rows present in 2013 CSV/staging table with Product not present in Product_BU
SELECT DISTINCT Product
FROM  Prod_Order_2013_Staging
WHERE Product not in (SELECT DISTINCT Product_Name FROM Product_BU WHERE Prod_BU_Year = 2013);

# Check whether any rows present in 2014 CSV/staging table with Product not present in Product_BU
SELECT DISTINCT Product
FROM  Prod_Order_2014_Staging
WHERE Product not in (SELECT DISTINCT Product_Name FROM Product_BU WHERE Prod_BU_Year = 2014);
##############################################################


# End of script
