--
-- PostgreSQL database dump
--

-- Started on 2007-11-17 05:43:26

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1775 (class 1262 OID 16407)
-- Name: CFL; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "CFL" WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII';


\connect "CFL"

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1776 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 287 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 27 (class 1255 OID 17089)
-- Dependencies: 287 4
-- Name: add_captain(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- TOC entry 25 (class 1255 OID 17088)
-- Dependencies: 4 287
-- Name: add_player(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- TOC entry 26 (class 1255 OID 17087)
-- Dependencies: 287 4
-- Name: add_sub(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- TOC entry 21 (class 1255 OID 17095)
-- Dependencies: 4 287
-- Name: insert_club_league(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- TOC entry 22 (class 1255 OID 17097)
-- Dependencies: 287 4
-- Name: insert_team(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- TOC entry 24 (class 1255 OID 25316)
-- Dependencies: 4 287
-- Name: player_fn(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- TOC entry 20 (class 1255 OID 16887)
-- Dependencies: 287 4
-- Name: score_change_fn(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION score_change_fn() RETURNS "trigger"
    AS $$
begin
	IF new.score > old.score
	THEN
		update BelongsTo A set league_rank = 1+ (select count(*) from BelongsTo B where B.league_name=A.league_name and (select score from Userteam U where
								U.team_name =B.team_name)>(select score from Userteam where team_name=new.team_name ))
			where A.team_name = new.team_name;
		update BelongsTo A set league_rank = league_rank - 1
			where A.league_name in (select league_name from BelongsTo B where B.team_name = new.team_name)
				and (select score from UserTeam where team_name = A.team_name) < old.score
				and (select score from UserTeam where team_name = A.team_name) >= new.score;
	END IF;
	IF new.score < old.score
	THEN
		update BelongsTo A set league_rank = 1+ (select count(*) from BelongsTo B where B.league_name=A.league_name and (select score from Userteam U where
								U.team_name =B.team_name)>(select score from Userteam where team_name=new.team_name ))
			where A.team_name = new.team_name;
		update BelongsTo A set league_rank = league_rank + 1
			where A.league_name in (select league_name from BelongsTo B where B.team_name = new.team_name)
				and (select score from UserTeam where team_name = A.team_name) >= old.score
				and (select score from UserTeam where team_name = A.team_name) < new.score;
	END IF;

return NEW;
end;$$
    LANGUAGE plpgsql;


--
-- TOC entry 23 (class 1255 OID 25314)
-- Dependencies: 287 4
-- Name: score_fn(); Type: FUNCTION; Schema: public; Owner: -
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


--
-- TOC entry 19 (class 1255 OID 16849)
-- Dependencies: 287 4
-- Name: team_join_league(); Type: FUNCTION; Schema: public; Owner: -
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1300 (class 1259 OID 16621)
-- Dependencies: 1671 4
-- Name: belongsto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE belongsto (
    team_name character varying(30) NOT NULL,
    league_name character varying(30) NOT NULL,
    league_rank integer NOT NULL,
    CONSTRAINT belongsto_league_rank_check CHECK ((league_rank > 0))
);


--
-- TOC entry 1303 (class 1259 OID 16664)
-- Dependencies: 4
-- Name: captainof; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE captainof (
    team_name character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL
);


--
-- TOC entry 1292 (class 1259 OID 16413)
-- Dependencies: 4
-- Name: club; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE club (
    club_name character varying(30) NOT NULL,
    stats_link character varying(100)
);


--
-- TOC entry 1299 (class 1259 OID 16607)
-- Dependencies: 4
-- Name: creates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE creates (
    league_name character varying(30) NOT NULL,
    user_id character varying(30) NOT NULL
);


--
-- TOC entry 1305 (class 1259 OID 16694)
-- Dependencies: 4
-- Name: favourite; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE favourite (
    user_id character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL
);


--
-- TOC entry 1295 (class 1259 OID 16580)
-- Dependencies: 4
-- Name: league; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE league (
    league_name character varying(30) NOT NULL
);


--
-- TOC entry 1304 (class 1259 OID 16678)
-- Dependencies: 4
-- Name: owns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE owns (
    user_id character varying(30) NOT NULL,
    team_name character varying(30)
);


--
-- TOC entry 1294 (class 1259 OID 16520)
-- Dependencies: 1640 1641 1642 1643 1644 1645 1646 1647 1648 1649 1650 1651 1652 1653 1654 1655 1656 1657 1658 1659 1660 1661 1662 1663 1664 1665 1666 1667 4
-- Name: player; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- TOC entry 1306 (class 1259 OID 17018)
-- Dependencies: 1672 1673 1674 1675 1676 1677 1678 1679 1680 1681 1682 1683 1684 1685 1686 1687 1688 1689 1690 1691 1692 1693 1694 1695 1696 1697 1698 1699 4
-- Name: player_total_stats; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- TOC entry 1302 (class 1259 OID 16650)
-- Dependencies: 4
-- Name: playing; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE playing (
    team_name character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL
);


--
-- TOC entry 1296 (class 1259 OID 16584)
-- Dependencies: 4
-- Name: private; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE private (
    league_name character varying(30) NOT NULL,
    league_id character varying(30) NOT NULL
);


--
-- TOC entry 1297 (class 1259 OID 16593)
-- Dependencies: 4
-- Name: public; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public (
    league_name character varying(30) NOT NULL
);


--
-- TOC entry 1308 (class 1259 OID 25318)
-- Dependencies: 1704 4
-- Name: results; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE results (
    matchday character varying(20) NOT NULL,
    date character varying(30) NOT NULL,
    hometeam character varying(30) NOT NULL,
    score character varying(20) DEFAULT ''::character varying NOT NULL,
    awayteam character varying(30) NOT NULL
);


--
-- TOC entry 1307 (class 1259 OID 25299)
-- Dependencies: 1700 1701 1702 1703 4
-- Name: score; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE score (
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL,
    today_score integer DEFAULT 0,
    total_score integer DEFAULT 0,
    CONSTRAINT score_today_score_check CHECK ((today_score >= 0)),
    CONSTRAINT score_total_score_check CHECK ((total_score >= 0))
);


--
-- TOC entry 1301 (class 1259 OID 16636)
-- Dependencies: 4
-- Name: substitute; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE substitute (
    team_name character varying(30) NOT NULL,
    club_name character varying(30) NOT NULL,
    jersey_no integer NOT NULL
);


--
-- TOC entry 1293 (class 1259 OID 16419)
-- Dependencies: 1639 4
-- Name: user_table; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_table (
    user_id character varying(30) NOT NULL,
    "password" character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    question character varying(100) DEFAULT 'What is your date of birth?'::character varying,
    answer character varying(30) NOT NULL
);


--
-- TOC entry 1298 (class 1259 OID 16602)
-- Dependencies: 1668 1669 1670 4
-- Name: userteam; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE userteam (
    team_name character varying(30) NOT NULL,
    score integer DEFAULT 0,
    value double precision DEFAULT 0,
    score_today integer DEFAULT 0
);


--
-- TOC entry 1724 (class 2606 OID 16625)
-- Dependencies: 1300 1300 1300
-- Name: belongsto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY belongsto
    ADD CONSTRAINT belongsto_pkey PRIMARY KEY (team_name, league_name);


--
-- TOC entry 1730 (class 2606 OID 16667)
-- Dependencies: 1303 1303
-- Name: captainof_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY captainof
    ADD CONSTRAINT captainof_pkey PRIMARY KEY (team_name);


--
-- TOC entry 1706 (class 2606 OID 16416)
-- Dependencies: 1292 1292
-- Name: club_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY club
    ADD CONSTRAINT club_pkey PRIMARY KEY (club_name);


--
-- TOC entry 1708 (class 2606 OID 16418)
-- Dependencies: 1292 1292
-- Name: club_stats_link_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY club
    ADD CONSTRAINT club_stats_link_key UNIQUE (stats_link);


--
-- TOC entry 1722 (class 2606 OID 16610)
-- Dependencies: 1299 1299
-- Name: creates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY creates
    ADD CONSTRAINT creates_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1736 (class 2606 OID 16697)
-- Dependencies: 1305 1305
-- Name: favourite_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY favourite
    ADD CONSTRAINT favourite_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1714 (class 2606 OID 16583)
-- Dependencies: 1295 1295
-- Name: league_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY league
    ADD CONSTRAINT league_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1732 (class 2606 OID 16681)
-- Dependencies: 1304 1304
-- Name: owns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1734 (class 2606 OID 16683)
-- Dependencies: 1304 1304
-- Name: owns_team_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_team_name_key UNIQUE (team_name);


--
-- TOC entry 1712 (class 2606 OID 16574)
-- Dependencies: 1294 1294 1294
-- Name: player_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (club_name, jersey_no);


--
-- TOC entry 1738 (class 2606 OID 17048)
-- Dependencies: 1306 1306 1306
-- Name: player_total_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY player_total_stats
    ADD CONSTRAINT player_total_stats_pkey PRIMARY KEY (club_name, jersey_no);


--
-- TOC entry 1728 (class 2606 OID 16653)
-- Dependencies: 1302 1302 1302 1302
-- Name: playing_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY playing
    ADD CONSTRAINT playing_pkey PRIMARY KEY (team_name, club_name, jersey_no);


--
-- TOC entry 1716 (class 2606 OID 16587)
-- Dependencies: 1296 1296
-- Name: private_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY private
    ADD CONSTRAINT private_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1718 (class 2606 OID 16596)
-- Dependencies: 1297 1297
-- Name: public_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public
    ADD CONSTRAINT public_pkey PRIMARY KEY (league_name);


--
-- TOC entry 1742 (class 2606 OID 25322)
-- Dependencies: 1308 1308 1308 1308 1308 1308
-- Name: results_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pkey PRIMARY KEY (matchday, date, hometeam, score, awayteam);


--
-- TOC entry 1740 (class 2606 OID 25306)
-- Dependencies: 1307 1307 1307
-- Name: score_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY score
    ADD CONSTRAINT score_pkey PRIMARY KEY (club_name, jersey_no);


--
-- TOC entry 1726 (class 2606 OID 16639)
-- Dependencies: 1301 1301 1301 1301
-- Name: substitute_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY substitute
    ADD CONSTRAINT substitute_pkey PRIMARY KEY (team_name, club_name, jersey_no);


--
-- TOC entry 1710 (class 2606 OID 16423)
-- Dependencies: 1293 1293
-- Name: user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1720 (class 2606 OID 16606)
-- Dependencies: 1298 1298
-- Name: userteam_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY userteam
    ADD CONSTRAINT userteam_pkey PRIMARY KEY (team_name);


--
-- TOC entry 1770 (class 2620 OID 17090)
-- Dependencies: 1303 27
-- Name: add_captainof; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER add_captainof
    AFTER INSERT OR UPDATE ON captainof
    FOR EACH ROW
    EXECUTE PROCEDURE add_captain();


--
-- TOC entry 1769 (class 2620 OID 17091)
-- Dependencies: 1302 25
-- Name: add_playing; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER add_playing
    AFTER INSERT OR UPDATE ON playing
    FOR EACH ROW
    EXECUTE PROCEDURE add_player();


--
-- TOC entry 1768 (class 2620 OID 17092)
-- Dependencies: 1301 26
-- Name: add_substitute; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER add_substitute
    AFTER INSERT OR UPDATE ON substitute
    FOR EACH ROW
    EXECUTE PROCEDURE add_sub();


--
-- TOC entry 1771 (class 2620 OID 17096)
-- Dependencies: 21 1305
-- Name: fav_club; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER fav_club
    AFTER INSERT ON favourite
    FOR EACH ROW
    EXECUTE PROCEDURE insert_club_league();


--
-- TOC entry 1765 (class 2620 OID 17098)
-- Dependencies: 22 1298
-- Name: new_team; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER new_team
    AFTER INSERT ON userteam
    FOR EACH ROW
    EXECUTE PROCEDURE insert_team();


--
-- TOC entry 1764 (class 2620 OID 25317)
-- Dependencies: 24 1294
-- Name: player_update; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER player_update
    AFTER UPDATE ON player
    FOR EACH ROW
    EXECUTE PROCEDURE player_fn();


--
-- TOC entry 1766 (class 2620 OID 16888)
-- Dependencies: 1298 20
-- Name: score_change; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER score_change
    AFTER UPDATE ON userteam
    FOR EACH ROW
    EXECUTE PROCEDURE score_change_fn();


--
-- TOC entry 1772 (class 2620 OID 25315)
-- Dependencies: 1307 23
-- Name: score_update; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER score_update
    AFTER UPDATE ON score
    FOR EACH ROW
    EXECUTE PROCEDURE score_fn();


--
-- TOC entry 1767 (class 2620 OID 16850)
-- Dependencies: 19 1300
-- Name: team_joins_league; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER team_joins_league
    AFTER INSERT ON belongsto
    FOR EACH ROW
    EXECUTE PROCEDURE team_join_league();


--
-- TOC entry 1748 (class 2606 OID 16626)
-- Dependencies: 1300 1295 1713
-- Name: belongsto_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY belongsto
    ADD CONSTRAINT belongsto_league_name_fkey FOREIGN KEY (league_name) REFERENCES league(league_name);


--
-- TOC entry 1749 (class 2606 OID 16631)
-- Dependencies: 1298 1719 1300
-- Name: belongsto_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY belongsto
    ADD CONSTRAINT belongsto_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1755 (class 2606 OID 16673)
-- Dependencies: 1294 1303 1303 1294 1711
-- Name: captainof_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY captainof
    ADD CONSTRAINT captainof_club_name_fkey FOREIGN KEY (club_name, jersey_no) REFERENCES player(club_name, jersey_no);


--
-- TOC entry 1754 (class 2606 OID 16668)
-- Dependencies: 1303 1719 1298
-- Name: captainof_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY captainof
    ADD CONSTRAINT captainof_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1746 (class 2606 OID 16611)
-- Dependencies: 1296 1715 1299
-- Name: creates_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY creates
    ADD CONSTRAINT creates_league_name_fkey FOREIGN KEY (league_name) REFERENCES private(league_name);


--
-- TOC entry 1747 (class 2606 OID 16616)
-- Dependencies: 1709 1293 1299
-- Name: creates_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY creates
    ADD CONSTRAINT creates_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_table(user_id);


--
-- TOC entry 1759 (class 2606 OID 16703)
-- Dependencies: 1292 1305 1705
-- Name: favourite_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY favourite
    ADD CONSTRAINT favourite_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1758 (class 2606 OID 16698)
-- Dependencies: 1305 1293 1709
-- Name: favourite_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY favourite
    ADD CONSTRAINT favourite_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_table(user_id);


--
-- TOC entry 1757 (class 2606 OID 16689)
-- Dependencies: 1304 1719 1298
-- Name: owns_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1756 (class 2606 OID 16684)
-- Dependencies: 1304 1709 1293
-- Name: owns_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY owns
    ADD CONSTRAINT owns_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_table(user_id);


--
-- TOC entry 1743 (class 2606 OID 16575)
-- Dependencies: 1294 1292 1705
-- Name: player_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1760 (class 2606 OID 17049)
-- Dependencies: 1705 1292 1306
-- Name: player_total_stats_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY player_total_stats
    ADD CONSTRAINT player_total_stats_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1753 (class 2606 OID 16659)
-- Dependencies: 1302 1294 1302 1294 1711
-- Name: playing_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY playing
    ADD CONSTRAINT playing_club_name_fkey FOREIGN KEY (club_name, jersey_no) REFERENCES player(club_name, jersey_no);


--
-- TOC entry 1752 (class 2606 OID 16654)
-- Dependencies: 1298 1302 1719
-- Name: playing_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY playing
    ADD CONSTRAINT playing_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1744 (class 2606 OID 16588)
-- Dependencies: 1296 1713 1295
-- Name: private_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY private
    ADD CONSTRAINT private_league_name_fkey FOREIGN KEY (league_name) REFERENCES league(league_name);


--
-- TOC entry 1745 (class 2606 OID 16597)
-- Dependencies: 1297 1713 1295
-- Name: public_league_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public
    ADD CONSTRAINT public_league_name_fkey FOREIGN KEY (league_name) REFERENCES league(league_name);


--
-- TOC entry 1763 (class 2606 OID 25328)
-- Dependencies: 1308 1705 1292
-- Name: results_awayteam_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_awayteam_fkey FOREIGN KEY (awayteam) REFERENCES club(club_name);


--
-- TOC entry 1762 (class 2606 OID 25323)
-- Dependencies: 1292 1705 1308
-- Name: results_hometeam_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_hometeam_fkey FOREIGN KEY (hometeam) REFERENCES club(club_name);


--
-- TOC entry 1761 (class 2606 OID 25307)
-- Dependencies: 1307 1705 1292
-- Name: score_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY score
    ADD CONSTRAINT score_club_name_fkey FOREIGN KEY (club_name) REFERENCES club(club_name);


--
-- TOC entry 1751 (class 2606 OID 16645)
-- Dependencies: 1711 1294 1294 1301 1301
-- Name: substitute_club_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY substitute
    ADD CONSTRAINT substitute_club_name_fkey FOREIGN KEY (club_name, jersey_no) REFERENCES player(club_name, jersey_no);


--
-- TOC entry 1750 (class 2606 OID 16640)
-- Dependencies: 1298 1301 1719
-- Name: substitute_team_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY substitute
    ADD CONSTRAINT substitute_team_name_fkey FOREIGN KEY (team_name) REFERENCES userteam(team_name);


--
-- TOC entry 1777 (class 0 OID 0)
-- Dependencies: 4
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM rattle;
GRANT ALL ON SCHEMA public TO rattle;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2007-11-17 05:43:27

--
-- PostgreSQL database dump complete
--

