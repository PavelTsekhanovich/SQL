CREATE TABLE PRODUCTS(
  MFR_ID CHAR(3) NOT NULL,
  PRODUCT_ID CHAR(3) NOT NULL,
  DESCRIPTION VARCHAR(20) NOT NULL,
  PRICE DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (MFR_ID, PRODUCT_ID)
);