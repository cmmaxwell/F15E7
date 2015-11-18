-- Generated by Oracle SQL Developer Data Modeler 4.1.1.888
--   at:        2015-11-15 20:20:47 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE F15E7_approver
  (
    approver_id       INTEGER NOT NULL ,
    approved_date     DATE ,
    entered_by_emp_id INTEGER ,
    comments          VARCHAR2 (4000) ,
    F15E7_emp_emp_id  INTEGER ,
    F15E7_rfe_rfe_id  INTEGER
  ) ;
ALTER TABLE F15E7_approver ADD CONSTRAINT F15E7_approver_PK PRIMARY KEY ( approver_id ) ;


CREATE TABLE F15E7_auth
  (
    auth_id          INTEGER NOT NULL ,
    RIGHT            VARCHAR2 (10) ,
    F15E7_emp_emp_id INTEGER
  ) ;
CREATE UNIQUE INDEX F15E7_auth__IDX ON F15E7_auth
  (
    F15E7_emp_emp_id ASC
  )
  ;
ALTER TABLE F15E7_auth ADD CONSTRAINT F15E7_auth_PK PRIMARY KEY ( auth_id ) ;


CREATE TABLE F15E7_comment
  (
    comment_id         INTEGER NOT NULL ,
    entered_by_emp_id  INTEGER ,
    comment_entry_date DATE ,
    comments           VARCHAR2 (4000) ,
    F15E7_rfe_rfe_id   INTEGER ,
    F15E7_emp_emp_id   INTEGER
  ) ;
ALTER TABLE F15E7_comment ADD CONSTRAINT F15E7_comment_PK PRIMARY KEY ( comment_id ) ;


CREATE TABLE F15E7_contact
  (
    contact_id        INTEGER NOT NULL ,
    contact_role_code VARCHAR2 (1) ,
    contact_emp_id    INTEGER ,
    effective_date    DATE ,
    comments          VARCHAR2 (4000) ,
    F15E7_emp_emp_id  INTEGER ,
    F15E7_rfe_rfe_id  INTEGER
  ) ;
ALTER TABLE F15E7_contact ADD CONSTRAINT F15E7_contact_PK PRIMARY KEY ( contact_id ) ;


CREATE TABLE F15E7_doc
  (
    doc_id        INTEGER NOT NULL ,
    filename      VARCHAR2 (4000) ,
    file_mimetype VARCHAR2 (512) ,
    file_charset  VARCHAR2 (512) ,
    file_blob BLOB ,
    file_comments    VARCHAR2 (4000) ,
    tags             VARCHAR2 (4000) ,
    F15E7_rfe_rfe_id INTEGER
  ) ;
ALTER TABLE F15E7_doc ADD CONSTRAINT F15E7_doc_PK PRIMARY KEY ( doc_id ) ;


CREATE TABLE F15E7_emp
  (
    emp_id             INTEGER NOT NULL ,
    type               VARCHAR2 (256) ,
    chairperson_flag   VARCHAR2 (1) ,
    exec_dir_flag      VARCHAR2 (1) ,
    sys_admin_flag     VARCHAR2 (1) ,
    lab_dir_flag       VARCHAR2 (1) ,
    active             CHAR (1) ,
    emp_name           VARCHAR2 (30) ,
    emp_email          VARCHAR2 (50) ,
    emp_office         VARCHAR2 (4) ,
    emp_phone          VARCHAR2 (10) ,
    emp_status         VARCHAR2 (1) ,
    status_eff_date    DATE ,
    F15E7_lab_lab_id   INTEGER ,
    F15E7_auth_auth_id INTEGER
  ) ;
CREATE UNIQUE INDEX F15E7_emp__IDX ON F15E7_emp
  (
    F15E7_auth_auth_id ASC
  )
  ;
ALTER TABLE F15E7_emp ADD CONSTRAINT F15E7_emp_PK PRIMARY KEY ( emp_id ) ;


CREATE TABLE F15E7_hist
  (
    hist_id          INTEGER NOT NULL ,
    last_modified    DATE ,
    F15E7_rfe_rfe_id INTEGER
  ) ;
ALTER TABLE F15E7_hist ADD CONSTRAINT F15E7_hist_PK PRIMARY KEY ( hist_id ) ;


CREATE TABLE F15E7_lab
  ( lab_id INTEGER NOT NULL
  ) ;
ALTER TABLE F15E7_lab ADD CONSTRAINT F15E7_lab_PK PRIMARY KEY ( lab_id ) ;


CREATE TABLE F15E7_rfe
  (
    rfe_id                 INTEGER NOT NULL ,
    explanation            VARCHAR2 (4000) ,
    alt_protections        VARCHAR2 (4000) ,
    approval_review_date   DATE ,
    F15E7_status_status_id INTEGER ,
    F15E7_emp_emp_id       INTEGER ,
    F15E7_taskv1_task_id   INTEGER
  ) ;
