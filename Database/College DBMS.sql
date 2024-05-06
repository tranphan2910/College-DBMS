Create database College 
USe College
---- Create Table
CREATE TABLE Department(
	Dept_ID char(2) NOT NULL,
	Dept_Name varchar(50) NOT NULL,
	Established_Year int,
	Ins_Manager_ID varchar(10),
	constraint PK_Department primary key(Dept_ID)
)

CREATE TABLE Major (
	Major_ID char(2) NOT NULL, 
	Major_name varchar(50) NOT NULL, 
	Dept_ID char(2) NOT NULL,
	constraint PK_Major primary key(Major_ID),
	constraint FK_Major foreign key(Dept_ID) references Department(Dept_ID)
)

CREATE TABLE Student (
	Student_ID char(11) NOT NULL,
	First_name varchar(20) NOT NULL,
	Last_name varchar(20) NOT NULL,
	Dob date, 
	Gender char(1), 
	Email varchar(30),
	Major_ID char(2) NOT NULL,
	constraint PK_Student primary key(Student_ID),
	constraint FK_Student foreign key(Major_ID) references Major(Major_ID)
)
Create table Relative(
Student_ID  char(11) not null,
Relative_name varchar(20) not null,
Relative_phone bigint not null,
Gender char(1),
constraint PK_Dependent Primary key(Relative_name),
constraint FK_Dependent Foreign key(Student_ID) references Student(Student_ID),
)


CREATE TABLE Instructor(
	Ins_ID varchar(10) NOT NULL, 
	Ins_name varchar(20) NOT NULL, 
	Dob Date, 
	Dept_ID char(2) NOT NULL
	constraint PK_instructor PRIMARY KEY(Ins_ID)
	constraint FK_instructor FOREIGN KEY(Dept_ID) references Department(Dept_ID)
)

CREATE TABLE Instructor_Email(
	Ins_ID varchar(10) NOT NULL,
	Email varchar(30) NOT NULL,
	constraint PK_Instructor_Email primary key(Ins_ID,Email),
	constraint FK_Instructor_Email foreign key(Ins_ID) references Instructor(Ins_ID)
)

CREATE TABLE Course
(
Course_ID char(7) not null, 
Course_Name varchar(50) not null, 
Credits int not null, 
Room varchar(10) not null, 
Dept_ID char(2) not null,
constraint PK_Course Primary Key(Course_ID),
constraint FK_Course Foreign Key (Dept_ID) references Department(Dept_ID)
)

CREATE TABLE Enrollment(
	Student_ID char(11), 
	Course_ID char(7),  
	Enrollment_ID int,
	Term int,
	constraint PK_enrollment PRIMARY KEY (Student_ID, Course_ID, Enrollment_ID),
	constraint FK_enrollment_1 FOREIGN KEY (Course_ID) references Course(Course_ID),
	constraint FK_enrollment_2 FOREIGN KEY (Student_ID) references Student(Student_ID)	
)



CREATE TABLE Section
(
Section_ID int not null, 
Section_Types varchar(10) not null, 
Room varchar(10) not null, 
Course_ID char(7) not null, 
Ins_ID varchar(10) not null,
constraint PK_Section Primary Key(Section_ID),
constraint FK_Section1 Foreign Key (Course_ID) references Course(Course_ID),
constraint FK_Section2 Foreign Key (Ins_ID) references Instructor(Ins_ID)
)
CREATE TABLE Condition
(
	Prerequisite_Course_ID char(7), 
	Course_ID char(7),
	Constraint PK_Condition Primary Key(Prerequisite_Course_ID, Course_ID),
	Constraint FK_Condition_1 Foreign Key(Prerequisite_Course_ID) references Course(Course_ID),
	Constraint FK_Condition_2 Foreign Key( Course_ID) references Course(Course_ID)
)
---Insert Data
--Department Table
INSERT INTO Department(Dept_ID, Dept_Name, Established_Year, Ins_Manager_ID)
VALUES ('BA','School of Business',2003, 'INS21'),
		('BT','School of Biotechnology',2017, 'INS6'),
		('CE','School of Civil Engineering and Management',2021, 'INS3'),
		('EN','School of Languages',2017, 'INS7'),
		('IE','School of Industrial Engineering and Management',2009, 'INS52'),
		('IT','School of Computer Science and Engineering',2004, 'INS1'),
		('MA','Department of Mathematics',2013, 'INS4'),
		('PH','Department of Physics',2016, 'INS17'),
		('EE','School of Electrical Engineering',2004, 'INS26')

