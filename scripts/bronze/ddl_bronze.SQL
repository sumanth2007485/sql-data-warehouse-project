/*
====================================================================
DDL Script: Create Bronze Tables
====================================================================
Script Layers:
This script creates the tables in the 'bronze' schema, drop the table if it already exists
 if not it will create the table
*/


If object_Id('bronze.crm_cust_info','U') IS NOT Null 
    Drop Table bronze.crm_cust_info;
Create table bronze.crm_cust_info(
	cst_id  INT,
    cst_key   NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE
);
If object_Id('bronze.crm_prd_info','U') IS NOT Null
    Drop table bronze.crm_prd_info;
Create table bronze.crm_prd_info(
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm  NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt  DATE
);
If object_id('bronze.crm_sales_details','U') IS NOT Null
    Drop Table bronze.crm_sales_details;
create table bronze.crm_sales_details(
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);
If object_id('bronze.erp_cust_az12','U') IS NOT Null
    Drop table bronze.erp_cust_az12;
create table bronze.erp_cust_az12(
    CID NVARCHAR(50),
    BDATE DATE,
    GEN NVARCHAR(50)
);
If object_id('bronze.erp_px_cat_g1v2','U') IS NOT Null
    Drop table bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2(
    ID NVARCHAR(50),
    CAT NVARCHAR(50),
    SUBCAT NVARCHAR(50),
    MAINTENANCE NVARCHAR(50)
);
If object_id('bronze.erp_loc_a101','U') IS NOT Null
    Drop Table bronze.erp_loc_a101;
create table bronze.erp_loc_a101(
    CID NVARCHAR(50),
    CNTRY NVARCHAR(50)
);
