
use Comp1640_Ecom
Create table Roles(
Id int identity,
Name varchar(50),
Primary key(Id)
)

Create table Masters(
Id int identity,
UserName varchar(100),
Pass varchar(100),
Primary key(Id)
)
Create table MasterRoles(
Id int identity,
RoleId int,
MasterId int,
Primary key(Id),
Foreign key(MasterId) references Masters(Id),
Foreign key(RoleId) references Roles(Id)
)
Create table Courses(
Id int identity,
Name varchar(50),
Primary key(Id)
)
Create table Semesters(
Id int identity,
StartDate datetime,
EndDate datetime,
Name varchar(50),
Primary key(Id)
)
Create table Coordinators(
Id int identity,
UserName varchar(100),
Pass varchar(50),
FullName varchar(100),
CourseId int,
Email varchar(50),
Primary key(Id),
Foreign key(CourseId) references Courses(Id)
)
Create table Students(
Id int identity,
UserName varchar(100),
Pass varchar(50),
FullName varchar(100),
CoordinatorId int,
ImgUrl varchar(max),
Primary key(Id),
Foreign key(CoordinatorId) references Coordinators(Id)
)