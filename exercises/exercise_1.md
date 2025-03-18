# 0. Hospital example

a) Create a logical data model using lucidcharts

<img src = "../assets/hospital_model_logical.png" width=500>

b) Identify different keys on the various entities

Hostpital
- hospital_id

Hospital/Doctor
- hospital_doctor_id
- hospital_id
- doctor_id

Doctor
- doctor_id
  
Doctor/Department
- doctor_department_id
- doctor_id
- department_id
  
department
- department_id 

Hospital/Department
- hospital_department_id
- hospital_id
- department_id

c) Identify child entities and parent entities. What makes them into parent/child relationships?

Parent
- Hosptial
- Department
- Doctor
  
Child
- Hospital_department
- Hospital_Doctor
- Department_doctor

d) Create a physical data model using dbdiagram

        Table Hospital{
        hospital_id SERIAL [primary key]
        name VARCHAR(50) [not null]
        adress VARCHAR(100) [not null]
        }

        Table Department{
        department_id SERIAL [primary key]
        name VARCHAR(50) [not null]
        }

        Table Doctor{
        doctor_id SERIAL [primary key]
        name VARCHAR(50) [not null]
        }

        Table Department_doctor{
        doctor_id INTEGER [not null, ref: > Doctor.doctor_id]
        department_id INTEGER [not null, ref: > Department.department_id] 
        indexes {
        (doctor_id, department_id) [pk]
        }
        }

        Table Hospital_department{
        hospital_id INTEGER [not null, ref: > Hospital.hospital_id]
        department_id INTEGER [not null, ref: > Department.department_id] 
        indexes {
        (hospital_id, department_id) [pk]
        }
        }

        Table Hospital_doctor{
        hospital_id INTEGER [not null, ref: > Hospital.hospital_id]
        doctor_id INTEGER [not null, ref: > Doctor.doctor_id] 
        indexes {
        (hospital_id,doctor_id) [pk]
        }
        }


e) Create a few tables manually, insert given data plus some more, and try to manually link foreign keys to primary keys. Can you satisfy that a doctor can work at several departments and several hospitals?


# 1. Implement hospital example in postgres
a) Now implement your physical model from e) and add the data from task 0e). Make sure that you have correctly specified different domain constraints.

b) Now lets try to add a row in HospitalDepartment with a hospital_id that doesn't exist in the hospital table. What happens here and why?

c) Do similar to b) but try adding a department_id to HospitalDepartment that doesn't exist in the Department.

d) Now try to do normal delete a record in Hospital that the HospitalDepartment refers to. What happens?

e) Now use delete on cascade and check what happens.

f) Try to violate a domain constraint, what did you try and what result did you get?

# 2. Identify keys
a) Which columns could be candidate keys here?

- employee_id
- Avdelnings_id
- Epost
- Telefonnumer

 
b) From this set of candidate keys, which one would you choose as primary key and which ones as alternate keys?

        Primery key = Emplyee_id
        Alternate Key = Epost eller Telefon om dem är uniqe

c) Is your primary key considered as natural key or surrogate key?

        Emplyee_id är surrogate key på grund av att det inte finns på riktigt.  

d) Create another table with a primary key where one of the columns in this table could act as a foreign key.

| location_id | employee_id | street_adress | city      |
| ----------- | ----------- | ------------- | --------- |
| 1           | 201         | storvägen 2   | stockholm |
| 2           | 202         | mellanvägen 3 | göteborg  |
| 3           | 202         | lillavägen 34 | malmö     |
| 4           | 203         | storvägen 2   | stockholm |


# 3.Sakila exercise

<img src = "../assets/sakila_erd.png" width=1000>

a) Is this a conceptual, logical or physical ERD, motivate?

        Logical ERD 

b) How many entities are in the database?

        15 ink composite entity

c) Which are the composite entities?

        Film_catergory
        Film_actor
        Inventory
        Staff
        Rental
        Payment
        

d) Try to find suitable relationship labels between entities



e) Try to write out some possible relationship statements between the entities.
         
        
f) Can you find if there is any errors/mistakes in this ERD?

 Store
 - maneger_staff_id?

Rental
- Staff_id har ingen conection --> rättade i efterhand
- customer_id har ingen conection --> rättade i efterhand
  
Film Actor 
- Film_actor till film kan vara noll, ett eller flera 

Language
- Language till film bör vara many-to-many 