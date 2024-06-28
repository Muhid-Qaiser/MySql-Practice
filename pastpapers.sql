
-- create database pastpapers;

use pastpapers;

-- create table movies
-- (
-- 	movieid int AUTO_INCREMENT primary key,
--     moviename varchar(50),
--     runningtime time,
--     studioid INT
-- );

-- create table studio
-- (
-- 	studioid int AUTO_INCREMENT primary key,
--     studioname varchar(50)
-- );


-- create table genres
-- (
-- 	genreid int AUTO_INCREMENT primary key,
--     genrename varchar(50)
-- );

-- create table movieGenre
-- (
-- 	movieid int ,
--     genreid int,
--     PRIMARY KEY(movieid, genreid)
-- );

-- alter table movies
-- add constraint m_s_fk Foreign key (studioid) References Studio (studioId) on update cascade on delete set null;

-- alter table movieGenre
-- add constraint mg_m_fk Foreign key (movieid) References movies (movieId) on update cascade on delete cascade;

-- alter table movieGenre
-- add constraint mg_g_fk Foreign key (genreid) References genres (genreId) on update cascade;


-- alter table movies
-- add column yearReleased int;

-- alter table studio
-- -- modify column studioname varchar(50) unique;
-- add constraint sn_uk Unique (studioname);

-- alter table movies
-- modify moviename varchar(50) not null;

-- alter table movies
-- add constraint rt_ck Check (runningtime > 0);

-- alter table movies
-- add constraint yr_ck Check (yearReleased <= year( sysdate() ));

-- show index from studio;


-- create table users
-- (
-- 	userid int auto_increment primary key,
--     password VARCHAR(50),
--     dob date,
--     joindate date
-- );

-- create table followers
-- (
-- 	followee int not null,
--     follower int not null,
--     constraint fe_fk Foreign Key (followee) References Users (userid) on update CASCADE on delete cascade,
--     constraint fr_fk Foreign Key (follower) References Users (userid) on update CASCADE on delete cascade
-- );

-- create table Questioncategories
-- (
-- 	category int auto_increment primary key,
--     name varchar(50)
-- );

-- create table questions
-- (
-- 	questionid int auto_increment Primary key,
--     userid int not null,
--     date date,
--     category int not null,
--     question varchar(100),
--     constraint u_fk Foreign key (userid) References Users (userid),
--     constraint c_fk Foreign key (category) References QuestionCategories (category)
-- );
-- 	
-- create table Answers
-- (
-- 	questionid int not null,
--     userid int not null,
--     date date,
--     answer VARCHAR(100),
--     primary key(questionid, userid),
--     constraint a_u_fk Foreign key (userid) References Users (userid),
--     constraint q_fk Foreign key (questionid) References questions (questionid)
-- );


-- insert into Users (password, dob, joinDate) Values 
-- 		('pass1', '2024-01-01', '2024-01-01'),
--         ('pass2', '2024-01-01', '2025-01-01'),
--         ('pass3', '2024-01-01', '2022-01-01'),
--         ('pass4', '2024-01-01', '2021-01-01');
--         
--         
-- insert into Followers (followee, follower) Values
-- 		(1, 1),
--         (1, 2),
--         (1, 3),
--         (2, 3),
--         (3, 2),
--         (3, 1);
--         

-- insert into questionCategories (name) Values
-- 		('Food'),
--         ('Bills'),
--         ('Curry'),
--         ('Gadgets');
--         
--         
-- insert into questions (userid, date, category, question) Values
-- 		(1, '2024-01-01', 1, 'wut is joe?'),
--         (2, '2025-01-01', 2, 'wut is ligma?'),
--         (3, '2023-01-01', 3, 'wut is bron?'),
--         (1, '2022-01-01', 1, 'wut is sunshine?');
--         
-- insert into Answers (questionid, userid, date, answer) Values
-- 		(1, 1, '2024-01-01', 'he is me.'),
--         (2, 1, '2024-01-01', 'he is you.'),
--         (3, 1, '2024-01-01', 'he is us.'),
--         (1, 2, '2024-01-01', 'he is them.');



-- select * from questions q
-- join users u 
-- 	on q.userid = u.userid;
    
-- select qc.category, count(*)
-- from questioncategories qc
-- join questions q
-- 	on q.category = qc.category
-- group by qc.category


-- set @userid = 1;
-- set @categoryid = 1;

-- delimiter $$
-- create procedure qc (in userid int, in categoryid int, out total int)
-- Begin

-- 	select *
-- 	from users u
-- 	join questions q 
-- 		on q.userid = u.userid
-- 	where q.category = categoryid 
-- 	and u.userid = userid;
--     
--     select count(*) into total
-- 	from users u
-- 	join questions q 
-- 		on q.userid = u.userid
-- 	where q.category = categoryid 
-- 	and u.userid = userid;

-- End $$
-- delimiter ;

-- call qc(@userid, @categoryid, @total);

-- select @total;

-- drop procedure qc;














