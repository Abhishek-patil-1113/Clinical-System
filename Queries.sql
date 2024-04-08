--select clinic_name, clinic_addrs, clinic_area, clinic_city, clinic_pin, clinic_contact, clinic_website, clinic_email, cast (start_time as time(0)) as start_time, cast (end_time as time(0)) as end_time from clinic_detail where clinic_id=1
--select * from clinic_detail

--select * from staff

--select staff_id, staff_name, staff_addrs, staff_area, staff_city, staff_pin, staff_contact, staff_gender, staff_aadhar, staff_email, staff_dob, staff_doj, staff_qualification, staff_experience, staff_work_type, password from staff        

--select staff_dob from staff

--select cast(staff_dob as date) as staff_dob from staff

--delete from staff where staff_id = 4

--delete from staff where staff_id = 4 

--delete from staff where staff_work_type = 'select'

--select max(staff_id) from staff

--insert into clinic_detail (clinic_name ,clinic_addrs ,clinic_area,clinic_city,clinic_pin,clinic_contact,clinic_website,clinic_email,start_time,end_time,clinic_id) values('Pulse Clinic', 'Pune', 'Navle Bridge', 'Pune', 416416, '9090909090', , '{emailText}', '13:13:13', '13:13:13',1)


--insert into clinic_detail (clinic_name ,clinic_addrs ,clinic_area,clinic_city,clinic_pin,clinic_website,clinic_email,clinic_id) values('{nameText}', '{cadd}', '{carea}', '{cityText}', 414414, '{cweb}', '{emailText}',5)

--insert into clinic_detail (clinic_name ,clinic_addrs ,clinic_area,clinic_city,clinic_pin,clinic_contact,clinic_website,clinic_email,clinic_id) values('{nameText}', '{cadd}', '{carea}', '{cityText}', 416416, '9090909090', '{cweb}', '{emailText}',5)

--update clinic_detail set clinic_name = '{pppp}', clinic_addrs ='{cadd}', clinic_area='{carea}', clinic_city='{cityText}' , clinic_pin= 707070 , clinic_contact='1010101010', clinic_website='{cweb}', clinic_email = '{email}', am_pm_start = 'pm', am_pm_end = 'am' where clinic_id = 1

--update clinic_detail set clinic_name = '{nameText}', clinic_addrs ='{cadd}', clinic_area='{carea}', clinic_city='{cityText}' , clinic_pin= 909090 , clinic_contact='8080808080', clinic_website='{cweb}', clinic_email = '{email}', am_pm_start = 'pm', am_pm_end = 'am' where clinic_id = 1

--insert into clinic_detail(clinic_name ,clinic_addrs ,clinic_area,clinic_city,clinic_pin,clinic_contact,clinic_website,clinic_email,start_time,end_time,clinic_id) 
--values ('clinic name', 'clinic address', 'clinic area','clinic city', 0, 'contact','website', 'email','13:10:10.78', '13:10:10.78',4)

--update clinic_detail set clinic_name = 'a', clinic_addrs ='a', clinic_area='a', clinic_city='a' , clinic_pin= 0 , clinic_contact='a', clinic_website='a',
--clinic_email='b', start_time='13:13:13', end_time='13:13:13', am_pm_start='pm', am_pm_end='am' where clinic_id = 1

--clinic_name  
--clinic_addrs 
--clinic_area
--clinic_city
--clinic_pin
--clinic_contact
--clinic_website
--clinic_email
--start_time
--end_time
--am_pm_start
--am_pm_end
--clinic_id

--delete from clinic_detail where clinic_id=1


--update staff set staff_name = 'updated', staff_addrs = 'updated address', staff_area ='', staff_city = '', staff_pin = 141414, staff_contact = 7070707070, staff_gender = 'Male', staff_aadhar = 606060606060, staff_email = '', staff_dob = '', staff_doj = '', staff_qualification = '', staff_experience = '', staff_work_type = '', password = '' where staff_id = 4

select * from patient

--select patient_id, patient_name,patient_city,patient_gender,patient_contact,reg_dt from patient