--Major Table
INSERT INTO Major(Major_ID, Major_name, Dept_ID)
VALUES ('MA','Applied Mathematics','MA'),
		('AR', 'Aquatic Resource Management', 'BT'),
		('EN','Arts in English Linguistics and Literature','EN'),
		('BT','BioTechnology','BT'),
		('BA','Business Management','BA'),
		('AE','Civil Engineering','CE'),
		('CE','Computer Engineering','IT'),
		('CS','Computer Science','IT'),
		('CM','Construction Management','CE'),
		('AC','Control Engineering and Automation','EE'),
		('DS','Data Science','IT'),
		('EE','Electronic and Telecommunication','EE'),
		('FT','Food Technology','BT'),
		('HM','Hospitality Management','BA'),
		('IE','Industrial System and Engineering','IE'),
		('IB','International Business Management','BA'),
		('LS','Logistics and Supply Chain Management','IE'),
		('MK','Marketing','BA'),
		('NE','Network Engineering','IT'),
		('SE','Space Engineering','PH')

--Table Instructor
INSERT INTO Instructor
VALUES
    ('INS1', 'Jacob Daniels', '1966-09-25', 'IT'),
    ('INS2', 'Wendy Ward', '1979-09-08', 'CE'),
    ('INS3', 'Susan Keller', '1964-01-02', 'CE'),
    ('INS4', 'Kristen Weiss', '1970-01-05','MA'),
    ('INS5', 'Kayla Crosby', '1985-08-06', 'CE'),
    ('INS6', 'Whitney Ruiz', '1971-04-07', 'BT'),
    ('INS7', 'Mary Brown', '1993-09-30', 'EN'),
    ('INS8', 'Zachary Garcia', '1992-01-12', 'IT'),
    ('INS9', 'Shari Mclaughlin', '1989-09-28', 'EN'),
    ('INS10', 'Dale Torres', '1981-12-11', 'EN'),
    ('INS16', 'Linda Nelson', '1974-08-01', 'EE'),
    ('INS17', 'Melanie Kaufman', '1987-10-13', 'PH'),
    ('INS18', 'Brian Gonzalez', '1995-10-09', 'PH'),
    ('INS19', 'Michelle Hayes', '1977-04-10', 'MA'),
    ('INS20', 'Walter Johnson', '1992-01-24', 'BT'),
    ('INS21', 'Melissa Miller', '1977-10-23', 'BA'),
    ('INS25', 'Johnny Mays', '1981-01-02', 'BT'),
    ('INS26', 'Jesse Ramirez', '1974-08-10', 'EE'),
    ('INS29', 'William Perkins', '1977-11-24', 'IT'),
    ('INS31', 'Ian Love', '1975-12-16', 'PH'),
    ('INS40', 'Jessica Sanders', '1987-09-20', 'MA'),
    ('INS46', 'Mike Patrick', '1975-02-13', 'BA'),
    ('INS48', 'Joshua Moore', '1995-10-27', 'BA'),
    ('INS52', 'Robert Potts', '1973-05-12', 'IE'),
    ('INS58','Kara Taylor','1994-10-28','EE'),
    ('INS80', 'Maureen Monroe', '1974-06-03', 'IE'),
    ('INS83', 'Hannah White', '1980-02-19', 'IE')

--Student table:
INSERT INTO Student (Student_ID,First_name, Last_name, Gender, Dob, Email, Major_ID) 
VALUES 

