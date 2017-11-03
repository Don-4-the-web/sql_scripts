CREATE VIEW renewals_batch_report AS
SELECT
	mc.batchID AS batchID,
	mc.firstPullBatchID AS center_seq,
	mc.poNumber AS po_number,
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19) AS card_name,
	mc.MemberNumberID AS membr_num,
	odb.Member_Since_Year AS mbr_snc_yr,
	DATE_FORMAT(ADDDATE(odb.Expire_Date,INTERVAL 365 DAY),'%m/%Y') AS expire_dt,
	memc.cards AS card,
	odb.Charter_Tag AS charter,
	creg.D_or_F AS Destination,
	mag.m_fall_2015 AS Mag,
	mc.ShipToName AS ship_name ,
	mc.giftOrderFlag AS Gifted

FROM
	Master_Collect as mc
		LEFT JOIN odb as odb ON (RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) = odb.MEM_NUM)
		LEFT JOIN MemberShip_codes as memc ON (mc.PODetailretailerItemCode = memc.retitmedcd)
		LEFT JOIN country_region as creg ON (mc.SoldToCountryName = creg.Country)
		LEFT JOIN Fall_2015_Mag_Distro as mag ON (RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) = mag.Member_ID)	
ORDER BY
	10,
	11,
	8 DESC
;