--delete from patient where patient_id = 18

--select patient_id from patient where patient_name like 'n%'

--insert into patient values(1, '{name.Text}','{padd}', '{parea}', '{city.Text}', 131313 , 'Male','1/1/1999', '9090909090', '{email.Text}', '{pref}','AB+', '1/1/1999')

--update staff set patient_name = '{name.Text}', patient_addrs = '{padd}', patient_area ='{parea}', patient_city = '{city.Text}', patient_pin = '{ppin}', staff_gender = '{pgender}', patient_dob = '{pdob}', patient_contact = {contact.Text}, patient_email = '{email.Text}', patient_ref = {pref}, patient_blood_group = '{pbg}' , reg_dt = '{dor}'  where patient_id = 10 

--update patient set patient_name = '{name.Text}', patient_addrs = '{padd}', patient_area ='{parea}', patient_city = '{city.Text}', patient_pin = '141414', patient_gender = 'Male', patient_dob = '3/3/1999', patient_contact = '7070707070', patient_email = '{email.Text}', patient_ref = '{pref}', patient_blood_group = '{pbg}'  , reg_dt = '3/3/1999'  where patient_id = 10

--select * from visit

--select patient_name, patient_blood_group, year(GETDATE())-year(patient_dob)- case when DATEPART(DAYOFYEAR, GETDATE()) < DATEPART(dayofyear, patient_dob) then 1 else 0 end as Age from patient where patient_id = 10
--insert into visit values (1, 'With Appointment', '13:13:13', '1/1/1999', 5 , 6 , 10 , '{symptoms}', '{diagnosis}', 90 , '45/45', 99 , '99.99' , '5.6', 'am' )

--select * from medication

--insert into medication values (1, 1, 'medicine1', 'once a day', 30)


--select * from investigation

--insert into investigation values (1, 1, 'aa', 'vv')

--select staff_id, staff_name from staff 


--select * from staff

select * from allergy_history
select * from cronic_disease
select * from medication_history

--delete from allergy_history where allergy_id= 5

--insert into allergy_history values (1, 10, 'yuyu', '1/1/1999')

--insert into cronic_disease values (1, 10, 'yuyu', '1/1/1999')

--insert into medication_history values (1, 10, 'yuyu', 'once a day')

--select allergy_id, allergy, allergy_start_dt from allergy_history where patient_id = 10

--select cronic_disease_id, cronic_disease, cronic_disease_start_dt from cronic_disease where patient_id = 10

--select patient_med_id, medicine, frequency from medication_history where patient_id = 10

--select max(allergy_id) from allergy_history

--update allergy_history set allergy = 'opop' , allergy_start_dt = '1/1/1999' where allergy_id = 6

--update cronic_disease set cronic_disease = 'opop' , cronic_disease_start_dt = '1/1/1999' where cronic_disease_id = 6 
 
 --update medication_history set medicine = 'opop' , frequency = '1/1/1999' where patient_med_id = 6 


 --select clinic_name, clinic_addrs, clinic_area, clinic_city, clinic_pin, clinic_contact, clinic_website, clinic_email, cast (start_time as time(0)) as start_time, cast (end_time as time(0)) as end_time from clinic_detail where clinic_id=1


 --select patient_id,patient_name,patient_addrs,patient_area,patient_city,patient_pin,patient_gender, patient_dob, patient_contact , patient_email, patient_ref, patient_blood_group, reg_dt from patient where patient_id = 1


-- patient_id	int	Unchecked
--patient_name	varchar(40)	Checked
--patient_addrs	varchar(150)	Checked
--patient_area	varchar(50)	Checked
--patient_city	varchar(25)	Checked
--patient_pin	int	Checked
--patient_gender	varchar(8)	Checked
--patient_dob	date	Checked
--patient_contact	varchar(10)	Checked
--patient_email	varchar(40)	Checked
--patient_ref	varchar(50)	Checked
--patient_blood_group	varchar(5)	Checked
--reg_dt	date	Checked
--		Unchecked