('ITNEIU21162','Darren', 'Snyder','F','2004-07-12','alexisnelson@example.com','NE'),
('ENENIU21138','Martin', 'Nunez','F','2002-03-16','robertsonkaitlyn@example.net','EN'),
('ITCSIU21124','Christina','Hodge','M','2003-12-29','brianbuckley@example.org','CS'),
('CECMIU21108','Eileen','Cole','M','2003-05-12','stricklandkimberly@example.org','CM'),
('ITCSIU19513','Jerry','Snyder','M','2005-01-20','randypope@example.net','CS'),
('ITCSIU20146','Tracie','Craig','F','2003-09-18','sward@example.net','CS'),
('BTARIU21124','Gregory','Fernandez','M','2004-08-23','megan37@example.net','AR'),
('CECMIU20184','Sara','Gomez','F','2003-11-28','ireed@example.com','CM'),
('CECEIU19189','Tyler','Mitchell','F','2004-05-11','gvelasquez@example.org','CE'),
('EEACIU22190','Brittany','Glover','F','2004-01-02','thamilton@example.com','AC'),
('BTARIU22745','Barbara','Webb','F','2001-03-26','hpatterson@example.com','AR'),
('CECMIU21553','Ian','Flores','M','2004-05-15','pmoore@example.com','CM'),
('PHSEIU20918','Zachary','Dunn','M','2002-11-17','alivingston@example.net','SE'),
('ITNEIU21305','Raymond','Neal','M','2002-11-27','alisonmendoza@example.com','NE'),
('EEEEIU20196','Mary','Fisher','F','2004-08-16','shahbetty@example.net','EE'),
('EEACIU19114','Amber','Cook','F','2004-12-21','tmack@example.net','AC'),
('CECMIU22971','Christian','Wilkins','M','2002-03-22','sandraanderson@example.net','CM'),
('BAMKIU19542','Dana','Marshall','F','2003-09-13','adambrewer@example.org','MK'),
('CECEIU19962','Ryan','Landry','M','2002-09-19','jessicahernandez@example.com','CE'),
('PHSEIU19147','Jason','Smith','M','2003-02-17','ethomas@example.com','SE'),
('ENENIU21199','Laurie','Lloyd','F','2002-01-04','herreramartin@example.com','EN'),
('BAMKIU20861','Elaine','Flores','F','2004-12-18','shaneortega@example.org','MK'),
('BAIBIU19142','Maria','Giles','F','2005-02-12','krystalray@example.com','IB'),
('ITNEIU19783','Ariana','Allison','F','2002-02-20','richardsonpatricia@example.org','NE'),
('BAMKIU22191', 'Harold','Mendoza','M', '2003-12-10', 'hermanmichael@example.com', 'MK'),
('EEEEIU22305', 'Patrick','Carey','M', '2002-10-12', 'wrightsteven@example.net', 'EE'),
('BTBTIU22143', 'Paula','Giles','M', '2004-04-28', 'chriswashington@example.org', 'BT'),
('ENENIU21862', 'Marcus','Jordan','M', '2002-12-16', 'zgonzalez@example.com', 'EN'),
('BABAIU20412', 'Kayla','Lopez','F', '2002-02-01', 'alyssagray@example.org', 'BA'),
('CECMIU21161', 'Paula','Powell','F', '2001-03-21', 'bianca27@example.org', 'CM'),
('CECEIU22135', 'Carol','Cameron','F', '2004-01-31', 'lisa88@example.com', 'CE'),
('CECEIU22189', 'David','Watson','M', '2004-07-02', 'martinallen@example.com', 'CE'),
('PHSEIU19161', 'Rebecca','Moore','F', '2001-07-13', 'rebecca84@example.com', 'SE'),
('PHSEIU22189', 'Jacob','Graves','M', '2001-11-15', 'johnsonrobin@example.net', 'SE'),
('BAIBIU19536', 'Stacey','Green','F', '2002-05-22', 'michaelcarey@example.net', 'IB'),
('ITDSIU21220', 'Cody','Holland','M', '2003-01-15', 'todd67@example.org', 'DS'),
('PHSEIU19128', 'Kenneth','Reed','F', '2001-07-14', 'lukegalvan@example.org', 'SE'),
('BAHMIU22192', 'Elizabeth','Delgado','F', '2001-02-28', 'loridiaz@example.com', 'HM'),
('ITNEIU20185', 'Nancy','Lopez','F', '2003-05-17', 'hendersonvanessa@example.net', 'NE'),
('CECMIU19519', 'Brenda','Hall','F', '2002-11-29', 'johnstonsandra@example.net', 'CM'),
('EEACIU20713', 'Jeffery','Williams','M', '2003-05-22', 'jnorman@example.net', 'AC'),
('ITDSIU20171', 'Paul','Cole','M', '2004-09-17', 'jason95@example.com', 'DS'),
('BTBTIU21124', 'Christopher','Rush','F', '2002-04-02', 'richardsonmelvin@example.org', 'BT'),
('ENENIU22140', 'Alex','Edwards','M', '2002-03-30', 'jessica22@example.com', 'EN'),
('ENENIU22108', 'Sherri','Robinson','M', '2001-09-09', 'bennettbarbara@example.com', 'EN'),
('BAIBIU19158', 'Russell','Baker','F', '2002-02-20', 'bradleyriggs@example.com', 'IB'),
('EEEEIU19523', 'Nicholas','Watson','M','2004-02-20', 'mclark@example.com', 'EE'),
('IELSIU19316', 'Christian','May','M', '2004-12-23', 'zachary50@example.net', 'LS'),
('BTARIU20134', 'John','Frost','M', '2001-03-05', 'ijones@example.org', 'AR'),
('PHSEIU22193', 'Michael','Johnson','M', '2002-06-11', 'michaelhorton@example.com', 'SE'),
('EEEEIU22135', 'Austin','Davis','M', '2002-10-28', 'lewismichael@example.net', 'EE'),
('BAMKIU21465', 'Katelyn','Stevenson','F', '2002-05-03', 'kgoodwin@example.net', 'MK'),
('EEACIU19704', 'Jennifer','Mcdowell','F', '2004-02-05', 'staffordjason@example.org', 'AC'),
('ITNEIU21148', 'Thomas','Rice','F' ,'2004-04-19', 'sean81@example.net', 'NE'),
('IELSIU21183', 'Patricia','Craig','M', '2001-06-29', 'thomas69@example.net', 'LS'),
('BTBTIU22479', 'Gregory','Jackson','M', '2001-09-15', 'robert78@example.com', 'BT'),
('CECMIU21482', 'Allison',' Gray','F', '2002-07-13', 'irodriguez@example.com', 'CM'),
('PHSEIU22184', 'Vanessa',' Silva','F', '2004-02-19', 'serranoanthony@example.com', 'SE')


