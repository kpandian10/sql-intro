-- Who hit the most home runs in 2019, and what team did they play for?

-- Expected result:
--
-- +---------------+------------+-----------+-----------+
-- | New York Mets | Pete       | Alonso    | 53        |
-- +---------------+------------+-----------+-----------+

SELECT name, first_name, last_name, home_runs
FROM players
JOIN stats ON stats.player_id = players.id
JOIN teams ON teams.id = stats.team_id
WHERE teams.year = 2019
ORDER BY home_runs DESC
LIMIT 1;
