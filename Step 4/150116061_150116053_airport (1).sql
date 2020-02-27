
create database Ataturk_Airport
use Ataturk_Airport

create table Airport 
(
	AirportID varchar(3) not null,
	name varchar(30) not null,
	City varchar(20),
	Constraint Airport_PK primary key(AirportID)
);
insert into Airport values('IST','Istanbul Airport','Istanbul')
insert into Airport values('SGK', 'Selanik Airport','Selanik')
insert into Airport values('CIA', 'Ciampino Airport', 'Rome')
insert into Airport values('SXF', 'Berlin Schonefeld', 'Berlin')
insert into Airport values('BCN', 'Barcelona Airport', 'Barcelona')
insert into Airport values('AMS', 'Amsterdam Schiphol Airport', 'Amsterdam')
insert into Airport values('PRG', 'Vaclav Havel Airport', 'Prague')
insert into Airport values('VIE','Vienna Airport', 'Vienna')
insert into Airport values('WAW','Varsaw Chopin Airport', 'Warsaw')
insert into Airport values('BUD','Budapest Ferenc Liszt Airport', 'Budapest')
insert into Airport values('BRU', 'Brussel Airport', 'Brussel')
insert into Airport values('CDG', 'Paris Charles Gualle Airport', 'Paris')
insert into Airport values('NAP', 'Naples Airport', 'Napels')
insert into Airport values('LGW', 'London Gatwick Airport','London')
insert into Airport values('STR', 'Stuttgard Airport', 'Stuttgard')
insert into Airport values('JFK', 'John F. Keneddy Airport', 'New York')
insert into Airport values('ESB', 'Esenboga Airport', 'Ankara')
insert into Airport values('ADB', 'Adnan Menderes Airport','Izmir')
insert into Airport values('AYT', 'Antalya Airport','Antalya')
insert into Airport values('TZX', 'Trabzon Airport','Trabzon')
insert into Airport values('DLM', 'Dalaman Airport', 'Mugla')

alter table Airport
Add Constraint CN_name
Unique (name)

create table Vehicle
(
	VehicleID int not null,
	Model int,
	Color varchar(15),
	Constraint Vehicle_PK primary key(VehicleID)
);
insert into Vehicle values(1,2019,'Black')
insert into Vehicle values(2,2016,'Yellow')
insert into Vehicle values(3,2012,'Red')
insert into Vehicle values(4,2002,'White')
insert into Vehicle values(5,2005,'White')
insert into Vehicle values(6,2011,'Blue')
insert into Vehicle values(7,2012,'White')
insert into Vehicle values(8,2013,'Purple')
insert into Vehicle values(9,2014,'Gray')
insert into Vehicle values(10,1996,'Green')
insert into Vehicle values(11,1975,'Yellow')
insert into Vehicle values(12,2000,'White')
insert into Vehicle values(13,2010,'White')
insert into Vehicle values(14,2009,'Yellow')
insert into Vehicle values(15,1993,'Yellow')
insert into Vehicle values(16,2011,'White')
insert into Vehicle values(17,2015,'White')
insert into Vehicle values(18,2008,'Purple')
insert into Vehicle values(19,2010,'White')
insert into Vehicle values(20,1995,'Purple')
insert into Vehicle values(21,2015,'White')
insert into Vehicle values(22,2015,'White')
insert into Vehicle values(23,2015,'White')
insert into Vehicle values(24,2015,'White')
insert into Vehicle values(25,2015,'White')
insert into Vehicle values(26,2015,'White')
insert into Vehicle values(27,2015,'White')
insert into Vehicle values(28,2015,'White')
insert into Vehicle values(29,2015,'White')
insert into Vehicle values(30,2015,'White')

create table Car_Park
(
	SpaceNumber int not null,
	ArrivalTime time not null,
	LeavingTime time not null,
	ParkingLotAirportID varchar(3),
	Constraint CarPark_PK primary key(SpaceNumber),
	Constraint CarPark_FK foreign key(ParkingLotAirportID) references Airport(AirportID)
);
insert into Car_Park values(1, '10:00', '12:00','IST')
insert into Car_Park values(2, '16:00', '19:00','IST')
insert into Car_Park values(3, '11:00', '15:00','IST')
insert into Car_Park values(4, '13:00',' 17:00','IST')
insert into Car_Park values(5, '09:00', '19:00','IST')
insert into Car_Park values(6, '11:30', '18:00','IST')
insert into Car_Park values(7, '19:00', '22:00','IST')
insert into Car_Park values(8, '20:00', '01:00','IST')
insert into Car_Park values(9, '18:00', '21:00','IST')
insert into Car_Park values(10, '12:20', '15:00','IST')
insert into Car_Park values(21, '16:00', '17:00','IST')
insert into Car_Park values(22, '04:00', '09:00','IST')
insert into Car_Park values(23, '05:00', '10:00','IST')
insert into Car_Park values(24, '11:00','13:00','IST')
insert into Car_Park values(25, '09:45', '19:15','IST')
insert into Car_Park values(26, '12:15', '18:00','IST')
insert into Car_Park values(27, '16:45', '18:00','IST')
insert into Car_Park values(28, '20:00', '21:00','IST')
insert into Car_Park values(29, '18:00', '20:15','IST')
insert into Car_Park values(30, '16:20', '09:00','IST')

create table Apron
(
	ApronNumber int not null,
	ArrivalTime time not null,
	LeavingTime time not null,
	ApronAirportID varchar(3),
	Constraint Apron_PK primary key(ApronNumber),
	Constraint Apron_FK foreign key(ApronAirportID) references Airport(AirportID)
);