-- DELIMITER //

-- CREATE PROCEDURE GetNthMostAnsweredQuestion(IN n INT)
-- BEGIN

--     SELECT 
--         q.questionid,
--         q.question,
--         qc.category AS category,
--         u.userid asked_by,
--         COUNT(a.questionid) AS answer_count
--     FROM 
--         questions q
--     JOIN 
--         users u ON q.userid = u.userid
--     JOIN 
--         questioncategories qc ON q.category = qc.category
--     LEFT JOIN 
--         answers a ON q.questionid = a.questionid
--     GROUP BY 
--         q.questionid, q.question, u.userid
--     ORDER BY 
--         COUNT(a.questionid) DESC
-- --     LIMIT n, 1;
--     limit n, 2;
--     
-- END //

-- DELIMITER ;

-- CALL GetNthMostAnsweredQuestion(0);

-- drop procedure GetNthMostAnsweredQuestion;


-- select distinct u1.follower, u1.followee
-- from followers u1, followers u2
-- where u1.follower = u2.followee and u2.follower = u1.followee

-- select u.userid , count( distinct q.category)
-- from users u
-- join questions q
-- 	ON 	q.userid = u.userid
-- group by u.userid 
-- having count(distinct q.category) >= (select count(*) from questioncategories)

-- SELECT distinct f1.followee AS user1, f1.follower AS user2
-- FROM followers f1
-- JOIN followers f2 ON f1.followee = f2.follower AND f1.follower = f2.followee;



-- select distinct *
-- from followers f1
-- where exists (
-- 	select 1 
--     from followers f2
--     where f2.followee = f1.follower and f1.followee = f2.follower
-- )






-- -- Create User table
-- CREATE TABLE User (
--     userID INT AUTO_INCREMENT PRIMARY KEY,
--     firstname VARCHAR(50),
--     lastname VARCHAR(50),
--     dateOfBirth DATE,
--     dateOfJoining DATE,
--     email VARCHAR(100) UNIQUE,
--     password VARCHAR(100)
-- );

-- -- Create Page table
-- CREATE TABLE Page (
--     pageID INT AUTO_INCREMENT PRIMARY KEY,
--     Title VARCHAR(100),
--     Description TEXT,
--     dateOfCreation DATE,
--     managedBy INT,
--     FOREIGN KEY (managedBy) REFERENCES User(userID)
-- );

-- -- Create ActorParent table
-- CREATE TABLE ActorParent (
--     ActorParentID INT AUTO_INCREMENT PRIMARY KEY,
--     ActorParentRole ENUM('User', 'Page')
-- );

-- -- Create FollowerList table
-- CREATE TABLE FollowerList (
--     Followed INT,
--     Follower INT,
--     followingDate DATE,
--     PRIMARY KEY (Followed, Follower),
--     FOREIGN KEY (Followed) REFERENCES ActorParent(ActorParentID),
--     FOREIGN KEY (Follower) REFERENCES ActorParent(ActorParentID)
-- );

-- -- Create Post table
-- CREATE TABLE Post (
--     postID INT AUTO_INCREMENT PRIMARY KEY,
--     Title VARCHAR(100),
--     Description TEXT,
--     dateOfCreation DATE,
--     createdBy INT,
--     FOREIGN KEY (createdBy) REFERENCES ActorParent(ActorParentID)
-- );

-- -- Create Comment table
-- CREATE TABLE Comment (
--     CommentID INT AUTO_INCREMENT PRIMARY KEY,
--     CommentText TEXT,
--     CommentDate DATE,
--     CommentedByID INT,
--     CommentedOnPostID INT,
--     FOREIGN KEY (CommentedByID) REFERENCES ActorParent(ActorParentID),
--     FOREIGN KEY (CommentedOnPostID) REFERENCES Post(postID)
-- );

-- -- Create PostLikedBy table
-- CREATE TABLE PostLikedBy (
--     PostID INT,
--     LikedByID INT,
--     PRIMARY KEY (PostID, LikedByID),
--     FOREIGN KEY (PostID) REFERENCES Post(postID),
--     FOREIGN KEY (LikedByID) REFERENCES ActorParent(ActorParentID)
-- );

-- -- Create SharedBy table
-- CREATE TABLE SharedBy (
--     PostID INT,
--     SharedByID INT,
--     SharedDate DATE,
--     PRIMARY KEY (PostID, SharedByID),
--     FOREIGN KEY (PostID) REFERENCES Post(postID),
--     FOREIGN KEY (SharedByID) REFERENCES ActorParent(ActorParentID)
-- );

-- -- Insert data into User table
-- INSERT INTO User (firstname, lastname, dateOfBirth, dateOfJoining, email, password)
-- VALUES
-- ('John', 'Doe', '1990-01-01', '2023-01-01', 'john.doe@example.com', 'password123'),
-- ('Jane', 'Smith', '1992-02-02', '2023-02-01', 'jane.smith@example.com', 'password456');

