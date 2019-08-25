SELECT
    TH.branch,
    CAST(SUM(TL.Quantity) as Float) 'Quantity',
    SUM(TL.SubBeforeTax) as SubBeforeTax,
    SUM(TL.SubAfterTax) as SubAfterTax

FROM
    AKPOS.dbo.TransHeaders TH
    INNER JOIN AKPOS.dbo.TransLines TL on TH.TransNo = TL.TransNo and TH.Branch = TL.Branch and TH.Station = TL.Station

WHERE
CONVERT(Date,Logged) BETWEEN
DATEFROMPARTS(2015,4,1) AND
DATEFROMPARTS(2015,4,30)
    and TL.IsVoided = 0 and TH.TransStatus = 'C'
    and TH.branch = '000' and tl.upc = '01'

GROUP BY TH.Branch

ORDER BY TH.Logged;

GO