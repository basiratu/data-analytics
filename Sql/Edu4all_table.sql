-- a) How much is the total donation?
select * from donation_data;
select sum (donation) as total_donation from donation_data;

-- b) What is the total donation by gender?
Select gender, sum (donation)as total_donation from donation_data
group by gender;

-- c) Show the total donation and number of donations by gender
 Select * from donation_data;
 Select gender, count ('male'), sum (donation)as total_donation from donation_data
group by gender;

select gender, sum (donation) as "Total Donation", count (donation) as "Number of donations"
from donation_data
group by gender;

-- d) Total donation made by frequency of donation
select * from donor_data;
select * from donation_data;
select sum (donation) as "total donation",donation_frequency from donation_data
full join donor_data
on donor_data.id=donation_data.id
group by donation_frequency;


-- e) Total donation and number of donation by Job field
select * from donation_data;
select job_field, count (job_field), sum (donation) as "total donation" from donation_data
group by job_field;

-- f) Total donation and number of donations above $200
select * from donation_data;
select count (donation), sum (donation) as "total_donation" from donation_data
where donation >'200';

-- g) Total donation and number of donations below $200
select count (donation), sum (donation) as "total_donation" from donation_data
where donation <'200';

-- h) Which top 10 states contributes the highest donations
select * from donation_data;
select "state", sum(donation) as total_donation from donation_data
group by state
order by total_donation desc
limit 10;


-- i) Which top 10 states contributes the least donations
select "state", sum(donation) as total_donation from donation_data
group by state
order by total_donation asc
limit 10;

-- j) What are the top 10 cars driven by the highest donors
select donation_data.id, donation, car from donation_data
full join donor_data
on donor_data.id=donation_data.id
group by donation,donation_data.id,car
order by donation desc
limit 10;


select concat(first_name,' ',last_name),donation,car
from donation_data
full join donor_data on donation_data.id=donor_data.id
order by donation desc
limit 10;