insert into Apron values(11, '16:00', '17:00','IST')
insert into Apron values(12, '04:00', '09:00','IST')
insert into Apron values(13, '05:00', '10:00','IST')
insert into Apron values(14, '11:00', '13:00','IST')
insert into Apron values(15, '09:45', '19:15','IST')
insert into Apron values(16, '12:15', '18:00','IST')
insert into Apron values(17, '16:45', '18:00','IST')
insert into Apron values(18, '20:00', '21:00','IST')
insert into Apron values(19, '18:00', '20:45','IST')
insert into Apron values(20, '16:20', '09:00','IST')

create table Car
(
	PlateNumber varchar(11) not null,
	CarVehicleID int,
	DailyPrice money,
	CarSpaceNumber int,
	Constraint Car_PK primary key(PlateNumber),
	Constraint Car_FK1 foreign key(CarSpaceNumber) references Car_Park(SpaceNumber),
	Constraint Car_FK2 foreign key(CarVehicleID) references Vehicle(VehicleID)
);
insert into Car values('01 OCK 1998',1,80,1)
insert into Car values('77 YLV 1998',2,60,2)
insert into Car values('16 ERT 34',3,70,3)
insert into Car values('03 SCK 766',4,90,4)
insert into Car values('34 RMN 654',5,50,5)
insert into Car values('77 TTR 8465',6,100,6)
insert into Car values('82 BRN 3636',7,70,7)
insert into Car values('10 HAZ 1998',8,80,8)
insert into Car values('34 GS 1905',9,65,9)
insert into Car values('34 BJK 1903',10,70,10)

create table Plane
(
	PlaneID varchar(7) not null,
	Capacity int,
	PlaneType varchar(30),
	HourlyPrice money,
	DailyPrice money,
	ApronNumber int,
	PlaneVehicleID int ,
	Constraint Plane_PK primary key(PlaneID),
	Constraint Plane_FK1 foreign key(PlaneVehicleID) references Vehicle(VehicleID),
	Constraint Plane_FK2 foreign key(ApronNumber) references Apron(ApronNumber),
)
insert into Plane values('5H-MAD',200, 'Mid Size Passenger jet',20,300, 11, 11)
insert into Plane values('5S-DAD',250, 'Mid Size Passenger jet',20,300, 12, 12)
insert into Plane values('5Y-LOD',220, 'Mid Size Passenger jet',20,300, 13, 13)
insert into Plane values('SK-TOT',100, 'Light Passenger Jet',10,150, 14, 14)
insert into Plane values('INS-OT',120, 'Light Passenger Jet',10,150, 15, 15)
insert into Plane values('SOL-A',160, 'Light Passenger Jet',10,150, 16, 16)
insert into Plane values('5S-HGS',200, 'Mid Size Passenger jet',20,300, 17, 17)
insert into Plane values('LMN-HZ',260, 'Jumbo Passenger Jet',30,450, 18, 18)
insert into Plane values('ASD-DA',300, 'Jumbo Passenger Jet',30,450, 19, 19)
insert into Plane values('12-SAD',260, 'Jumbo Passenger Jet',30,450, 20, 20)

create table Airport_Vehicle
(
	PlateNumber varchar(9) not null,
	Vehicle_Type varchar(30),
	AirportVehicleSpaceNumber int,
	AirportVehicleID int,
	Constraint Airport_Vehicle_PK primary key(PlateNumber),
	Constraint Airport_Vehicle_FK2 foreign key(AirportVehicleID) references Vehicle(VehicleID),
	Constraint Airport_Vehicle_FK1 foreign key(AirportVehicleSpaceNumber) references Car_Park(SpaceNumber)
);
insert into Airport_Vehicle values('34 INS 90','Pushback tug',21,21)
insert into Airport_Vehicle values('34 INS 91','Apron bus',22,22)
insert into Airport_Vehicle values('34 INS 92','Apron bus',23,23)
insert into Airport_Vehicle values('34 INS 93','Container loader',24,24)
insert into Airport_Vehicle values('34 INS 94','Refuel truck',25,25)
insert into Airport_Vehicle values('34 INS 95','Fire truck',26,26)
insert into Airport_Vehicle values('34 INS 96','Ambulance',27,27)
insert into Airport_Vehicle values('34 INS 97','Belt loader',28,28)
insert into Airport_Vehicle values('34 INS 98','Refuel truck',29,29)
insert into Airport_Vehicle values('34 INS 99','Belt loader',30,30)

create table Airport_Store
(
	BlockNumber int not null,
	name varchar(15) not null,
	ContractDate date,
	StoreAirportID varchar(3),
	Constraint Airport_Store_PK primary key(BlockNumber),
	Constraint Airport_Store_FK1 foreign key(StoreAirportID) references Airport(AirportID),
);
insert into Airport_Store values(1, 'Free Shop', '01-01-2029', 'IST')
insert into Airport_Store values(2, 'Starbucks', '01-01-2030', 'IST')
insert into Airport_Store values(3, 'McDonalds', '01-01-2035', 'IST')
insert into Airport_Store values(4, 'Burger King', '01-01-2040', 'IST')
insert into Airport_Store values(5, 'Shake Shake', '01-01-2025', 'IST')
insert into Airport_Store values(6, 'Szimpla Kert', '01-01-2019', 'IST')
insert into Airport_Store values(7, 'Morrisons', '01-01-2024', 'IST')
insert into Airport_Store values(8, 'Instant', '01-01-2031', 'IST')
insert into Airport_Store values(9, 'Pontoon', '01-01-2050', 'IST')
insert into Airport_Store values(10, 'Grange', '01-01-2011', 'IST')

