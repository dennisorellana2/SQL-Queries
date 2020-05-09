# Assignment
# Submitted By : Group 2
#                A.K.R
#                 Dennis Orellana 
#                 D.S 
#                 M.S
# Semester : Fall 2019
# 
# Script File Name: G2_2_Transform.sql
#
# Purpose: This script (3 of 4) is part of DATA 620 Assignment 6.1 
#          to merge its old product order data into a new data mart to facilitate analysis:
#           	G2_0_Business_Units.sql
#           	G2_1_Extract_Validate.sql
#               G2_2_Transform.sql
#               G2_3_Load_Export.sql
# 
# Steps:  1. Open Use prod_order_db database
#         2. Create new table Prod_Order_2012 
#         3. Transform 2012 Staging table data and insert into new table Prod_Order_2012
#         4. Create new table Prod_Order_2013 
#         5. Transform 2012 Staging table data and insert into new table Prod_Order_2013
#         6. Create new table Prod_Order_2014 
#         7. Transform 2012 Staging table data and insert into new table Prod_Order_2014
#
# Prerequisites:	 1. prod_order_db database already created
#                    2. Below staging tables already created and required data loaded
#                    		Prod_Order_2012_Staging table
#                    		Prod_Order_2013_Staging table
#                    		Prod_Order_2014_Staging table
# Output:
#                    Prod_Order_2012 table
#                    Prod_Order_2013 table
#                    Prod_Order_2014 table
# Last Updated: Nov 3rd 2019
			

# Open/Use our database		
USE prod_order_db;			


##################### TRANSFORMATION ##########################

# Transform 2012 into new data format

# Drop table Prod_Order_2012 if exists
DROP TABLE if exists Prod_Order_2012 ; 

# Create new table Prod_Order_2012 
CREATE TABLE Prod_Order_2012 (
BU_Designation VARCHAR(25),
BU_Name VARCHAR(25),
Product_Name VARCHAR(25),
Region VARCHAR(25),
Year INT(4),
Month INT(2),
Sum_of_Quantity INT,
Sum_of_Order_Total INT
);

# Transform 2012 Staging table data and insert into new table Prod_Order_2012
INSERT INTO Prod_Order_2012 (BU_Designation, BU_Name, Product_Name, Region, Year, Month, Sum_of_Quantity, Sum_of_Order_Total)
SELECT 	BU.BU_Designation,
		BU.BU_Name,
        P.Product_Name,
        PO.Region,
        2012,
        PO.Month,
        SUM(Quantity) as Sum_of_Quantity,
        SUM(`Order Total`) as Sum_of_Order_Total
FROM   Prod_Order_2012_Staging PO
INNER JOIN Product_BU P
		ON 	PO.Product = P.Product_Name
			AND P.Prod_BU_Year = 2012
INNER JOIN Business_Unit BU 
		ON 	BU.BU_Name = P.BU_Name
			AND BU.BU_Designation in ('Growth', 'Mature')
GROUP BY BU.BU_Designation, BU.BU_Name, P.Product_Name, PO.Region, PO.Month;



# Transform 2013 into new data format

# Drop table Prod_Order_2013 if exists
DROP TABLE if exists Prod_Order_2013 ; 

# Create new table Prod_Order_2013
CREATE TABLE Prod_Order_2013 (
BU_Designation VARCHAR(25),
BU_Name VARCHAR(25),
Product_Name VARCHAR(25),
Region VARCHAR(25),
Year INT(4),
Month INT(2),
Sum_of_Quantity INT,
Sum_of_Order_Total INT
);

# Transform 2013 Staging table data and insert into new table Prod_Order_2013
INSERT INTO Prod_Order_2013 (BU_Designation, BU_Name, Product_Name, Region, Year, Month, Sum_of_Quantity, Sum_of_Order_Total)
SELECT 	BU.BU_Designation,
		BU.BU_Name,
        P.Product_Name,
        PO.Region,
        2013,
        PO.Month,
        SUM(Quantity_1 + Quantity_2)  as Sum_of_Quantity,
        SUM((Quantity_1 + Quantity_2) * `Per-Unit Price`) as Sum_of_Order_Total
FROM   Prod_Order_2013_Staging PO
INNER JOIN Product_BU P
		ON 	PO.Product = P.Product_Name
			AND P.Prod_BU_Year = 2013
INNER JOIN Business_Unit BU 
		ON 	BU.BU_Name = P.BU_Name
			AND BU.BU_Designation in ('Growth', 'Mature')
GROUP BY BU.BU_Designation, BU.BU_Name, P.Product_Name, PO.Region, PO.Month;



# Transform 2014 into new data format

# Drop table Prod_Order_2014 if exists
DROP TABLE if exists Prod_Order_2014 ; 

# Create new table Prod_Order_2014
CREATE TABLE Prod_Order_2014 (
BU_Designation VARCHAR(25),
BU_Name VARCHAR(25),
Product_Name VARCHAR(25),
Region VARCHAR(25),
Year INT(4),
Month INT(2),
Sum_of_Quantity INT,
Sum_of_Order_Total INT
);

# Transform 2014 Staging table data and insert into new table Prod_Order_2014
INSERT INTO Prod_Order_2014 (BU_Designation, BU_Name, Product_Name, Region, Year, Month, Sum_of_Quantity, Sum_of_Order_Total)
SELECT 	BU.BU_Designation,
		BU.BU_Name,
        P.Product_Name,
        PO.Region,
        2014,
        PO.Month,
        SUM(Quantity)  as Sum_of_Quantity,
        SUM(`Order Subtotal` - `Quantity Discount`) as Sum_of_Order_Total
FROM   Prod_Order_2014_Staging PO
INNER JOIN Product_BU P
		ON 	PO.Product = P.Product_Name
			AND P.Prod_BU_Year = 2014
INNER JOIN Business_Unit BU 
		ON 	BU.BU_Name = P.BU_Name
			AND BU.BU_Designation in ('Growth', 'Mature')
GROUP BY BU.BU_Designation, BU.BU_Name, P.Product_Name, PO.Region, PO.Month;


# End of script
