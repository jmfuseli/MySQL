CREATE DATABASE RacingLeague;

USE Fuselier_HW3_RacingLeague;

CREATE TABLE Teams(
       Teams_TeamID_PK VARCHAR(4) NOT NULL, 
       TeamName VARCHAR(30) NOT NULL,
       PRIMARY KEY (Teams_TeamID_PK)
);
CREATE TABLE Agents(
       Agents_AgentID_PK VARCHAR(4) NOT NULL, 
       AFirstName VARCHAR(30) NOT NULL, 
       ALastName VARCHAR(30) NOT NULL, 
       Street VARCHAR(30), 
       City VARCHAR(30), 
       State CHAR(20), 
       Zip VARCHAR(10), 
       Phone CHAR(15),
       PRIMARY KEY (Agents_AgentID_PK)
);
CREATE TABLE Bikes(
       Bikes_BikeID_PK VARCHAR(4) NOT NULL, 
       BikeName VARCHAR(100) NOT NULL, 
       Description VARCHAR(1000) NOT NULL,
       PRIMARY KEY (Bikes_BikeID_PK)
);
CREATE TABLE Sponsors(
       Sponsors_SponsorID_PK VARCHAR(4) NOT NULL, 
       SponsorName VARCHAR(30) NOT NULL, 
       Street VARCHAR(30), 
       City VARCHAR(30), 
       State CHAR(20), 
       Zip VARCHAR(10), 
       Phone CHAR(15),
       PRIMARY KEY (Sponsors_SponsorID_PK)
);
CREATE TABLE Riders(
       Riders_RiderID_PK VARCHAR(4) NOT NULL, 
       RFirstName VARCHAR(30) NOT NULL, 
       RLastName VARCHAR(30) NOT NULL, 
       Street VARCHAR(30), 
       City VARCHAR(30), 
       State CHAR(20), 
       Zip VARCHAR(10), 
       Phone CHAR(15), 
       DateJoined DATE, 
       Agents_AgentID_FK VARCHAR(4) NOT NULL,
       Teams_TeamID_FK VARCHAR(4) NOT NULL,
       PRIMARY KEY (Riders_RiderID_PK),
       FOREIGN KEY (Agents_AgentID_FK) REFERENCES Agents(Agents_AgentID_PK),
       FOREIGN KEY (Teams_TeamID_FK) REFERENCES Teams(Teams_TeamID_PK)
);
CREATE TABLE Events_(
       Events_EventID_PK VARCHAR(4) NOT NULL,
       Event_Name VARCHAR(100) NOT NULL,
       Description VARCHAR(1000) NOT NULL,
       Location VARCHAR(30) NOT NULL,
       Street VARCHAR(30), 
       City VARCHAR(30), 
       State CHAR(20), 
       Zip VARCHAR(10), 
       StartDate DATE,
       EndDate DATE,
       Sponsors_SponsorID_FK VARCHAR(4) NOT NULL,
       PRIMARY KEY (Events_EventID_PK),
       FOREIGN KEY (Sponsors_SponsorID_FK) REFERENCES Sponsors(Sponsors_SponsorID_PK)
);
CREATE TABLE Races(
       Races_RaceID_PK VARCHAR(4) NOT NULL,
       RaceName VARCHAR(100) NOT NULL,
       Description VARCHAR(1000) NOT NULL,
       RaceLevel VARCHAR(30) NOT NULL,
       Location VARCHAR(30) NOT NULL,
       RaceDate DATE NOT NULL,
       StartTime VARCHAR(30) NOT NULL,
       EndTime VARCHAR(30) NOT NULL,
       Events_EventID_FK VARCHAR(4) NOT NULL,
       PRIMARY KEY (Races_RaceID_PK),
       FOREIGN KEY (Events_EventID_FK) REFERENCES Events_(Events_EventID_PK)
);
CREATE TABLE Participation(
       Participation_PID_PK VARCHAR(4) NOT NULL,
       Riders_RiderID_FK VARCHAR(4) NOT NULL,
       Races_RaceID_FK VARCHAR(4) NOT NULL,
       Bikes_BikeID_FK VARCHAR(4) NOT NULL,
       PRIMARY KEY (Participation_PID_PK),
       FOREIGN KEY (Riders_RiderID_FK) REFERENCES Riders(Riders_RiderID_PK),
       FOREIGN KEY (Races_RaceID_FK) REFERENCES Races(Races_RaceID_PK),              
       FOREIGN KEY (Bikes_BikeID_FK) REFERENCES Bikes(Bikes_BikeID_PK),
       Placement INT
);
CREATE TABLE Rider_Sponsorship(
       Rider_Sponsorship_RSID_PK VARCHAR(4) NOT NULL,
       Riders_RiderID_FK VARCHAR(4) NOT NULL,
       Sponsors_SponsorID_FK VARCHAR(4) NOT NULL,
       PRIMARY KEY (Rider_Sponsorship_RSID_PK),
       FOREIGN KEY (Riders_RiderID_FK) REFERENCES Riders(Riders_RiderID_PK),
       FOREIGN KEY (Sponsors_SponsorID_FK) REFERENCES Sponsors(Sponsors_SponsorID_PK)
);

