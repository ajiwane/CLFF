--
-- PostgreSQL database dump
--

-- Started on 2007-11-30 06:44:22

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1779 (class 1262 OID 16404)
-- Name: CFL; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "CFL" WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII';


ALTER DATABASE "CFL" OWNER TO postgres;

\connect "CFL"

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1780 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 288 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 26 (class 1255 OID 17449)
-- Dependencies: 5 288
-- Name: add_captain(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_captain() RETURNS "trigger"
    AS $$
begin
	IF (select count(*) from Playing
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no) > 0
	or (select count(*) from Substitute
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no) > 0
	or (
		(select count(*) from Playing A
			where new.team_name = A.team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 1
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 2
	or (select count(*) from Playing A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 5
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 5
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 3

	or ((select value from userteam where team_name=new.team_name)
		+ (select value from Player where club_name=new.club_name and jersey_no=new.jersey_no)
		) >100

	THEN
	delete from CaptainOf
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no;

	ELSE
		update userteam set value=value+(select value from Player where club_name=new.club_name and jersey_no=new.jersey_no)
		where team_name=new.team_name;

	END IF;
return NEW;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.add_captain() OWNER TO postgres;

--
-- TOC entry 25 (class 1255 OID 17450)
-- Dependencies: 5 288
-- Name: add_player(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_player() RETURNS "trigger"
    AS $$
begin
	IF (select count(*) from Substitute
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no) > 0
	or (select count(*) from CaptainOf
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no) > 0
	or (select count(*) from Playing
		where new.team_name = team_name) > 10
	or (
		(select count(*) from Playing A
			where new.team_name = A.team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 1
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 2
	or (select count(*) from Playing A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 5
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 5
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 3

	or ((select value from userteam where team_name=new.team_name)
		+ (select value from Player where club_name=new.club_name and jersey_no=new.jersey_no)
		) >100


	THEN
	delete from Playing
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no;
	ELSE
		update userteam set value=value+(select value from Player where club_name=new.club_name and jersey_no=new.jersey_no)
		where team_name=new.team_name;

	END IF;
return NEW;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.add_player() OWNER TO postgres;

--
-- TOC entry 24 (class 1255 OID 17451)
-- Dependencies: 288 5
-- Name: add_sub(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_sub() RETURNS "trigger"
    AS $$
begin
	IF (select count(*) from Playing
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no) > 0
	or (select count(*) from CaptainOf
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no) > 0
	or (select count(*) from Substitute
		where new.team_name = team_name) > 4
	or (
		(select count(*) from Playing A
			where new.team_name = A.team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 1
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 2
	or (select count(*) from Playing A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1
	or (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Goalkeeper' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Goalkeeper' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		> 1

	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Defender' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Defender' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 5
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Midfielder' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Midfielder' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 5
	or (
		(select count(*) from Playing A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from CaptainOf A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		+ (select count(*) from Substitute A
			where new.team_name = team_name
				and 'Forward' in (select position from Player
								where new.club_name = club_name
									and new.jersey_no = jersey_no)
				and 'Forward' in (select position from Player
								where A.club_name = club_name
									and A.jersey_no = jersey_no))
		) > 3

	or ((select value from userteam where team_name=new.team_name)
		+ (select value from Player where club_name=new.club_name and jersey_no=new.jersey_no)
		) >100

	THEN

	delete from Substitute
		where new.team_name = team_name
			and new.club_name = club_name
			and new.jersey_no = jersey_no;
	ELSE
		update userteam set value=value+(select value from Player where club_name=new.club_name and jersey_no=new.jersey_no)
		where team_name=new.team_name;	

	END IF;
return NEW;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.add_sub() OWNER TO postgres;

--
-- TOC entry 19 (class 1255 OID 17452)
-- Dependencies: 5 288
-- Name: insert_club_league(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insert_club_league() RETURNS "trigger"
    AS $$
begin
	
	insert into BelongsTo values
		((select team_name from owns where user_id = new.user_id),new.club_name, (1+ (select count(*) from BelongsTo B where
			league_name=new.club_name and 
			(select score from Userteam U where
				U.team_name =B.team_name)>(select score from Userteam where team_name=(select team_name from owns where user_id = new.user_id)))
					)
                );
return NEW;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.insert_club_league() OWNER TO postgres;

--
-- TOC entry 20 (class 1255 OID 17453)
-- Dependencies: 5 288
-- Name: insert_team(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insert_team() RETURNS "trigger"
    AS $$
begin
	insert into BelongsTo values
		(new.team_name,'Overall', (1+ (select count(*) from BelongsTo B where
			league_name='Overall' and 
			(select score from Userteam U where
				U.team_name =B.team_name)>(select score from Userteam where team_name=new.team_name ))
					)
                );
	insert into BelongsTo values
		(new.team_name,'Today', (1+ (select count(*) from BelongsTo B where
			league_name='Today' and 
			(select score from Userteam U where
				U.team_name =B.team_name)>(select score from Userteam where team_name=new.team_name ))
					)
                );
	
return NEW;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.insert_team() OWNER TO postgres;

--
-- TOC entry 21 (class 1255 OID 17454)
-- Dependencies: 288 5
-- Name: player_fn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION player_fn() RETURNS "trigger"
    AS $$
        begin
	IF new.today_played_game = 1
	THEN
			update Player_total_stats
			set total_played_game = total_played_game + new.today_played_game,
				total_played_60_min = total_played_60_min + new.today_played_60_min,
				total_goal_scored = total_goal_scored + new.today_goal_scored,
				total_goal_assist = total_goal_assist +new.today_goal_assist,
				total_no_conceed = total_no_conceed +new.today_no_conceed,
				total_penalty_saved = total_penalty_saved +new.today_penalty_saved,
				total_penalty_created = total_penalty_created +new.today_penalty_created,
				total_penalty_missed = total_penalty_missed +new.today_penalty_missed,
				total_2_goal_conceed = total_2_goal_conceed +new.today_2_goal_conceed,
				total_yellow_card = total_yellow_card +new.today_yellow_card,
				total_red_card = total_red_card +new.today_red_card,
				total_3_saves = total_3_saves +new.today_3_saves
			where new.club_name = club_name
			and new.jersey_no = jersey_no;


		IF new.position ='Forward' and new.today_yellow_card = 0
		THEN

		update score set today_score=(new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2))
					+ (new.today_red_card*(-3)) + (new.today_3_saves*1),
				total_score=total_score + (new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2))
					+ (new.today_red_card*(-3)) + (new.today_3_saves*1)
				where new.club_name = club_name
				and new.jersey_no = jersey_no;

		
		ELSE IF new.position = 'Forward' and new.today_yellow_card = 1
		THEN

		update score set today_score=(new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2)) +(new.today_yellow_card*(-1))
					+ (new.today_red_card*(-2)) + (new.today_3_saves*1),
				
				total_score=total_score + (new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2)) +(new.today_yellow_card*(-1))
					+ (new.today_red_card*(-2)) + (new.today_3_saves*1)
				where new.club_name = club_name
			and new.jersey_no = jersey_no;

		ELSE IF new.position = 'Midfielder' and new.today_yellow_card = 0
		THEN

		update score set today_score=(new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*5) + (new.today_no_conceed*2) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2))
					+ (new.today_red_card*(-3)) + (new.today_3_saves*1),
				total_score=total_score + (new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*5) + (new.today_no_conceed*2) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2))
					+ (new.today_red_card*(-3)) + (new.today_3_saves*1)
				where new.club_name = club_name
			and new.jersey_no = jersey_no;

		ELSE	IF new.position = 'Midfielder' and new.today_yellow_card = 1
		THEN

		update score set today_score=(new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*5) + (new.today_no_conceed*2) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2)) +(new.today_yellow_card*(-1))
					+ (new.today_red_card*(-2)) + (new.today_3_saves*1),
				total_score=total_score + (new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*5) + (new.today_no_conceed*2) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2)) +(new.today_yellow_card*(-1))
					+ (new.today_red_card*(-2)) + (new.today_3_saves*1)
				where new.club_name = club_name
			and new.jersey_no = jersey_no;

		ELSE IF (new.position = 'Defender' or new.position = 'Goalkeeper') and new.today_yellow_card = 0
		THEN

		update score set today_score=(new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*6) + (new.today_no_conceed*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2))
					+ (new.today_red_card*(-3)) + (new.today_3_saves*1) + (new.today_2_goal_conceed*(-1)),
				total_score=total_score + (new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*6) + (new.today_no_conceed*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2))
					+ (new.today_red_card*(-3)) + (new.today_3_saves*1) + (new.today_2_goal_conceed*(-1))
				where new.club_name = club_name
			and new.jersey_no = jersey_no;

		
		ELSE IF (new.position = 'Defender' or new.position = 'Goalkeeper') and new.today_yellow_card = 1
		THEN

		update score set today_score=(new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*6) + (new.today_no_conceed*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2)) +(new.today_yellow_card*(-1))
					+ (new.today_red_card*(-2)) + (new.today_3_saves*1) + (new.today_2_goal_conceed*(-1)),
				total_score=total_score + (new.today_played_game*1) + (new.today_played_60_min*1)
					+ (new.today_goal_scored*6) + (new.today_no_conceed*4) + (new.today_goal_assist*3) + (new.today_penalty_saved*5) +
					+ (new.today_penalty_created*1) + (new.today_penalty_missed*(-2)) +(new.today_yellow_card*(-1))
					+ (new.today_red_card*(-2)) + (new.today_3_saves*1) + (new.today_2_goal_conceed*(-1))
				where new.club_name = club_name
			and new.jersey_no = jersey_no;

		
		END IF; END IF;END IF;END IF;END IF;END IF;
	END IF;			
return NEW;
end;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.player_fn() OWNER TO postgres;

--
-- TOC entry 27 (class 1255 OID 17455)
-- Dependencies: 288 5
-- Name: score_change_fn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION score_change_fn() RETURNS "trigger"
    AS $$
begin
	IF new.score > old.score
	THEN
		update BelongsTo A set league_rank = 1+ (select count(*) from BelongsTo B where B.league_name=A.league_name and (select score from Userteam U where
								U.team_name =B.team_name)>(select score from Userteam where team_name=new.team_name ))
			where A.team_name = new.team_name and A.league_name<>'Today';
		update BelongsTo A set league_rank = league_rank + 1
			where A.league_name in (select league_name from BelongsTo B where B.team_name = new.team_name)
				and A.league_name<>'Today'
				and (select score from UserTeam where team_name = A.team_name) >= old.score
				and (select score from UserTeam where team_name = A.team_name) < new.score;

		update BelongsTo A set league_rank = 1+ (select count(*) from BelongsTo B where B.league_name=A.league_name and (select score_today from Userteam U where
								U.team_name =B.team_name)>(select score_today from Userteam where team_name=new.team_name ))
			where A.team_name = new.team_name and A.league_name='Today';
		update BelongsTo A set league_rank = league_rank + 1
			where A.league_name in (select league_name from BelongsTo B where B.team_name = new.team_name)
				and A.league_name='Today'
				and (select score_today from UserTeam where team_name = A.team_name) >= old.score_today
				and (select score_today from UserTeam where team_name = A.team_name) < new.score_today;
	END IF;
	IF new.score < old.score
	THEN
		update BelongsTo A set league_rank = 1+ (select count(*) from BelongsTo B where B.league_name=A.league_name and (select score from Userteam U where
								U.team_name =B.team_name)>(select score from Userteam where team_name=new.team_name ))
			where A.team_name = new.team_name and A.league_name<>'Today';
		update BelongsTo A set league_rank = league_rank - 1
			where A.league_name in (select league_name from BelongsTo B where B.team_name = new.team_name)
				and A.league_name<>'Today'
				and (select score from UserTeam where team_name = A.team_name) < old.score
				and (select score from UserTeam where team_name = A.team_name) >= new.score;

		update BelongsTo A set league_rank = 1+ (select count(*) from BelongsTo B where B.league_name=A.league_name and (select score_today from Userteam U where
								U.team_name =B.team_name)>(select score_today from Userteam where team_name=new.team_name ))
			where A.team_name = new.team_name and A.league_name='Today';
		update BelongsTo A set league_rank = league_rank - 1
			where A.league_name in (select league_name from BelongsTo B where B.team_name = new.team_name)
				and A.league_name='Today'
				and (select score_today from UserTeam where team_name = A.team_name) < old.score_today
				and (select score_today from UserTeam where team_name = A.team_name) >= new.score_today;
	END IF;

return NEW;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.score_change_fn() OWNER TO postgres;

--
-- TOC entry 22 (class 1255 OID 17456)
-- Dependencies: 288 5
-- Name: score_fn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION score_fn() RETURNS "trigger"
    AS $$
        begin

		update userteam set score = score + new.today_score,
				    score_today=score_today+new.today_score	
						where team_name in (select team_name from playing where 
												club_name =new.club_name and
												jersey_no = new.jersey_no);
			
		
		update userteam set score = score + (new.today_score*2),
					score_today = score_today + (new.today_score*2)
						 where team_name in (select team_name from CaptainOf where 
												club_name =new.club_name and
												jersey_no = new.jersey_no);		
				
return NEW;
end;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.score_fn() OWNER TO postgres;

--
-- TOC entry 23 (class 1255 OID 17457)
-- Dependencies: 288 5
-- Name: team_join_league(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION team_join_league() RETURNS "trigger"
    AS $$
begin
	
update BelongsTo B1  set league_rank = 1+(select count(*) from BelongsTo B1 where							
 							new.league_name = B1.league_name  and 
							(select score from Userteam U where
										U.team_name =B1.team_name)>(select score from Userteam where team_name=new.team_name ))
			where league_name=new.league_name and team_name=new.team_name;

update BelongsTo B1 set league_rank=league_rank+1 where							
 							new.league_name = B1.league_name  and 
							(select score from Userteam U where
										U.team_name =B1.team_name)<(select score from Userteam where team_name=new.team_name );

	
	return NEW;
end;$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.team_join_league() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1293 (class 1259 OID 17458)
-- Dependencies: 1641 5
-- Name: belongsto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE belongsto (
    team_name character varying(30) NOT NULL,
    league_name character varying(30) NOT NULL,
    league_rank integer NOT NULL,
    CONSTRAINT belongsto_league_rank_check CHECK ((league_rank > 0))
);


ALTER TABLE public.belongsto OWNER TO postgres;

--
-- TOC entry 1294 (class 1259 OID 17461)
-- Dependencies: 5
-- Name: captainof; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE captainof (
    team_name character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL
);


ALTER TABLE public.captainof OWNER TO postgres;

--
-- TOC entry 1295 (class 1259 OID 17463)
-- Dependencies: 5
-- Name: club; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE club (
    club_name character varying(30) NOT NULL,
    stats_link character varying(100)
);


ALTER TABLE public.club OWNER TO postgres;

--
-- TOC entry 1296 (class 1259 OID 17465)
-- Dependencies: 5
-- Name: creates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE creates (
    league_name character varying(30) NOT NULL,
    user_id character varying(30) NOT NULL
);


ALTER TABLE public.creates OWNER TO postgres;

--
-- TOC entry 1310 (class 1259 OID 17720)
-- Dependencies: 5
-- Name: deadlines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE deadlines (
    matchday character varying(30) NOT NULL,
    deadline_close timestamp without time zone NOT NULL,
    deadline_open timestamp without time zone NOT NULL
);


ALTER TABLE public.deadlines OWNER TO postgres;

--
-- TOC entry 1297 (class 1259 OID 17467)
-- Dependencies: 5
-- Name: favourite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE favourite (
    user_id character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL
);


ALTER TABLE public.favourite OWNER TO postgres;

--
-- TOC entry 1298 (class 1259 OID 17469)
-- Dependencies: 5
-- Name: league; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE league (
    league_name character varying(30) NOT NULL
);


ALTER TABLE public.league OWNER TO postgres;

--
-- TOC entry 1299 (class 1259 OID 17471)
-- Dependencies: 5
-- Name: owns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE owns (
    user_id character varying(30) NOT NULL,
    team_name character varying(30)
);


ALTER TABLE public.owns OWNER TO postgres;

--
-- TOC entry 1300 (class 1259 OID 17473)
-- Dependencies: 1642 1643 1644 1645 1646 1647 1648 1649 1650 1651 1652 1653 1654 1655 1656 1657 1658 1659 1660 1661 1662 1663 1664 1665 1666 1667 1668 1669 5
-- Name: player; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE player (
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL,
    player_name character varying(50) NOT NULL,
    "position" character varying(30) NOT NULL,
    value double precision NOT NULL,
    today_played_game integer DEFAULT 0,
    today_played_60_min integer DEFAULT 0,
    today_goal_scored integer DEFAULT 0,
    today_goal_assist integer DEFAULT 0,
    today_no_conceed integer DEFAULT 0,
    today_penalty_saved integer DEFAULT 0,
    today_penalty_created integer DEFAULT 0,
    today_penalty_missed integer DEFAULT 0,
    today_2_goal_conceed integer DEFAULT 0,
    today_yellow_card integer DEFAULT 0,
    today_red_card integer DEFAULT 0,
    today_3_saves integer DEFAULT 0,
    today_score integer DEFAULT 0,
    CONSTRAINT player_jersey_no_check CHECK ((jersey_no > 0)),
    CONSTRAINT player_position_check CHECK ((("position")::text = ANY ((ARRAY['Forward'::character varying, 'Midfielder'::character varying, 'Defender'::character varying, 'Goalkeeper'::character varying])::text[]))),
    CONSTRAINT player_today_2_goal_conceed_check CHECK ((today_2_goal_conceed >= 0)),
    CONSTRAINT player_today_3_saves_check CHECK ((today_3_saves >= 0)),
    CONSTRAINT player_today_goal_assist_check CHECK ((today_goal_assist >= 0)),
    CONSTRAINT player_today_goal_scored_check CHECK ((today_goal_scored >= 0)),
    CONSTRAINT player_today_no_conceed_check CHECK ((today_no_conceed = ANY (ARRAY[1, 0]))),
    CONSTRAINT player_today_penalty_created_check CHECK ((today_penalty_created >= 0)),
    CONSTRAINT player_today_penalty_missed_check CHECK ((today_penalty_missed >= 0)),
    CONSTRAINT player_today_penalty_saved_check CHECK ((today_penalty_saved >= 0)),
    CONSTRAINT player_today_played_60_min_check CHECK ((today_played_60_min = ANY (ARRAY[1, 0]))),
    CONSTRAINT player_today_played_game_check CHECK ((today_played_game = ANY (ARRAY[1, 0]))),
    CONSTRAINT player_today_red_card_check CHECK ((today_red_card = ANY (ARRAY[1, 0]))),
    CONSTRAINT player_today_yellow_card_check CHECK ((today_yellow_card = ANY (ARRAY[1, 0]))),
    CONSTRAINT player_value_check CHECK ((value > (0)::double precision))
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 1301 (class 1259 OID 17503)
-- Dependencies: 1670 1671 1672 1673 1674 1675 1676 1677 1678 1679 1680 1681 1682 1683 1684 1685 1686 1687 1688 1689 1690 1691 1692 1693 1694 1695 1696 1697 5
-- Name: player_total_stats; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE player_total_stats (
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL,
    player_name character varying(50) NOT NULL,
    "position" character varying(30) NOT NULL,
    value double precision NOT NULL,
    total_played_game integer DEFAULT 0,
    total_played_60_min integer DEFAULT 0,
    total_goal_scored integer DEFAULT 0,
    total_goal_assist integer DEFAULT 0,
    total_no_conceed integer DEFAULT 0,
    total_penalty_saved integer DEFAULT 0,
    total_penalty_created integer DEFAULT 0,
    total_penalty_missed integer DEFAULT 0,
    total_2_goal_conceed integer DEFAULT 0,
    total_yellow_card integer DEFAULT 0,
    total_red_card integer DEFAULT 0,
    total_3_saves integer DEFAULT 0,
    total_score integer DEFAULT 0,
    CONSTRAINT player_total_stats_jersey_no_check CHECK ((jersey_no > 0)),
    CONSTRAINT player_total_stats_position_check CHECK ((("position")::text = ANY ((ARRAY['Forward'::character varying, 'Midfielder'::character varying, 'Defender'::character varying, 'Goalkeeper'::character varying])::text[]))),
    CONSTRAINT player_total_stats_total_2_goal_conceed_check CHECK ((total_2_goal_conceed >= 0)),
    CONSTRAINT player_total_stats_total_3_saves_check CHECK ((total_3_saves >= 0)),
    CONSTRAINT player_total_stats_total_goal_assist_check CHECK ((total_goal_assist >= 0)),
    CONSTRAINT player_total_stats_total_goal_scored_check CHECK ((total_goal_scored >= 0)),
    CONSTRAINT player_total_stats_total_no_conceed_check CHECK ((total_no_conceed >= 0)),
    CONSTRAINT player_total_stats_total_penalty_created_check CHECK ((total_penalty_created >= 0)),
    CONSTRAINT player_total_stats_total_penalty_missed_check CHECK ((total_penalty_missed >= 0)),
    CONSTRAINT player_total_stats_total_penalty_saved_check CHECK ((total_penalty_saved >= 0)),
    CONSTRAINT player_total_stats_total_played_60_min_check CHECK ((total_played_60_min >= 0)),
    CONSTRAINT player_total_stats_total_played_game_check CHECK ((total_played_game >= 0)),
    CONSTRAINT player_total_stats_total_red_card_check CHECK ((total_red_card >= 0)),
    CONSTRAINT player_total_stats_total_yellow_card_check CHECK ((total_yellow_card >= 0)),
    CONSTRAINT player_total_stats_value_check CHECK ((value > (0)::double precision))
);


ALTER TABLE public.player_total_stats OWNER TO postgres;

--
-- TOC entry 1302 (class 1259 OID 17533)
-- Dependencies: 5
-- Name: playing; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE playing (
    team_name character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL
);


ALTER TABLE public.playing OWNER TO postgres;

--
-- TOC entry 1303 (class 1259 OID 17535)
-- Dependencies: 5
-- Name: private; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE private (
    league_name character varying(30) NOT NULL,
    league_id character varying(30) NOT NULL
);


ALTER TABLE public.private OWNER TO postgres;

--
-- TOC entry 1304 (class 1259 OID 17537)
-- Dependencies: 5
-- Name: public; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public (
    league_name character varying(30) NOT NULL
);


ALTER TABLE public.public OWNER TO postgres;

--
-- TOC entry 1305 (class 1259 OID 17539)
-- Dependencies: 5
-- Name: results; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE results (
    matchday character varying(20) NOT NULL,
    hometeam character varying(30) NOT NULL,
    awayteam character varying(30) NOT NULL,
    score character varying(15) NOT NULL
);


ALTER TABLE public.results OWNER TO postgres;

--
-- TOC entry 1306 (class 1259 OID 17542)
-- Dependencies: 1698 1699 1700 1701 5
-- Name: score; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE score (
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL,
    today_score integer DEFAULT 0,
    total_score integer DEFAULT 0,
    CONSTRAINT score_today_score_check CHECK ((today_score >= 0)),
    CONSTRAINT score_total_score_check CHECK ((total_score >= 0))
);


ALTER TABLE public.score OWNER TO postgres;

--
-- TOC entry 1307 (class 1259 OID 17548)
-- Dependencies: 5
-- Name: substitute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE substitute (
    team_name character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL
);


ALTER TABLE public.substitute OWNER TO postgres;

--
-- TOC entry 1308 (class 1259 OID 17550)
-- Dependencies: 1702 5
-- Name: user_table; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_table (
    user_id character varying(30) NOT NULL,
    "password" character varying(32) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    question character varying(100) DEFAULT 'What is your date of birth?'::character varying,
    answer character varying(32) NOT NULL
);


ALTER TABLE public.user_table OWNER TO postgres;

--
-- TOC entry 1309 (class 1259 OID 17553)
-- Dependencies: 1703 1704 1705 5
-- Name: userteam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE userteam (
    team_name character varying(30) NOT NULL,
    score integer DEFAULT 0,
    value double precision DEFAULT 0,
    score_today integer DEFAULT 0
);


ALTER TABLE public.userteam OWNER TO postgres;

--
-- TOC entry 1707 (class 2606 OID 17559)
-- Dependencies: 1293 1293 1293
-- Name: belongsto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY belongsto
    ADD CONSTRAINT belongsto_pkey PRIMARY KEY (team_name, league_name);


--
-- TOC entry 1709 (class 2606 OID 17561)
-- Dependencies: 1294 1294
-- Name: captainof_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY captainof
    ADD CONSTRAINT captainof_pkey PRIMARY KEY (team_name);


--
-- TOC entry 1711 (class 2606 OID 17563)
-- Dependencies: 1295 1295
-- Name: club_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY club
    ADD CONSTRAINT club_pkey PRIMARY KEY (club_name);


--
-- TOC entry 1713 (class 2606 OID 17565)
-- Dependencies: 1295 1295
-- Name: club_stats_link_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY club
    ADD CONSTRAINT club_stats_link_key UNIQUE (stats_link);


--
-- TOC entry 1715 (class 2606 OID 17567)
-- Dependencies: 1296 1296
-- Name: creates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY creates
    ADD CONSTRAINT creates_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1745 (class 2606 OID 17723)
-- Dependencies: 1310 1310
-- Name: deadlines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY deadlines
    ADD CONSTRAINT deadlines_pkey PRIMARY KEY (matchday);


--
-- TOC entry 1717 (class 2606 OID 17569)
-- Dependencies: 1297 1297
-- Name: favourite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY favourite
    ADD CONSTRAINT favourite_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1719 (class 2606 OID 17571)
-- Dependencies: 1298 1298
-- Name: league_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY league
    ADD CONSTRAINT league_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1721 (class 2606 OID 17573)
-- Dependencies: 1299 1299
-- Name: owns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1723 (class 2606 OID 17575)
-- Dependencies: 1299 1299
-- Name: owns_team_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_team_name_key UNIQUE (team_name);


--
-- TOC entry 1725 (class 2606 OID 17577)
-- Dependencies: 1300 1300 1300
-- Name: player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (club_name, jersey_no);


--
-- TOC entry 1727 (class 2606 OID 17579)
-- Dependencies: 1301 1301 1301
-- Name: player_total_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY player_total_stats
    ADD CONSTRAINT player_total_stats_pkey PRIMARY KEY (club_name, jersey_no);


--
-- TOC entry 1729 (class 2606 OID 17581)
-- Dependencies: 1302 1302 1302 1302
-- Name: playing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY playing
    ADD CONSTRAINT playing_pkey PRIMARY KEY (team_name, club_name, jersey_no);


--
-- TOC entry 1731 (class 2606 OID 17583)
-- Dependencies: 1303 1303
-- Name: private_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY private
    ADD CONSTRAINT private_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1733 (class 2606 OID 17585)
-- Dependencies: 1304 1304
-- Name: public_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public
    ADD CONSTRAINT public_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1735 (class 2606 OID 17719)
-- Dependencies: 1305 1305 1305
-- Name: results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (matchday, hometeam);


--
-- TOC entry 1737 (class 2606 OID 17589)
-- Dependencies: 1306 1306 1306
-- Name: score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY score
    ADD CONSTRAINT score_pkey PRIMARY KEY (club_name, jersey_no);


--
-- TOC entry 1739 (class 2606 OID 17591)
-- Dependencies: 1307 1307 1307 1307
-- Name: substitute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY substitute
    ADD CONSTRAINT substitute_pkey PRIMARY KEY (team_name, club_name, jersey_no);


--
-- TOC entry 1741 (class 2606 OID 17593)
-- Dependencies: 1308 1308
-- Name: user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1743 (class 2606 OID 17595)
-- Dependencies: 1309 1309
-- Name: userteam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY userteam
    ADD CONSTRAINT userteam_pkey PRIMARY KEY (team_name);


--
-- TOC entry 1769 (class 2620 OID 17596)
-- Dependencies: 26 1294
-- Name: add_captainof; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER add_captainof
    AFTER INSERT OR UPDATE ON captainof
    FOR EACH ROW
    EXECUTE PROCEDURE add_captain();


--
-- TOC entry 1772 (class 2620 OID 17597)
-- Dependencies: 25 1302
-- Name: add_playing; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER add_playing
    AFTER INSERT OR UPDATE ON playing
    FOR EACH ROW
    EXECUTE PROCEDURE add_player();


--
-- TOC entry 1774 (class 2620 OID 17598)
-- Dependencies: 1307 24
-- Name: add_substitute; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER add_substitute
    AFTER INSERT OR UPDATE ON substitute
    FOR EACH ROW
    EXECUTE PROCEDURE add_sub();


--
-- TOC entry 1770 (class 2620 OID 17599)
-- Dependencies: 19 1297
-- Name: fav_club; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER fav_club
    AFTER INSERT ON favourite
    FOR EACH ROW
    EXECUTE PROCEDURE insert_club_league();


--
-- TOC entry 1775 (class 2620 OID 17600)
-- Dependencies: 1309 20
-- Name: new_team; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER new_team
    AFTER INSERT ON userteam
    FOR EACH ROW
    EXECUTE PROCEDURE insert_team();


--
-- TOC entry 1771 (class 2620 OID 17601)
-- Dependencies: 21 1300
-- Name: player_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER player_update
    AFTER UPDATE ON player
    FOR EACH ROW
    EXECUTE PROCEDURE player_fn();


--
-- TOC entry 1776 (class 2620 OID 17602)
-- Dependencies: 27 1309
-- Name: score_change; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER score_change
    AFTER UPDATE ON userteam
    FOR EACH ROW
    EXECUTE PROCEDURE score_change_fn();


--
-- TOC entry 1773 (class 2620 OID 17603)
-- Dependencies: 22 1306
-- Name: score_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER score_update
    AFTER UPDATE ON score
    FOR EACH ROW
    EXECUTE PROCEDURE score_fn();


--
-- TOC entry 1768 (class 2620 OID 17604)
-- Dependencies: 23 1293
-- Name: team_joins_league; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER team_joins_league
    AFTER INSERT ON belongsto
    FOR EACH ROW
    EXECUTE PROCEDURE team_join_league();


--
-- TOC entry 1746 (class 2606 OID 17605)
-- Dependencies: 1293 1298 1718
-- Name: belongsto_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY belongsto
    ADD CONSTRAINT belongsto_league_name_fkey FOREIGN KEY (league_name) REFERENCES league(league_name);


--
-- TOC entry 1747 (class 2606 OID 17610)
-- Dependencies: 1293 1742 1309
-- Name: belongsto_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY belongsto
    ADD CONSTRAINT belongsto_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1748 (class 2606 OID 17615)
-- Dependencies: 1300 1294 1294 1300 1724
-- Name: captainof_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captainof
    ADD CONSTRAINT captainof_club_name_fkey FOREIGN KEY (club_name, jersey_no) REFERENCES player(club_name, jersey_no);


--
-- TOC entry 1749 (class 2606 OID 17620)
-- Dependencies: 1742 1309 1294
-- Name: captainof_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captainof
    ADD CONSTRAINT captainof_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1750 (class 2606 OID 17625)
-- Dependencies: 1296 1303 1730
-- Name: creates_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creates
    ADD CONSTRAINT creates_league_name_fkey FOREIGN KEY (league_name) REFERENCES private(league_name);


--
-- TOC entry 1751 (class 2606 OID 17630)
-- Dependencies: 1740 1308 1296
-- Name: creates_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creates
    ADD CONSTRAINT creates_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_table(user_id);


--
-- TOC entry 1752 (class 2606 OID 17635)
-- Dependencies: 1297 1295 1710
-- Name: favourite_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favourite
    ADD CONSTRAINT favourite_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1753 (class 2606 OID 17640)
-- Dependencies: 1740 1308 1297
-- Name: favourite_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY favourite
    ADD CONSTRAINT favourite_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_table(user_id);


--
-- TOC entry 1754 (class 2606 OID 17645)
-- Dependencies: 1309 1299 1742
-- Name: owns_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1755 (class 2606 OID 17650)
-- Dependencies: 1299 1740 1308
-- Name: owns_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_table(user_id);


--
-- TOC entry 1756 (class 2606 OID 17655)
-- Dependencies: 1710 1300 1295
-- Name: player_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1757 (class 2606 OID 17660)
-- Dependencies: 1295 1710 1301
-- Name: player_total_stats_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY player_total_stats
    ADD CONSTRAINT player_total_stats_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1758 (class 2606 OID 17665)
-- Dependencies: 1302 1302 1300 1300 1724
-- Name: playing_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY playing
    ADD CONSTRAINT playing_club_name_fkey FOREIGN KEY (club_name, jersey_no) REFERENCES player(club_name, jersey_no);


--
-- TOC entry 1759 (class 2606 OID 17670)
-- Dependencies: 1302 1742 1309
-- Name: playing_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY playing
    ADD CONSTRAINT playing_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1760 (class 2606 OID 17675)
-- Dependencies: 1718 1298 1303
-- Name: private_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY private
    ADD CONSTRAINT private_league_name_fkey FOREIGN KEY (league_name) REFERENCES league(league_name);


--
-- TOC entry 1761 (class 2606 OID 17680)
-- Dependencies: 1718 1304 1298
-- Name: public_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public
    ADD CONSTRAINT public_league_name_fkey FOREIGN KEY (league_name) REFERENCES league(league_name);


--
-- TOC entry 1762 (class 2606 OID 17685)
-- Dependencies: 1295 1710 1305
-- Name: results_awayteam_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_awayteam_fkey FOREIGN KEY (awayteam) REFERENCES club(club_name);


--
-- TOC entry 1763 (class 2606 OID 17690)
-- Dependencies: 1305 1295 1710
-- Name: results_hometeam_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_hometeam_fkey FOREIGN KEY (hometeam) REFERENCES club(club_name);


--
-- TOC entry 1764 (class 2606 OID 17724)
-- Dependencies: 1305 1310 1744
-- Name: results_matchday_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_matchday_fkey FOREIGN KEY (matchday) REFERENCES deadlines(matchday);


--
-- TOC entry 1765 (class 2606 OID 17695)
-- Dependencies: 1710 1306 1295
-- Name: score_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY score
    ADD CONSTRAINT score_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1766 (class 2606 OID 17700)
-- Dependencies: 1300 1307 1307 1724 1300
-- Name: substitute_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY substitute
    ADD CONSTRAINT substitute_club_name_fkey FOREIGN KEY (club_name, jersey_no) REFERENCES player(club_name, jersey_no);


--
-- TOC entry 1767 (class 2606 OID 17705)
-- Dependencies: 1309 1307 1742
-- Name: substitute_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY substitute
    ADD CONSTRAINT substitute_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1781 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2007-11-30 06:44:23

--
-- PostgreSQL database dump complete
--

