CREATE VIEW new_members_batch_report AS
SELECT
	mc.batchID AS batchID,
	mc.firstPullBatchID AS center_seq,
	mc.poNumber AS po_number,
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19) AS card_name,
	mc.MemberNumberID AS membr_num,
	DATE_FORMAT(ADDDATE(mc.batchDate,INTERVAL 365 DAY),'%m/%Y') AS expire_dt,
	memc.cards AS card,
	mc.firstPullBatchID AS charter,
	creg.D_or_F AS Destination,
	mag.m_fall_2015 AS Mag,
	mc.poNumber AS po_num_1,
	mc.ShipToName AS ship_name,
	mc.giftOrderFlag AS Gifted

FROM
	Master_Collect as mc
		LEFT JOIN MemberShip_codes as memc ON (mc.PODetailretailerItemCode = memc.retitmedcd)
		LEFT JOIN country_region as creg ON (mc.SoldToCountryName = creg.Country)	
ORDER BY
	14,
	15,
	25,
	10 DESC,
	12 DESC,
	24
	;