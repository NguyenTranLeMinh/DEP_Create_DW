---•	Liệt kê các vật nuôi được tiêm phòng cũng được triệt sản.
Select PetID, Type, Name, Age, Quantity, Fee
From Pet_DIM p JOIN [dbo].[PetFinder_Fact] f On p.Pet_Key=f.Pet_Key
Where Vaccinated='Yes' and Sterilized='Yes'
---•	Liệt kê số vật nuôi theo từng bang.
Select count(*) as Num_Pets, State
From [dbo].[PetFinder_Fact] f JOIN [dbo].[Rescuer_DIM] r On f.Rescuer_Key=r.Rescuer_Key
Group By State
Order By Num_Pets
---•	Liệt kê các chú chó nhiều màu (3 màu) chưa được 3 tháng tuổi.
Select PetID, Type, Name, Age, Color1, Color2, Color3, Quantity, Fee
From Pet_DIM p JOIN [dbo].[PetFinder_Fact] f On p.Pet_Key=f.Pet_Key
Where Color3 != 'None' and Type='Dog' and Age < 3