alter table Airport_Store
Add Constraint CN_StoreName
unique (name)

create table Supplier 
(
	SupplierID int not null,
	name varchar(20),
	district varchar(15),
	city varchar(10),
	Constraint Supplier_PK primary key(SupplierID)
);
insert into Supplier values(1, 'Ertugrul','Kadikoy', 'Istanbul')
insert into Supplier values(2, 'Eray', 'Beylikduzu', 'Istanbul')
insert into Supplier values(3, 'Mete', 'Kadikoy','Istanbul')
insert into Supplier values(4, 'Furkan Kuse', 'Maltepe', 'Istanbul')
insert into Supplier values(5, 'Furkan Kemal','Maltepe', 'Istanbul')
insert into Supplier values(6, 'Faruk','Sancaktepe', 'Istanbul')
insert into Supplier values(7, 'Berk','Kadikoy', 'Istanbul')
insert into Supplier values(8, 'Rahim','Maltepe', 'Istanbul')
insert into Supplier values(9, 'Mahir','Mecidiyekoy', 'Istanbul')
insert into Supplier values(10, 'Erdal','Merter', 'Istanbul')


create table Supplies
(
	SSupplierID int not null,
	SBlockNumber int not null,
	UnitPrice int,
	ProductType varchar(20),
	Constraint Supplies_PK primary key(SBlockNumber,SSupplierID),
	Constraint Supplies_FK1 foreign key(SSupplierID) references Supplier(SupplierID),
	Constraint Supplies_FK2 foreign key(SBlockNumber) references Airport_Store(BlockNumber)
);
insert into Supplies values(1, 1, 200,'Technology')
insert into Supplies values(2, 2, 210,'Food')
insert into Supplies values(3, 3, 220,'Clothes')
insert into Supplies values(4, 4, 300,'Drinks')
insert into Supplies values(5, 5, 500,'Alcohol')
insert into Supplies values(6, 6, 100,'Cosmetic')
insert into Supplies values(7, 7, 550,'Tobacco')
insert into Supplies values(8, 8, 900,'Desserts')
insert into Supplies values(9, 9, 100,'Coffee')
insert into Supplies values(10, 10, 100,'Technology')


create table Person
(
	TCKN numeric(11,0) not null,
	name varchar(20) not null,
	Street varchar(15),
	City varchar(15),
	Constraint Person_PK primary key(TCKN)
);
--passenger
insert into Person values(12345678900,'Eray','Ali Çebi','Ýstanbul')
insert into Person values(12345678901,'Ertuðrul','Volkan','Ýstanbul')
insert into Person values(12345678902,'Evrim','Savaþ','Ýstanbul')
insert into Person values(12345678903,'Berk','Hürriyet','Ýstanbul')
insert into Person values(12345678904,'Faruk','Milliyet','Ýstanbul')
insert into Person values(12345678905,'Rahim','Atatürk','Ýstanbul')
insert into Person values(12345678906,'Süleyman','Cumhuriyet','Ýstanbul')
insert into Person values(12345678907,'Eren','Galatasaray','Ýstanbul')
insert into Person values(12345678908,'Emre','Beþiktaþ','Ýstanbul')
insert into Person values(12345678909,'Kemal','Akdeniz','Ýstanbul')
--manager
insert into Person values(12345678910,'Mete','Eðitim','Ýstanbul')
insert into Person values(12345678911,'Abdullah','Mekez','Ýstanbul')
insert into Person values(12345678912,'Semrin','Kent','Ýstanbul')
insert into Person values(12345678913,'Beyza','Köy','Ýstanbul')
insert into Person values(12345678914,'Büþra','Barýþ','Ýstanbul')
insert into Person values(12345678915,'Çaðla','Çaðdaþ','Ýstanbul')
insert into Person values(12345678916,'Ezgi','Cumhuriyet','Ýstanbul')
insert into Person values(12345678917,'Sevcan','Galatasaray','Ýstanbul')
insert into Person values(12345678918,'Melis','Beþiktaþ','Ýstanbul')
insert into Person values(12345678919,'Ýrem','Akdeniz','Ýstanbul')
--technician
insert into Person values(12345678920,'Miray','Ali Çebi','Ýstanbul')
insert into Person values(12345678921,'Almila','Volkan','Ýstanbul')
insert into Person values(12345678922,'Hicran','Savaþ','Ýstanbul')
insert into Person values(12345678923,'Didem','Hürriyet','Ýstanbul')
insert into Person values(12345678924,'Ýmge','Milliyet','Ýstanbul')
insert into Person values(12345678925,'Þevval','Atatürk','Ýstanbul')
insert into Person values(12345678926,'Amporo','Cumhuriyet','Ýstanbul')
insert into Person values(12345678927,'Simon','Galatasaray','Ýstanbul')
insert into Person values(12345678928,'Coline','Beþiktaþ','Ýstanbul')
insert into Person values(12345678929,'Mary','Akdeniz','Ýstanbul')
--traffic controller
insert into Person values(12345678930,'Pierre','Ali Çebi','Ýstanbul')
insert into Person values(12345678931,'Reka','Volkan','Ýstanbul')
insert into Person values(12345678932,'Berfin','Savaþ','Ýstanbul')
insert into Person values(12345678933,'Berk','Hürriyet','Ýstanbul')
insert into Person values(12345678934,'Gülþah','Milliyet','Ýstanbul')
insert into Person values(12345678935,'Ayça','Atatürk','Ýstanbul')
insert into Person values(12345678936,'Berre','Cumhuriyet','Ýstanbul')
insert into Person values(12345678937,'Gülce','Galatasaray','Ýstanbul')
insert into Person values(12345678938,'Melisa','Beþiktaþ','Ýstanbul')
insert into Person values(12345678939,'Ekin','Akdeniz','Ýstanbul')
--emergency service
insert into Person values(12345678940,'Rabia','Ali Çebi','Ýstanbul')
insert into Person values(12345678941,'Miray','Volkan','Ýstanbul')
insert into Person values(12345678942,'Ekrem','Savaþ','Ýstanbul')
insert into Person values(12345678943,'Mervan','Hürriyet','Ýstanbul')
insert into Person values(12345678944,'Hilal','Milliyet','Ýstanbul')
insert into Person values(12345678945,'Ýzzy','Atatürk','Ýstanbul')
insert into Person values(12345678946,'Demet','Cumhuriyet','Ýstanbul')
insert into Person values(12345678947,'Kübra','Galatasaray','Ýstanbul')
insert into Person values(12345678948,'Dilara','Beþiktaþ','Ýstanbul')
insert into Person values(12345678949,'Elif','Akdeniz','Ýstanbul')
--Pilot 
insert into Person values(12345678950,'Sena','Ali Çebi','Ýstanbul')
insert into Person values(12345678951,'Ece','Volkan','Ýstanbul')
insert into Person values(12345678952,'Orkun','Savaþ','Ýstanbul')
insert into Person values(12345678953,'Esra','Hürriyet','Ýstanbul')
insert into Person values(12345678954,'Çaðatay','Milliyet','Ýstanbul')
insert into Person values(12345678955,'Hasan','Atatürk','Ýstanbul')
insert into Person values(12345678956,'Dilruba','Cumhuriyet','Ýstanbul')
insert into Person values(12345678957,'Elmas','Galatasaray','Ýstanbul')
insert into Person values(12345678958,'Aleyna','Beþiktaþ','Ýstanbul')
insert into Person values(12345678959,'Zeynep','Akdeniz','Ýstanbul')