--Relative table:
INSERT INTO RELATIVE(Student_ID, Relative_name, Relative_phone, Gender)
VALUES
('ITNEIU21162','Darren',0011355754636106,'F'),
('ENENIU21138','Martin',0017766109974239,'M'),
('CECMIU21108','Christina',0011355754636106,'F'),
('ITCSIU19513','Jerry',001236416148826,'M'),
('ITCSIU20146','Tracie',00178110632926910,'M'),
('BTARIU21124','Gregory',0014172871063246,'M'),
('CECMIU20184','Sara',001146632375253,'M'),
('CECEIU19189','Tyler',0011056177835455,'M'),
('BTARIU22745','Barbara',00122945110104193,'F'),
('EEACIU19114','Amber',001859737253754,'M'),
('CECEIU22189', 'Peter',0016497310286864,'M'),
('PHSEIU19161', 'Stacey',001645622229635,'M'),
('EEACIU20713', 'Paul',00198101103713125,'F'),
('EEEEIU22135', 'Katelyn',0014453710256294,'M'),
('ITNEIU21148', 'Rice',001492192936465,'M'),
('PHSEIU22184', 'Vanessa',0016672712221025,'M'),
('CECEIU22135', 'Carol',0013949338621089,'F'),
('EEEEIU22305', 'May',001931021106231088,'M')



--Course Table 
INSERT INTO Course(Course_ID, Course_Name,Credits, Dept_ID)
VALUES
('BA003IU','Principles of Marketing',3,'BA'),
('BA005IU','Financial Accounting', 3,'BA'),
('BA006IU','Business Communication',2,'BA'),
('BA016IU','Fundamental of Financial Management',2,'BA'),
('BA018IU','Quality Management',1,'BA'),
('BA020IU','Business Ethics',3,'BA'),
('EE097IU','Thesis',1, 'EE'),
('EE010IU','Electromagnetic Theory',1, 'EE'),
('EE049IU','Introduction to EE',3,'EE'),
('EE051IU','Principles of EE',2, 'EE'),
('IS001IU','Introduction to Industrial Engineering',2 ,'IE'),
('IS004IU','Engineering Probability & Statistics',4,'IE'),
('IS019IU','Production Management',3,'IE'),
('IS020IU','Engineering Economy',1,'IE'),
('IS090IU','Engineering Mechanics & Dynamics',2,'IE'),
('IT013IU','Algorithms & Data Structures',4,'IT'),
('IT024IU','Computer Graphics',3,'IT'),
('IT056IU','IT Project Management',4, 'IT'),
('IT058IU','Thesis',2,'IT'),
('IT069IU','Object-Oriented Programming',4,'IT'),
('IT079IU','Principles of Database Management',4, 'IT'),
('IT082IU','Internship',3, 'IT'),
('MA001IU','Calculus 1',4,'MA'),
('MA003IU','Calculus 2', 4,'MA'),
('MA023IU','Calculus 3', 2,'MA'),
('MA024IU','Differential Equations',4, 'MA'),
('PH012IU','Physics 4 (Optics & Atomics)',2, 'PH'),
('PH016IU','Physics 3 Lab',1,'PH'),
('PH025IU','Math for Engineers', 4,'PH'),
('PH028IU','Circuit theory', 2, 'PH'),
('BT155IU','General Biology',	4, 'BT'),
('CH101IU','General Chemistry',  4, 'BT'),
('CH009IU','Organic chemistry',3, 'BT'),
('BT210IU','Human physiology', 3, 'BT'),
('BT164IU','Microbiology', 2, 'BT'),
('BT207IU','Human Pharmacology',3,'BT')



--Instructor_Email Table
INSERT INTO Instructor_Email(Ins_ID,Email)
VALUES
('INS1',  'patrickgarcia@example.com'),
('INS2', 'ilang@example.com'),
('INS4',  'catherineobrien@example.com'),	
('INS5',  'danaadkins@example.com'),
('INS6',  'dianamunoz@example.org'),
('INS7',  'robert28@example.net'),
('INS8', 'rachel08@example.net'),
('INS9',  'qerickson@example.org'),
('INS10', 'james39@example.net'),
('INS16', 'porterkyle@example.com'),
('INS17', 'qhendricks@example.org'),
('INS18', 'williammartinez@example.net'),
('INS19', 'jeremy63@example.net'),
('INS20', 'bretthoward@example.net'),
('INS21', 'michael66@example.org'),
('INS25', 'deleonthomas@example.net'),
('INS26', 'jgarcia@example.net'),
('INS29', 'williamsaustin@example.org'),
('INS31', 'aaronchang@example.org'),
('INS40', 'njohnson@example.org'),
('INS46', 'wpowell@example.net'),
('INS48', 'edawson@example.net'),
('INS52', 'klane@example.net'),
('INS58', 'michael55@example.com'),
('INS80', 'richardsonemily@example.net'),
('INS83', 'jenniferprice@example.org')


