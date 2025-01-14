-- In the modern era (1960-present), how many regular season games did the best team win each season?
-- Challenge: Try to include the team's name in the results. Is it accurate?

-- Expected result: 61 rows, starting with
--
-- +------+-------------------------------+-----------+
-- | 2001 | Seattle Mariners              | 116       |
-- | 1998 | New York Yankees              | 114       |
-- | 1969 | Baltimore Orioles             | 109       |
-- | 1961 | New York Yankees              | 109       |
-- | 2018 | Boston Red Sox                | 108       |
-- | 1986 | New York Mets                 | 108       |
-- | 1975 | Cincinnati Reds               | 108       |
-- | 1970 | Baltimore Orioles             | 108       |
-- | 2019 | Houston Astros                | 107       |
-- | 2004 | St. Louis Cardinals           | 105       |


WITH team_wins AS (
  SELECT year, name, wins,
    RANK() OVER (PARTITION BY year ORDER BY wins DESC) as rank
  FROM teams
  WHERE year >= 1960
)
SELECT year, name, wins 
FROM team_wins
WHERE rank = 1
ORDER BY wins DESC;