INSERT INTO Teams
VALUES('1','Jim''s Hardware');
INSERT INTO Teams
VALUES ('2','Team Huffy 1');
INSERT INTO Teams
VALUES ('3','Team Huffy 2');
INSERT INTO Teams
VALUES ('4','Ace''s Aces');
INSERT INTO Teams
VALUES ('5','Valley Spring Riders');
INSERT INTO Teams
VALUES ('6','Team Coca Cola');

INSERT INTO Agents
VALUES ('1','Jim','Jenkins','123 One Street','Onervile','OH','83838-3838','(838) 383-8383');
INSERT INTO Agents
VALUES ('2','Lucy','Luger','234 Two Street','Twooler','MI','73737-3737','(373) 737-3737');
INSERT INTO Agents
VALUES ('3','Bob','Bright','345 Three Ave.','Threeley','PA','83737-3638','(763) 643-8738');
INSERT INTO Agents
VALUES ('4','John','Jones','4565 Four Circle','Fourlord','FL','65445-6677','(566) 363-6776');
INSERT INTO Agents
VALUES ('5','Stacey','Dagwood','5538 Five Flower Drive','Fiveville','IN','46353-4363', '(317) 363-5363');

Insert Into Bikes
Values ('1','Huffy Ignite Men''s 26-Inch','This 26 inch men''s dual suspension bicycle has a steel Monocoque suspension frame, steel suspension fork, twistshift, Falcon 18-speed derailleur, steel linear pull brakes, alloy/resin levers, steel 3-piece crank, alloy rims.');
Insert Into Bikes
Values ('3','Mongoose Tech 4 26 inch Men''s','The Mongoose Tech 4 full-suspension men''s mountain bike brings you a high-performance, 4-Bar Link, 18-in suspension frame matched with Rock Shox Judy J1 fork for easily handling rough terrain. This bike has a front and rear V-brakes for dependable stopping power and a 24-speed SRAM 4.0 shifting system for responsive gear changes. It also comes equipped with a WTB Speed V saddle and 26-in wheels with Kenda Kharisma XC tires.');
Insert Into Bikes
Values ('6','Apollo XC.26 SE Mens 20 inch Cross Country Mountain Bike','Front suspension - Premium frame design - Front and rear disc brakes for optimum braking - Rugged 2.1 tires - Dual spoke wheels with double rims - Available in 17 inch and 20 inch frames - Bike accessories also available');

Insert Into Sponsors
Values ('1','Jim''s Hardware','123 Main Street','Greenfield','IN','46255-0123','(123) 123-1234');
Insert Into Sponsors
Values ('2','Ace Rental Car','234 West Road','Georgetown','MI','34564-0234','(234) 234-2345');
Insert Into Sponsors
Values ('3','Huffy Bike Company','4568 Raceway Rd','Raceville','IL','29282-2828','(282) 828-2828');
Insert Into Sponsors
Values ('5','Valley Spring Water Company','346 River Valley Circle','River Station','PA','98989-8984','(383) 737-3738');
Insert Into Sponsors
Values ('6','Coca Cola Beverage Company','8763 Drinkers Lane','New York','NY','87674-6464','(373) 374-7373');
Insert Into Sponsors
Values ('7','Muscle Rub Inc.','97863 Streching Avenue','Gainsville','FL','64746-4746','(437) 487-4748');
Insert Into Sponsors
Values ('8','Coconut Milk Lotion Company','777 Smooth Skin Valley','Honolulu','HI','83738-3733','(383) 838-3838');

