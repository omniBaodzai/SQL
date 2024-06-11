-- Tạo database Quản lý sinh viên (QLSV)
CREATE DATABASE QLSV;

-- Tạo bảng MONHOC
CREATE TABLE MONHOC (
	MAMH VARCHAR(10) PRIMARY KEY, -- Mã môn học là khóa chính
	TENMH VARCHAR(255) NOT NULL, -- Tên môn học không được phép NULL
	SOTC INT NOT NULL -- Số tín chỉ không được phép NULL
);

-- Nhập dữ liệu bảng MONHOC: MAMH: M01 -> M05
INSERT INTO MONHOC (MAMH, TENMH, SOTC)
VALUES
	('M01', 'Dai so', 3),
	('M02', 'Giai tich', 2),
	('M03', 'Ky thuat lap trinh', 3),
	('M04', 'Triet hoc', 4),
	('M05', 'Co so du lieu', 4);

-- Tạo bảng LOP
CREATE TABLE LOP (
	MALP VARCHAR(10) PRIMARY KEY, -- Mã lớp là khóa chính
	TENLP VARCHAR(255) NOT NULL, -- Tên lớp không được phép NULL
	NK INT NOT NULL -- Niên khóa không được phép NULL
);

-- Nhập dữ liệu bảng LOP: MALP: L01 -> L03
INSERT INTO LOP (MALP, TENLP, NK)
VALUES
	('L01', 'Information Technology', 2021),
	('L02', 'Computer Science', 2022),
	('L03', 'Network Security', 2023);

--Tạo bảng SINHVIEN
CREATE TABLE SINHVIEN (
	MASV VARCHAR(10) PRIMARY KEY, -- Mã sinh viên là khóa chính
	TENSV VARCHAR(255) NOT NULL, -- Tên sinh viên không được phép NULL
	DCSV VARCHAR(255) NOT NULL, -- Địa chỉ sinh viên có thể NULL hoặc tùy bạn muốn
	MALP VARCHAR(10) NOT NULL, -- Mã lớp không được phép NULL, và sẽ là khóa ngoại
	FOREIGN KEY (MALP) REFERENCES LOP(MALP) -- Khóa ngoại tham chiếu đến bảng LOP
);

-- Nhập dữ liệu bảng SINHVIEN: MASV: S01 -> S20
INSERT INTO SINHVIEN (MASV, TENSV, DCSV, MALP)
VALUES
	('S01', 'Nguyen Van A', 'Hanoi', 'L01'),
	('S02', 'Tran Thi B', 'Hanoi', 'L03'),
	('S03', 'Le Van C', 'Dak Lak', 'L02'),
	('S04', 'Hoang Thi D', 'Lao Cai', 'L01'),
	('S05', 'Pham Van E', 'Hanoi', 'L01'),
	('S06', 'Ngo Thi F', 'Lam Dong', 'L02'),
	('S07', 'Dao Van G', 'Ho Chi Minh', 'L02'),
	('S08', 'Bui Thi H', 'Ho Chi Minh', 'L03'),
	('S09', 'Pham Van I', 'Nghe An', 'L01'),
	('S10', 'Le Thi J', 'Lang Son', 'L02'),
	('S11', 'Nguyen Van K', 'Tien Giang', 'L03'),
	('S12', 'Tran Thi L', 'Hanoi', 'L03'),
	('S13', 'Le Van M', 'Dak Lak', 'L01'),
	('S14', 'Hoang Thi N', 'Da Nang', 'L02'),
	('S15', 'Pham Van O', 'Hai Phong', 'L03'),
	('S16', 'Ngo Thi P', 'Long An', 'L01'),
	('S17', 'Dao Van Q', 'Hanoi', 'L02'),
	('S18', 'Bui Thi R', 'Dong Thap', 'L03'),
	('S19', 'Pham Van S', 'Ha Giang', 'L01'),
	('S20', 'Le Thi T', 'Ho Chi Minh', 'L02');

--Tạo bảng DIEMSV
CREATE TABLE DIEMSV (
	MASV VARCHAR(10) NOT NULL, -- Mã sinh viên không được phép NULL
	MAMH VARCHAR(10) NOT NULL, -- Mã môn học không được phép NULL
	DIEM FLOAT NOT NULL, -- Điểm không được phép NULL
	--DIEM DECIMAL(4, 2) CHECK (DIEM >= 0 AND DIEM <= 10),
	PRIMARY KEY (MASV, MAMH), -- Khóa chính là sự kết hợp của MASV và MAMH
	FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV), -- Khóa ngoại tham chiếu đến bảng SINHVIEN
	FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH) -- Khóa ngoại tham chiếu đến bảng MONHOC
);

-- Nhập dữ liệu cho bảng DIEMSV: 
/* 
- Phân phối điểm cho các sinh viên. Mỗi sinh viên có điểm từ 1 đến 4 môn. 
- Khoảng chừng một nửa sinh viên có điểm. 
- Có sinh viên đậu có sinh viên rớt (điểm hệ 10) 
*/
INSERT INTO DIEMSV (MASV, MAMH, DIEM)
VALUES
	('S01', 'M01', 8.5),
	('S01', 'M02', 7.0),
	('S01', 'M03', 9.0),
	('S02', 'M01', 5.5),
	('S02', 'M04', 6.0),
	('S03', 'M02', 4.0),
	('S03', 'M05', 7.5),
	('S04', 'M01', 8.0),
	('S04', 'M03', 4.0),
	('S05', 'M01', 9.0),
	('S05', 'M02', 8.5),
	('S05', 'M03', 9.5),
	('S06', 'M04', 4.5),
	('S07', 'M05', 5.0),
	('S08', 'M02', 7.0),
	('S09', 'M01', 3.0),
	('S09', 'M03', 6.0),
	('S10', 'M04', 3.5),
	('S10', 'M05', 8.5),
	('S11', 'M01', 6.5),
	('S11', 'M02', 7.5);