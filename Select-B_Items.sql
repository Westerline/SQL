/* 
Script used to query Infinity against a large number of UPCs. Steps to use this script:
	1. Under the "Where UPC In(" Section, copy in all of the UPCs you want to use in your query.
	2. Once the UPCs are between your parentheses, highlight all of them and then press CTRL + H
	3. In the Find and Replace tab, expand the "Find options" at the bottom
	4. Select the "Use" tickbox and select "Regular expressions"
	5. Find what: \n
	6. Replace with: ',\n'
	7. Check the first and last rows which were highlighted, these will likely contain an extra ' or , that you need to remove for the syntax error to be resolved.
*/

Use 
AKPOS

Select 
	B_Items.UPC,
	B_Items.Price1,
	B_Items.Cost,
	B_Items.Branch,
	Items.Description

From 
	B_Items 

Join Items
	On B_Items.UPC = Items.UPC

Where 

/*	UPC IN ()
*/

	Items.Description LIKE 'POWERADE %'
	AND
	Items.InActive = '0'
	AND
	B_Items.Branch Between 000 AND 000

Order by 
Description