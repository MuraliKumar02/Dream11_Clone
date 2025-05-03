--1. Create a schema user_details
CREATE SCHEMA IF NOT EXISTS user_details;

-- 2. Create user_info table under user_details schema
CREATE TABLE IF NOT EXISTS user_details.user_info (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email_id VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL
);

-- 3. Select all users
SELECT * FROM user_details.user_info;

-- 4. Create another schema for team-related tables
CREATE SCHEMA IF NOT EXISTS team_details;

-- 5. Create a table for rcb 
CREATE TABLE IF NOT EXISTS team_details.players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    team_name VARCHAR(50) NOT NULL
);

--6. Insert the players data into the  table COMMENT


INSERT INTO team_details.players (player_name, role, status, team_name) VALUES
('Axar Patel', 'All-rounder', 'Captain', 'Delhi Capitals'),
('KL Rahul', 'Wicket-keeper Batter', 'Vice Captain', 'Delhi Capitals'),
('David Warner', 'Batter', 'Team Member', 'Delhi Capitals'),
('Prithvi Shaw', 'Batter', 'Team Member', 'Delhi Capitals'),
('Mitchell Marsh', 'All-rounder', 'Team Member', 'Delhi Capitals'),
('Kuldeep Yadav', 'Bowler', 'Team Member', 'Delhi Capitals'),
('Mukesh Kumar', 'Bowler', 'Team Member', 'Delhi Capitals'),
('Anrich Nortje', 'Bowler', 'Team Member', 'Delhi Capitals'),
('Rovman Powell', 'Batter', 'Team Member', 'Delhi Capitals'),
('Shai Hope', 'Wicket-keeper Batter', 'Team Member', 'Delhi Capitals'),
('Lalit Yadav', 'All-rounder', 'Team Member', 'Delhi Capitals'),
('Ashutosh Sharma', 'All-rounder', 'Team Member', 'Delhi Capitals'),
('Madhav Tiwari', 'All-rounder', 'Team Member', 'Delhi Capitals'),
('Tristan Stubbs', 'Wicket-keeper Batter', 'Team Member', 'Delhi Capitals'),
('Dushmantha Chameera', 'Bowler', 'Team Member', 'Delhi Capitals');


INSERT INTO team_details.players (player_name, role, status, team_name) VALUES
('Ajinkya Rahane', 'Batter', 'Captain', 'Kolkata Knight Riders'),
('Rinku Singh', 'Batter', 'Team Member', 'Kolkata Knight Riders'),
('Quinton de Kock', 'Wicket-keeper Batter', 'Team Member', 'Kolkata Knight Riders'),
('Rahmanullah Gurbaz', 'Wicket-keeper Batter', 'Team Member', 'Kolkata Knight Riders'),
('Angkrish Raghuvanshi', 'Batter', 'Team Member', 'Kolkata Knight Riders'),
('Rovman Powell', 'Batter', 'Team Member', 'Kolkata Knight Riders'),
('Manish Pandey', 'Batter', 'Team Member', 'Kolkata Knight Riders'),
('Venkatesh Iyer', 'All-rounder', 'Vice Captain', 'Kolkata Knight Riders'),
('Andre Russell', 'All-rounder', 'Team Member', 'Kolkata Knight Riders'),
('Moeen Ali', 'All-rounder', 'Team Member', 'Kolkata Knight Riders'),
('Sunil Narine', 'Bowler', 'Team Member', 'Kolkata Knight Riders'),
('Varun Chakravarthy', 'Bowler', 'Team Member', 'Kolkata Knight Riders'),
('Anrich Nortje', 'Bowler', 'Team Member', 'Kolkata Knight Riders'),
('Vaibhav Arora', 'Bowler', 'Team Member', 'Kolkata Knight Riders'),
('Harshit Rana', 'Bowler', 'Team Member', 'Kolkata Knight Riders');