--Enrollment table
INSERT INTO Enrollment
VALUES
('ITNEIU21162', 'MA023IU', 40,2,'2022-01-01'),
('ITNEIU21162', 'IT069IU', 1,1,'2021-09-01'),
('ITDSIU21220', 'MA023IU', 42,1,'2021-09-03'),
('ITDSIU21220', 'IT079IU', 2,1,'2021-09-03'),
('ITDSIU20171','MA023IU', 44,1,'2021-09-04'),
('ITDSIU20171', 'IT079IU', 46,2,'2022-01-05'),
('ITCSIU21124', 'MA023IU', 3,1,'2021-09-05'),
('ITCSIU21124', 'IT069IU', 4,2,'2022-01-04'),
('ITCSIU20146', 'MA023IU', 48,2,'2022-01-04'),
('ITCSIU20146', 'IT013IU', 5,2,'2022-01-01'),
('ITCSIU19513', 'MA023IU', 50,1,'2021-09-03'),
('ITCSIU19513','IT013IU', 6,2,'2022-01-02'),
('BTARIU21124','MA023IU', 58,2,'2021-01-04'),
('BTARIU21124','MA003IU', 7,1,'2021-09-04'),
('BTARIU22745','MA023IU', 60,2,'2022-01-02'),
('BTARIU22745','BT210IU', 8,2,'2022-01-04'),
('BTBTIU21124','MA023IU', 62,1,'2021-09-04'),
('BTBTIU21124','BT210IU', 9,1,'2021-09-05'),
('BTBTIU22479','MA023IU', 64,1,'2022-01-01'),
('BTBTIU22479','BT207IU', 10,1,'2021-09-01'),
('BTARIU20134','MA023IU', 68,2,'2022-01-02'),
('BTARIU20134','BT164IU', 11,2,'2022-01-03'),
('BTARIU20134','BT207IU', 12,2,'2022-01-01'),
('EEEEIU20196','MA023IU', 72,1,'2021-09-03'),
('EEEEIU20196','EE097IU', 13,2,'2022-01-04'),
('EEACIU19114','MA023IU', 74,1,'2022-01-03'),
('EEACIU19114','EE097IU', 14,1,'2021-09-02'),
('EEEEIU22305','MA023IU', 76,2,'2022-01-04'),
('EEEEIU22305','EE049IU', 15,2,'2022-01-05'),
('EEACIU20713','MA023IU', 78,2,'2021-01-03'),
('EEACIU20713','EE049IU', 16,2,'2022-01-01'),
('EEEEIU19523','MA023IU',80,2,'2022-01-05'),
('EEEEIU19523','EE051IU',17,1,'2021-09-03'),
('PHSEIU20918','MA023IU', 82,1,'2021-09-01'),
('PHSEIU20918','PH012IU', 18,1,'2021-09-04'),
('PHSEIU19147','MA023IU', 84,2,'2022-01-01'),
('PHSEIU19147','PH025IU', 19,1,'2021-09-05'),
('PHSEIU19161','MA023IU', 86,1, '2021-09-02'),
('PHSEIU19161','PH012IU', 20,1, '2021-09-01'),
('PHSEIU22189','MA023IU', 88,1,'2021-09-03'),
('PHSEIU22189','PH025IU', 21,1,'2021-09-02'),
('CECMIU20184','MA023IU', 90,1,'2021-09-04'),
('CECMIU20184','MA001IU', 22,2,'2022-01-01'),
('CECEIU19189','MA023IU', 92,1, '2021-09-02'),
('CECEIU19189','MA003IU', 23,1, '2021-09-03'),
('CECMIU21553','MA023IU', 24,1, '2021-09-04'),
('CECMIU22971','MA023IU', 25,2,'2022-01-03'),
('CECMIU21161','MA023IU', 26,2,'2022-01-04'),
('BAMKIU19542','MA023IU', 94,1,'2021-09-03'),
('BAMKIU19542','BA003IU', 27,1,'2021-09-05'),
('BAMKIU20861','MA023IU', 96,2,'2022-01-03'),
('BAMKIU20861','BA003IU', 28,2,'2022-01-02'),
('BAIBIU19142','MA023IU',98,2,'2022-01-05'),
('BAIBIU19142','BA006IU',29,2,'2022-01-05'),
('BAIBIU19536','MA023IU',102,2,'2022-01-04'),
('BAIBIU19536','BA003IU',30,2,'2022-01-04'),
('BAHMIU22192','MA023IU', 104,1,'2021-09-02'),
('BAHMIU22192','BA003IU', 31,2,'2022-01-03'),
('BAIBIU19142','BA005IU', 32,2,'2022-01-05'),
('BAIBIU19536','BA005IU',33, 2,'2022-01-01'),
('BAHMIU22192','BA006IU', 34,2,'2022-01-02'),
('IELSIU19316','MA023IU', 112,1,'2022-09-03'),
('IELSIU19316','IS001IU', 35,2,'2022-01-04'),
('IELSIU21183','IS004IU', 36,2,'2022-01-03'),
('IELSIU19316','IS019IU', 37,2,'2022-01-05'),
('IELSIU21183','IS019IU', 38,2,'2022-01-01'),
('IELSIU21183','MA023IU', 114,2,'2022-01-01'),
('BABAIU20412', 'MA023IU', 116,1,'2021-09-04'),
('BTBTIU22143','MA023IU', 120,2,'2022-01-04'),
('CECEIU19962','MA023IU', 122,1,'2021-09-03'),
('CECEIU22135','MA023IU', 124,1,'2021-09-02'),
('CECEIU22189','MA023IU', 126,2,'2022-01-02'),
('CECEIU19962','MA023IU',128,2,'2022-01-03'),
('PHSEIU19147','MA023IU',130,1,'2021-08-01'),
('ENENIU21199','MA023IU',132,1,'2021-08-02'),
('ITNEIU19783','MA023IU',138,2,'2022-01-05'),
('BAMKIU22191','MA023IU',140,1,'2021-09-05'),
('ENENIU21862','MA023IU',146,1,'2021-09-03'),
('BABAIU20412','MA023IU',148,2,'2022-01-04'),
('PHSEIU19128','MA023IU',164,2,'2022-01-05'),
('ITNEIU20185', 'MA023IU', 168,1,'2021-09-03'),
('CECMIU19519','MA023IU',170,2,'2022-01-04'),
('BTBTIU21124','MA023IU',176,2,'2022-01-04'),
('ENENIU22140','MA023IU',178,2,'2022-01-03'),
('ENENIU22108','MA023IU',180,1,'2021-09-02'),
('BAIBIU19158','MA023IU',182,2,'2022-01-06'),
('PHSEIU22193','MA023IU',186,2,'2022-01-05'),
('EEEEIU22135','MA023IU',188,1,'2021-09-04'),
('BAMKIU21465','MA023IU',190,1,'2021-09-05'),
('EEACIU19704','MA023IU',192,2,'2022-01-03'),
('ITNEIU21148','MA023IU',194,1,'2021-09-03'),
('CECMIU21482','MA023IU', 196,2,'2022-01-05'),
('PHSEIU22184', 'MA023IU', 198,1,'2021-09-01'),
('ENENIU21138', 'MA023IU', 200,1,'2021-09-02'),
('CECMIU21108', 'MA023IU', 202,2,'2022-01-02'),
('EEACIU22190', 'MA023IU', 204,1,'2021-09-04'),
('ITNEIU21305', 'MA023IU', 206,1,'2021-09-01'),
('BABAIU20412','IT069IU', 39, 1,'2021-09-03'),
('BAHMIU22192','IT069IU',41, 2, '2022-01-01'),
('BAIBIU19142','IT069IU',43,1,'2021-09-03'),
('BAIBIU19158','IT069IU',45,2, '2022-01-01'),
('BAIBIU19536','IT069IU',47,1,'2021-09-03'),
('BAMKIU19542','IT069IU',49,2, '2022-01-01'),
('BAMKIU20861','IT069IU',51,1,'2021-09-03'),
('BAMKIU21465','IT069IU',53,2, '2022-01-01'),
('BAMKIU22191','IT069IU',57,1,'2021-09-03'),
('BTARIU20134','IT069IU',61,2, '2022-01-01'),
('BTARIU21124','IT069IU',63,1,'2021-09-03'),
('BTARIU22745','IT069IU',65,2, '2022-01-01'),
('BTBTIU21124','IT069IU',67,1,'2021-09-03'),
('BTBTIU22143','IT069IU',69,2, '2022-01-01'),
('BTBTIU22479','IT069IU',71,1,'2021-09-03'),
('CECEIU19189','IT069IU',73,2, '2022-01-01'),
('CECEIU19962','IT069IU',75,1,'2021-09-03'),
('CECEIU22135','IT069IU',79,2, '2022-01-01'),
('CECEIU22189','IT069IU',81,1,'2021-09-03'),
('CECMIU19519','IT069IU',83,2, '2022-01-01'),
('CECMIU20184','IT069IU',85,2, '2022-01-01'),
('CECMIU21108','IT069IU',89,1,'2021-09-03'),
('CECMIU21161','IT069IU',87,2, '2022-01-01'),
('CECMIU21482','IT069IU',91,1,'2021-09-03'),
('CECMIU21553','IT069IU',93,2, '2022-01-01'),
('CECMIU22971','IT069IU',95,1,'2021-09-03'),
('EEACIU19114','IT069IU',97,2, '2022-01-01'),
('EEACIU19704','IT069IU',99,1,'2021-09-03'),
('EEACIU20713','IT069IU',101,1,'2021-09-03'),
('EEACIU22190','IT069IU',103,2, '2022-01-01'),
('EEEEIU19523','IT069IU',105,1,'2021-09-03'),
('EEEEIU20196','IT069IU',107,2, '2022-01-01'),
('EEEEIU22135','IT069IU',109,1,'2021-09-03'),
('EEEEIU22305','IT069IU',111,2, '2022-01-01'),
('ENENIU21138','IT069IU',113,1,'2021-09-03'),
('ENENIU21199','IT069IU',115,2, '2022-01-01'),
('ENENIU21862','IT069IU',117,1,'2021-09-03'),
('ENENIU22108','IT069IU',119,2, '2022-01-01'),
('ENENIU22140','IT069IU',121,1,'2021-09-03'),
('IELSIU19316','IT069IU',123,2, '2022-01-01'),
('IELSIU21183','IT069IU',125,1,'2021-09-03'),
('ITCSIU19513','IT069IU',127,1,'2021-09-03'),
('ITCSIU20146','IT069IU',129,2, '2022-01-01'),
('ITNEIU19783','IT069IU',131,1,'2021-09-03'),
('ITNEIU20185','IT069IU',135,2, '2022-01-01'),
('ITNEIU21148','IT069IU',133,1,'2021-09-03'),
('ITNEIU21305','IT069IU',137,1,'2021-09-05'),
('PHSEIU19128','IT069IU',139,2, '2022-01-01'),
('PHSEIU19147','IT069IU',141,2, '2022-01-01'),
('PHSEIU19161','IT069IU',143,1,'2021-09-03'),
('PHSEIU20918','IT069IU',145,1,'2021-09-03'),
('PHSEIU22184','IT069IU',147,1,'2021-09-03'),
('PHSEIU22189','IT069IU',149,2, '2022-01-01'),
('PHSEIU22193','IT069IU',151,1,'2021-09-03'),
('ITDSIU20171','IT069IU',153,2,'2022-01-03'),
('ITDSIU21220','IT069IU',155,1,'2021-09-03')


