# Class Database
Run the following commands:
```
createdb homework
psql -d homework -f setup.sql
```
This will create and populate a database called homework.

It is based on real data from the government found at
https://data.gov.uk/dataset/72eaec8e-0d32-4041-a553-87b852abee64/spend-over-25-000-in-worcestershire-acute-hospitals-psnhs-trust

You can work with it by running
```
psql homework
```
## Submission

Below you will find a set of tasks for you to complete to consolidate and extend your learning from this week. You will find it beneficial to complete the reading tasks before attempting some of these.

To submit this homework write the correct commands after each question.

### 1. Show the date, transaction_no, description and amount for those transactions whose amount is between £30,000 and £31,000.
```sql
"date"	"transaction_no"	"description"	"amount"
"2021-03-01"	37411793	"Prescriptions"	28700
"2021-03-01"	37776847	"Renal Central Delivery System"	29260
"2021-03-01"	37743666	"A Block, Kidderminster Hospital Oncology refurbishment."	25891
"2021-03-01"	37588987	"Waste Volume"	25000
"2021-03-01"	37472467	"Electricity charges"	26610
"2021-03-01"	37588999	"Passthrough costs"	25845
"2021-03-01"	37698692	"Gas charges"	29362
"2021-03-01"	37698700	"Waste Volume"	25000
"2021-03-01"	37726829	"Passthrough costs - HPV Cleans"	25695
"2021-03-01"	37672678	"Design Team Services"	26760
"2021-03-01"	37474695	"Contract COVERING PACS SYSTEMS"	25882
"2021-03-01"	37590313	"ED Expansion Aconbury"	28089
"2021-03-01"	37492411	"Nurse Call Alex, Midwest supply, wiring installation"	29521
"2021-03-01"	37755444	"Flexible endoscope Technical Service"	30238
"2021-03-01"	37717273	"Worcester City Council"	25500
"2021-03-01"	37605489	"PHARMACY PURCHASES"	28882
"2021-03-01"	37517595	"PHARMACY PURCHASES"	25631
"2021-03-01"	37635840	"PHARMACY PURCHASES"	25620
"2021-03-01"	37778631	"PHARMACY PURCHASES"	28123
"2021-03-01"	37632601	"Support and Maintenance for Clinisys Winpath Pathology IT system"	30242
"2021-03-01"	37520209	"Site surveys and weekly design/Progress Meetings."	25000
"2021-03-01"	37480281	"PHARMACY PURCHASES"	27000
"2021-03-01"	37675451	"Drugs for Spasticity clinics"	30591
"2021-04-01"	37801641	"Fire Alarm Infrastructure Replacement"	25000
"2021-04-01"	37852571	"Medical and non medical products"	25466
"2021-04-01"	37801672	"Breast Screening Digital Mammography Equipment"	25602
"2021-04-01"	37801681	"Breast Screening Digital Mammography Equipment"	25602
"2021-04-01"	37907271	"Insignia PACS Contract"	25634
"2021-04-01"	37804617	"System Support Renewal"	25650
"2021-04-01"	38104089	"Staff Nurse"	26226
"2021-04-01"	37933543	"Extension of Auto Logic Block rental mattresses"	26387
"2021-04-01"	37873401	"Provision of hardware & licenses"	26578
"2021-04-01"	38014040	"Advisor Projects"	26856
"2021-04-01"	37846634	"Medical and non medical products"	27356
"2021-04-01"	37960823	"DAF - Fixed Screens"	27841
"2021-04-01"	37804421	"Site surveys and weekly design"	27870
"2021-04-01"	37811714	"Agency Staff"	27966
"2021-04-01"	37854459	"PHARMACY PURCHASES"	28849
"2021-04-01"	37853305	"DCR PAS Project Manager"	28912
"2021-04-01"	37917568	"Medical and non medical products"	29584
"2021-04-01"	37905657	"Agency Staff"	29772
"2021-04-01"	37854035	"CALL OFF PO - REMOTE ACCESS"	30000
"2021-04-01"	38014043	"Advisor Projects"	30040
"2021-04-01"	37823809	"CALL OFF ORDER - NETWORKING"	30942
"2021-04-01"	37829728	"Linen services"	30990
```
### 2. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee'.
```sql
"date"	"transaction_no"	"description"	"supplier_inv_no"	"amount"
"2021-03-01"	37600517	"Overseas Nurses Fees"	"I000038387P"	34800
"2021-03-01"	37750117	"Consultant Fees"	"T034177"	74996
"2021-03-01"	37726776	"Consultant Fees"	"T034397"	461861
"2021-03-01"	37669018	"Consultant Fees"	"T034456"	646944
"2021-03-01"	37788777	"Consultant Fees"	"T034567"	423270
"2021-04-01"	38014054	"Annual Fee"	"42914332"	319646
```
### 3. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'Fee'.
```sql

```
### 4. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee' (case insensitive). You will need to search 'https://www.postgresql.org/docs/' to solve this.
```sql

```
### 5. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose amount is £25,000, £30,000, £35,000 or £40,000.
```sql

```
### 6. Show the date, the supplier_id, the description and the amount for transactions with the expense area of 'Better Hospital Food'. You could do a query to get the expense_area_id first then do a query to find the dates, supplier_ids and amounts. But it would be better to do this all in one query by linking the tables together using INNER JOINs.
```sql

```
### 7. Show the date, supplier name, description and amount for transactions with the expense area of 'Better Hospital Food'. You will need to INNER JOIN another table to be able to do this.
```sql

```
### 8. We have just received a late invoice for April! Add a new row to the spends table:
    dated 1st April 2021
    with a description of 'Computer Hardware Dell'
    transaction number is 38104091 and the supplier's inv no is '3780119655'
    the supplier is 'COMPUTACENTER (UK) LTD' (id 16)
    the expense type is 'Computer Hardware Purch' (id 7)
    the expense area is 'ICT Contingency' (id 18)
    for £32,000.
```sql

```
### 9. If you examine the dates in the data, you will see they all are dated either 1st march 2021 or 1st April 2021. So if we group on the the date, there will only be two groups. Show the date and the total amount spent on that date for these two dates by using a GROUP BY clause.
```sql

```
### 10. (optional) Great we now know the monthly spend. But it didn't look that good. So I've changed my SELECT query to output this instead:
```
   Month    | Monthly Spend 
------------+---------------
 March 2021 | £ 28,674,452
 April 2021 | £ 22,895,194
(2 rows)
```
Can you work out how to do this?

```sql

```

When you have finished all of the questions - open a pull request with your answers to the `SQL-Coursework-Week1` repository.
