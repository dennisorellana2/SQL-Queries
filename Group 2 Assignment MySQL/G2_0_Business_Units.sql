#  Assignment
# Submitted By : Group 2
#                 A.K.R
#                 Dennis Orellana 
#                 D.S 
#                 M.S
# Semester : Fall 2019
# 
# Script File Name: G2_0_Business_Units.sql
#
# Purpose: This script (1 of 4) is part of DATA 620 Assignment 6.1 
#          to merge its old product order data into a new data mart to facilitate analysis:
#           	G2_0_Business_Units.sql
#           	G2_1_Extract_Validate.sql
#               G2_2_Transform.sql
#               G2_3_Load_Export.sql
# 
# Steps:  1. Drop database prod_order_db, if exists
#		  2. Create database prod_order_db
#         3. Open Use prod_order_db database
#         4. Drop business_unit & product_BU table if exists
#         5. Create table Business_Unit & product_BU
#         6. Insert data into table Business_Unit & product_BU
# Prerequisites: N/A 
# Last Updated: Nov 3rd 2019

			
# Drop database prod_order_db, if exists				
DROP DATABASE if exists prod_order_db;				

# Create database prod_order_db				
CREATE DATABASE prod_order_db;		

# Open/Use our database		
USE prod_order_db;			

# Drop the business unit & product_BU table if exists
DROP TABLE if exists business_unit ; 
DROP TABLE if exists product_BU ; 

# A business unit is division of the company
# Create the Business Unit table
CREATE TABLE Business_Unit (
BU_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
BU_Name VARCHAR(25),
BU_Designation VARCHAR(25)
);

# Each product is assigned to one business unit for a given year
# Create the Product_BU table
CREATE TABLE Product_BU (
Prod_BU_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
BU_Name VARCHAR(25),
Product_Name VARCHAR(25),
Prod_BU_Year INT(4)
);


# Adding records to the Business Unit table
INSERT INTO Business_Unit (BU_Name, BU_Designation)
VALUES
('Snack', 'Growth'),
('On the go', 'Growth'),
('Energy', 'Growth'),
('Health', 'Mature'),
('Lunchtime', 'Mature'),
('Sugar', 'Decline'),
('GMO', 'Decline')
;


# Adding records to the Product/Business Unit table
INSERT INTO Product_BU (BU_Name, Product_Name, Prod_BU_Year)
VALUES
('On the go', 'Blue Rock Candy', '2012'),
('On the go', 'Blue Rock Candy', '2013'),
('On the go', 'Blue Rock Candy', '2014'),
('Snack', 'Crocodile Tears', '2012'),
('Snack', 'Crocodile Tears', '2013'),
('Snack', 'Crocodile Tears', '2014'),
('Sugar', 'Giant Gummies', '2012'),
('Sugar', 'Giant Gummies', '2013'),
('Sugar', 'Giant Gummies', '2014'),
('Sugar', 'Green Lightning', '2012'),
('Lunchtime', 'Green Lightning', '2013'),
('Lunchtime', 'Green Lightning', '2014'),
('GMO', 'Grey Gummies', '2012'),
('GMO', 'Grey Gummies', '2013'),
('GMO', 'Grey Gummies', '2014'),
('Sugar', 'Nap Be Gone', '2012'),
('Sugar', 'Nap Be Gone', '2013'),
('Sugar', 'Nap Be Gone', '2014'),
('GMO', 'Orange Creepies', '2012'),
('GMO', 'Orange Creepies', '2013'),
('Lunchtime', 'Orange Creepies', '2014'),
('Health', 'Panda Gummies', '2012'),
('Health', 'Panda Gummies', '2013'),
('Health', 'Panda Gummies', '2014'),
('On the go', 'Pink Bubble Gum', '2012'),
('On the go', 'Pink Bubble Gum', '2013'),
('On the go', 'Pink Bubble Gum', '2014'),
('Energy', 'Purple Pain', '2012'),
('Energy', 'Purple Pain', '2013'),
('Energy', 'Purple Pain', '2014'),
('Energy', 'Red Hot Chili Peppers', '2012'),
('Energy', 'Red Hot Chili Peppers', '2013'),
('Energy', 'Red Hot Chili Peppers', '2014'),
('Lunchtime', 'Yellow Zonkers', '2012'),
('Lunchtime', 'Yellow Zonkers', '2013'),
('Lunchtime', 'Yellow Zonkers', '2014')
;

# End of script
