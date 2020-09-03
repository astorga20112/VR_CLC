DROP TABLE SCORE_IND;

CREATE TABLE SCORE_IND (
    ID_INDICADOR                VARCHAR2(128 BYTE) NOT NULL,
    NOM_INDICADOR               VARCHAR2(256 BYTE),
    POND_INDICADOR              VARCHAR2(128 BYTE),
    ID_PROCESO                  NUMBER(38),
    NOM_PROCESO                 VARCHAR2(256 BYTE),
    ID_SUBP                     NUMBER(38),
    NOM_SUBP                    VARCHAR2(256 BYTE),
    POND_SUBP                   NUMBER(38),
    FEC_PROCESO                 DATE,
    TBL_ASOCIADA                VARCHAR2(256 BYTE),
    CASOS_ALTO                  NUMBER(38),
    CASOS_MEDIO                 NUMBER(38),
    CASOS_BAJO                  NUMBER(38),
    TOTAL_CASOS                 NUMBER(38),
    POND_ALTO                   FLOAT(3),
    POND_MEDIO                  FLOAT(3),
    POND_BAJO                   FLOAT(3),
    PUNTAJE_ALTO                FLOAT(3),
    PUNTAJE_MEDIO               FLOAT(3),
    PUNTAJE_BAJO                FLOAT(3),
    PUNTAJE_RIESGO_IND          FLOAT(3),
    CALIF_INDICADOR             VARCHAR2(128 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

INSERT INTO SCORE_IND 
select  id ,nombre_del_indicador ,0 ,ID_PROCESOS ,NOMBRE_PROCESO ,idsubproceso,0,'',NOMBRE_TABLA_GENERADA,0,0,0,0,0,0,0,0,0,0,0,0 
FROM indicadores
WHERE ID NOT IN (SELECT ID FROM SCORE_IND);

----
DEFINE tableNm = 'TBLARO149_LMSOLPAGPNDT'; 
DEFINE camptabl = 'DIAS_PEND';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>5    AND COUNT(NVL(&camptabl, '0'))<= 7    THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=8   AND COUNT(NVL(&camptabl, '0'))<= 11   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=125                             THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO142_AFRCHZ'; 
DEFINE camptabl = 'ANTIGUEDAD';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=6                               THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=7 AND COUNT(ANTIGUEDAD)<=11     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=12                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;
 
 
DEFINE tableNm = 'TBLARO147_AFSOLRCPDFST'; 
DEFINE camptabl = 'ANTIGUEDAD';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=6                               THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=7 AND COUNT(ANTIGUEDAD)<=11     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=12                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO81_AFIEMP'; 
DEFINE camptabl = 'DIAS_AFI';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=30                         THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))> 30 AND COUNT(NVL(&camptabl, '0'))<=90 THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>90                          THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;



DEFINE tableNm = 'TBLARO82_AFIEMP'; 
DEFINE camptabl = 'MESES';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=1    THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=2     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=3    THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;



DEFINE tableNm = 'TBLARO101_AFIDESFPENS'; 
DEFINE camptabl = 'MESES_DESAF';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=1     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=2     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=3    THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO95_AFIEMP'; 
DEFINE camptabl = 'MESES_DE_ATRASO';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=1    THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=2   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=3   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO102_AHDESBCTAS'; 
DEFINE camptabl = 'SALDO_ACU_PESOS';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>0 AND COUNT(NVL(&camptabl, '0'))<=100000        THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=100001 AND COUNT(NVL(&camptabl, '0'))<=500000  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>500000                                      THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO93_AHOCTAS'; 
DEFINE camptabl = 'MOV_MONTO_P';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=-100000  AND   COUNT(NVL(&camptabl, '0'))<=-1   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=-500000 AND COUNT(NVL(&camptabl, '0'))<-100000  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<-500000                                  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO131_CRDTSR'; 
DEFINE camptabl = 'MONTO';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1   AND COUNT(NVL(&camptabl, '0'))<=50000      THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=50001 AND COUNT(NVL(&camptabl, '0'))<=100000   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100000                            THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO132_CRDEGR'; 
DEFINE camptabl = 'EGR_MONDEV';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1 AND COUNT(EGR_MONDEV)<=50000       THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=50001 AND COUNT(EGR_MONDEV)<=100000  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100000                                THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO143_CYDCRD'; 
DEFINE camptabl = 'EGR_MONDEV';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1 AND COUNT(NVL(&camptabl, '0'))<=50000        THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=50001 AND COUNT(NVL(&camptabl, '0'))<=100000   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100000                                 THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO145_CYDCRD'; 
DEFINE camptabl = 'AMOUNT_FINANCED';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1 AND COUNT(NVL(&camptabl, '0'))<=50000        THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=50001 AND COUNT(NVL(&camptabl, '0'))<=100000   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100000                                      THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO146_CYDPAGFLXRCHZ'; 
DEFINE camptabl = 'MONTO';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1 AND COUNT(NVL(&camptabl, '0'))<=50000      THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=50001 AND COUNT(NVL(&camptabl, '0'))<=100000 THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100000                          THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO141_PPCCERR'; 
DEFINE camptabl = 'DAS_MONTO';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>1 AND COUNT(NVL(&camptabl, '0'))<=100000       THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100000 AND COUNT(NVL(&camptabl, '0'))<=500000  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>500000                               THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO144_PPCCDVL'; 
DEFINE camptabl = 'DIFERENCIA';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=-100000 AND COUNT(NVL(&camptabl, '0'))>=-1      THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0')) >=-500000 AND COUNT(NVL(&camptabl, '0'))<-100000 THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<-500000                                 THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO83_SGVNT'; 
DEFINE camptabl = 'ANTIGU';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>4                          THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=3 AND COUNT(NVL(&camptabl, '0'))<=4    THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=2                         THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO94_SGVNTCRG'; 
DEFINE camptabl = 'ANTIGU';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>4                        THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=3 AND COUNT(NVL(&camptabl, '0'))<=4  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<3                        THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;

 
 