create table Person_Phone_Number 
(
	TCKN numeric(11,0) not null,
	phoneNumber numeric(11,0) not null,
	Constraint Person_Phone_Number_PK primary key (TCKN,phoneNumber),
	Constraint Person_Phone_Number_FK foreign key(TCKN) references Person(TCKN)

);
--passenger
insert into Person_Phone_Number values(12345678900,5345678900)
insert into Person_Phone_Number values(12345678901,5345678901)
insert into Person_Phone_Number values(12345678902,5345678902)
insert into Person_Phone_Number values(12345678903,5345678903)
insert into Person_Phone_Number values(12345678904,5345678904)
insert into Person_Phone_Number values(12345678905,5345678905)
insert into Person_Phone_Number values(12345678906,5345678906)
insert into Person_Phone_Number values(12345678907,5345678907)
insert into Person_Phone_Number values(12345678908,5345678908)
insert into Person_Phone_Number values(12345678909,5345678909)
insert into Person_Phone_Number values(12345678910,5345678910)
--manager
insert into Person_Phone_Number values(12345678911,5345678911)
insert into Person_Phone_Number values(12345678912,5345678912)
insert into Person_Phone_Number values(12345678913,5345678913)
insert into Person_Phone_Number values(12345678914,5345678914)
insert into Person_Phone_Number values(12345678915,5345678915)
insert into Person_Phone_Number values(12345678916,5345678916)
insert into Person_Phone_Number values(12345678917,5345678917)
insert into Person_Phone_Number values(12345678918,5345678918)
insert into Person_Phone_Number values(12345678919,5345678919)
insert into Person_Phone_Number values(12345678921,5345678920)
--technician
insert into Person_Phone_Number values(12345678921,5345678921)
insert into Person_Phone_Number values(12345678922,5345678922)
insert into Person_Phone_Number values(12345678923,5345678923)
insert into Person_Phone_Number values(12345678924,5345678924)
insert into Person_Phone_Number values(12345678925,5345678925)
insert into Person_Phone_Number values(12345678926,5345678926)
insert into Person_Phone_Number values(12345678927,5345678927)
insert into Person_Phone_Number values(12345678928,5345678928)
insert into Person_Phone_Number values(12345678929,5345678929)
insert into Person_Phone_Number values(12345678930,5345678930)
--traffic controller
insert into Person_Phone_Number values(12345678931,5345678931)
insert into Person_Phone_Number values(12345678932,5345678932)
insert into Person_Phone_Number values(12345678933,5345678933)
insert into Person_Phone_Number values(12345678934,5345678934)
insert into Person_Phone_Number values(12345678935,5345678935)
insert into Person_Phone_Number values(12345678936,5345678936)
insert into Person_Phone_Number values(12345678937,5345678937)
insert into Person_Phone_Number values(12345678938,5345678938)
insert into Person_Phone_Number values(12345678939,5345678939)
insert into Person_Phone_Number values(12345678940,5345678940)
--emergency service
insert into Person_Phone_Number values(12345678941,5345678941)
insert into Person_Phone_Number values(12345678942,5345678942)
insert into Person_Phone_Number values(12345678943,5345678943)
insert into Person_Phone_Number values(12345678944,5345678944)
insert into Person_Phone_Number values(12345678945,5345678945)
insert into Person_Phone_Number values(12345678946,5345678946)
insert into Person_Phone_Number values(12345678947,5345678947)
insert into Person_Phone_Number values(12345678948,5345678948)
insert into Person_Phone_Number values(12345678949,5345678949)
--Pilot 
insert into Person_Phone_Number values(12345678950,5345678950)
insert into Person_Phone_Number values(12345678951,5345678951)
insert into Person_Phone_Number values(12345678952,5345678952)
insert into Person_Phone_Number values(12345678953,5345678953)
insert into Person_Phone_Number values(12345678954,5345678954)
insert into Person_Phone_Number values(12345678955,5345678955)
insert into Person_Phone_Number values(12345678956,5345678956)
insert into Person_Phone_Number values(12345678957,5345678957)
insert into Person_Phone_Number values(12345678958,5345678958)
insert into Person_Phone_Number values(12345678959,5345678959)

