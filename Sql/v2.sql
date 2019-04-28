
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