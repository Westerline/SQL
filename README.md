# SQL Tools Repository

* This repository is a collection of tool-oriented Transact-SQL scripts and stored proceedures. These tools are meant to perform one or two simple tasks. For more complex sequences, you can mix and match tools.
* If parameterized input is appropriate, the tool or script is wrapped in a PowerShell script or may be written as a stored proceedure. All other tools are created as standard T-SQL scripts.

## Getting Started

* Download the repository and unzip the files to your preferred destination. For more complex sequences, create a caller script with any proprietary data you require. Then call the tools you need for your task. Mix and match the tools you use to tackle different tasks.

### Disclaimer
Please test these tools thoroughly in your own environment before deploying them to a production environment. I have tested these tools in my own environment, but I cannot garuntee their effectiveness and/or safety in yours.

### Prerequisites

* SQL Server version 2012 or Higher
* Virtual Machine Environment for Testing (Optional)
* Text Editor with Syntax Highlighting Such as Notepad++ (Optional)

### Coding/Indentation Style

* Any comments should be located towards the top of the document. These comments should focus on items which aren't included in Microsoft's Transact-SQL Reference documentation (https://docs.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-2017).
* Comments should be written as complete sentences.
* The first letter of commands should be capitalized
* K&R is the prefered indentation style, refer to https://en.wikipedia.org/wiki/Indentation_style#K&R_style for more details.

## Contributing

* Feel free to email me at esterline.wj.s@gmail.com if you would like to contribute to this project!

## Authors

* **Wesley Esterline**

## Acknowledgments

*Special thanks to Khan Academy for their "Intro to SQL" online course.

## To-do:
* Incorporate Invoke-SQLCMD2 with the existing tools.
