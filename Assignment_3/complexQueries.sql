\c tbs_assignment

-- SELECT * from customer, booking where (customer.cust_id = booking.cust_id);

-- SELECT seat_no, final_price, screen_no from ticket, shows where ((ticket.show_id = shows.show_id) and (shows.screen_no = 3));

--select all customer whose price was more than $100 after applying offer
select * from customer where cust_id in (select cust_ID from ticket where ticket.final_price < ticket.price);

-- select all customer whose price was less than $100

-- Customer queries:
-- select customer who have availed 10% off of their ticket
select * from customer where cust_ID in (select cust_ID from ticket where offer_ID in (select offer_ID from offer where discount = 10));

-- select the customer who has watched a movie directed by some director
-- select the maximum amount paid for a ticket and give details who paid it and for what movie

-- Cashier queries:
-- #select the cashier who has sold the ticket to a particular person 
-- select cashier_name from cashier as C,sale as S where C.cashier_id=S.cashier_id and ticket_no in (select ticket_no from ticket as T where T.cust_id in (select cust_id from customer where cust_name='Alex'));

-- #select the cashier who has sold the ticket for a particular movie
select C.cashier_name from cashier as C where cashier_id in(select S.cashier_id from sale as S where S.ticket_no in (select ticket_no from ticket as T where T.show_id in ((select show_id from movie as M ,shows as S where movie_name='Fame' and M.movie_id=S.movie_id) union (select show_id from movie as M ,shows as S where movie_name='Flicker' and M.movie_id=S.movie_id))));

-- #check the discount offered on the ticket of a particular customer
select discount from offer as O inner join (select offer_id from ticket as T inner join customer as C on C.cust_id=T.cust_id and C.cust_name='Alex') as Q on Q.offer_id=O.offer_id ;
 
-- Actor queries:
-- #select the movie in which the actor has acted in
-- #select the actors acting in a given movie
select actors.Actor_name, movie.movie_name from actors,movie where actors.movie_id=movie.movie_id and movie.movie_name = 'Do You Wanna Know a Secret?';
