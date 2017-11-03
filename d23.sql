#main view
SELECT
	mc.firstPullBatchID,
	mc.poNumber,
	mc.MemberIDName,
	mc.MemberNumberID,
	memc.Member_Since,
	odb.Member_Since_Year,
	memc.Expires,
	DATE_FORMAT(ADDDATE(odb.Expire_Date,INTERVAL 365 DAY),'%m/%Y'),
	memc.Letters,
	mc.SalesOrderNumber,
	memc.cards,
	odb.Charter_Tag,
	mc.ShipToAddress1,
	mc.ShipToAddress2,
	mc.ShipToCity,
	mc.ShipToStateCode,
	mc.ShipToPostalCode,
	mc.ShipToCountryName,
	mc.giftOrderFlag,
	cr.D_or_F
	

FROM
	Master_Collect AS mc,
	Membership_Codes AS memc,
	odb AS odb,
	country_region AS cr

WHERE
	mc.MemberNumberID = odb.MEM_NUM
	and mc.PODetailretailerItemCode = memc.retitmedcd
	and mc.ShipToCountryName = cr.Country
	GROUP BY 2;
;








# FORMAT DATE FOR Expiration Date Output
SELECT DATE_FORMAT(ADDDATE(odb.Expire_Date,INTERVAL 365 DAY),'%m/%Y') FROM ODB;




# Member Name and retailItemCode to match with cards and letters
SELECT
	mc.MemberIDName,
	mc.PODetailretailerItemCode,
	memc.cards,
	memc.letters


FROM
	Master_Collect as mc,
	Membership_Codes as memc


WHERE
	mc.PODetailretailerItemCode = memc.retitmedcd
;



#Linking the member IDS together
SELECT 
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19),
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17),
	odb.Expire_Date

FROM
	Master_Collect as mc,
	odb as odb

WHERE
	RIGHT(mc.MemberNumberID,LENGTH(mc.MemberNumberID)-17) = odb.MEM_NUM
	;

#/ Column Query tests to see results of cutting the string
SELECT RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19) FROM MASTER_COLLECT as mc;
SELECT RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) FROM MASTER_COLLECT as mc;

SELECT odb.MEM_NUM FROM ODB as odb;

SELECT mc.MemberNumberID FROM Master_Collect as mc;


#Join Test
SELECT 
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19),
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17),
	odb.Expire_Date
FROM
	Master_Collect as mc
		JOIN odb as odb on RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17) = odb.MEM_NUM
	;
#Left Join Test
SELECT 
	RIGHT(mc.MemberIDName, LENGTH(mc.MemberIDName)-19),
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17),
	odb.Expire_Date
FROM
	Master_Collect as mc
		LEFT JOIN odb as odb on RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17) = odb.MEM_NUM
	;

	MEM NUMBER (45)    11001270251795016



	SELECT batchID, MemberNumberID, RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-19) FROM MASTER_COLLECT as mc;


# LEFT Join using names
SELECT 
	mc.ShipToName,
	mc.MemberNumberID,
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17) AS MEM_NUM_2,
	mc.ItemDescription,
	odb.MEM_NUM,
	odb.Name_On_Card,
	odb.Expire_Date
FROM
	Master_Collect as mc
		LEFT JOIN odb as odb ON mc.ShipToName = odb.Shipping_Name;
	;

# 2 LEFT Join using names and member description
SELECT 
	mc.ShipToName,
	mc.MemberNumberID,
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17) AS MEM_NUM_2,
	mc.ItemDescription,
	odb.MEM_NUM,
	odb.Name_On_Card,
	odb.Expire_Date,
	memc.cards,
	memc.letters
FROM
	Master_Collect as mc
		LEFT JOIN odb as odb ON (mc.ShipToName = odb.Shipping_Name)
		LEFT JOIN MemberShip_codes as memc ON (mc.PODetailretailerItemCode = memc.retitmedcd)
	;



# LEFT JOIN USING MEMBER NUMBER (not working)

SELECT
	mc.ShipToName,
	mc.MemberNumberID,
	RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17) AS MEM_NUM_2,
	odb.MEM_NUM,
	odb.Name_On_Card,
	odb.Expire_Date

FROM
	Master_Collect as mc
		LEFT JOIN odb as odb ON RIGHT(mc.MemberNumberID, LENGTH(mc.MemberNumberID)-17)
		 = odb.MEM_NUM
	;



