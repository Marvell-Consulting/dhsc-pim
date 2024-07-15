CREATE TABLE DVC_DEVICE_PRODUCT_duplicates
AS SELECT *
       FROM DVC_DEVICE_PRODUCT
      WHERE CREATED_DATECREATED_DATE LIKE '%.000'
        OR UPDATED_DATE LIKE '%.000'
        OR ROW_VERSION LIKE '%.000';

DELETE FROM DVC_DEVICE_PRODUCT
WHERE CREATED_DATECREATED_DATE LIKE '%.000'
   OR UPDATED_DATE LIKE '%.000'
   OR ROW_VERSION LIKE '%.000';


-- If this succeeded, the following query should return zero results:

-- select PRODUCT_ID
--   from (select PRODUCT_ID, count(*) as dup_count
--             from DVC_DEVICE_PRODUCT
--         group by PRODUCT_ID)
--   where dup_count > 1
