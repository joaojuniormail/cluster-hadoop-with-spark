DROP TABLE IF EXISTS santander_train;
CREATE TABLE santander_train(
   fecha_dato            DATE 
  ,ncodpers              INT
  ,ind_empleado          STRING
  ,pais_residencia       STRING
  ,sexo                  STRING
  ,age                   INT 
  ,fecha_alta            DATE 
  ,ind_nuevo             TINYINT 
  ,antiguedad            INT 
  ,indrel                TINYINT 
  ,ult_fec_cli_1t        STRING
  ,indrel_1mes           DECIMAL(38,2)
  ,tiprel_1mes           STRING
  ,indresi               STRING
  ,indext                STRING
  ,conyuemp              STRING
  ,canal_entrada         STRING
  ,indfall               STRING
  ,tipodom               TINYINT 
  ,cod_prov              INT 
  ,nomprov               STRING
  ,ind_actividad_cliente TINYINT 
  ,renta                 DECIMAL(38,2)
  ,segmento              STRING
  ,ind_ahor_fin_ult1     TINYINT 
  ,ind_aval_fin_ult1     TINYINT 
  ,ind_cco_fin_ult1      TINYINT 
  ,ind_cder_fin_ult1     TINYINT 
  ,ind_cno_fin_ult1      TINYINT 
  ,ind_ctju_fin_ult1     TINYINT 
  ,ind_ctma_fin_ult1     TINYINT 
  ,ind_ctop_fin_ult1     TINYINT 
  ,ind_ctpp_fin_ult1     TINYINT 
  ,ind_deco_fin_ult1     TINYINT 
  ,ind_deme_fin_ult1     TINYINT 
  ,ind_dela_fin_ult1     TINYINT 
  ,ind_ecue_fin_ult1     TINYINT 
  ,ind_fond_fin_ult1     TINYINT 
  ,ind_hip_fin_ult1      TINYINT 
  ,ind_plan_fin_ult1     TINYINT 
  ,ind_pres_fin_ult1     TINYINT 
  ,ind_reca_fin_ult1     TINYINT 
  ,ind_tjcr_fin_ult1     TINYINT 
  ,ind_valo_fin_ult1     TINYINT 
  ,ind_viv_fin_ult1      TINYINT 
  ,ind_nomina_ult1       TINYINT 
  ,ind_nom_pens_ult1     TINYINT 
  ,ind_recibo_ult1       TINYINT 
) ROW FORMAT DELIMITED FIELDS TERMINATED BY "," ESCAPED BY '\\'
tblproperties("skip.header.line.count"="1");
LOAD DATA LOCAL INPATH '/home/hadoop/train.csv' OVERWRITE INTO TABLE santander_train;