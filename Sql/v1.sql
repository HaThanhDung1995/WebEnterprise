
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