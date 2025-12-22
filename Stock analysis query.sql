SELECT * FROM stock_market.stockanalysis;
use stock_market;
-- --------------------KPI's ---------------------------

SELECT
        Concat('$ ', round((sum(volume)-avg(volume)/avg(volume))/1000000,2), ' M') Volume_Spike,
	     Concat('$ ', Round((sum(close)-sum(Open)/sum(open))/1000,2), ' K') Volatility,
		  round((sum(Close)-Sum(open)),2) Daily_Return,
          max(close) Max_Close_company
FROM stockanalysis;

-- ------------------ Sector Wise Volume -------------
 SELECT
    `Sector.sector_name`,
    CONCAT(
        '$ ',
        ROUND(SUM(volume) / 1000, 2),
        ' K'
    ) AS total_volume_m
FROM stockanalysis
GROUP BY `Sector.sector_name`
ORDER BY SUM(volume) DESC;

-- ------------------------------ Sector name Wise close And open -----------
SELECT
    `Sector.sector_name` AS Sector_name,
    CONCAT(ROUND(SUM(close) / 1000, 2), ' K') AS `Sum of close`,
    CONCAT(ROUND(SUM(open) / 1000, 2), ' K')  AS `Sum of open`
FROM stockanalysis
GROUP BY `Sector.sector_name`
ORDER BY SUM(close);

-- --------------- HOCL Analysis -------------
SELECT
    Month_name,
    CONCAT(ROUND(SUM(open)  / 1000, 2), 'K') AS open,
    CONCAT(ROUND(SUM(high)  / 1000, 2), 'K') AS high,
    CONCAT(ROUND(SUM(low)   / 1000, 2), 'K') AS low,
    CONCAT(ROUND(SUM(close) / 1000, 2), 'K') AS close
FROM stockanalysis
GROUP BY Month_name
ORDER BY FIELD(
    Month_name,
    'Jan','Feb','Mar','Apr','May','Jun',
    'Jul','Aug','Sep','Oct','Nov','Dec');

-- -------------- Month Wise Daily Return ----------------
SELECT
    Month_name,
    CONCAT(ROUND(SUM(`Dailt Return`), 2),
        '%'
    ) AS `Sum of Daily Return %`
FROM stockanalysis
GROUP BY Month_name
ORDER BY FIELD(
    Month_name,
    'Jan','Feb','Mar','Apr','May','Jun',
    'Jul','Aug','Sep','Oct','Nov','Dec'
);

-- ----------------- Month Name wise High Low Amount -----------------

SELECT
    Month_name AS Month,
    CONCAT(ROUND(SUM(high) / 1000, 2), 'K') AS high,
    CONCAT(ROUND(SUM(low)  / 1000, 2), 'K') AS low
FROM stockanalysis
GROUP BY Month_name
ORDER BY FIELD(
    Month_name,
    'Jan','Feb','Mar','Apr','May','Jun',
    'Jul','Aug','Sep','Oct','Nov','Dec'
);

-- -----------------------Company wise Avg Daily Return -----------------
SELECT
    company_name AS `Month`,
    concat('$',round(AVG(Volume)/100, 2),' M') AS `Average Volume`
FROM stockanalysis
GROUP BY company_name
ORDER BY `Average Volume` DESC;









