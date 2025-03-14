/*

===================================================================
DDL Script: Create Silver Tables
===================================================================
The tables are going to be the same as in the Bronze Layer, so I can use the same query to create them.
- Schema must be updated to 'Silver'.
- I'm adding column 'dwh_create_date' within each table, which is gonna be the unique column that is not coming from
the Source Systems, but from the Data Engineering of the DWH.
===================================================================

*/

CREATE TABLE Silver.crm_cust_info (
	cst_id				INT,
	cst_key				NVARCHAR(50),
	cst_firstname		NVARCHAR(50),
	cst_lastname		NVARCHAR(50),
	cst_marital_status	NVARCHAR(50),
	cst_gndr			NVARCHAR(50),
	cst_create_date		DATE,
	dwh_create_date		DATETIME2 DEFAULT GETDATE()
)

CREATE TABLE Silver.crm_prd_info (
	prd_id			INT,
	prd_key			NVARCHAR(50),
	prd_nm			NVARCHAR(50),
	prd_cost		INT,
	prd_line		NVARCHAR(50),
	prd_start_dt	DATETIME,
	prd_end_dt		DATETIME,
	dwh_create_date		DATETIME2 DEFAULT GETDATE()
)

CREATE TABLE Silver.crm_sales_details (
	sls_ord_num		NVARCHAR(50),
	sls_prd_key		NVARCHAR(50),
	sls_cust_id		INT,
	sls_order_dt	INT,
	sls_ship_dt		INT,
	sls_due_dt		INT,
	sls_sales		INT,
	sls_quantity	INT,
	sls_price		INT,
	dwh_create_date		DATETIME2 DEFAULT GETDATE()
)

CREATE TABLE Silver.erp_cust_az12 (
	cid		NVARCHAR(50),
	bdate	DATE,
	gen		NVARCHAR(50),
	dwh_create_date		DATETIME2 DEFAULT GETDATE()
)

CREATE TABLE Silver.erp_loc_a101 (
	cid		NVARCHAR(50),
	cntry	NVARCHAR(50),
	dwh_create_date		DATETIME2 DEFAULT GETDATE()
)

CREATE TABLE Silver.erp_px_cat_g1v2 (
	id				NVARCHAR(50),
	cat				NVARCHAR(50),
	subcat			NVARCHAR(50),
	maintenance		NVARCHAR(50),
	dwh_create_date		DATETIME2 DEFAULT GETDATE()
)

/*

T-SQL could be used before the CREATE TABLE statements in case we need to redo the table.

IF OBJECT_ID ('tablename', 'U') IS NOT NULL
	DROP TABLE tablename;

*/
