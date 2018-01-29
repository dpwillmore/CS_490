
CREATE TABLE Tutor(
	tutorId integer,
	lastName varchar(20),
	firstName varchar(20),
	summary varchar(250), --text type is too big 
  availability varchar(250)
    PRIMARY KEY(tutorId));

CREATE TABLE Student(
	studentId integer,
	lastName varchar(20),
	firstName varchar(20),
	summary varchar(250), --text type is too big 
  availability varchar(250)
    PRIMARY KEY(tutorId));
    
insert into Guest values(101,'Washington','George','666-666-6666');
insert into Guest values(102,'Smith','Jane','666-666-APES');
insert into Guest values(103,'Iacobelli','Francisco','666-66T-EACH');
insert into Guest values(104,'Trump','Donald','666-USA-OVER');
insert into Guest values(105,'Jackson','Elmore','666-NOT-REAL');

insert into Booking values(101,'2014-08-01','2014-08-31', 500);
insert into Booking values(102,'2014-07-01','2014-07-31', 500);
insert into Booking values(102,'2015-07-01','2015-07-31', 500);
insert into Booking values(103,'2014-09-01','2014-09-30', 500);

insert into Guest values(106,'Boyd','James','708-788-8065');

-- insert into Booking values(105,'2017-09-01','2017-09-30');

#2.1
CREATE TABLE Room(
	roomNo integer,
    address varchar(25),
	city varchar(15),
	state char(2),
    zipcode integer,
    aptNo varchar(5),
    PRIMARY KEY(roomNo,address),
    UNIQUE(roomNo));

#2.2
insert into Room values(1,'752 Franklin','Brookyln','NY',11238,'4');
insert into Room values(2,'815 St Johns','Brookyln','NY',11216,'2a');
insert into Room values(3,'12A Vernon','Brookyln','NY',11206,'4');

insert into Room values(4,'752 Franklin','Brookyln','NY',11238,null);

#3.2
ALTER TABLE Room
    ALTER aptNo SET DEFAULT '0';

#3.3
insert into Room values(5,'815 St Johns','Brookyln','NY',11216, default);

ALTER TABLE Room
    DROP aptNo ;
    
ALTER TABLE Booking
    ADD roomNo integer default 0;
    
insert into Booking values(104,'2014-06-01','2014-06-30', 650,4);

#1.1
CREATE TABLE PAYMENTS(
    paymentId INTEGER AUTO_INCREMENT,
    guestNo INTEGER,
    dateArrive DATE,
    paymentType CHAR(1),
    amount DECIMAL(8,2),
    PRIMARY KEY (PaymentID)
    );

INSERT INTO PAYMENTS VALUES(
    default,101,'2014-08-01','C',219.35
);

#1.3
INSERT INTO PAYMENTS VALUES(
    default,101,'2015-08-17','$',2500.00
);

/*#1.4
ALTER TABLE Payments ADD CONSTRAINT fk_gd
    FOREIGN KEY (paymentId)
    REFERENCES Booking (guestNo,dateArrive);*/

#1.6
INSERT INTO Booking VALUES(101,'2015-08-17','2015-08-22', 500,2);
#1.7
ALTER TABLE Payments ADD CONSTRAINT fk_gd
    FOREIGN KEY (guestNo,dateArrive)
    REFERENCES Booking (guestNo,dateArrive);

#1.8
/*INSERT INTO PAYMENTS VALUES(
    default,102,'2016-01-27','C',1500.00
);*/

#1.9
INSERT INTO Booking VALUES(
    102,'2016-03-13','2016-03-15',150,4
);

INSERT INTO PAYMENTS VALUES(
    default,102,'2016-03-13','C',300.00
);

#1.11
-- DELETE FROM Booking 
-- WHERE guestNo=102 AND dateArrive='2016-03-13';


#1.12
DELETE FROM Payments
WHERE guestNo=102 AND dateArrive='2016-03-13';

DELETE FROM Booking 
WHERE guestNo=102 AND dateArrive='2016-03-13';


#1.13
ALTER TABLE Payments
DROP FOREIGN KEY fk_gd;

ALTER TABLE Payments
ADD CONSTRAINT fk_gd FOREIGN KEY(guestNo,dateArrive)
REFERENCES Booking(guestNo,dateArrive)
ON DELETE CASCADE;

#1.14
INSERT INTO Booking VALUES(
    102,'2016-03-15','2016-03-17',150,4
);

INSERT INTO Payments VALUES(
    default,102,'2016-03-15','C',300.00
);

INSERT INTO Booking VALUES(
    101,'2016-03-15','2016-03-17',150,2
);

INSERT INTO Payments VALUES(
    default,101,'2016-03-15','C',300.00
);

#1.16
DELETE FROM Booking 
WHERE guestNo=101 AND dateArrive='2016-03-15';
