-- Generated by Oracle SQL Developer Data Modeler 3.1.4.710
--   at:        2013-04-04 14:28:02 BST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE clientes CASCADE CONSTRAINTS 
;
DROP TABLE Facturacao CASCADE CONSTRAINTS 
;
DROP TABLE Iti_internacional CASCADE CONSTRAINTS 
;
DROP TABLE Iti_nacional CASCADE CONSTRAINTS 
;
DROP TABLE Prestadores CASCADE CONSTRAINTS 
;
DROP TABLE Servi�os CASCADE CONSTRAINTS 
;
DROP TABLE Transportes CASCADE CONSTRAINTS 
;
DROP TABLE troco CASCADE CONSTRAINTS
;
CREATE TABLE Clientes 
    ( 
     id_cliente INTEGER  NOT NULL , 
     Nome VARCHAR2 (40) , 
     NIF INTEGER , 
     Contacto VARCHAR2 (20) , 
     Morada VARCHAR2 (25) , 
     "e-mail" VARCHAR2 (15) , 
     n_servicos_adquiridos INTEGER 
    ) 
;



ALTER TABLE Clientes 
    ADD CONSTRAINT "Clientes PK" PRIMARY KEY ( id_cliente ) ;


ALTER TABLE Clientes 
    ADD CONSTRAINT NIF UNIQUE ( NIF ) ;



CREATE TABLE Facturacao 
    ( 
     id_fact INTEGER , 
     preco INTEGER , 
     pago INTEGER , 
     id_servico INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Facturacao__IDX ON Facturacao 
    ( 
     id_servico ASC 
    ) 
;


CREATE TABLE Iti_internacional 
    ( 
     id_servico INTEGER  NOT NULL , 
     Origem VARCHAR2 (20) , 
     Destino VARCHAR2 (20) , 
     id_prest INTEGER  NOT NULL 
    ) 
;



ALTER TABLE Iti_internacional 
    ADD CONSTRAINT "Iti_internacional PK" PRIMARY KEY ( id_servico, id_prest ) ;



CREATE TABLE Iti_nacional 
    ( 
     id_servico INTEGER  NOT NULL , 
     id_troco INTEGER NOT NULL,
     Matricula VARCHAR2 (10)  NOT NULL 
    ) 
;

ALTER TABLE Iti_nacional 
    ADD CONSTRAINT "Iti_nacional PK" PRIMARY KEY ( id_servico ) ;



CREATE TABLE troco 
    ( 
     id_troco INTEGER  NOT NULL , 
     Origem VARCHAR2 (50) , 
     Destino VARCHAR2 (50) , 
     distancia INTEGER 
    ) 
;

ALTER TABLE troco 
    ADD CONSTRAINT "troco PK" PRIMARY KEY ( id_troco ) ;

CREATE TABLE Prestadores 
    ( 
     id_prest INTEGER  NOT NULL , 
     Nome VARCHAR2 (50),
     preco INTEGER
    ) 
;



ALTER TABLE Prestadores 
    ADD CONSTRAINT "Prestadores PK" PRIMARY KEY ( id_prest ) ;



CREATE TABLE Servi�os 
    ( 
     id_servico INTEGER  NOT NULL , 
     tipo_servico INTEGER , 
     data_servico DATE , 
     id_cliente INTEGER
    ) 
;



ALTER TABLE Servi�os 
    ADD CONSTRAINT "Servi�os PK" PRIMARY KEY ( id_servico ) ;



CREATE TABLE Transportes 
    ( 
     Matricula VARCHAR2 (50)  NOT NULL , 
     Tipo VARCHAR (25),
     transito INTEGER,
     carga INTEGER,
     Taxa_Viagem INTEGER,
     Taxa_Aluger INTEGER 
    ) 
;



ALTER TABLE Transportes 
    ADD CONSTRAINT "Transportes PK" PRIMARY KEY ( Matricula ) ;




ALTER TABLE Servi�os 
    ADD CONSTRAINT Relation_1 FOREIGN KEY 
    ( 
     id_cliente
    ) 
    REFERENCES Clientes 
    ( 
     id_cliente
    ) 
    ON DELETE CASCADE
;


ALTER TABLE Iti_nacional 
    ADD CONSTRAINT Relation_4 FOREIGN KEY 
    ( 
     id_servico
    ) 
    REFERENCES Servi�os 
    ( 
     id_servico
    ) 
    ON DELETE CASCADE
;

ALTER TABLE troco 
    ADD CONSTRAINT troco_nacional FOREIGN KEY 
    ( 
     id_troco
    ) 
    REFERENCES iti_nacional 
    ( 
     id_troco
    ) 
    ON DELETE CASCADE
;


ALTER TABLE Iti_nacional 
    ADD CONSTRAINT Relation_5 FOREIGN KEY 
    ( 
     Matricula
    ) 
    REFERENCES Transportes 
    ( 
     Matricula
    ) 
    ON DELETE CASCADE
;


ALTER TABLE Iti_internacional 
    ADD CONSTRAINT Relation_6 FOREIGN KEY 
    ( 
     id_servico
    ) 
    REFERENCES Servi�os 
    ( 
     id_servico
    ) 
    ON DELETE CASCADE
;


ALTER TABLE Iti_internacional 
    ADD CONSTRAINT Relation_7 FOREIGN KEY 
    ( 
     id_prest
    ) 
    REFERENCES Prestadores 
    ( 
     id_prest
    ) 
    ON DELETE CASCADE
;


ALTER TABLE Facturacao 
    ADD CONSTRAINT Relation_7 FOREIGN KEY 
    ( 
     id_servico
    ) 
    REFERENCES Servi�os 
    ( 
     id_servico
    ) 
    ON DELETE CASCADE 
; 
-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

commit;