ALTER TABLE F15E7_rfe ADD CONSTRAINT F15E7_rfe_PK PRIMARY KEY ( rfe_id ) ;


CREATE TABLE F15E7_rfeTask
  (
    rfeTask_id         INTEGER NOT NULL ,
    F15E7_rfe_rfe_id   INTEGER ,
    F15E7_task_task_id INTEGER
  ) ;
ALTER TABLE F15E7_rfeTask ADD CONSTRAINT F15E7_rfeTask_PK PRIMARY KEY ( rfeTask_id ) ;


CREATE TABLE F15E7_status
  (
    status_id         INTEGER NOT NULL ,
    rfe_status        VARCHAR2 (30) ,
    description       VARCHAR2 (500) ,
    effective_date    DATE ,
    entered_by_emp_id INTEGER ,
    status_code       VARCHAR2 (1)
  ) ;
ALTER TABLE F15E7_status ADD CONSTRAINT F15E7_status_PK PRIMARY KEY ( status_id ) ;


CREATE TABLE F15E7_task
  (
    task_id           INTEGER NOT NULL ,
    effective_date    DATE ,
    task_abbreviation VARCHAR2 (15) ,
    task_descriptiom  VARCHAR2 (4000)
  ) ;
ALTER TABLE F15E7_task ADD CONSTRAINT F15E7_task_PK PRIMARY KEY ( task_id ) ;


ALTER TABLE F15E7_approver ADD CONSTRAINT F15E7_approver_F15E7_emp_FK FOREIGN KEY ( F15E7_emp_emp_id ) REFERENCES F15E7_emp ( emp_id ) ;

ALTER TABLE F15E7_approver ADD CONSTRAINT F15E7_approver_F15E7_rfe_FK FOREIGN KEY ( F15E7_rfe_rfe_id ) REFERENCES F15E7_rfe ( rfe_id ) ;

ALTER TABLE F15E7_auth ADD CONSTRAINT F15E7_auth_F15E7_emp_FK FOREIGN KEY ( F15E7_emp_emp_id ) REFERENCES F15E7_emp ( emp_id ) ;

ALTER TABLE F15E7_comment ADD CONSTRAINT F15E7_comment_F15E7_emp_FK FOREIGN KEY ( F15E7_emp_emp_id ) REFERENCES F15E7_emp ( emp_id ) ;

ALTER TABLE F15E7_comment ADD CONSTRAINT F15E7_comment_F15E7_rfe_FK FOREIGN KEY ( F15E7_rfe_rfe_id ) REFERENCES F15E7_rfe ( rfe_id ) ;

ALTER TABLE F15E7_contact ADD CONSTRAINT F15E7_contact_F15E7_emp_FK FOREIGN KEY ( F15E7_emp_emp_id ) REFERENCES F15E7_emp ( emp_id ) ;

ALTER TABLE F15E7_contact ADD CONSTRAINT F15E7_contact_F15E7_rfe_FK FOREIGN KEY ( F15E7_rfe_rfe_id ) REFERENCES F15E7_rfe ( rfe_id ) ;

ALTER TABLE F15E7_doc ADD CONSTRAINT F15E7_doc_F15E7_rfe_FK FOREIGN KEY ( F15E7_rfe_rfe_id ) REFERENCES F15E7_rfe ( rfe_id ) ;

ALTER TABLE F15E7_emp ADD CONSTRAINT F15E7_emp_F15E7_auth_FK FOREIGN KEY ( F15E7_auth_auth_id ) REFERENCES F15E7_auth ( auth_id ) ;

ALTER TABLE F15E7_emp ADD CONSTRAINT F15E7_emp_F15E7_lab_FK FOREIGN KEY ( F15E7_lab_lab_id ) REFERENCES F15E7_lab ( lab_id ) ;

ALTER TABLE F15E7_hist ADD CONSTRAINT F15E7_hist_F15E7_rfe_FK FOREIGN KEY ( F15E7_rfe_rfe_id ) REFERENCES F15E7_rfe ( rfe_id ) ;

ALTER TABLE F15E7_rfeTask ADD CONSTRAINT F15E7_rfeTask_F15E7_rfe_FK FOREIGN KEY ( F15E7_rfe_rfe_id ) REFERENCES F15E7_rfe ( rfe_id ) ;

ALTER TABLE F15E7_rfeTask ADD CONSTRAINT F15E7_rfeTask_F15E7_task_FK FOREIGN KEY ( F15E7_task_task_id ) REFERENCES F15E7_task ( task_id ) ;

ALTER TABLE F15E7_rfe ADD CONSTRAINT F15E7_rfe_F15E7_emp_FK FOREIGN KEY ( F15E7_emp_emp_id ) REFERENCES F15E7_emp ( emp_id ) ;

ALTER TABLE F15E7_rfe ADD CONSTRAINT F15E7_rfe_F15E7_status_FK FOREIGN KEY ( F15E7_status_status_id ) REFERENCES F15E7_status ( status_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             2
-- ALTER TABLE                             27
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