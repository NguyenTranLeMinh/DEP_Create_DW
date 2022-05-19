create database [Asm1_DEP302x]
GO
use [Asm1_DEP302x]
GO
create table Pet_DIM (
	Pet_Key int IDENTITY(1,1) not NULL PRIMARY KEY,
	PetID int not NULL,
	Type varchar(3) not NULL,
	Name nvarchar(255),
	Age int not NULL,
	Breed1 varchar(255) not NULL,
	Breed2 varchar(255),
	Gender varchar(6) not NULL,
	Color1 varchar(255) not NULL,
	Color2 varchar(255),
	Color3 varchar(255),
	MaturitySize varchar(13) not NULL,
	FurLength varchar(13) not NULL,
	Vaccinated varchar(8) not NULL,
	Dewormed varchar(8) not NULL,
	Sterilized varchar(8) not NULL,
	Health varchar(14) not NULL,
	Description nvarchar(2000)
)
GO
create table Rescuer_DIM (
	Rescuer_Key int IDENTITY(1,1) not NULL PRIMARY KEY,
	RescuerID int not NULL,
	State varchar(255) not NULL 
)
GO
create table PetFinder_Fact(
	Pet_Key int not NULL FOREIGN KEY references Pet_DIM(Pet_Key),
	Rescuer_Key int not NULL FOREIGN KEY references Rescuer_DIM(Rescuer_Key),
	Quantity int not NULL,
	Fee int not NULL
)