create table Employee
(
	EmployeeID int not null,
	Salary money,
	EmployeeTCKN numeric(11,0),
	EmployeeAirportID varchar(3),
	HireDate date,
	Constraint Employee_PK primary key(EmployeeID),
	Constraint Employee_FK1 foreign key(EmployeeTCKN) references Person(TCKN),
	Constraint Employee_FK2 foreign key(EmployeeAirportID) references Airport(AirportID)
	
);
--manager
insert into Employee values(1,6000,12345678910,'IST','10-12-2018')
insert into Employee values(2,6000,12345678911,'IST','05-10-2013')
insert into Employee values(3,6000,12345678912,'IST','04-23-2014')
insert into Employee values(4,6000,12345678913,'IST','04-05-2003')
insert into Employee values(5,6000,12345678914,'IST','11-24-2003')
insert into Employee values(6,6000,12345678915,'IST','10-24-2007')
insert into Employee values(7,6000,12345678916,'IST','09-14-2009')
insert into Employee values(8,6000,12345678917,'IST','05-02-2017')
insert into Employee values(9,6000,12345678918,'IST','08-07-2012')
insert into Employee values(10,6000,12345678919,'IST','06-08-2013')
--technician
insert into Employee values(11,3000,12345678920,'IST','04-05-2003')
insert into Employee values(12,3000,12345678921,'IST','07-21-2017')
insert into Employee values(13,3000,12345678922,'IST','05-31-2016')
insert into Employee values(14,3000,12345678923,'IST','03-21-2013')
insert into Employee values(15,3000,12345678924,'IST','07-30-2013')
insert into Employee values(16,3000,12345678925,'IST','08-23-2012')
insert into Employee values(17,3000,12345678926,'IST','12-23-2015')
insert into Employee values(18,3000,12345678927,'IST','12-22-2011')
insert into Employee values(19,3000,12345678928,'IST','11-24-2011')
insert into Employee values(20,3000,12345678929,'IST','11-14-2009')
--traffic controller
insert into Employee values(21,3000,12345678930,'IST','05-23-2011')
insert into Employee values(22,3000,12345678931,'IST','05-29-2010')
insert into Employee values(23,3000,12345678932,'IST','06-28-2009')
insert into Employee values(24,3000,12345678933,'IST','07-21-2008')
insert into Employee values(25,3000,12345678934,'IST','12-23-2007')
insert into Employee values(26,3000,12345678935,'IST','12-31-2007')
insert into Employee values(27,3000,12345678936,'IST','10-24-2006')
insert into Employee values(28,3000,12345678937,'IST','12-01-2005')
insert into Employee values(29,3000,12345678938,'IST','02-14-2004')
insert into Employee values(30,3000,12345678939,'IST','03-14-2003')
--emergency service
insert into Employee values(31,3000,12345678940,'IST','04-07-2013')
insert into Employee values(32,3000,12345678941,'IST','04-21-2013')
insert into Employee values(33,3000,12345678942,'IST','03-12-2013')
insert into Employee values(34,3000,12345678943,'IST','06-21-2013')
insert into Employee values(35,3000,12345678944,'IST','12-20-2013')
insert into Employee values(36,3000,12345678945,'IST','12-29-2019')
insert into Employee values(37,3000,12345678946,'IST','12-31-2013')
insert into Employee values(38,3000,12345678947,'IST','02-11-2011')
insert into Employee values(39,3000,12345678948,'IST','01-10-2019')
insert into Employee values(40,3000,12345678949,'IST','09-01-2013')


create table Manager
(
	ManagerEmployeeID int,
	Department varchar(10),
	Constraint Manager_PK primary key(ManagerEmployeeID),
	Constraint Manager_FK foreign key(ManagerEmployeeID) references Employee (EmployeeID)
);
insert into Manager values(1, 'Technic')
insert into Manager values(2, 'Technic')
insert into Manager values(3, 'Technic')
insert into Manager values(4, 'Traffic')
insert into Manager values(5, 'Traffic')
insert into Manager values(6, 'Traffic')
insert into Manager values(7, 'Emergency')
insert into Manager values(8, 'Emergency')
insert into Manager values(9, 'Emergency')
insert into Manager values(10, 'Management')