--Section Table 
INSERT INTO Section(Section_ID, Section_Types, Room, Course_ID, Ins_ID)
VALUES
(1000, 'Lab', 'LA1.101', 'BA003IU', 'INS46'),
(1001, 'Theory','A1.101', 'BA005IU', 'INS46'),
(1002, 'Lab','LA1.102', 'BA006IU', 'INS48'),
(1003, 'Theory','A1.102', 'BA006IU', 'INS48'),
(1004, 'Lab', 'A1.103', 'BA016IU', 'INS21'),
(1005, 'Theory', 'A1.104', 'BA003IU', 'INS21'),
(1006, 'Lab','LA1.201', 'BT155IU', 'INS20'),
(1007, 'Theory','A2.201', 'BT155IU','INS20'),
(1008, 'Lab', 'LA1.202', 'BT164IU', 'INS20'),
(1009, 'Theory', 'A2.202','BT164IU', 'INS25'),
(1010, 'Lab', 'LA1.203', 'BT207IU', 'INS25'),
(1011, 'Theory', 'A2.203', 'BT207IU', 'INS6'),
(1012, 'Lab','LA2.301', 'EE010IU', 'INS58'),
(1013, 'Theory','A2.301', 'EE010IU', 'INS58'),
(1014, 'Lab', 'LA2.302', 'EE049IU', 'INS58'),
(1015, 'Theory' , 'A2.303', 'EE097IU', 'INS26'),
(1016, 'Lab', 'LA2.304', 'EE097IU', 'INS16'),
(1017, 'Lab', 'LA2.401','IS001IU','INS52'),
(1018, 'Theory', 'A2.401', 'IS001IU','INS52'),
(1019, 'Lab', 'LA2.402', 'IS090IU', 'INS80'),
(1020, 'Theory', 'A2.402', 'IS004IU', 'INS80'),
(1021, 'Lab','LA2.501', 'IT013IU', 'INS1'),
(1022, 'Theory','A2.501', 'IT013IU', 'INS8'),
(1023, 'Lab', 'LA2.502', 'IT024IU','INS8'),
(1024, 'Theory', 'A2.502','IT024IU', 'INS29'),
(1025, 'Theory', 'LA2.503', 'IT056IU', 'INS29'),
(1026, 'Theory','A2.504', 'IT079IU','INS8'),
(1027, 'Lab','LA2.505', 'IT079IU','INS1'),
(1028, 'Lab','LA2.506', 'IT069IU','INS1'),
(1029, 'Lab', 'LA2.601', 'MA001IU', 'INS19'),
(1030, 'Theory', 'A2.601', 'MA001IU', 'INS4'),
(1031, 'Lab', 'LA2.602', 'MA003IU', 'INS40'),
(1032, 'Lab', 'LA2.603','MA023IU', 'INS4'),
(1033, 'Theory', 'A2.604', 'MA023IU', 'INS40'),
(1034, 'Lab','LA2.604','MA024IU','INS19'),
(1035, 'Lab', 'LA2.701', 'PH012IU','INS31'),
(1036, 'Theory', 'A2.702','PH016IU','INS31'),
(1037, 'Lab', 'LA2.703','PH016IU','INS18'),
(1038, 'Lab', 'LA2.704', 'PH025IU', 'INS18'),
(1039,'Theory', 'A2.705', 'PH028IU','INS17'),
(1040, 'Theory', 'A2.707', 'PH025IU', 'INS17'),
(1041, 'Theory', 'A2.701', 'PH012IU','INS31'),
(1042, 'Lab', 'LA1.401','IT058IU', 'INS8'),
(1043, 'Theory','A1.402', 'IT058IU', 'INS29')


