Create DATABASE tutorial


use tutorial;


DROP DATABASE tutorial


-- Constraints
-- NOT NULL
-- UNIQUE
-- DEFAULT
-- CHECK

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL UNIQUE PRIMARY KEY ,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100),
    contact VARCHAR(15),
    address text,
    dob date,
    gender enum("M","F"),
    status boolean DEFAULT 1
);

Drop table testing

SELECT * from users




insert into users (id, username, email, password, contact, address, dob, gender, status)
Values(15,'priya', 'priya@gmail.com', 'sad12as12esd3sdaf', '9835465767', 'Koteshwor, Kathmandu','2003-11-09', NULL, 1 ),
(3,'Sameera Singh', 'Sameera@gmail.com', 'sdf45hj3k2h4', '9836455768', 'Gwarko Lalitpur','2001-08-09', "F", 1 )
(4, 'Aarav', 'aarav@example.com', 'password1', '9800000001', 'Baluwatar, Kathmandu', '2000-02-14', 'M', 1),
(5, 'Alina', 'alina@example.com', 'password2', '9800000002', 'Sanepa, Lalitpur', '1998-05-21', 'F', 1),
(6, 'Raj', 'raj@example.com', 'password3', '9800000003', 'Thamel, Kathmandu', '1999-12-12', 'M', 1),
(7, 'Priya', 'priya@example.com', 'password4', '9800000004', 'Patan, Lalitpur', '2001-07-19', 'F', 1),
(8, 'Kiran', 'kiran@example.com', 'password5', '9800000005', 'Bhaktapur', '2000-04-23', 'M', 1),
(9, 'Sneha', 'sneha@example.com', 'password6', '9800000006', 'Baneshwor, Kathmandu', '1997-11-30', 'F', 1),
(10, 'Ramesh', 'ramesh@example.com', 'password7', '9800000007', 'Maitidevi, Kathmandu', '1998-09-05', 'M', 1),
(11, 'Sita', 'sita@example.com', 'password8', '9800000008', 'Dillibazar, Kathmandu', '1999-03-17', 'F', 1),
(12, 'Arjun', 'arjun@example.com', 'password9', '9800000009', 'Kirtipur', '2000-10-10', 'M', 1),
(13, 'Kritika', 'kritika@example.com', 'password10', '9800000010', 'Basundhara, Kathmandu', '2001-01-02', 'F', 1);




SELECT id, username as 'Name', address from users
WHERE gender = 'M' OR status = 1

SELECT id, username as 'Name', address from users
WHERE gender in ('M','F')  -- gender = 'M' OR gender = 'f'

Select * from users WHERE username like 'P%'
-- % => no character or characters
-- _ => one character



SELECT * FROM users WHERE dob 
BETWEEN '2000-01-01' AND '2001-12-31';

SELECT * FROM users WHERE dob 
NOT BETWEEN '2000-01-01' AND '2001-12-31';

Select * from users ORDER BY 
username ASC 

Select distinct username as "Name" from users ORDER BY username ASC


SELECT * from users WHERE gender is NULL

Select * from users ORDER BY username ASC LIMIT 10 offset 5


-- Agggrigate Function
-- Count()
-- Sum()
-- Avg()
-- MIN()
-- MAx()

Select Count(id) as "Male Users" from users where gender = 'M'\

update users
set email = 'Puspa@gmail.com' WHERE id = 15

delete from users where id = 15


commit;

delete from users where id in (2,6,13)
update users set email = 'kiranhere@gmail.com' where id = 8

rollback;
Select * from users



create table services(
    s_name VARCHAR(100) not NULL,
    s_id INT not null unique auto_increment,
    u_id int not null,
    s_description text null,
    PRIMARY KEY(s_id),
    Foreign key(u_id) references users(id)
)
INSERT INTO services (s_name, u_id, s_description)
VALUES
('Web Hosting', 1, 'Provides web hosting services to clients.'),
('SEO Optimization', 3, 'Helps in improving search engine rankings for websites.'),
('Graphic Design', 4, 'Creates visual concepts to communicate ideas.'),
('Digital Marketing', 5, 'Promotes brands through digital channels.'),
('Content Writing', 12, 'Produces written content for various platforms.'),
('IT Support', 7, 'Provides technical support and troubleshooting.'),
('App Development', 8, 'Develops applications for mobile and desktop.'),
('Cybersecurity', 9, 'Protects systems and networks from cyber threats.'),
('Cloud Services', 10, 'Offers cloud computing solutions.'),
('Data Analysis', 11, 'Analyzes data to extract meaningful insights.');

update services set u_id = 8 where s_id in (4,6,10)

-- Joining tables with foreign key
select * from users INNER JOIN services ON users.id = services.u_id
ORDER BY users.id ASC 

-- Priority on left table ie table 1
Select * from users left join services 
on users.id = services.u_id


-- Priority on right table ie table 2
Select * from users right join services 
on users.id = services.u_id