Insert Into Riders
Values ('3','Marty','Monk','009 Purnell Street','Denver','CO','12345-1234','(123) 098-7654','2005-02-12','3','2');
Insert Into Riders
Values ('4','James','Jordon','008 Purnell Street','Denver','CO','12345-1234','(123) 737-7373','2005-02-12','5','2');
Insert Into Riders
Values ('5','Willis','Wills','1010 Wordon Ave','Denver','CO','12345-1234','(123) 847-8748','2005-02-12','3','2');
Insert Into Riders
Values ('6','George','Jones','1223 Apler','Denver','CO','12345-1234','(123) 656-8876','2005-02-12','3','2');
Insert Into Riders
Values ('7','Aaron','Adams','494 Creek Road','Maui','HI','98989-0009','(909) 222-3333','2006-04-14','3','1');
Insert Into Riders
Values ('8','Gordon','Jenkins','231 Lava Lane','Maui','HI','98989-0009','(909) 828-8288','2006-04-14','5','1');
Insert Into Riders
Values ('10','Robert','Vaden','987 Volcano Circle','Maui','HI','98989-0009','(909) 387-3737','2006-04-14','5','1');
Insert Into Riders
Values ('11','Luke','Skywalker','898 Lava Lane','Maui','HI','98989-0009','(909) 734-9878','2006-04-14','5','1');
Insert Into Riders
Values ('12','Walter','Wilkens','1010 Traylor Ct.','New England','MA','20202-0002','(303) 870-8098','2006-08-20','1','6');
Insert Into Riders
Values ('13','Walter','Hawkins','2345 Jakes Haven Ct','New England','MA','20202-0002','(303) 928-2388','2006-08-20','4','6');
Insert Into Riders
Values ('14','Adam','Hamsond','393 Yeller Drive','New England','MA','20202-0002','(303) 478-9981','2006-09-01','2','6');
Insert Into Riders
Values ('15','Wilbur','Wayne','7464 Watkins Willow Drive','New England','MA','20202-0002','(303) 948-7592','2006-09-01','2','6');
Insert Into Riders
Values ('16','Jay','Gillgan','876 John Island Ave.','Minneapolis','MN','37373-7773','(838) 549-1382','2005-02-12','4','4');
Insert Into Riders
Values ('17','William','Wilks','345 John Island Ct','Minneapolis','MN','37373-7773','(838) 019-8430','2005-02-12','4','4');
Insert Into Riders
Values ('18','Johnny','Quest','987 Hodgi Circle','Minneapolis','MN','37373-7773','(838) 020-2838','2005-02-12','2','4');
Insert Into Riders
Values ('19','Jimmy','Walker','938 Good Times Lane','Minneapolis','MN','37373-7773','(838) 638-2392','2005-02-12','2','4');

Insert Into Events_
Values ('1','Ace Rental Car - Fair Hill Invitational','Weekend Mountain Bike Excursion for all expertise levels','Fair Hill','855 Fair Hill Blvd.','Minneapolis','MN','37373-7773','2007-06-13','2007-06-15','2');
Insert Into Events_
Values ('2','Huffy''s Volcano River Valley Invitational','Weekend Mountain Bike Excursion for all expertise levels in the glorious mountains of Hawaii','Volcano River Valley','896 Volcano River Valley','Maui','HI','98989-0009','2007-07-04','2007-07-06','3');
Insert Into Events_
Values ('3','Coca Cola''s Treacherous Trails Invitational','Expert level race through the trails of Spruce Glenn. Only for expert level riders','Spruce Glenn','7363 Spruce Glenn Lane','Denver','CO','12345-1234','2007-08-08','2007-08-08','6');
Insert Into Events_
Values ('4','Valley Spring Water Mountain Bike Extravaganza','Week-long Mountain Bike Excursions - Easy, Intermediate and Expert Races will be run.','Hoola Hut Gorge','9087 Hoola Hut Lane','New England','MA','20202-0002','2008-04-21','2008-04-27','5');
Insert Into Events_
Values ('5','Huffy''s Mountain Trip','Weekend Mountain Bike Races for the entire month of August 2008 - Easy, Intermediate and Expert Races will be run.','Pineapple Island','98765 Fruit Corner Avenue','Honolulu','HI','98765-0987','2008-08-01','2008-08-31','3');

