Select
    *

From
    TransHeaders as TH

    Left Join
    TransLines as TL
    On TH.TransNo = TL.TransNo

    Left Join


    Where

--Include Valid Transactions Only
TH  .TransType = 'C'
        AND
        TH.TransStatus = 'C'

        AND

        --Select Desired Branch
        TH.Branch = '000'

        AND

        --Format: YYYY-MM-DD HH:MM:SS.sss
        TH.Logged
Between
'2018-10-22 06:37:19.000'
AND
'2018-10-23 06:50:35.000'
