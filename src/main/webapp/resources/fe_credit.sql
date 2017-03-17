--Vu 23/10/2015
alter table CMS add (test1_new nvarchar2(255));
update CMS set test1_new = to_char(CMS_CATEGORYID);
alter table CMS drop column CMS_CATEGORYID cascade constraints;
alter table CMS rename column test1_new to CMS_CATEGORYID;

--- UAT------------
--Kham 27/10/2015
ALTER TABLE CUSTOMER 
ADD (CREATEDATE DATE);

ALTER TABLE CUSTOMER 
ADD (CREATEBY NVARCHAR2(100) );

ALTER TABLE CUSTOMER 
ADD (UPDATEDATE DATE );

ALTER TABLE CUSTOMER 
ADD (UPDATEBY NVARCHAR2(100) );

ALTER TABLE MESSAGES  
MODIFY (CREATEDDATE TIMESTAMP );

--- UAT------------
--Vu 4/11/2015
ALTER TABLE POS
ADD ( "LONGITUDE" NVARCHAR2(255) NULL  ) 
ADD ( "LATITUDE" NVARCHAR2(255) NULL  ) ;



ALTER TABLE BRANCH
ADD ( "LONGITUDE" NVARCHAR2(255) NULL  ) 
ADD ( "LATITUDE" NVARCHAR2(255) NULL  ) ;

ALTER TABLE ACCOUNT
ADD ( "STATUSID" NUMBER(16) NULL  ) ;
--- UAT------------

--Vu 5/11/2015
ALTER TABLE CMS
ADD ( "IMAGELONG" NVARCHAR2(500) NULL  ) 
ADD ( "SHARECOMMENT" NVARCHAR2(500) NULL  ) ;

--Vu 6/11/2015
ALTER TABLE POS ADD ( "BRANCH_NAMEPOS" NVARCHAR2(255) NULL  ) ;
ALTER TABLE APPLYNOW DROP CONSTRAINT "SYS_C0010867";

ALTER TABLE CMS
ADD ( "URL" NVARCHAR2(500) NULL  ) ;
--- UAT------------
--- PRO------------

--Cuong 10/11/2015

ALTER TABLE LOAN
MODIFY ( "CONDITIONCATEGORY" NVARCHAR2(50) NULL  ) 
MODIFY ( "CONDITIONNAME" NVARCHAR2(200) NULL  ) 
MODIFY ( "CONDITIONVALUE" NUMBER(16) NULL  ) ;


--Vu 11/11/2015

ALTER TABLE POS
ADD ( "BUYORPAY" NVARCHAR2(255) NULL  ) ;

alter table MESSAGES add (test1_new nvarchar2(255));
update MESSAGES set test1_new = to_char(CONTRACTMSGID);
alter table MESSAGES drop column CONTRACTMSGID cascade constraints;
alter table MESSAGES rename column test1_new to CONTRACTMSGID;


--- PRO------------
--- UAT------------
--Vu 12/11/2015
ALTER TABLE POS ADD ( "IDDISTRICT" NUMBER(16) NULL  ) ;

--Cuong 16/11/2015
ALTER TABLE LOAN ADD (CREATEDATE TIMESTAMP );

ALTER TABLE LOANDETAIL 
ADD (CREATEDATE TIMESTAMP );

ALTER TABLE APPLYNOW  
MODIFY (EXPORTEDDATE DATE );

ALTER TABLE APPLYNOW  
MODIFY (SUBMITTEDDATE DATE );



--Vu 16/11/2015
ALTER TABLE CMS
ADD ( "CMS_HOBBYYID" NVARCHAR2(255) NULL  ) 
ADD ( "START_DAY" TIMESTAMP NULL  ) 
ADD ( "END_DAY" TIMESTAMP NULL  ) ;

--- UAT------------

CREATE SEQUENCE SEQ_MASTERDATADETAIL
     MINVALUE 1
     MAXVALUE 999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     
CREATE SEQUENCE SEQ_MASTERDATA_MASTERDATAID
     MINVALUE 1
     MAXVALUE 999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;

