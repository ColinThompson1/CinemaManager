#CUSTOMER ####################################################

#store CUSTOMER info
INSERT
INTO CUSTOMERS (ID, FNAME, LNAME, BDATE, SEX, ADDRESS, CREDIT_CARD_NO, EMAIL, PHONE_NO)
VALUES (<respective values>)

#update customer info


#check/retrieve customer
#delete customer info

#MOVIE #######################################################

#store movie information
INSERT
INTO MOVIE (ID, TITLE, RELEASE_DATE, LENGTH, EARNINGS, AIR_LENGTH, POSTER_PATH)
VALUES (<respective values>)

#retrieve movie info
#update movie info
#delete movie info

#CONCESSIONS #################################################

#store concessions info
INSERT
INTO CONCESSIONS(SKU, ITEM, PRICE, BARCODE)
VALUES (<respective values>)

#retrieve concessions info
#update concessions info
#delete concessions info

#ADVERTISERS #################################################

#store adverstiser info
INSERT
INTO ADVERTISERS (ID, AD_COMPANY, REP_NAME, REP_EMAIL, REP_PHONE_NO)
VALUES (<respective values>)

#retrieve concessions info
#update concessions info
#delete concessions info

#AUDITORIUM ##################################################

#store auditorium info
INSERT
INTO AUDITORIUM (AUD_NO, SEAT_COUNT, LOCATION, SHOWING_ID)
VALUES (<respective values>)

#retrieve concessions info
#update concessions info
#delete concessions info

#DEPARTMENT ##################################################

#store department info
INSERT
INTO DEPARTMENT (DNO, MNGR_SSN, DNAME)
VALUES (<respective values>)

#retrieve concessions info
#update concessions info
#delete concessions info

#EMPLOYEE ####################################################

#store employee info
INSERT
INTO EMPLOYEE (SSN, FNAME, LNAME, BDATE, DNO, SUPERSSN, SEX, ADDRESS, PHONE_NO, SALARY, EMAIL)
VALUES (<respective values>)

#retrieve concessions info
#update concessions info
#delete concessions info

#SHOWING #####################################################

#store showing info
INSERT
INTO SHOWING (ID, START_TIME, PRICE, MOVIE_ID)
VALUES (<respective values>)

#retrieve showing info
#update showing info
#delete showing info


#TICKETS #####################################################

#store ticket info
INSERT
INTO TICKETS (ID, SEAT_NO, SHOWING_ID, CUSTOMER_ID)
VALUES (<respective values>)

#retrieve ticket info
#update ticket info
#delete ticket info