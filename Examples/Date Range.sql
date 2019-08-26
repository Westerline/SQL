SELECT
    TH.branch,
    CAST(SUM(TL.Quantity) as Float) 'Quantity',
    SUM(TL.SubBeforeTax) as SubBeforeTax,
    SUM(TL.SubAfterTax) as SubAfterTax
FROM
    AKPOS.dbo.TransHeaders TH
    INNER JOIN AKPOS.dbo.TransLines TL
    ON TH.TransNo = TL.TransNo
        AND TH.Branch = TL.Branch
        AND TH.Station = TL.Station
WHERE
    CONVERT(Date,Logged) BETWEEN
    DATEFROMPARTS(2015,4,1)
    AND DATEFROMPARTS(2015,4,30)
    AND TL.IsVoided = 0 AND TH.TransStatus = 'C'
    AND TH.branch = '000' AND tl.upc = '01'
GROUP BY
    TH.Branch
ORDER BY
    TH.Logged;

GO