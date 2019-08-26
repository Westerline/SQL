SELECT top 100
    SUM(TL.SubBeforeTax) AS SalesBeforeTax,
    SUM(TL.Quantity) AS Quantity
FROM
    TransLines AS TL
    JOIN
    TransHeaders AS TH
    ON TL.TransNo = TH.TransNo
WHERE
    TL.Branch = '000'
    AND TL.UPC = '01'
    AND TH.Logged --Format: YYYY-MM-DD HH:MM:SS.sss
    BETWEEN '2018-10-23 00:01:00.000'
    AND '2018-10-23 23:59:59.999';

GO