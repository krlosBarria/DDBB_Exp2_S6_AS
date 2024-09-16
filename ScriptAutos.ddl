-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-16 18:08:28 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    rut       INTEGER NOT NULL,
    nombres   VARCHAR2(20) NOT NULL,
    apellidos VARCHAR2(20) NOT NULL,
    domicilio VARCHAR2(30) NOT NULL,
    contacto  VARCHAR2(30)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

CREATE TABLE domicilio (
    id_domicilio INTEGER NOT NULL,
    direccion    VARCHAR2(30) NOT NULL,
    comuna       VARCHAR2(20) NOT NULL,
    cliente_rut  INTEGER NOT NULL,
    rut          INTEGER NOT NULL
);

ALTER TABLE domicilio ADD CONSTRAINT domicilio_pkv1 PRIMARY KEY ( rut );

ALTER TABLE domicilio ADD CONSTRAINT domicilio_pk UNIQUE ( id_domicilio );

CREATE TABLE orden_de_atencion (
    id_orden               INTEGER NOT NULL,
    fecha_ingreso          DATE,
    fecha_estimada_entrega DATE,
    estado                 VARCHAR2(20),
    cliente_rut            INTEGER NOT NULL,
    vehiculo_id_vehiculo   INTEGER NOT NULL
);

ALTER TABLE orden_de_atencion ADD CONSTRAINT orden_de_atencion_pk PRIMARY KEY ( id_orden );

CREATE TABLE respuesto (
    id_repuesto          INTEGER NOT NULL,
    descripcion          VARCHAR2(30),
    costo                INTEGER,
    servicio_id_servicio INTEGER NOT NULL
);

ALTER TABLE respuesto ADD CONSTRAINT respuesto_pk PRIMARY KEY ( id_repuesto );

CREATE TABLE servicio (
    id_servicio                INTEGER NOT NULL,
    tipo_servicio              VARCHAR2(12) NOT NULL,
    descripcion                VARCHAR2(30),
    costo                      INTEGER,
    orden_de_atencion_id_orden INTEGER NOT NULL
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( id_servicio );

CREATE TABLE vehiculo (
    id_vehiculo INTEGER NOT NULL,
    patente     VARCHAR2(8) NOT NULL,
    marca       VARCHAR2(20) NOT NULL,
    modelo      VARCHAR2(20) NOT NULL,
    año         INTEGER NOT NULL,
    color       VARCHAR2(12),
    cliente_rut INTEGER NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( id_vehiculo );

ALTER TABLE domicilio
    ADD CONSTRAINT domicilio_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE domicilio
    ADD CONSTRAINT domicilio_cliente_fkv2 FOREIGN KEY ( rut )
        REFERENCES cliente ( rut );

ALTER TABLE orden_de_atencion
    ADD CONSTRAINT orden_de_atencion_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE orden_de_atencion
    ADD CONSTRAINT orden_de_atencion_vehiculo_fk FOREIGN KEY ( vehiculo_id_vehiculo )
        REFERENCES vehiculo ( id_vehiculo );

ALTER TABLE respuesto
    ADD CONSTRAINT respuesto_servicio_fk FOREIGN KEY ( servicio_id_servicio )
        REFERENCES servicio ( id_servicio );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_orden_de_atencion_fk FOREIGN KEY ( orden_de_atencion_id_orden )
        REFERENCES orden_de_atencion ( id_orden );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
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
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
