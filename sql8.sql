use sakila;
select * from category;

# 1 Rank films by length. Select only columns title, length and rank in your output.
select title, length  , rank() over(order by length desc) as "Rank"
from film
where length is not null or length <> 0;

# 2 Rank films by length within the rating category. In your output, only select the columns title, length, rating and rank.
select title, length, rating, rank() over(partition by rating order by length desc) as "Rank"
from film
where length is not null or length <> 0;

# 3 How many films are there for each of the categories in the category table? 
select name, count(film_id) from category A
left join film_category fA on A.category_id = fA.category_id
group by A.category_id;

# 4 Which actor has appeared in the most films? 
select B.actor_id, count(film_id) from actor B 
join film_actor FB on B.actor_id = fB.actor_id
group by B.actor_id
order by count(film_id) desc limit 1;


# 5 Which is the most active customer ?
select C.customer_id, count(rental_id) from customer C
join rental R on C.customer_id = R.customer_id
group by C.customer_id
order by count(rental_id) desc limit 1;