-- -- Insert data into Page table
-- INSERT INTO Page (Title, Description, dateOfCreation, managedBy)
-- VALUES
-- ('Tech News', 'Latest technology news and updates.', '2023-01-01', 1),
-- ('Food Blog', 'Delicious recipes and food reviews.', '2023-01-15', 2);

-- -- Insert data into ActorParent table
-- INSERT INTO ActorParent (ActorParentRole)
-- VALUES
-- ('User'),
-- ('User'),
-- ('Page'),
-- ('Page');

-- -- Insert data into FollowerList table
-- INSERT INTO FollowerList (Followed, Follower, followingDate)
-- VALUES
-- (1, 2, '2023-02-15'),
-- (2, 1, '2023-02-16'),
-- (3, 1, '2023-02-17');

-- -- Insert data into Post table
-- INSERT INTO Post (Title, Description, dateOfCreation, createdBy)
-- VALUES
-- ('New Smartphone Released', 'The latest smartphone has just been released.', '2023-03-01', 1),
-- ('How to Make Pancakes', 'A simple recipe for making delicious pancakes.', '2023-03-02', 2);

-- -- Insert data into Comment table
-- INSERT INTO Comment (CommentText, CommentDate, CommentedByID, CommentedOnPostID)
-- VALUES
-- ('Great article!', '2023-03-05', 2, 1),
-- ('Thanks for the recipe!', '2023-03-06', 1, 2);

-- -- Insert data into PostLikedBy table
-- INSERT INTO PostLikedBy (PostID, LikedByID)
-- VALUES
-- (1, 2),
-- (2, 1);

-- -- Insert data into SharedBy table
-- INSERT INTO SharedBy (PostID, SharedByID, SharedDate)
-- VALUES
-- (1, 3, '2023-03-07'),
-- (2, 4, '2023-03-08');


-- delimiter $$
-- create trigger before_update_post 
-- 	before update 
-- 	on Post
-- 	for each row
-- begin

-- 	update 
-- 	postlikedby pl
-- 	set pl.postid = new.postid
-- 	where pl.postid = old.postid;
--     
--     update 
-- 	comment c
-- 	set c.commentedOnPostID = new.postid
-- 	where c.commentedOnPostID = old.postid;
--     
--     update 
-- 	sharedby s
-- 	set s.postid = new.postid
-- 	where s.postid = old.postid;

-- end $$
-- delimiter ;


-- set foreign_key_checks = 0;

-- update
-- post p
-- set p.postid = 1
-- where p.postid = 10;

-- set foreign_key_checks = 1;

-- drop trigger before_update_post;



-- delimiter $$
-- create trigger new_record 

-- 	before insert
-- 	on sharedby
-- 	for each row

-- begin 

-- 	declare id int default 0;
--     declare title1 varchar(100) default '';
--     declare description1 varchar(100) default '';
--     declare dateofcreation date default date(sysdate());
--     declare createdby1 int default 1;
--     
--     select max(postid) into id from Post;
--     set id = id + 1;
--     
--     select title, description into title1, description1
--     from post p
--     where p.postid = new.postid;
--     
--     insert into Post (PostID, Title, Description, dateofcreation, createdBy) VALUES
-- 			(id, Title1, Description1, date(sysdate()), new.sharedbyID);

-- 	

-- end $$
-- delimiter ;

-- insert into sharedby (postid, SharedbyID, shareddate) Values
-- 		(2, 2, '2024-01-01');
        
-- insert into post (PostID, Title, Description, dateofcreation, createdBy) VALUES
-- 			(3, '3', '3', date(sysdate()), 1);
        
-- delete
-- from sharedby
-- where postid = 2 and sharedbyid = 2;

-- delete
-- from post
-- where postid = 3;

-- drop trigger new_record ;



-- delimiter $$
-- create trigger new_page

-- 	before insert
-- 	on Page
-- 	for each row

-- begin

-- 	if not ( new.pageid in (select distinct actorparentid from actorparent) and char_length(new.title) > 5 and char_length(new.description) >= 10 and new.managedby in (select distinct actorparentid from actorparent where actorparentrole like 'user' ) ) then
--     
-- 		signal SQLSTATE '45000'
--         set Message_text = 'Invalid input';
--         
--     
--     end if ;

-- end $$
-- delimiter ;

-- insert into page (pageid, title, description, dateofcreation, managedby) values
-- 		(3, 'Joee23', '1234567839', '2029-01-01',1);


-- drop trigger new_page;

delimiter $$
create procedure joe ()

begin

declare checker int default 0;

set @f1 = 1;
set @f2 = 2;
	

-- if @f1 = @f2 then
-- 	signal sqlstate '45000'
--     set message_text = 'Same';
-- end if;

select count(*) into checker
from followers f
where (@f1, @f2) in 
(
	select followee, follower
    from followers
)
;

if checker > 0 then
	signal sqlstate '45000'
    set message_text = 'Exists';
end if;

end $$
delimiter $$ ;

call joe();

drop procedure joe;

