create table Technician 
(
	TechnicEmployeeID int not null,
	Field varchar(20),
	ManagerID int references Manager(ManagerEmployeeID) not null,
	Constraint Technician_Controller_PK primary key(TechnicEmployeeID,ManagerID),
	Constraint Technician_FK foreign key(ManagerID) references Manager(ManagerEmployeeID)
);
insert into Technician values(11,'Cargo',1)
insert into Technician values(12,'Cargo',1)
insert into Technician values(13,'Cargo',1)
insert into Technician values(14,'Engine',2)
insert into Technician values(15,'Engine',2)
insert into Technician values(16,'Engine',2)
insert into Technician values(17,'Maintanance',3)
insert into Technician values(18,'Maintanance',3)
insert into Technician values(19,'Maintanance',3)
insert into Technician values(20,'Maintanance',3)

create table Traffic_Controller
(
	ControlEmployeeID int not null,
	ControllerLocation varchar(20),
	ManagerID int not null,
	Constraint Traffic_Controller_PK primary key(ControlEmployeeID,ManagerID),
	Constraint Traffic_Controller_FK foreign key(ManagerID) references Manager(ManagerEmployeeID)
);
insert into Traffic_Controller values(21,'Terminal traffic',4)
insert into Traffic_Controller values(22,'Terminal traffic',4)
insert into Traffic_Controller values(23,'Terminal traffic',4)
insert into Traffic_Controller values(24,'Apron Traffic',5)
insert into Traffic_Controller values(25,'Apron Traffic',5)
insert into Traffic_Controller values(26,'Apron Traffic',5)
insert into Traffic_Controller values(27,'Air Traffic',6)
insert into Traffic_Controller values(28,'Air Traffic',6)
insert into Traffic_Controller values(29,'Air Traffic',6)
insert into Traffic_Controller values(30,'Air Traffic',6)

create table Emergency_Service
(
	EmergecnyEmployeeID int not null,
	EmergencyServicetype varchar(20),
	EmergencyNumber numeric(3,0),
	ManagerID int not null,
	Constraint Emergency_Service_PK primary key(EmergecnyEmployeeID,ManagerID),
	Constraint Emergency_Service_FK foreign key(ManagerID) references Manager(ManagerEmployeeID)
);
insert into Emergency_Service values(31,'Fire',110,7)
insert into Emergency_Service values(32,'Fire',110,7)
insert into Emergency_Service values(33,'Fire',110,7)
insert into Emergency_Service values(34,'Ambulance',112,7)
insert into Emergency_Service values(35,'Ambulance',112,8)
insert into Emergency_Service values(36,'Ambulance',112,8)
insert into Emergency_Service values(37,'Ambulance',112,8)
insert into Emergency_Service values(38,'Security',155,9)
insert into Emergency_Service values(39,'Security',155,9)
insert into Emergency_Service values(40,'Security',155,9)


create table Pilot
(
	PilotID int not null,
	PTCKN numeric(11,0) ,
	Constraint Pilot_PK primary key(PilotID),
	Constraint Pilot_FK foreign key(PTCKN) references Person(TCKN)
);
insert into Pilot values(1, 12345678950)
insert into Pilot values(2, 12345678951)
insert into Pilot values(3, 12345678952)
insert into Pilot values(4, 12345678953)
insert into Pilot values(5, 12345678954)
insert into Pilot values(6, 12345678955)
insert into Pilot values(7, 12345678956)
insert into Pilot values(8, 12345678957)
insert into Pilot values(9, 12345678958)
insert into Pilot values(10,12345678959)


create table Employee_Certificate
(
	CertificateNumber int not null,
	CEmployeeID int,
	DateCompleted date,
	Constraint Employee_Certificate_PK primary key(CertificateNumber),
	Constraint Employee_Certificate_FK foreign key(CEmployeeID) references Employee(EmployeeID)
);
--manager
insert into Employee_Certificate values(1,1,'01-14-1968')
insert into Employee_Certificate values(2,2,'02-24-1978')
insert into Employee_Certificate values(3,3,'03-23-1964')
insert into Employee_Certificate values(4,4,'11-30-1965')
insert into Employee_Certificate values(5,5,'09-21-1956')
insert into Employee_Certificate values(6,6,'07-11-1979')
insert into Employee_Certificate values(7,7,'08-03-1961')
insert into Employee_Certificate values(8,8,'09-05-1972')
insert into Employee_Certificate values(9,9,'12-07-1973')
insert into Employee_Certificate values(10,10,'01-06-1974')
--technician
insert into Employee_Certificate values(11,11,'12-16-1978')
insert into Employee_Certificate values(12,12,'03-13-1978')
insert into Employee_Certificate values(13,13,'04-12-1988')
insert into Employee_Certificate values(14,14,'02-12-1982')
insert into Employee_Certificate values(15,15,'05-21-1983')
insert into Employee_Certificate values(16,16,'06-24-1983')
insert into Employee_Certificate values(17,17,'01-31-1984')
insert into Employee_Certificate values(18,18,'07-21-1985')
insert into Employee_Certificate values(19,19,'09-11-1986')
insert into Employee_Certificate values(20,20,'11-11-1987')
--traffic controller
insert into Employee_Certificate values(21,21,'03-25-1980')
insert into Employee_Certificate values(22,22,'04-24-1981')
insert into Employee_Certificate values(23,23,'06-28-1982')
insert into Employee_Certificate values(24,24,'08-27-1983')
insert into Employee_Certificate values(25,25,'09-17-1984')
insert into Employee_Certificate values(26,26,'10-17-1977')
insert into Employee_Certificate values(27,27,'11-15-1975')
insert into Employee_Certificate values(28,28,'02-15-1979')
insert into Employee_Certificate values(29,29,'05-21-1980')
insert into Employee_Certificate values(30,30,'08-11-1980')
--emergency service
insert into Employee_Certificate values(31,31,'11-20-1982')
insert into Employee_Certificate values(32,32,'11-23-1983')
insert into Employee_Certificate values(33,33,'10-17-1989')
insert into Employee_Certificate values(34,34,'12-10-1988')
insert into Employee_Certificate values(35,35,'12-17-1987')
insert into Employee_Certificate values(36,36,'04-03-1988')
insert into Employee_Certificate values(37,37,'05-02-1989')
insert into Employee_Certificate values(38,38,'08-07-1990')
insert into Employee_Certificate values(39,39,'09-06-1990')
insert into Employee_Certificate values(40,40,'02-05-1990')


