create or alter procedure bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME,@end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
BEGIN TRY
		set @batch_start_time = GETDATE();
		print '==================================';
		print 'Loading the bronze layer';
		print '==================================';

		print '----------------------------------';
		print 'Loading the crm tables';
		print '----------------------------------';
		set  @start_time = GETDATE();
		print '>> Truncating Table:brone.crm_cust_info';
		Truncate Table bronze.crm_cust_info;
		print '>>Inserting the data :brone.crm_cust_info';
		Bulk insert bronze.crm_cust_info
		from 'Z:\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			TabLock
		)
		set @end_time = GETDATE();
		print '-----------------------------------';
		print 'Execution Time:'+Cast(Datediff(second,@start_time,@end_time) as NVARCHAR) +'secound';
		print '-----------------------------------';

		set @start_time = GETDATE();
		print '>> Truncating Table:brone.crm_prd_info';
		Truncate Table bronze.crm_prd_info;
		print '>> Inserting the data:brone.crm_prd_info';
		Bulk insert bronze.crm_prd_info
		from 'Z:\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			TabLock
		)
		set @end_time = GETDATE();
		print '-----------------------';
		print 'Execution Time:'+ Cast(DateDiff(second,@start_time,@end_time) as NVARCHAR)+'second';
		print '-----------------------';

		set @start_time = GETDATE();
		print '>>Trancating Table:bronze.crm_sales_details';
		Truncate Table bronze.crm_sales_details;
		print '>>Inserting data:brone.crm_sales_details';
		Bulk insert bronze.crm_sales_details
		from 'Z:\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			TabLock
		)
		set @end_time = GETDATE();
		print '------------------------';
		print 'Execution time:'+Cast(DateDiff(second,@start_time,@end_time) as NVARCHAR)+'second';
		print '------------------------';

		print '-----------------------------';
		print 'Loading the erp tables';
		print '-----------------------------';
		set @start_time = GETDATE();
		print '>>Trancating Table:bronze.erp_cust_az12';
		Truncate Table bronze.erp_cust_az12;
		print '>>Inserting data:bronze.erp_cust_az12';
		Bulk insert bronze.erp_cust_az12
		from 'Z:\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			TabLock
		)
		set @end_time = GETDATE();
		print '--------------------------';
		print 'Execution Time:'+cast(DateDiff(second,@start_time,@end_time) as NVARCHAR)+'second';
		print '--------------------------';
		set @start_time = GETDATE();
		print'>> Trancating Table :bronze.erp_loc_101';
		Truncate Table bronze.erp_loc_a101;
		print '>>Inserting data :bronze.erp_loc_101';
		Bulk insert bronze.erp_loc_a101
		from 'Z:\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			TabLock
		)
		set @end_time = GETDATE();
		print '--------------------------';
		print 'Execution Time:'+Cast(DateDiff(second,@start_time,@end_time) as NVARCHAR)+'second';
		print '--------------------------';

		set @start_time = GETDATE();
		print '>>Trancating Table:bronze.erp_px_cat_g1v2';
		Truncate Table bronze.erp_px_cat_g1v2;
		print '>>Inserting data:bronze.erp_px_cat_g1v2';
		Bulk insert bronze.erp_px_cat_g1v2
		from 'Z:\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			TabLock
		)
		set @end_time = GETDATE();
		print '-------------------------';
		print 'Execution Date:'+cast(DateDiff(second,@start_time,@end_time) as NVARCHAR)+'second';
		print '-------------------------';
		set @batch_end_time = GETDATE();
		print '-----------------------------------';
		print 'Total Execution Time of Bronze Layer:'+Cast(DateDiff(second,@batch_start_time,@batch_end_time)as NVARCHAR)+'second';
		print '-----------------------------------';
END TRY
BEGIN CATCH
	print '==========================================';
	print 'ERROR OCCURED DURING LOADING BRONZE LAYER';
	print 'ERROR MESSAGE:'+ ERROR_MESSAGE();
	print 'ERROR NUMBER:'+CAST(ERROR_NUMBER() AS NVARCHAR);
	print 'ERROR STATE:'+ CAST(ERROR_STATE() AS NVARCHAR);
	print '==========================================';
END CATCH
End

