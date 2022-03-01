use HMS;

-- 1) list the people who died in 2020 with thier body ID,names and the cause of death;
select deadbodyid,m_firstname,m_lastname,causeofdeath,dateofdeath
from morgue
where dateofdeath>='2020-1-1' and dateofdeath<='2020-12-31';

-- 2) report bill number,patientid and lab charge bills that are less than the average of the medicine prices;
select billno,patientid,labchargebill
from bill
where labchargebill<(select avg(price) from medicine);

-- 3) list all patients id and names only if there firstname begins with letter A;
select patientid,p_firstname,p_lastname
from patient
where p_firstname regexp '^A';

-- 4) report the number of specialities that the doctors have in this hospital;
select count(distinct speciality) as 'Speciality'
from doctor;

-- 5) report all patients bill number,names and the total bill according to the number of days spent;
select billno,p_firstname,p_lastname,sum(doctorcharge+(roomcharge*numberofdays)+labchargebill+medicinecharge) as 'Total bill'
from bill,patient
where bill.patientid=patient.patientid
group by billno;

-- 6) get the total prices of medicines according to their quantity only if the maximum quantity is greater than or equal 20;
select medid,(quantity*price) as 'Total price of medicines according to quantities'
from medicine
group by medid
having max(quantity) >=20;

-- 7) report patient ID,Firstname and age if patient age is greater than average of doctors age;
select patientid,p_firstname,p_age 
from patient
where p_age>(select avg(d_age)from doctor);

-- 8) list all patients and doctors name and their date of appointment with their doctors;
select concat(p_firstname,' ',p_lastname) as 'Patients Name',concat(d_firstname,' ',d_lastname) as 'Doctors Name',
dateofapp,timeofapp
from patient,doctor,appointment
where appointment.patientid=patient.patientid and appointment.doctorid=doctor.doctorid;

-- 9) report doctors id,firstname that are females that are responisble for the only available rooms in the hospital;
select doctorid,d_firstname from doctor 
where d_gender='F'
and exists (select statu from room where statu='available' and room.doctorid=doctor.doctorid);

-- 10) list patients names that had more than one Lab test on december 2020 at 12 pm;
select concat(p_firstname,' ',p_lastname) as 'Patients Name',amountoftest,dateoftest
from patient,laboratory
where amountoftest > '1' and dateoftest in('2020-12-01 12:00:00')
and laboratory.patientid=patient.patientid;