create table Pilot_Certificate
(
	CertificateNumber int not null,
	CPilotID int not null,
	DateCompleted date not null,
	constraint Pilot_Certificate_PK primary key (CertificateNumber),
	Constraint Pilot_Certificate_FK foreign key(CPilotID) references Pilot(PilotID)
);
insert into Pilot_Certificate values(1,1,'03-31-1988')
insert into Pilot_Certificate values(2,2,'06-30-1978')
insert into Pilot_Certificate values(3,3,'09-27-1968')
insert into Pilot_Certificate values(4,4,'11-23-1977')
insert into Pilot_Certificate values(5,5,'12-06-1971')
insert into Pilot_Certificate values(6,6,'10-05-1975')
insert into Pilot_Certificate values(7,7,'08-09-1970')
insert into Pilot_Certificate values(8,8,'06-17-1980')
insert into Pilot_Certificate values(9,9,'04-14-1961')
insert into Pilot_Certificate values(10,10,'01-11-1977')

create table Passenger
(
	PassengerTCKN numeric(11,0),
	Gender char,
	LuggageWeight int,
	Constraint Passenger_PK primary key(PassengerTCKN),
	Constraint Passenger_FK foreign key(PassengerTCKN) references Person(TCKN)
);
insert into Passenger values(12345678900,'M',25)
insert into Passenger values(12345678901,'M',25)
insert into Passenger values(12345678902,'M',28)
insert into Passenger values(12345678915,'F',8)
insert into Passenger values(12345678916,'F',10)
insert into Passenger values(12345678917,'F',15)
insert into Passenger values(12345678922,'F',27)
insert into Passenger values(12345678923,'F',16)
insert into Passenger values(12345678934,'F',5)
insert into Passenger values(12345678945,'F',32)

create table Ticket
(
	TicketID varchar(6) not null,
	price money,
	TicketPassengerTCKN numeric(11,0),
	TicketType varchar(20),
	Constraint Ticket_PK primary key(TicketID),
	Constraint Ticket_FK foreign key(TicketPassengerTCKN) references Passenger(PassengerTCKN)
);
insert into Ticket values('ZKL930', 100,12345678900,'Business')
insert into Ticket values('1GR100', 300,12345678901,'Economy')
insert into Ticket values('MHR420', 700,12345678902,'Economy')
insert into Ticket values('3RD4AL', 440,12345678915,'First Class')
insert into Ticket values('L1MNHZ', 380,12345678916,'First Class')
insert into Ticket values('AMNE51', 900,12345678917,'Economy')
insert into Ticket values('06KUSH', 1200,12345678922,'Business')
insert into Ticket values('PRPLHZ', 150,12345678923,'Economy')
insert into Ticket values('THC34L', 690,12345678934,'First Class')
insert into Ticket values('H0TB0X', 500,12345678945,'Economy')



create table Flight
(
	FlightID varchar(7) not null,
	Flight_date date,
	FlightTime time,
	GoesTo varchar(3),
	ComesFrom varchar(3),
	FAirportID varchar(3),
	FPilotID int,
	Constraint Flight_PK primary key(FlightID),
	Constraint Flight_FK1 foreign key(FAirportID) references Airport(AirportID),
	Constraint Flight_FK2 foreign key(FPilotID) references Pilot(PilotID)
);
insert into Flight values('THY2342','10-11-2020','15:00','SGK',null,'IST', 1)
insert into Flight values('THY2340','08-03-2020','16:00',null,'CIA', 'IST', 2)
insert into Flight values('THY2550','05-21-2020','17:00','SXF',null, 'IST', 3)
insert into Flight values('PGT8052','02-14-2020','18:00',null,'BCN', 'IST', 4)
insert into Flight values('PGT5342','08-12-2019','19:00','AMS',null, 'IST', 5)
insert into Flight values('THY2345','01-20-2020','20:00',null,'PRG', 'IST', 6)
insert into Flight values('THY2348','12-30-2019','21:00','VIE',null, 'IST', 7)
insert into Flight values('THY2448','04-17-2020','22:00',null,'WAW', 'IST', 8)
insert into Flight values('THY5462','06-10-2020','23:00','BUD',null, 'IST', 9)
insert into Flight values('PGT7985','07-28-2020','22:30',null,'BRU', 'IST', 10)
insert into Flight values('THY1994','02-14-2020','06:30','CDG',null, 'IST', 1)
insert into Flight values('THY1458','12-30-2019','08:15',null,'NAP', 'IST', 2)
insert into Flight values('THY2545','11-28-2019','10:20','LGW',null,'IST', 3)
insert into Flight values('PGT1478','01-17-2020','13:00',null,'STR', 'IST', 4)
insert into Flight values('PGT5312','06-16-2020','14:30','JFK',null, 'IST', 5)
insert into Flight values('THY1564','12-15-2019','16:30',null,'ESB', 'IST', 6)
insert into Flight values('THY3155','12-01-2019','12:30','ADB',null,'IST', 7)
insert into Flight values('THY1148','09-09-2020','14:00',null,'AYT','IST', 8)
insert into Flight values('THY5672','06-01-2061','11:30','TZX',null,'IST', 9)
insert into Flight values('PGT9185','08-31-2020','11:00',null,'DLM','IST',10)


