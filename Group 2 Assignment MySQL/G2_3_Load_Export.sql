# Assignment
# Submitted By : Group 2
#                 A.K.R
#                 Dennis Orellana 
#                 D.S 
#                 M.S
# Semester : Fall 2019
# 
# Script File Name: G2_3_Load_Export.sql
#
# Purpose: This script (4 of 4) is part of DATA 620 Assignment 6.1 
#          to merge its old product order data into a new data mart to facilitate analysis:
#           	G2_0_Business_Units.sql
#           	G2_1_Extract_Validate.sql
#               G2_2_Transform.sql
#               G2_3_Load_Export.sql
# 
# Steps:  1. Open Use prod_order_db database
#         2. Create table Prod_Order and load data from
#                    			Prod_Order_2012 table
#                    			Prod_Order_2013 table
#                    			Prod_Order_2014 table
#         3. Select the Prod_Order table for exporting into CSV file 
#
# Prerequisites:	 1. prod_order_db database already created
#                    2. Below staging tables already created and required data loaded
#                    			Prod_Order_2012 table
#                    			Prod_Order_2013 table
#                    			Prod_Order_2014 table
# Output:
#                    Prod_Order table
# Last Updated: Nov 3rd 2019
			

# Open/Use our database		
USE prod_order_db;			



##################### LOADING ##########################

# Drop table Prod_Order if exists
DROP TABLE if exists Prod_Order; 

# Create table Prod_Order and load the transformed data from 2012, 2013, 2014 table
CREATE TABLE Prod_Order AS
SELECT * FROM Prod_Order_2012
UNION ALL
SELECT * FROM Prod_Order_2013
UNION ALL
SELECT * FROM Prod_Order_2014
ORDER BY BU_Designation, BU_Name, Product_Name, Region, Year, Month;

#########################################################


#################### EXPORTING #########################

# Select the Prod_Order table for exporting into CSV file 
SELECT 	BU_Designation, ',',
		BU_Name, ',',
		Product_Name, ',',
		Region, ',',
		Year, ',',
		Month, ',',
		Sum_of_Quantity, ',',
		Sum_of_Order_Total
FROM Prod_Order
ORDER BY BU_Designation, BU_Name, Product_Name, Region, Year, Month;

########################################################

# End of script