INSERT INTO team_details.players (player_name, role, status, team_name) VALUES
('Shubman Gill', 'Batter', 'Captain', 'Gujarat Titans'),
('Jos Buttler', 'Wicketkeeper-Batter', 'Vice Captain', 'Gujarat Titans'),
('Sai Sudharsan', 'Batter', 'Team Member', 'Gujarat Titans'),
('Shahrukh Khan', 'All-Rounder', 'Team Member', 'Gujarat Titans'),
('Glenn Phillips', 'Batter', 'Team Member', 'Gujarat Titans'),
('Rahul Tewatia', 'All-Rounder', 'Team Member', 'Gujarat Titans'),
('Mahipal Lomror', 'All-Rounder', 'Team Member', 'Gujarat Titans'),
('Rashid Khan', 'All-Rounder', 'Team Member', 'Gujarat Titans'),
('Washington Sundar', 'Bowler', 'Team Member', 'Gujarat Titans'),
('Kagiso Rabada', 'Bowler', 'Team Member', 'Gujarat Titans'),
('Mohammed Siraj', 'Bowler', 'Team Member', 'Gujarat Titans'),
('Anuj Rawat', 'Wicketkeeper-Batter', 'Team Member', 'Gujarat Titans'),
('Sherfane Rutherford', 'Batter', 'Team Member', 'Gujarat Titans'),
('Prasidh Krishna', 'Bowler', 'Team Member', 'Gujarat Titans'),
('Jayant Yadav', 'All-Rounder', 'Team Member', 'Gujarat Titans');

INSERT INTO team_details.players (player_name, role, status, team_name)VALUES 
('Shikhar Dhawan', 'Batter', 'Captain', 'Punjab Kings'),
('Jitesh Sharma', 'Wicketkeeper-Batter', 'Vice-Captain', 'Punjab Kings'),
('Liam Livingstone', 'All-Rounder', 'Team Member', 'Punjab Kings'),
('Prabhsimran Singh', 'Wicketkeeper-Batter', 'Team Member', 'Punjab Kings'),
('Sam Curran', 'All-Rounder', 'Team Member', 'Punjab Kings'),
('Shahrukh Khan', 'All-Rounder', 'Team Member', 'Punjab Kings'),
('Harpreet Brar', 'All-Rounder', 'Team Member', 'Punjab Kings'),
('Rahul Chahar', 'Bowler', 'Team Member', 'Punjab Kings'),
('Kagiso Rabada', 'Bowler', 'Team Member', 'Punjab Kings'),
('Arshdeep Singh', 'Bowler', 'Team Member', 'Punjab Kings'),
('Nathan Ellis', 'Bowler', 'Team Member', 'Punjab Kings'),
('Rishi Dhawan', 'Bowler', 'Team Member', 'Punjab Kings'),
('M Shahrukh', 'Batter', 'Team Member', 'Punjab Kings'),
('Matt Henry', 'Bowler', 'Team Member', 'Punjab Kings'),
('Raj Angad Bawa', 'All-Rounder', 'Team Member', 'Punjab Kings');

INSERT INTO team_details.players (player_name, role, status, team_name)VALUES
('Rohit Sharma', 'Batter', 'Captain', 'Mumbai Indians'),
('Suryakumar Yadav', 'Batter', 'Vice Captain', 'Mumbai Indians'),
('Ishan Kishan','Wicketkeeper-Batter','Team Member','Mumbai Indians'),
('Cameron Green', 'All-Rounder', 'Team Member', 'Mumbai Indians'),
('Tim David', 'Batter', 'Team Member', 'Mumbai Indians'),
('Nehal Wadhera', 'Batter', 'Team Member', 'Mumbai Indians'),
('Akash Madhwal', 'Bowler', 'Team Member', 'Mumbai Indians'),
('Piyush Chawla', 'Bowler', 'Team Member', 'Mumbai Indians'),
('Jasprit Bumrah', 'Bowler', 'Team Member', 'Mumbai Indians'),
('Arshad Khan', 'Bowler', 'Team Member', 'Mumbai Indians'),
('Shams Mulani', 'All-Rounder', 'Team Member', 'Mumbai Indians'),
('Hrithik Shokeen', 'All-Rounder', 'Team Member', 'Mumbai Indians'),
('Ramandeep Singh', 'All-Rounder', 'Team Member', 'Mumbai Indians'),
('Arjun Tendulkar', 'All-Rounder', 'Team Member', 'Mumbai Indians'),
('Raghav Goyal', 'All-Rounder', 'Team Member', 'Mumbai Indians');

