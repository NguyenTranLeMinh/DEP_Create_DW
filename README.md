***

Mô tả về tập dữ liệu: Tập dữ liệu PetFinder chứa các thông tin của các vật nuôi, gồm các thông tin như sau: Tên, tuổi, giống, màu lông,... Bạn được giao nhiệm vụ thiết kế Data Warehouse để lưu trữ các dữ liệu đó.

Các trường của tập dữ liệu sẽ như sau:

PetID - int  - ID duy nhất của một vật nuôi.
Type - varchar(3) - Loài của vật nuôi (Chó hoặc Mèo).
Name - nvarchar(255) - Tên của vật nuôi. Có thể để trống nếu chưa đặt tên.
Age - int - Số tháng tuổi của vật nuôi.
Breed1 - varchar(255) - Giống chính của vật nuôi.
Breed2 - varchar(255) - Giống thứ hai của  vật nuôi (nếu là giống lai).
Gender - varchar(6) - Giới tính của vật nuôi (Male, Female, Mixed)
Color1 - varchar(255) - Màu sắc thứ nhất của vật nuôi.
Color2 - varchar(255) - Màu sắc thứ hai của vật nuôi (Nếu có).
Color3 - varchar(255) - Màu sắc thứ ba của vật nuôi (Nếu có).
MaturitySize - varchar(13) - Kích thước khi trưởng thành (Small, Medium, Large, Extra Large, Not Specified).
FurLength - varchar(13) - Độ dài lông (Short, Medium, Long, Not Specified).
Vaccinated - varchar(8) - Thú cưng đã được tiêm phòng chưa (Yes, No, Not Sure).
Dewormed - varchar(8) - Thú cưng đã được tẩy giun chưa (Yes, No, Not Sure).
Sterilized - varchar(8) - Thú cưng đã được triệt sản chưa (Yes, No, Not Sure).
Health - varchar(14) - Tình trạng sức khỏe (Healthy, Minor Injury, Serious Injury, Not Specified).
Quantity - int -Số lượng vật nuôi có trong hồ sơ.
Fee - int - Phí nhận nuôi.
State - varchar(255) - Vị trí tiểu bang.
Description - nvarchar(2000) - Mô tả về vật nuôi.
RescuerID - int - Id của người giải cứu.

***

Hướng dẫn

1. Thiết kế ERD:

Sau khi tải xong dataset, bạn hãy tiến hành phân tích và xây dựng lược đồ cho Data Warehouse. Ở bài tập này, bạn nên chọn xây dựng theo kiến trúc Centralized Data Warehouse nên bạn chỉ cần thiết kế lược đồ cho một Database duy nhất. Sau đó, dựa theo ERD mà bạn đã thiết kế, hãy viết SQL để xây dựng cơ sở dữ liệu.

Bạn có thể sử dụng draw.io để vẽ ERD.

 2. Xác định các truy vấn nghiệp vụ:

Sau khi thiết kế xong ERD, bạn hãy xác định tối thiểu 3 truy vấn nghiệp vụ dùng để phân tích dữ liệu từ Dataset. Một số ví dụ như sau:

Có bao nhiêu vật nuôi được tiêm phòng cũng được triệt sản?
Có bao nhiêu vật nuôi ở một bang?

 3. Xây dựng ETL cho Dimension Table:

Như đã giới thiệu, chúng ta nên viết ETL cho các Dimension Table trước rồi mới đến Fact Table. Bạn nên thiết kế từng ETL riêng cho các Dimension Table, mỗi ETL sẽ nằm trong 1 Data Flow riêng.

Với việc đưa dữ liệu vào Dimension Table, bạn hãy thiết kế sao cho chỉ đưa các dữ liệu mới hoặc các dữ liệu thay đổi vào Dimension Table chứ sẽ không đưa các dữ liệu cũ vào nữa.

 4. Xây dựng ETL cho Fact Table

Sau khi xây dựng xong ETL cho Dimension Table, bạn hãy xây dựng ETL cho Fact Table. Bạn có thể sử dụng Lookup Transformation để tìm kiếm các dữ liệu liên quan trong các Dimension Table.

5. Viết SQL để thực hiện các truy vấn nghiệp vụ:

Sau khi chạy ETL và đưa dữ liệu vào Data Warehouse thành công. Bạn hãy viết SQL để thực hiện các truy vấn nghiệp vụ.

6. (Nâng cao) Sử dụng cơ chế Change Data Capture:

Khi thực hiện lấy dữ liệu, chúng ta không nên lấy toàn bộ dữ liệu mà chỉ cần lấy dữ liệu đã được chỉnh sửa hoặc thêm mới. Kỹ thuật Change Data Capture sẽ giúp chúng ta xác định được các dữ liệu này.

Change Data Capture chỉ có thể được áp dụng trên các Data Source ở dạng SQL Server, vậy nên bạn cần thiết kế một bảng mới có cấu trúc tương tự với file csv đã cho, sau đó đưa toàn bộ dữ liệu từ file csv sang bảng mới.

 7. (Nâng cao) Thiết kế các ETL chạy song song:

Chúng ta không nên chạy từng ETL lần lượt, như vậy sẽ rất tốn thời gian và không khai thác được hết tài nguyên của hệ thống. Vậy nên bạn cần thiết kế các ETL sau cho chúng có thể chạy song song với nhau. Tuy nhiên vẫn cần đảm bảo các dữ liệu DIM được load trước, sau đó mới load đến bảng Fact.