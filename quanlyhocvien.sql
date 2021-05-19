insert into Students(studentName, studentPhone,classID, addressID)
values ('Nguyễn thị G', '0777-777-777', 4, 3);
insert into Students(studentName, studentPhone,classID, addressID)
values ('Nguyễn thị H', '0888-888-888', 4, 5);
insert into Students(studentName, studentPhone,classID, addressID)
values ('Nguyễn thị I', '0999-999-999', 5, 1);
insert into Students(studentName, studentPhone,classID, addressID)
values ('Nguyễn thị K', '1000-000-000', 5, 2);


insert into Course(couresName, couresDescription)
    value ('JavaBootCamp8', 'Học Java full 6 tháng');

insert into Course(couresName, couresDescription)
    value ('PHPBootCamp8', 'Học PHP full 5 tháng');

insert into Course(couresName, couresDescription)
    value ('JavaBootCamp4', 'Học Java  partTime 12 tháng');

insert into Course(couresName, couresDescription)
    value ('PHPBootCamp4', 'Học PHP partTime 10 tháng');

insert into Course(couresName, couresDescription)
    value ('Java', 'Học Java');

insert into points(coures_ID, student_ID, point) value
    (1,1,8),
    (1,2,9),
    (1,3,10),
    (1,4,8),
    (1,7,9),
    (2,1,9),
    (2,2,10),
    (2,3,8),
    (2,4,10),
    (2,6,8),
    (3,1,10),
    (3,6,8),
    (3,8,9),
    (3,10,9),
    (3,4,8);

# select address as DiaChi, count(Student.studentsID) as Soluong
select address as DiaChi, count(Address.addressID) as Soluong
from address
         inner join Students S on Address.addressID = S.addressID
group by address
order by address desc;

select couresName as KhoaHoc , avg(point) as DiemTB
from course
         inner join Points P on Course.couresID = P.coures_ID
group by couresName
order by couresName desc;


select couresName as KhoaHoc , avg(point) as DiemTB
from course
         inner join Points P on Course.couresID = P.coures_ID
group by couresName
order by couresName desc
    limit 1;

select  Ketqua.KhoaHoc, max(Ketqua.DiemTB)
from (select couresName as KhoaHoc , avg(point) as DiemTB
      from course
               inner join Points P on Course.couresID = P.coures_ID
      group by couresName
      order by couresName desc) as Ketqua;


# create table ketqua(
    #     id int auto_increment
        # );

select a.studentName, max(a.point) from (select students.studentName, p.point from students join points p on students.studentID = p.student_ID) as a;


SELECT S.StudentId, S.StudentName, AVG(point)
FROM Students S join Points p on S.StudentId = p.student_ID
GROUP BY S.StudentId, S.StudentName
HAVING AVG(point) >= ALL (SELECT AVG(point) FROM Points GROUP BY Points.pointId);