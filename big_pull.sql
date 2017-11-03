#big pull (GENERAL)
SELECT
	mc.firstPullBatchID AS center_seq,
	mc.poNumber AS po_number,
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19) AS card_name,
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) AS membr_num,
	memc.Member_Since AS mbr_since,
	odb.Member_Since_Year AS mbr_snc_yr,
	memc.Expires AS expires,
	DATE_FORMAT(ADDDATE(odb.Expire_Date,INTERVAL 365 DAY),'%m/%Y') AS expire_dt,
	memc.letters AS letter,
	mc.SalesOrderNumber AS salesord,
	memc.cards AS card,
	odb.Charter_Tag AS charter,
	creg.D_or_F AS Destination,
	mag.m_fall_2015 AS Mag,
	mc.poNumber AS po_num_1,
	mc.ShipToName AS ship_name ,
	mc.ShipToAddress1 AS address_1,
	mc.ShipToAddress2 AS address_2,
	mc.ShipToCity AS city,
	mc.ShipToStateCode AS state,
	mc.ShipToPostalCode AS zip4,
	mc.ShipToCountryName AS country,
	mc.ItemDescription AS Description,
	mc.giftOrderFlag AS Gifted

FROM
	Master_Collect as mc
		LEFT JOIN odb as odb ON (mc.ShipToName = odb.Shipping_Name)
		LEFT JOIN MemberShip_codes as memc ON (mc.PODetailretailerItemCode = memc.retitmedcd)
		LEFT JOIN country_region as creg ON (mc.SoldToCountryName = creg.Country)
		LEFT JOIN Fall_2015_Mag_Distro as mag ON (RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) = mag.Member_ID)	
ORDER BY
	13,
	14,
	24,
	9 DESC,
	11 DESC
	;


# GENERAL PULL DOMESTIC
SELECT
	mc.firstPullBatchID,
	mc.poNumber,
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19),
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) AS MEM_NUM_2,
	memc.Member_Since,
	odb.Member_Since_Year,
	memc.Expires,
	DATE_FORMAT(ADDDATE(odb.Expire_Date,INTERVAL 365 DAY),'%m/%Y'),
	memc.letters,
	mc.SalesOrderNumber,
	memc.cards,
	odb.Charter_Tag,
	creg.D_or_F,
	mag.m_fall_2015,
	mc.poNumber,
	mc.ShipToName,
	mc.ShipToAddress1,
	mc.ShipToAddress2,
	mc.ShipToCity,
	mc.ShipToStateCode,
	mc.ShipToPostalCode,
	mc.ShipToCountryName,
	mc.ItemDescription,
	mc.giftOrderFlag

FROM
	Master_Collect as mc
		LEFT JOIN odb as odb ON (mc.ShipToName = odb.Shipping_Name)
		LEFT JOIN MemberShip_codes as memc ON (mc.PODetailretailerItemCode = memc.retitmedcd)
		LEFT JOIN country_region as creg ON (mc.SoldToCountryName = creg.Country)
		LEFT JOIN Fall_2015_Mag_Distro as mag ON (RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) = mag.Member_ID)
WHERE creg.D_or_F = "DOMESTIC"	
ORDER BY
	13,
	14,
	11 DESC,
	24,
	9 DESC,
	10 DESC
	;

# GENERAL PULL DOMESTIC
SELECT
	mc.firstPullBatchID,
	mc.poNumber,
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19),
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) AS MEM_NUM_2,
	memc.Member_Since,
	odb.Member_Since_Year,
	memc.Expires,
	DATE_FORMAT(ADDDATE(odb.Expire_Date,INTERVAL 365 DAY),'%m/%Y'),
	memc.letters,
	mc.SalesOrderNumber,
	memc.cards,
	odb.Charter_Tag,
	creg.D_or_F,
	mag.m_fall_2015,
	mc.poNumber,
	mc.ShipToName,
	mc.ShipToAddress1,
	mc.ShipToAddress2,
	mc.ShipToCity,
	mc.ShipToStateCode,
	mc.ShipToPostalCode,
	mc.ShipToCountryName,
	mc.ItemDescription,
	mc.giftOrderFlag

FROM
	Master_Collect as mc
		LEFT JOIN odb as odb ON (mc.ShipToName = odb.Shipping_Name)
		LEFT JOIN MemberShip_codes as memc ON (mc.PODetailretailerItemCode = memc.retitmedcd)
		LEFT JOIN country_region as creg ON (mc.SoldToCountryName = creg.Country)
		LEFT JOIN Fall_2015_Mag_Distro as mag ON (RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) = mag.Member_ID)
WHERE creg.D_or_F = "FOREIGN"	
ORDER BY
	13,
	14,
	11 DESC,
	24,
	9 DESC,
	10 DESC
	;

