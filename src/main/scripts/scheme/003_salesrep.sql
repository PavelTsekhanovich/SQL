CREATE TABLE SALESREPS(
  EMPL_NUM INTEGER NOT NULL,
  NAME VARCHAR(15) NOT NULL,
  AGE INTEGER,
  REP_OFFICE INTEGER,
  TITLE VARCHAR(10),
  HIRE_DATE DATE NOT NULL,
  MANAGER INTEGER,
  QUOTA DECIMAL(9,2),
  SALES DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (EMPL_NUM),
  FOREIGN KEY (MANAGER)
  REFERENCES SALESREPS (EMPL_NUM)
    ON DELETE SET NULL,
  FOREIGN KEY WORKSIN (REP_OFFICE)
  REFERENCES OFFICES (OFFICE)
    ON DELETE SET NULL
);