CREATE TABLE MASTERDATA (
"MASTERDATAID" NUMBER(16) NOT NULL ,
"NAME" NVARCHAR2(255) NULL ,
"DESCRIPTION" NVARCHAR2(255) NULL ,
PRIMARY KEY ("MASTERDATAID")
)

CREATE TABLE MASTERDATADETAIL (
"MASTERDATADETAILID" NUMBER(16) NOT NULL ,
"MASTERDATAID" NUMBER(16) NULL ,
"NAME" NVARCHAR2(255) NULL ,
"DESCRIPTION" NVARCHAR2(255) NULL ,
PRIMARY KEY ("MASTERDATADETAILID")
)


     
 --trung 17/11/2015
alter table CMS add (test1_new clob);
update CMS set test1_new = to_char(CONTENT);
alter table CMS drop column CONTENT cascade constraints;
alter table CMS rename column test1_new to CONTENT;

--- UAT------------
-- VU/18/11/2015
ALTER TABLE BANNER
ADD ( "ORDERBANNER" NUMBER(16) NULL  ) ;

ALTER TABLE CMS
ADD ( "ORDERCMS" NUMBER(16) NULL  ) ;


ALTER TABLE APPLYNOW
ADD ( "EMI" NUMBER(16) NULL  ) ;

--trung 19/11/2015
 CREATE SEQUENCE SEQ_CUSTOMERHOBBYHISTORYID
     MINVALUE 1
     MAXVALUE 999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
 
 CREATE TABLE CUSTOMERHOBBYHISTORY
   (	"CUSTOMERHOBBYHISTORYID" NUMBER(16,0), 
	"CHECKEDDATE" TIMESTAMP (6), 
	"STATUS" NUMBER(2,0), 
	"CUSTOMERID" NUMBER(16,0), 
	"HOBBYID" NUMBER(16,0)
   );
   
   
   ALTER TABLE CMS
MODIFY ( "TAG" NVARCHAR2(255) NULL  ) ;

ALTER TABLE CMS
MODIFY ( "SHORT" NVARCHAR2(500) NULL  ) ;
--- UAT------------

