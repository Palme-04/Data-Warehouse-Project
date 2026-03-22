EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @total_start_time DATETIME, @total_end_time DATETIME;
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		SET @total_start_time = GETDATE();
		PRINT '========================';
		PRINT 'Loading Bronze layer';
		PRINT '========================';

		-- CRM --
		PRINT '------------------------';
		PRINT 'Loading CRM';
		PRINT '------------------------';

		-- CUST INFO--^
		SET @start_time = GETDATE();
		PRINT '## Truncating: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '## Bulk Inserting into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\marti\Documents\Projects\Data Projects\Data-Warehouse-Project\Dataset\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();

		PRINT '## Load time: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' sec';
		PRINT '-----------------------------------'
		-- PRD INFO --
		SET @start_time = GETDATE();

		PRINT '## Truncating: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '## Bulk Inserting into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\marti\Documents\Projects\Data Projects\Data-Warehouse-Project\Dataset\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();

		PRINT '## Load time: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' sec';
		PRINT '-----------------------------------'

		-- SALES DETAILS --
		SET @start_time = GETDATE();

		PRINT '## Truncating: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '## Bulk Inserting into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\marti\Documents\Projects\Data Projects\Data-Warehouse-Project\Dataset\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();

		PRINT '## Load time: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' sec';
		PRINT '-----------------------------------'

		-- ERP --
		PRINT '------------------------';
		PRINT 'Loading ERP';
		PRINT '------------------------';

		SET @start_time = GETDATE();

		PRINT '## Truncating: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '## Bulk Inserting into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\marti\Documents\Projects\Data Projects\Data-Warehouse-Project\Dataset\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();

		PRINT '## Load time: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' sec';
		PRINT '-----------------------------------'

		-- LOC A101 --
		SET @start_time = GETDATE();

		PRINT '## Truncating: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '## Bulk Inserting into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\marti\Documents\Projects\Data Projects\Data-Warehouse-Project\Dataset\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();

		PRINT '## Load time: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' sec';
		PRINT '-----------------------------------'


		-- PX CAT G1V2 --
		SET @start_time = GETDATE();

		PRINT '## Truncating: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '## Bulk Inserting into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\marti\Documents\Projects\Data Projects\Data-Warehouse-Project\Dataset\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE();

		PRINT '## Load time: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' sec';
		PRINT '-----------------------------------'

		SET @total_end_time = GETDATE();
		PRINT '## Total load time for bronze layer: ' + CAST (DATEDIFF(second, @total_start_time, @total_end_time) AS NVARCHAR) + ' sec';

	END TRY
	BEGIN CATCH
		PRINT '========================';
		PRINT 'ERROR OCCURED IN LOAD OF BRONZE LAYER';
		PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
		PRINT 'ERROR NUMBER: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR STATUS: ' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '========================';
	END CATCH
END