INSERT INTO team_details.players (player_name, role, status, team_name) VALUES
('MS Dhoni', 'Wicketkeeper-Batter', 'Captain', 'Chennai Super Kings'),
('Ravindra Jadeja', 'All-Rounder', 'Vice-Captain', 'Chennai Super Kings'),
('Ruturaj Gaikwad', 'Batter', 'Team Member', 'Chennai Super Kings'),
('Devon Conway', 'Batter', 'Team Member', 'Chennai Super Kings'),
('Rahul Tripathi', 'Batter', 'Team Member', 'Chennai Super Kings'),
('Shaik Rasheed', 'Batter', 'Team Member', 'Chennai Super Kings'),
('Rachin Ravindra', 'All-Rounder', 'Team Member', 'Chennai Super Kings'),
('Sam Curran', 'All-Rounder', 'Team Member', 'Chennai Super Kings'),
('Deepak Hooda', 'All-Rounder', 'Team Member', 'Chennai Super Kings'),
('Khaleel Ahmed', 'Bowler', 'Team Member', 'Chennai Super Kings'),
('Mukesh Choudhary', 'Bowler', 'Team Member', 'Chennai Super Kings'),
('Nathan Ellis', 'Bowler', 'Team Member', 'Chennai Super Kings'),
('Shreyas Gopal', 'Bowler', 'Team Member', 'Chennai Super Kings'),
('Matheesha Pathirana', 'Bowler', 'Team Member', 'Chennai Super Kings'),
('Jamie Overton', 'All-Rounder', 'Team Member', 'Chennai Super Kings');


