SELECT
    TH.branch,
    Cast(Sum(TL.Quantity) as Float) 'Quantity',
    Sum(TL.SubBeforeTax) as SubBeforeTax,
    Sum(TL.SubAfterTax) as SubAfterTax

FROM
    AKPOS.dbo.TransHeaders TH
    INNER JOIN AKPOS.dbo.TransLines TL on TH.TransNo = TL.TransNo and TH.Branch = TL.Branch and TH.Station = TL.Station

WHERE
Convert(Date,Logged) BETWEEN
Datefromparts(2015,4,1) AND
Datefromparts(2015,4,30)
    and TL.IsVoided = 0 and TH.TransStatus = 'C'
    and TH.branch = '000' and tl.upc = '01'

GROUP BY TH.Branch
--ORDER BY TH.Logged
