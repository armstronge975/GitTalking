--DROP TABLE user CASCADE CONSTRAINTS;
CREATE TABLE user (
  fname    varchar2(15) not null, 
  lname    varchar2(15) not null,
  userid      char(9),
  projectid	  char(9),
  groupid		char (9),
  permissions	char (15),
  primary key (userid),
  foreign key (projectid) references projects(projectid) on delete set null
 -- on update not allowed in Oracle
);

--DROP TABLE projects CASCADE CONSTRAINTS;
CREATE TABLE projects (
   projectname varchar2(15) not null,
   projectid char(9),
   groupid char(9),
   status char(9),
  primary key (projectid),
  foreign key (groupid) references group(groupid) on delete set null,
);

--DROP TABLE group CASCADE CONSTRAINTS;
CREATE TABLE group (
  groupname varchar2(15) not null,
   groupid char(9),
  primary key (groupid),
);

--DROP TABLE message CASCADE CONSTRAINTS;
CREATE TABLE message (
	public	char(1),
	message_content	varchar2(140),
	messageid	varchar2(140),
  primary key (messageid),
  foreign key (muserid) references user(userid)
);