INSERT INTO team_details.players(player_name, role, status, team_name) VALUES
('Sanju Samson', 'Wicket-keeper batsman', 'Captain', 'Rajasthan Royals'),
('Nitish Rana', 'All-rounder', 'Vice Captain', 'Rajasthan Royals'),
('Riyan Parag', 'All-rounder', 'Team Member', 'Rajasthan Royals'),
('Shimron Hetmyer', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Yashasvi Jaiswal', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Dhruv Jurel', 'Wicket-keeper batsman', 'Team Member', 'Rajasthan Royals'),
('Shubham Dubey', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Jofra Archer', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Maheesh Theekshana', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Wanindu Hasaranga', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Akash Madhwal', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Kumar Kartikeya Singh', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Vaibhav Suryavanshi', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Kunal Rathore', 'Wicket-keeper', 'Team Member', 'Rajasthan Royals'),
('Sandeep Sharma', 'Bowler', 'Team Member', 'Rajasthan Royals');

INSERT INTO team_details.players (player_name, role, status, team_name)
VALUES
('Rishabh Pant', 'Wicket-keeper batsman', 'Captain', 'Lucknow Super Giants'),
('Nicholas Pooran', 'Wicket-keeper batsman', 'Vice Captain', 'Lucknow Super Giants'),
('David Miller', 'Batter', 'Team Member', 'Lucknow Super Giants'),
('Aiden Markram', 'Batter', 'Team Member', 'Lucknow Super Giants'),
('Mitchell Marsh', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Shardul Thakur', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Shahbaz Ahmed', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Ayush Badoni', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Ravi Bishnoi', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Avesh Khan', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Mayank Yadav', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Shamar Joseph', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Akash Singh', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Manimaran Siddharth', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Digvesh Singh', 'Bowler', 'Team Member', 'Lucknow Super Giants');

INSERT INTO team_details.players (player_name, role, status, team_name)VALUES
('Rajat Patidar', 'Batter', 'Captain', 'Royal Challengers Bengaluru'),
('Virat Kohli', 'Batter', 'Vice Captain', 'Royal Challengers Bengaluru'),
('Devdutt Padikkal', 'Batter', 'Team Member', 'Royal Challengers Bengaluru'),
('Phil Salt', 'Wicketkeeper-Batter', 'Team Member', 'Royal Challengers Bengaluru'),
('Liam Livingstone', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Tim David', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Krunal Pandya', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Bhuvneshwar Kumar', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Josh Hazlewood', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Yash Dayal', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Rasikh Dar', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Jitesh Sharma', 'Wicketkeeper-Batter', 'Team Member', 'Royal Challengers Bengaluru'),
('Jacob Bethell', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Romario Shepherd', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Suyash Sharma', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru');

INSERT INTO team_details.players (player_name, role, status, team_name)VALUES
('Pat Cummins', 'Bowler', 'Captain', 'Sunrisers Hyderabad'),
('Heinrich Klaasen', 'Wicketkeeper-Batter', 'Vice Captain', 'Sunrisers Hyderabad'),
('Travis Head', 'Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Abhishek Sharma', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Ishan Kishan', 'Wicketkeeper-Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Nitish Kumar Reddy', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Wiaan Mulder', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Harshal Patel', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Mohammed Shami', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Rahul Chahar', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Adam Zampa', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Abhinav Manohar', 'Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Atharva Taide', 'Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Kamindu Mendis', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Jaydev Unadkat', 'Bowler', 'Team Member', 'Sunrisers Hyderabad');


INSERT INTO team_details.players(player_name, role, status, team_name) VALUES
('Sanju Samson', 'Wicket-keeper batsman', 'Captain', 'Rajasthan Royals'),
('Nitish Rana', 'All-rounder', 'Vice Captain', 'Rajasthan Royals'),
('Riyan Parag', 'All-rounder', 'Team Member', 'Rajasthan Royals'),
('Shimron Hetmyer', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Yashasvi Jaiswal', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Dhruv Jurel', 'Wicket-keeper batsman', 'Team Member', 'Rajasthan Royals'),
('Shubham Dubey', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Jofra Archer', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Maheesh Theekshana', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Wanindu Hasaranga', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Akash Madhwal', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Kumar Kartikeya Singh', 'Bowler', 'Team Member', 'Rajasthan Royals'),
('Vaibhav Suryavanshi', 'Batter', 'Team Member', 'Rajasthan Royals'),
('Kunal Rathore', 'Wicket-keeper', 'Team Member', 'Rajasthan Royals'),
('Sandeep Sharma', 'Bowler', 'Team Member', 'Rajasthan Royals');

INSERT INTO team_details.players (player_name, role, status, team_name)VALUES
('Rishabh Pant', 'Wicket-keeper batsman', 'Captain', 'Lucknow Super Giants'),
('Nicholas Pooran', 'Wicket-keeper batsman', 'Vice Captain', 'Lucknow Super Giants'),
('David Miller', 'Batter', 'Team Member', 'Lucknow Super Giants'),
('Aiden Markram', 'Batter', 'Team Member', 'Lucknow Super Giants'),
('Mitchell Marsh', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Shardul Thakur', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Shahbaz Ahmed', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Ayush Badoni', 'All-rounder', 'Team Member', 'Lucknow Super Giants'),
('Ravi Bishnoi', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Avesh Khan', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Mayank Yadav', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Shamar Joseph', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Akash Singh', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Manimaran Siddharth', 'Bowler', 'Team Member', 'Lucknow Super Giants'),
('Digvesh Singh', 'Bowler', 'Team Member', 'Lucknow Super Giants');

INSERT INTO team_details.players (player_name, role, status, team_name)VALUES
('Rajat Patidar', 'Batter', 'Captain', 'Royal Challengers Bengaluru'),
('Virat Kohli', 'Batter', 'Vice Captain', 'Royal Challengers Bengaluru'),
('Devdutt Padikkal', 'Batter', 'Team Member', 'Royal Challengers Bengaluru'),
('Phil Salt', 'Wicketkeeper-Batter', 'Team Member', 'Royal Challengers Bengaluru'),
('Liam Livingstone', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Tim David', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Krunal Pandya', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Bhuvneshwar Kumar', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Josh Hazlewood', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Yash Dayal', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Rasikh Dar', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru'),
('Jitesh Sharma', 'Wicketkeeper-Batter', 'Team Member', 'Royal Challengers Bengaluru'),
('Jacob Bethell', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Romario Shepherd', 'All-Rounder', 'Team Member', 'Royal Challengers Bengaluru'),
('Suyash Sharma', 'Bowler', 'Team Member', 'Royal Challengers Bengaluru');

INSERT INTO team_details.players (player_name, role, status, team_name)VALUES
('Pat Cummins', 'Bowler', 'Captain', 'Sunrisers Hyderabad'),
('Heinrich Klaasen', 'Wicketkeeper-Batter', 'Vice Captain', 'Sunrisers Hyderabad'),
('Travis Head', 'Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Abhishek Sharma', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Ishan Kishan', 'Wicketkeeper-Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Nitish Kumar Reddy', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Wiaan Mulder', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Harshal Patel', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Mohammed Shami', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Rahul Chahar', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Adam Zampa', 'Bowler', 'Team Member', 'Sunrisers Hyderabad'),
('Abhinav Manohar', 'Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Atharva Taide', 'Batter', 'Team Member', 'Sunrisers Hyderabad'),
('Kamindu Mendis', 'All-Rounder', 'Team Member', 'Sunrisers Hyderabad'),
('Jaydev Unadkat', 'Bowler', 'Team Member', 'Sunrisers Hyderabad');


-- 7. Created a schema to stored the match details by admin COMMENT

CREATE SCHEMA IF NOT EXISTS admin_match;

-- 8. Created a table COMMENT

CREATE TABLE IF NOT EXISTS admin_match.match_details (
    match_id SERIAL PRIMARY KEY,
    match_date DATE NOT NULL,
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    winner VARCHAR(50),
    stadium VARCHAR(100)
);