--Condition Table
Insert into Condition (Prerequisite_Course_ID, Course_ID)
Values 
('BA003IU','BA005IU'),
('BA003IU','BA006IU'),
('BA003IU','BA016IU'),
('BA018IU','BA005IU'),
('BA003IU','BA020IU'),
('EE097IU','EE010IU'),
('EE010IU','EE049IU'),
('EE010IU','EE051IU'),
('IS001IU','IS004IU'),
('IS001IU','IS019IU'),
('IS001IU','IS020IU'),
('IS001IU','IT013IU'),
('IS001IU','IT024IU'),
('IS001IU','IT056IU'),
('IT056IU','IT058IU'),
('IT056IU','IT069IU'),
('IT056IU','IT079IU'),
('IT056IU','IT082IU'),
('MA001IU','MA003IU'),
('MA001IU','PH025IU'),
('MA003IU','MA023IU'),
('MA003IU','MA024IU'),
('PH012IU','PH028IU'),
('PH012IU','CH101IU'),
('PH012IU','CH009IU'),
('BT210IU','CH009IU'),
('BT210IU','BT164IU'),
('BT210IU','BT207IU')

------------------------------------------------------------------------------------------
-- Query câu hỏi 
--- Question 1:
select Instructor.Ins_name
from Instructor
	Join Department 
	on Instructor.Dept_ID = Department.Dept_ID
