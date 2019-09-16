DROP TABLE IF EXISTS santander_test;
CREATE TABLE santander_test(
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
  ,indrel_1mes           TINYINT 
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
) ROW FORMAT DELIMITED FIELDS TERMINATED BY "," ESCAPED BY '\\'
tblproperties("skip.header.line.count"="1");
LOAD DATA LOCAL INPATH '/home/hadoop/test.csv' OVERWRITE INTO TABLE santander_test;