create table Flies
(
	PassengerTCKN numeric(11,0) ,
	PFlightID varchar(7),
	Constraint Flies_PK primary key(PassengerTCKN,PFlightID),
	Constraint Flies_FK1 foreign key(PassengerTCKN) references Passenger (PassengerTCKN),
	Constraint Flies_FK2 foreign key(PFlightID) references Flight (FlightID)
);
insert into Flies values(12345678900,'THY2545')
insert into Flies values(12345678901,'PGT5342')
insert into Flies values(12345678902,'PGT9185')
insert into Flies values(12345678915,'THY2348')
insert into Flies values(12345678916,'THY1458')
insert into Flies values(12345678917,'THY5672')
insert into Flies values(12345678922,'PGT8052')
insert into Flies values(12345678923,'THY1994')
insert into Flies values(12345678934,'PGT1478')
insert into Flies values(12345678945,'THY5462')


create table Cargo_Flight
(
	CFlightID varchar(7) not null,
	NumberOfCargo int,
	Constraint Cargo_Flight_PK primary key(CFlightID),
	Constraint Cargo_Flight_FK foreign key(CFlightID) references Flight(FlightID)
);
insert into Cargo_Flight values('THY2342', 800)
insert into Cargo_Flight values('THY2340',5000)
insert into Cargo_Flight values('THY2550',600)
insert into Cargo_Flight values('PGT8052',460)
insert into Cargo_Flight values('PGT5342',810)
insert into Cargo_Flight values('THY2345',60)
insert into Cargo_Flight values('THY2348',400)
insert into Cargo_Flight values('THY2448',500)
insert into Cargo_Flight values('THY5462',800)
insert into Cargo_Flight values('PGT7985',600)


create table Passenger_Flight
(
	PFlightID varchar(7) not null,
	NumberOfSeat int,
	NumberOfCabinAttendant int,
	Constraint Passenger_Flight_PK primary key(PFlightID),
	Constraint Passenger_Flight_FK foreign key(PFlightID) references Flight(FlightID)
);
insert into Passenger_Flight values('THY1994',220,6)
insert into Passenger_Flight values('THY1458',260,5)
insert into Passenger_Flight values('THY2545',150,7)
insert into Passenger_Flight values('PGT1478',300,3)
insert into Passenger_Flight values('PGT5342',180,5)
insert into Passenger_Flight values('THY1564',120,6)
insert into Passenger_Flight values('THY2348',250,7)
insert into Passenger_Flight values('THY1148',190,8)
insert into Passenger_Flight values('THY5672',350,4)
insert into Passenger_Flight values('PGT9185',260,6)

Go
create view PassengerDetail
AS
SELECT Person.City,Passenger.Gender, Passenger.LuggageWeight, Ticket.price, Ticket.TicketType
FROM     Person INNER JOIN Passenger ON Person.TCKN = Passenger.PassengerTCKN INNER JOIN
                  Ticket ON Passenger.PassengerTCKN = Ticket.TicketPassengerTCKN AND Ticket.TicketType = 'First Class';


Go 
create view Park
as
select Car.PlateNumber,Car.DailyPrice,Car_Park.SpaceNumber,Car_Park.ArrivalTime,Car_Park.LeavingTime
from Car INNER JOIN Car_Park ON Car.CarSpaceNumber = Car_Park.SpaceNumber
where Car.DailyPrice > 75;



go 
create view AirportDetail
as
SELECT Airport.AirportID, Airport.name, Airport.City, Airport_Store.name AS expr1, Airport_Store.ContractDate
FROM     Airport INNER JOIN Airport_Store ON Airport.AirportID = Airport_Store.StoreAirportID




go
create trigger SuppIns on Supplier
AFTER INSERT
as 
begin
	update Supplies set UnitPrice = UnitPrice -20
	select Supplier.name,Supplies.UnitPrice
	from Supplies,Supplier
	where Supplies.UnitPrice > 250 AND Supplier.SupplierID = Supplies.SSupplierID;
end


go
create trigger flights on Cargo_Flight
after delete
as 
begin 
	update Cargo_Flight set NumberOfCargo = NumberOfCargo +30
	select Cargo_Flight.CFlightID,Cargo_Flight.NumberOfCargo
	from Cargo_Flight
	where Cargo_Flight.NumberOfCargo < 700
end

go
create procedure CarDetail
	@platenumber varchar(11)
as	
	select *
	from Vehicle v INNER JOIN Car c on v.VehicleID = c.CarVehicleID INNER JOIN Car_Park p on p.SpaceNumber=c.CarSpaceNumber
	where c.PlateNumber= @platenumber
go
CREATE PROCEDURE SalaryEmp
As
select Person.TCKN, Person.name,Person_Phone_Number.phoneNumber,Employee.Salary
from Person,Person_Phone_Number,Employee
where Person.TCKN = Employee.EmployeeTCKN AND Employee.EmployeeTCKN = Person_Phone_Number.TCKN AND Employee.Salary>4500;