where Department.Dept_ID = 'IT'

--- Question 2:
select Condition_.Prerequisite_Course_ID, Course.Course_Name 'Prerequisite_Course_Name'
from Course 
	Join (select * 
			from Condition
			where Condition.Course_ID= 'IT058IU') as Condition_
	on Course.Course_ID = Condition_.Prerequisite_Course_ID

--- Question 3:
select Student.First_name, Student.Last_name
from Course 
	Join Enrollment on Course.Course_ID = Enrollment.Course_ID
	Join Student on Student.Student_ID = Enrollment.Enrollment_ID
where Course.Course_Name = 'Principles of Marketing' and Student.Gender= 'm'

--- Question 4:
select Instructor.Ins_ID, Instructor.Ins_name
from Department
	Join Instructor on Department.Dept_ID = Instructor.Dept_ID
	Join Section on Section.Ins_ID = Instructor.Ins_ID
where Section.Section_Types = 'Lab' and Instructor.Ins_ID like '_N%'

--- Question 5:
select Enrollment.Course_ID
from Enrollment
Group by Course_ID
Having COUNT(distinct(Student_ID)) = (select COUNT(distinct(Student_ID))
									from Student)
------------------------------------------------------------------------------------------
---- Create view
--------------------------------------------- 
Create view The_Most_Registered_Course 
AS 
select *
from Course 
where Course_ID in	(select E1.Course_ID
					from Enrollment E1
					where not exists	(select Student_ID 
										from Student
										except 
										select Student_ID
										from Enrollment E2
										where E1.Course_ID = E2.Course_ID))

select*from The_Most_Registered_Course
-------------------------------------------- 
Create view The_Course_Have_Both_Of_Lab_and_Theory
as (
select *
from Course 
where Course_ID in	(select Course_ID
					from Section 
					Group By Course_ID
					Having Count(Section_Types) >= ALL(select Count(Section_Types)
													from Section 
													Group By Course_ID)))

select*from The_Course_Have_Both_Of_Lab_and_Theory
-------------------------------------------- 
Create view Header_Of_Department 
as 
select Department.Ins_Manager_ID, Instructor.Ins_name,Department.Dept_Name
from Department
	join Instructor on Department.Ins_Manager_ID = Instructor.Ins_ID

select*from Header_Of_Department
-------------------------------------------- 
Create view All_Students_Have_The_Smallest_Age_In_Each_Course
AS
select Student.Student_ID, Student.First_name + ' ' + Student.Last_name 'Full_Name', 
Year(CURRENT_TIMESTAMP) - Year(Student.Dob) 'Age', Course.Course_ID, Course.Course_Name,
Course.Credits, Course.Dept_ID
from Student 
		join Enrollment on Student.Student_ID = Enrollment.Student_ID
		join Course on Course.Course_ID = Enrollment.Course_ID
where Student.Student_ID in (
select Student.Student_ID 
from  Student 
where Year(Student.Dob) >= All	
							(select Year(Student.Dob)
							from Student)
)

select*from All_Students_Have_The_Smallest_Age_In_Each_Course