Insert Into Races
Values ('1','Fair Hill - Robin Run','Day 1 Race on Fair Hill''s Easy level Course','Easy','Location 1','2007-06-13','10:00 AM','2:00 PM','1');
Insert Into Races
Values ('2','Fair Hill - Wonka Run','Day 2 Race on Fair Hill''s Intermediate level Course','Intermediate','Location 2','2007-06-14','10:00 AM','4:00 PM','1');
Insert Into Races
Values ('3','Fair Hill - Skywalker Challenge','Day 3 Race on Fair Hill''s Advanced level Course','Advanced','Location 1','2007-06-15','10:00 AM','6:00 PM','1');
Insert Into Races
Values ('4','Volcano Run','Day 1 Race on Volcano River Valley''s intermediate level Course','Intermediate','Location 1','2007-07-04','10:00 AM','2:00 PM','2');
Insert Into Races
Values ('5','Volcano Trailblazer Run','Day 2 Race on Volcano River Valley''s Advanced level Course','Advanced','Location 2','2007-07-05','10:00 AM','2:00 PM','2');
Insert Into Races
Values ('6','Volcano Trail','Day 3 Race on Volcano River Valley''s Easy level Course','Easy','Location 1','2007-07-06','10:00 AM','12:00 PM','2');
Insert Into Races
Values ('7','Spruce Glenn Heart Pumpin'' Race Spectacular','Expert level Endurance Race on Spruce Glenn''s newly renovated course','Easy','Location 1','2007-08-08','10:00 AM','5:00 PM','3');
Insert Into Races
Values ('8','Hoola Hut Race 1-E','Day 1 Race on Hoola Hut Gorge''s Easy level Course','Easy','Location 2','2008-04-21','10:00 AM','2:00 PM','4');
Insert Into Races
Values ('9','Hoola Hut Race 2-E','Day 2 Race on Hoola Hut Gorge''s Easy level Course','Easy','Location 1','2008-04-22','10:00 AM','2:00 PM','4');
Insert Into Races
Values ('10','Hoola Hut Race 3-I','Day 3 Race on Hoola Hut Gorge''s Intermediate level Course','Intermediate','Location 2','2008-04-23','10:00 AM','3:00 PM','4');
Insert Into Races
Values ('11','Hoola Hut Race 4-I','Day 4 Race on Hoola Hut Gorge''s Intermediate level Course','Intermediate','Location 3','2008-04-24','10:00 AM','3:00 PM','4');
Insert Into Races
Values ('12','Hoola Hut Race 5-A','Day 5 Race on Hoola Hut Gorge''s Advanced level Course','Advanced','Location 3','2008-04-25','10:00 AM','4:00 PM','4');
Insert Into Races
Values ('13','Hoola Hut Race 6-A','Day 6 Race on Hoola Hut Gorge''s Advanced level Course','Advanced','Location 1','2008-04-26','10:00 AM','5:00 PM','4');
Insert Into Races
Values ('14','Hoola Hut Race 7-A','Day 7 Race on Hoola Hut Gorge''s Advanced level Course','Advanced','Location 1','2008-04-27','10:00 AM','6:00 PM','4');
Insert Into Races
Values ('15','Huffy Mountain Run 1E - Wk1','Weekend 1 Race 1 on Huffy Mountain''s Easy level Course','Easy','Location 2','2008-04-01','10:00 AM','2:00 PM','5');
Insert Into Races
Values ('16','Huffy Mountain Run 1E - Wk2','Weekend 2 Race 1 on Huffy Mountain''s Easy level Course','Easy','Location 1','2008-08-08','10:00 AM','2:00 PM','5');
Insert Into Races
Values ('17','Huffy Mountain Trail 2I - Wk1','Weekend 1 Race 2 on Huffy Mountain''s Intermediate level Course','Intermediate','Location 2','2008-08-02','10:00 AM','3:00 PM','5');
Insert Into Races
Values ('18','Huffy Mountain Trail 2I - Wk2','Weekend 2 Race 2 on Huffy Mountain''s Intermediate level Course','Intermediate','Location 1','2008-08-09','10:00 AM','3:00 PM','5');
Insert Into Races
Values ('19','Huffy Mountain Trail 3A - Wk1','Weekend 1 Race 3 on Huffy Mountain''s Advanced level Course','Advanced','Location 2','2008-08-03','10:00 AM','4:00 PM','5');
Insert Into Races
Values ('20','Huffy Mountain Trail 3A - Wk2','Weekend 2 Race 3 on Huffy Mountain''s Advanced level Course','Advanced','Location 1','2008-08-10','10:00 AM','4:00 PM','5');