-- trungnt-20/11/2015

Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (5,'R005','Loan',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (6,'R006','Banner',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (7,'R007','Navigation',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (8,'R008','CMS',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (9,'R009','Report',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (10,'R010','Read',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (11,'R011','LDAP',null,null);


--vu 23/11/2015
ALTER TABLE ACCOUNT
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;



ALTER TABLE BANNER
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;



ALTER TABLE CMS
ADD ( "CREATED_DATE" TIMESTAMP(7)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(7)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;


ALTER TABLE CMS_CATEGORY
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;


ALTER TABLE CUSTOMER
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;


ALTER TABLE HOBBY
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;

ALTER TABLE LOAN
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) 
ADD ( "STATUSID" NUMBER(16) NULL  ) ;


ALTER TABLE LOANDETAIL
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) 
ADD ( "STATUSID" NUMBER(16) NULL  ) ;

ALTER TABLE APPLYNOW
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;

ALTER TABLE POS
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) ;


ALTER TABLE BRANCH
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) ;

ALTER TABLE TEAM
ADD ( "STATUSID" NUMBER(16) NULL  ) 
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;

ALTER TABLE MASTERDATA
ADD ( "STATUSID" NUMBER(16) NULL  ) 
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;

ALTER TABLE MASTERDATADETAIL
ADD ( "STATUSID" NUMBER(16) NULL  ) 
ADD ( "CREATED_DATE" TIMESTAMP(6) NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;

ALTER TABLE CONTACT
ADD ( "STATUSID" NUMBER(16) NULL  ) 
ADD ( "CREATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "CREATED_BY" NVARCHAR2(255) NULL  ) 
ADD ( "UPDATED_DATE" TIMESTAMP(6)  NULL  ) 
ADD ( "UPDATE_BY" NVARCHAR2(255) NULL  ) 
ADD ( "REMARK" NVARCHAR2(255) NULL  ) ;

---VU--26/11/2015
CREATE SEQUENCE SEQ_HOBBYACTIVITYLOG
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     
CREATE TABLE HOBBYACTIVITYLOG (
"ACTIVITYID" NUMBER(16) NOT NULL ,
"LOGCODE" VARCHAR2(1000 BYTE) NULL ,
"LOGDATE" TIMESTAMP(6)  NULL ,
"DESCRITPTION" VARCHAR2(1000 BYTE) NULL ,
"USERTYPE" NUMBER(16) NULL ,
"TYPE" NUMBER(16) NULL ,
"REFEID" NUMBER(16) NULL ,
"USERID" NUMBER(16) NULL ,
"ID" NUMBER(16) NULL 
);


 CREATE SEQUENCE SEQ_CUSTOMERACTIVITYLOG
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;   
     
CREATE TABLE CUSTOMERACTIVITYLOG (
"ACTIVITYID" NUMBER(16) NOT NULL ,
"LOGCODE" VARCHAR2(1000 BYTE) NULL ,
"LOGDATE" TIMESTAMP(6)  NULL ,
"DESCRITPTION" VARCHAR2(1000 BYTE) NULL ,
"USERTYPE" NUMBER(16) NULL ,
"TYPE" NUMBER(16) NULL ,
"REFEID" NUMBER(16) NULL ,
"USERID" NUMBER(16) NULL ,
"CUSTOMERID" NUMBER(16) NULL 
);

 --- UAT------------ 

 --vu--27/11/2015    
 CREATE SEQUENCE SEQ_BANNERACTIVITYLOG
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
CREATE TABLE BANNERACTIVITYLOG (
"ACTIVITYID" NUMBER(16) NOT NULL ,
"LOGCODE" VARCHAR2(1000 BYTE) NULL ,
"LOGDATE" TIMESTAMP(6)  NULL ,
"DESCRITPTION" VARCHAR2(1000 BYTE) NULL ,
"USERTYPE" NUMBER(16) NULL ,
"TYPE" NUMBER(16) NULL ,
"REFEID" NUMBER(16) NULL ,
"USERID" NUMBER(16) NULL ,
"ID" NUMBER(16) NULL 
);

CREATE SEQUENCE SEQ_CMSACTIVITYLOG
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     
CREATE TABLE CMSACTIVITYLOG (
"ACTIVITYID" NUMBER(16) NOT NULL ,
"LOGCODE" VARCHAR2(1000 BYTE) NULL ,
"LOGDATE" TIMESTAMP(6)  NULL ,
"DESCRITPTION" VARCHAR2(1000 BYTE) NULL ,
"USERTYPE" NUMBER(16) NULL ,
"TYPE" NUMBER(16) NULL ,
"REFEID" NUMBER(16) NULL ,
"USERID" NUMBER(16) NULL ,
"ID" NUMBER(16) NULL 
);
CREATE SEQUENCE SEQ_LOANACTIVITYLOG
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     
CREATE TABLE LOANACTIVITYLOG (
"ACTIVITYID" NUMBER(16) NOT NULL ,
"LOGCODE" VARCHAR2(1000 BYTE) NULL ,
"LOGDATE" TIMESTAMP(6)  NULL ,
"DESCRITPTION" VARCHAR2(1000 BYTE) NULL ,
"USERTYPE" NUMBER(16) NULL ,
"TYPE" NUMBER(16) NULL ,
"REFEID" NUMBER(16) NULL ,
"USERID" NUMBER(16) NULL ,
"ID" NUMBER(16) NULL 
);
CREATE SEQUENCE SEQ_CONTACTACTIVITYLOG
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;

CREATE TABLE CONTACTACTIVITYLOG (
"ACTIVITYID" NUMBER(16) NOT NULL ,
"LOGCODE" VARCHAR2(1000 BYTE) NULL ,
"LOGDATE" TIMESTAMP(6)  NULL ,
"DESCRITPTION" VARCHAR2(1000 BYTE) NULL ,
"USERTYPE" NUMBER(16) NULL ,
"TYPE" NUMBER(16) NULL ,
"REFEID" NUMBER(16) NULL ,
"USERID" NUMBER(16) NULL ,
"ID" NUMBER(16) NULL 
);
--vu--30/11/2015
CREATE SEQUENCE SEQ_MESSAGEACTIVITYLOGID
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     
CREATE TABLE MESSAGEACTIVITYLOG (
"ACTIVITYID" NUMBER(16) NOT NULL ,
"LOGCODE" VARCHAR2(1000 BYTE) NULL ,
"LOGDATE" TIMESTAMP(6)  NULL ,
"DESCRITPTION" VARCHAR2(1000 BYTE) NULL ,
"USERTYPE" NUMBER(16) NULL ,
"TYPE" NUMBER(16) NULL ,
"REFEID" NUMBER(16) NULL ,
"USERID" NUMBER(16) NULL ,
"ID" NUMBER(16) NULL 
);

--vu--2/12/2015
ALTER TABLE CUSTOMER
ADD ( "DATEGETCODE" DATE NULL  ) 
ADD ( "NUMBERGETCODE" NUMBER(2) NULL  ) 
ADD ( "DATEFORGETCODE" DATE NULL  ) 
ADD ( "NUMBERFORGETGETCODE" NUMBER(2) NULL  ) ;
     

 --- UAT------------ 
 --vu--3/12/2015
ALTER TABLE LOANDETAIL
ADD ( "TENURE" NVARCHAR2(2000) NULL  ) ;

--vu--08/12/2015
ALTER TABLE CUSTOMER
ADD ( "CODEMACHINE" NVARCHAR2(255) NULL  ) ;

CREATE SEQUENCE SEQ_CUSTOMERCMS
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     
CREATE TABLE CUSTOMERCMSREAD
(
	CUSTOMERCMSREADID number(16,0) NOT NULL,
	CUSTOMERID number(16) NOT NULL,
	CMSID number(16,0) NOT NULL,
	PRIMARY KEY (CUSTOMERCMSREADID)
);


 --- UAT------------
 
--vu--09/12/2015

CREATE SEQUENCE SEQ_APLLYNOWLOGID
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     

CREATE TABLE APLLYNOWLOG
(
	ACTIVITYID number(16) NOT NULL,
	LOGCODE varchar2(1000),
	LOGDATE timestamp,
	DESCRITPTION varchar2(1000),
	USERTYPE number(16),
	TYPE number(16),
	REFEID number(16),
	USERID number(16),
	ID number(16),
	PRIMARY KEY (ACTIVITYID)
);

CREATE SEQUENCE SEQ_POSLOGID
     MINVALUE 1
     MAXVALUE 999999999999999999999999999
     START WITH 1
     INCREMENT BY 1
     CACHE 20;
     
CREATE TABLE POSLOG
(
	ACTIVITYID number(16) NOT NULL,
	LOGCODE varchar2(1000),
	LOGDATE timestamp,
	DESCRITPTION varchar2(1000),
	USERTYPE number(16),
	TYPE number(16),
	REFEID number(16),
	USERID number(16),
	ID number(16),
	PRIMARY KEY (ACTIVITYID)
);



--vu--14/12/2015--
ALTER TABLE POS
ADD ( "CODE_BRANCH_POS" NVARCHAR2(255) NULL  ) ;

ALTER TABLE POS
MODIFY ( "ADDRESS_NUMBER" NVARCHAR2(255) ) ;

 --- UAT------------
UPDATE ROLE SET NAME='Message Dashboard' WHERE CODE = 'R003';
UPDATE ROLE SET NAME='Submitted Loan Request' WHERE CODE = 'R005';
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (12,'R012','Hobby',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (13,'R013','My Follow-up Messages',null,null);

Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (14,'R014','Loan Calculator',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (15,'R015','Loan Calculator Setup',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (16,'R016','About',null,null);
Insert into ROLE (ROLEID,CODE,NAME,TYPE,CONDITIONAL) values (17,'R017','Category',null,null);
 --- UAT------------
 --- PRO------------06/01/2016
 

 --- vu------------22/01/2016
ALTER TABLE CUSTOMER
ADD ( "DATEIMPORT" DATE NULL  ) ;

 --- vu------------26/01/2016
ALTER TABLE MESSAGES
ADD ( "DATEIMPORT" DATE NULL  ) ;

 --- UAT------------
 --- PRO------------01/02/2016