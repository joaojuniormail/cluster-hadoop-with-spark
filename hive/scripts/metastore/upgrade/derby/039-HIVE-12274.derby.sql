-- add a new temp column,type clob, drop the old column and rename temp to old col
-- change COLUMNS_V2.TYPE_NAME to CLOB
ALTER TABLE "APP"."COLUMNS_V2" ADD COLUMN "TYPE_NAME_CLOB" CLOB;
UPDATE "APP"."COLUMNS_V2" SET TYPE_NAME_CLOB=CAST(TYPE_NAME AS CLOB);
ALTER TABLE "APP"."COLUMNS_V2" DROP COLUMN TYPE_NAME;
RENAME COLUMN "APP"."COLUMNS_V2"."TYPE_NAME_CLOB" TO "TYPE_NAME";

-- change TABLE_PARAMS.PARAM_VALUE to CLOB
ALTER TABLE "APP"."TABLE_PARAMS" ADD COLUMN "PARAM_VALUE_CLOB" CLOB;
UPDATE "APP"."TABLE_PARAMS" SET PARAM_VALUE_CLOB=CAST(PARAM_VALUE AS CLOB);
ALTER TABLE "APP"."TABLE_PARAMS" DROP COLUMN PARAM_VALUE;
RENAME COLUMN "APP"."TABLE_PARAMS"."PARAM_VALUE_CLOB" TO "PARAM_VALUE";

-- change SERDE_PARAMS.PARAM_VALUE to CLOB
ALTER TABLE "APP"."SERDE_PARAMS" ADD COLUMN "SERDE_PV_CLOB" CLOB;
UPDATE "APP"."SERDE_PARAMS" SET SERDE_PV_CLOB=CAST(PARAM_VALUE AS CLOB);
ALTER TABLE "APP"."SERDE_PARAMS" DROP COLUMN PARAM_VALUE;
RENAME COLUMN "APP"."SERDE_PARAMS"."SERDE_PV_CLOB" TO "PARAM_VALUE";

-- change SD_PARAMS.PARAM_VALUE to CLOB
ALTER TABLE "APP"."SD_PARAMS" ADD COLUMN "SD_PV_CLOB" CLOB;
UPDATE "APP"."SD_PARAMS" SET SD_PV_CLOB=CAST(PARAM_VALUE AS CLOB);
ALTER TABLE "APP"."SD_PARAMS" DROP COLUMN PARAM_VALUE;
RENAME COLUMN "APP"."SD_PARAMS"."SD_PV_CLOB" TO "PARAM_VALUE";

-- expand a hive table name length to 256 chars
ALTER TABLE "APP"."TBLS" ALTER COLUMN "TBL_NAME" SET DATA TYPE VARCHAR(256);
ALTER TABLE "APP"."NOTIFICATION_LOG" ALTER COLUMN "TBL_NAME" SET DATA TYPE VARCHAR(256);
ALTER TABLE "APP"."PARTITION_EVENTS" ALTER COLUMN "TBL_NAME" SET DATA TYPE VARCHAR(256);
ALTER TABLE "APP"."TAB_COL_STATS" ALTER COLUMN "TABLE_NAME" SET DATA TYPE VARCHAR(256);
ALTER TABLE "APP"."PART_COL_STATS" ALTER COLUMN "TABLE_NAME" SET DATA TYPE VARCHAR(256);
ALTER TABLE "APP"."COMPLETED_TXN_COMPONENTS" ALTER COLUMN "CTC_TABLE" SET DATA TYPE VARCHAR(256);