Insert Into Participation
Values ('1','3','1','3',16);
Insert Into Participation
Values ('2','7','2','6',6);
Insert Into Participation
Values ('3','12','3','6',3);
Insert Into Participation
Values ('4','4','12','6',1);
Insert Into Participation
Values ('5','6','14','3',1);
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('6','7','15','1');
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('7','8','20','6');
Insert Into Participation
Values ('8','7','1','6',14);
Insert Into Participation
Values ('9','3','2','3',3);
Insert Into Participation
Values ('10','11','6','3',4);
Insert Into Participation
Values ('11','6','13','1',2);
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('12','13','15','1');
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('13','14','20','6');
Insert Into Participation
Values ('14','6','1','6',15);
Insert Into Participation
Values ('15','5','2','1',16);
Insert Into Participation
Values ('16','4','3','1',2);
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('17','18','16','3');
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('18','19','20','3');
Insert Into Participation
Values ('19','5','1','3',12);
Insert Into Participation
Values ('20','8','2','6',6);
Insert Into Participation
Values ('21','17','10','3',4);
Insert Into Participation
Values ('22','16','10','3',3);
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('23','15','13','3');
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('24','14','20','3');
Insert Into Participation
Values ('25','13','1','6',2);
Insert Into Participation
Values ('26','12','2','6',1);
Insert Into Participation
Values ('27','11','3','6',1);
Insert Into Participation
Values ('28','10','12','6',2);
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('29','8','15','1');
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('30','8','20','6');
Insert Into Participation
Values ('31','7','1','1',10);
Insert Into Participation
Values ('32','6','2','3',5);
Insert Into Participation
Values ('33','5','6','3',1);
Insert Into Participation
Values ('34','4','15','1',0);
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('35','3','20','6');
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('36','17','20','1');
Insert Into Participation
Values ('37','13','1','1',5);
Insert Into Participation
(Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK)
Values ('38','5','20','1');

Insert Into Rider_Sponsorship
Values ('1','3','3');
Insert Into Rider_Sponsorship
Values ('2','3','7');
Insert Into Rider_Sponsorship
Values ('3','4','3');
Insert Into Rider_Sponsorship
Values ('4','4','7');
Insert Into Rider_Sponsorship
Values ('5','5','3');
Insert Into Rider_Sponsorship
Values ('6','5','7');
Insert Into Rider_Sponsorship
Values ('7','6','3');
Insert Into Rider_Sponsorship
Values ('8','6','7');
Insert Into Rider_Sponsorship
Values ('9','7','1');
Insert Into Rider_Sponsorship
Values ('10','8','1');
Insert Into Rider_Sponsorship
Values ('11','10','1');
Insert Into Rider_Sponsorship
Values ('12','11','1');
Insert Into Rider_Sponsorship
Values ('13','12','5');
Insert Into Rider_Sponsorship
Values ('14','12','6');
Insert Into Rider_Sponsorship
Values ('15','12','8');
Insert Into Rider_Sponsorship
Values ('16','13','1');
Insert Into Rider_Sponsorship
Values ('17','13','6');
Insert Into Rider_Sponsorship
Values ('18','14','6');
Insert Into Rider_Sponsorship
Values ('19','15','6');
Insert Into Rider_Sponsorship
Values ('20','16','2');
Insert Into Rider_Sponsorship
Values ('21','17','2');
Insert Into Rider_Sponsorship
Values ('22','18','2');
Insert Into Rider_Sponsorship
Values ('23','19','2');

