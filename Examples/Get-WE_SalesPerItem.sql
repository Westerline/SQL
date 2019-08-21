Select top 100
    SUM(TL.SubBeforeTax) as SalesBeforeTax,
    SUM(TL.Quantity) as Quantity

From
    TransLines as TL

    Join
    TransHeaders as TH
    On TL.TransNo = TH.TransNo

Where
TL.Branch = '000'
    AND
    TL.UPC = '01'
    AND

    --Format: YYYY-MM-DD HH:MM:SS.sss
    TH.Logged
Between
'2018-10-23 00:01:00.000'
AND
'2018-10-23 23:59:59.999'