DEFINE tableNm = 'TBLARO124_SGCOB'; 
DEFINE camptabl = 'PRI_MONTO';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=5000                             THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>5000 AND COUNT(NVL(&camptabl, '0'))<=10000  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>10000                             THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA =  '&tableNm'  ;



DEFINE tableNm = 'TBLTBLARO125_AFIPER';
DEFINE camptabl = 'DIAS_HABILES';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<7                  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=7 AND COUNT(NVL(&camptabl, '0'))<=10 THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>10                 THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO1011_AFIGRA'; 
DEFINE camptabl = 'DIFERENCIA_FECHAS';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=1   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=2   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>3   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO148_SEGDVLPRS'; 
DEFINE camptabl = 'PRI_MONTO';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=5000                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>5000 AND COUNT(PRI_MONTO)<=10000   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>10000                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO1012_LMPAG'; 
DEFINE camptabl = 'PAGO_TOTAL_LM';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1  AND  COUNT(NVL(&camptabl, '0'))<=50000      THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=50001 AND COUNT(NVL(&camptabl, '0'))<=100000   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=100001                                   THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO1410_LMPNDTRQ'; 
DEFINE camptabl = 'DIF_DIAS_RESOL';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>0 AND   COUNT(NVL(&camptabl, '0'))<=50                             THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=51 AND COUNT(NVL(&camptabl, '0'))<=100     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO1210_LMERRATZPAG'; 
DEFINE camptabl = 'PAGO_TOTAL_LM';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))<=6                               THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=7 AND COUNT(NVL(&camptabl, '0'))<=11     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=12                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;



DEFINE tableNm = 'TBLARO1310_LMRTJSPAG'; 
DEFINE camptabl = 'CUS_MONSIL';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=0  and COUNT(NVL(&camptabl, '0'))<=50000      THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=50001 AND COUNT(NVL(&camptabl, '0'))<=100000  THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>10000                                THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;



DEFINE tableNm = 'TBL21_CPNDIA'; 
DEFINE camptabl = 'DIAS_ATRASO';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1 and COUNT(NVL(&camptabl, '0')) <=3                             THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=4 AND COUNT(NVL(&camptabl, '0'))<=7     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0')) >7                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO104_LMERRPAG'; 
DEFINE camptabl = 'PAGO_TOTAL_LM';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1 and COUNT(NVL(&camptabl, '0'))<= 500000                             THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=500001 AND COUNT(NVL(&camptabl, '0'))<= 1000000     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=1000001                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;

DEFINE tableNm = 'TBLARO84_LMDIF'; 
DEFINE camptabl = 'DIAS_DEMORA';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=1                               THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))=2     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=3                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


DEFINE tableNm = 'TBLARO105_LMDIFPAG'; 
DEFINE camptabl = 'DIAS_S_ACT';
UPDATE SCORE_IND
SET  CASOS_ALTO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>0 and  COUNT(NVL(&camptabl, '0'))<=50                             THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_MEDIO = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>=51 AND COUNT(NVL(&camptabl, '0'))<=100     THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
    ,CASOS_BAJO  = (SELECT CASE WHEN COUNT(NVL(&camptabl, '0'))>100                              THEN COUNT(NVL(&camptabl, '0')) ELSE 0 END FROM &tableNm)
WHERE TBL_ASOCIADA = '&tableNm'  ;


--------------------------------------
UPDATE SCORE_IND
SET TOTAL_CASOS = (CASOS_ALTO + CASOS_MEDIO + CASOS_BAJO);
-------------------------------------------------------------

UPDATE SCORE_IND
SET  POND_ALTO  =  (SELECT PONDERACION_SEMAFOROS_ROJO FROM INDICADORES WHERE ID_INDICADOR = ID )
    ,POND_MEDIO  = (SELECT PONDERACION_SEMAFOROS_ROJO FROM INDICADORES WHERE ID_INDICADOR = ID )
    ,POND_BAJO  =  (SELECT PONDERACION_SEMAFOROS_ROJO FROM INDICADORES WHERE ID_INDICADOR = ID )




UPDATE SCORE_IND
SET PUNTAJE_ALTO = ((CASOS_ALTO / CASE WHEN TOTAL_CASOS = 0 THEN 1 ELSE TOTAL_CASOS END)* POND_ALTO )
    ,PUNTAJE_MEDIO =((CASOS_ALTO / CASE WHEN TOTAL_CASOS = 0 THEN 1 ELSE TOTAL_CASOS END)* POND_ALTO )
    ,PUNTAJE_BAJO  =((CASOS_ALTO / CASE WHEN TOTAL_CASOS = 0 THEN 1 ELSE TOTAL_CASOS END)* POND_ALTO )
  ;
 
UPDATE SCORE_IND
SET PUNTAJE_RIESGO_IND =  (PUNTAJE_ALTO + PUNTAJE_MEDIO + PUNTAJE_BAJO);


SELECT * FROM SCORE_IND

UPDATE SCORE_IND
SET CALIF_INDICADOR = CASE 	WHEN PUNTAJE_RIESGO_IND >= 0.75 THEN 'INSATISFACTORIO'
							WHEN PUNTAJE_RIESGO_IND < 0.30 PUNTAJE_RIESGO_IND > 0.74 THEN 'MEJORABLE'
							WHEN PUNTAJE_RIESGO_IND < 0.29 THEN 'SATISFACTORIO'
					END 
