use eHRMApp;

/*
enum Role {
    0:DEFAULT
    1:DIRECTOR
    2:ADMINISTRATIVE
    3:DOCTOR
    4:NURSE
    5:SYSTEM
}
*/

-- Insert the professionals
insert into Professional (pk,user,password,name,surname,role,asNurse,asDoctor,asDirector,asAdministrative) values (1,'jorge','1111','Jorge','Cuellar',3,null,1,null,null), (2,'miguel','1111','Miguel','Garcia',3,null,2,null,null), (3,'karen','1111','Karen','Sraderr',4,1,null,null,null), (4,'alice','1111','Alice','Gonzalez',2,null,null,null,1), (5,'narciso','1111','Marti','Narciso',1,null,null,1,null);
-- Insert director
insert into Director (pk,directorProfessional) values (1,5);
-- Insert administrative
insert into Administrative (pk,administrativeProfessional) values (1,4);
-- Insert doctors
insert into Doctor (pk,status,medicalLicense,doctorProfessional) values (1,1,'1001',1), (2,1,'1002',2);
-- Insert nurse
insert into Nurse (pk,nursingLicense,nurseProfessional) values (1,'2001',3);

-- Insert medical center
insert into MedicalCenter (pk,addressCenter,country,nameCenter,zipCode,city) values (1,'Ramistrasse 100','Swissland','North Hospital',8006,'Zurich');
-- Insert departments
insert into Department (pk,location,nameDepartment,belongsTo) values (1,'First floor','Department N1',1), (2,'Second floor','Department N2',1);
-- Link the medical center and the departments
insert into Department_belongsTo__MedicalCenter_departments (MedicalCenter_departments,Department_belongsTo) values (1,1),(1,2);
-- Link the professionals and medical centers
insert into MedicalCenter_employees__Professional_worksIn(Professional_worksIn,MedicalCenter_employees) values (1,1),(2,1),(3,1),(4,1),(5,1);
-- Link doctors and departments
insert into Department_doctors__Doctor_doctorDepartments(Doctor_doctorDepartments,Department_doctors) values (1,1),(2,2);
-- Link nurses and departments
insert into Department_nurses__Nurse_nurseDepartments(Nurse_nurseDepartments,Department_nurses) values (1,2);

-- Insert patients
insert into Patient(pk,doctor,department,allocation,contact,administrative,medical,social,public) values (1,1,1,1,1,1,1,1,1), (2,2,2,2,2,2,2,2,2);
insert into ContactInfo (pk,birthDate,surnamePatient,gender,id,address,namePatient,contactPatient) values (1,'80-01-25','Smith','Male','1','Clausiusstrasse 38, Zurich','Peter',1), (2,'78-04-20','Carter','Male','2','Leonhardstrasse 25A, Zurich','Bob',2);
insert into AllocationInfo (pk,floor,room,allocationPatient) values (1,'1','108',1), (2,'1','109',2);
insert into AdministrativeInfo (pk,insurance,accountNumber,administrativePatient) values (1,'Adeslas','10848753',1), (2,'Adeslas','10123753',2);
insert into SocialInfo (pk,description,socialPatient) values (1,'Drug consumer',1), (2,'Alcoholism problems two years ago',2);
insert into PublicInfo (pk,allergies,bloodType,medicineRestrictions,diabetes,foodRestrictions,publicPatient) values (1,'None','A-','Prinperan','None','Lactose intolerance',1), (2,'Pollen and cats','B-','Penicillin','None','None',2);
insert into MedicalInfo (pk,medicalPatient) values (1,1),(2,2);
insert into MedicalCase (pk,medicalDescription,endDate,medicalId,startDate,medicalInfo) values (1,'Strong stomachache','2011-11-26 11:30:45','1001','2011-11-15 09:35:04',1), (2,'Cold','2012-02-01 10:45:32','1002','2012-01-26 14:25:24',1), (3,'Broken left arm','2012-01-14 11:45:32','2001','2012-01-14 11:15:24',1), (4,'Appendicitis','2012-02-02 17:34:09','3001','2012-01-30 08:17:44',2), (5,'Backache','2012-01-15 16:46:09','4001','2012-01-15 14:51:52',2);

insert into MedicalCase_medicalInfo__MedicalInfo_cases (MedicalInfo_cases,MedicalCase_medicalInfo) values (1,1), (1,2), (1,3), (2,4), (2,5);
-- TODO: add eHRs and link them to their cases
-- Link patients to doctors
insert into Doctor_doctorPatients__Patient_doctor (Doctor_doctorPatients,Patient_doctor) values (1,1), (2,2);
-- Link patients and departments
insert into Department_patients__Patient_department (Patient_department,Department_patients) values (1,1), (2,2);
