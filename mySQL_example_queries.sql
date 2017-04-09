#Q1. 
SELECT * FROM Teams;
SELECT * FROM Agents;
SELECT * FROM Bikes;
SELECT * FROM Sponsors;
SELECT * FROM Riders;
SELECT * FROM Events_;
SELECT * FROM Races;
SELECT * FROM Participation;
SELECT * FROM Rider_Sponsorship;

#Q2.

SELECT Teams_TeamID_PK FROM Teams;
SELECT Agents_AgentID_PK FROM Agents;
SELECT Bikes_BikeID_PK FROM Bikes;
SELECT Sponsors_SponsorID_PK FROM Sponsors;
SELECT Riders_RiderID_PK,Agents_AgentID_FK,Teams_TeamID_FK FROM Riders;
SELECT Events_EventID_PK,Sponsors_SponsorID_FK FROM Events_;
SELECT Races_RaceID_PK,Events_EventID_FK FROM Races;
SELECT Participation_PID_PK, Riders_RiderID_FK, Races_RaceID_FK, Bikes_BikeID_FK FROM Participation;
SELECT Rider_Sponsorship_RSID_PK, Riders_RiderID_FK, Sponsors_SponsorID_FK FROM Rider_Sponsorship; 


#Q3.
SHOW TABLES;

#Q4.
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Teams';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Agents';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Bikes';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Sponsors';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Riders';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Events_';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Races';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Participation';
SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE TABLE_NAME = 'Rider_Sponsorship';  

#Q5.
SELECT Event_Name FROM Events_
       WHERE EndDate LIKE '2007%';

#Q6.
SELECT ALastName,Phone FROM Agents;

#Q7.
SELECT SponsorName FROM Sponsors
       WHERE State = "IL" OR State = "IN" OR State = "MI";

#Q8.
SELECT MAX(Placement),MIN(Placement),AVG(Placement),Riders_RiderID_FK FROM Participation
       WHERE Placement IS NOT NULL
       GROUP BY Riders_RiderID_FK;       

#Q9.
SELECT r.RLastName FROM Riders r, Sponsors s, Rider_Sponsorship rs 
       WHERE s.SponsorName = 'Coca Cola Beverage Company' AND rs.Sponsors_SponsorID_FK = s.Sponsors_SponsorID_PK
       AND r.Riders_RiderID_PK = rs.Riders_RiderID_FK;

#Q10.
SELECT r.RFirstName,r.RLastName, CONCAT(a.AFirstName,' ',a.ALastName) AS 'Agent_Name', t.TeamName FROM Riders r, Agents a, Teams t
	   WHERE r.Agents_AgentID_FK = a.Agents_AgentID_PK AND r.Teams_TeamID_FK = t.Teams_TeamID_PK;       
       
#Q11.
SELECT COUNT(r.RaceName) AS Total_Races,e.Event_Name FROM Races r, Events_ e
       WHERE e.EndDate LIKE '2007%' AND r.Events_EventID_FK = e.Events_EventID_PK
       GROUP BY e.Event_Name;
       
#Q12.
SELECT b.BikeName FROM Bikes b, Participation p
       WHERE p.Bikes_BikeID_FK = b.Bikes_BikeID_PK
       GROUP BY b.BikeName
       ORDER BY COUNT(b.BikeName) DESC
       LIMIT 1;

#Q13.  

SELECT CONCAT(r.RFirstName,' ',r.RLastName) AS 'Riders_Name', race.RaceLevel AS 'Race_Level', SUM(((1/p.Placement) * 1000)) AS Total_Points
       FROM Races race, Riders r, Participation p
       WHERE Placement IS NOT NULL AND Placement != 0 AND p.Riders_RiderID_FK = r.Riders_RiderID_PK
       AND p.Races_RaceID_FK = race.Races_RaceID_PK AND race.RaceLevel = 'Easy'
       GROUP BY Riders_Name
       ORDER BY Total_Points DESC;
       
SELECT CONCAT(r.RFirstName,' ',r.RLastName) AS 'Riders_Name', race.RaceLevel AS 'Race_Level', SUM(((1/p.Placement) * 1000)) AS Total_Points
       FROM Races race, Riders r, Participation p
       WHERE Placement IS NOT NULL AND Placement != 0 AND p.Riders_RiderID_FK = r.Riders_RiderID_PK
       AND p.Races_RaceID_FK = race.Races_RaceID_PK AND race.RaceLevel = 'Intermediate'
       GROUP BY Riders_Name
       ORDER BY Total_Points DESC;
       
SELECT CONCAT(r.RFirstName,' ',r.RLastName) AS 'Riders_Name', race.RaceLevel AS 'Race_Level', SUM(((1/p.Placement) * 1000)) AS Total_Points
       FROM Races race, Riders r, Participation p
       WHERE Placement IS NOT NULL AND Placement != 0 AND p.Riders_RiderID_FK = r.Riders_RiderID_PK
       AND p.Races_RaceID_FK = race.Races_RaceID_PK AND race.RaceLevel = 'Advanced'
       GROUP BY Riders_Name
       ORDER BY Total_Points DESC;  
	
#Q14.
SELECT e.Event_Name,r.RaceName FROM Races r, Events_ e
       WHERE r.RaceName LIKE '%run%' AND r.Events_EventID_FK = e.Events_EventID_PK;

#Q15.
SELECT DISTINCT CONCAT(r.RFirstName,' ', r.RLastName) AS 'Rider_Name', t.TeamName,
       CONCAT(a.AFirstName,' ',a.ALastName) AS 'Agent_Name'
       FROM Riders r, Agents a, Races race, Participation p, Teams t
       WHERE race.RaceDate LIKE '2008-04%' AND r.Riders_RiderID_PK = p.Riders_RiderID_FK
       AND race.Races_RaceID_PK = p.Races_RaceID_FK AND a.Agents_AgentID_PK = r.Agents_AgentID_FK
       AND t.Teams_TeamID_PK = r.Teams_TeamID_FK;
                            
#Q16.
SELECT SponsorName From Sponsors
       WHERE Sponsors_SponsorID_PK IN
             (SELECT e.Sponsors_SponsorID_FK FROM Events_ e, Rider_Sponsorship rs
				     WHERE rs.Sponsors_SponsorID_FK = e.Sponsors_SponsorID_FK);                             
