-- =====================================================================
-- Represents the operational "customer" table for the pipeline.
-- =====================================================================

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;
GO

CREATE TABLE dbo.Customers (
    customer_id      VARCHAR(10)   NOT NULL PRIMARY KEY,
    first_name       VARCHAR(50)   NOT NULL,
    last_name        VARCHAR(50)   NOT NULL,
    phone_number     VARCHAR(20)   NOT NULL,
    country_code     VARCHAR(5)    NULL,
    country_name     VARCHAR(100)  NULL,
    line_type        VARCHAR(20)   NULL,
    carrier          VARCHAR(100)  NULL,
    plan_type        VARCHAR(30)   NOT NULL,
    contract_type    VARCHAR(20)   NOT NULL,
    payment_method    VARCHAR(20)   NOT NULL,
    signup_date       DATE          NOT NULL,
    tenure_months     INT           NOT NULL,
    is_churned        BIT           NOT NULL DEFAULT 0
);
GO

-- Helpful index for joining against the usage/billing CSV source on customer_id
CREATE INDEX IX_Customers_PhoneNumber ON dbo.Customers(phone_number);
GO

INSERT INTO dbo.Customers
    (customer_id, first_name, last_name, phone_number, country_code, country_name,
     line_type, carrier, plan_type, contract_type, payment_method,
     signup_date, tenure_months, is_churned)
VALUES

('CUST00001', 'Nour', 'Khalil', '447492794773', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Hutchison 3G UK Ltd', 'Prepaid Plus', 'Month-to-Month', 'Credit Card', '2024-08-02', 22, 0),
('CUST00002', 'Oliver', 'Garcia', '447457344527', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Vectone Mobile Ltd', 'Postpaid Family', 'One Year', 'Credit Card', '2024-10-17', 20, 0),
('CUST00003', 'Omar', 'Walker', '201075031249', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Postpaid Family', 'Month-to-Month', 'Cash', '2021-03-03', 64, 0),
('CUST00004', 'Oliver', 'Nair', '201163838190', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Etisalat Misr', 'Prepaid Plus', 'One Year', 'Cash', '2022-02-12', 52, 0),
('CUST00005', 'James', 'Hassan', '917818138729', 'IN', 'India (Republic of)', 'landline', NULL, 'Postpaid Premium', 'One Year', 'Direct Debit', '2022-07-24', 47, 1),
('CUST00006', 'Priya', 'Miller', '16104192434', 'US', 'United States of America', 'landline', NULL, 'Prepaid Basic', 'One Year', 'Credit Card', '2021-11-15', 55, 0),
('CUST00007', 'George', 'Mansour', '201555414826', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Telecom Egypt SAE (te)', 'Prepaid Basic', 'Two Year', 'Mobile Wallet', '2023-01-06', 41, 1),
('CUST00008', 'Vikram', 'Garcia', '447830156558', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Hutchison 3G UK Ltd', 'Postpaid Family', 'One Year', 'Cash', '2024-01-04', 29, 0),
('CUST00009', 'Robert', 'Williams', '201236389633', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Orange Egypt for Telecommunications SAE', 'Prepaid Plus', 'One Year', 'Credit Card', '2023-01-11', 41, 0),
('CUST00010', 'Vikram', 'Aziz', '447668029765', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'paging', NULL, 'Postpaid Premium', 'Two Year', 'Direct Debit', '2022-04-22', 50, 1),
('CUST00011', 'Mona', 'Aziz', '18574215766', 'US', 'United States of America', 'mobile', 'T-Mobile USA Inc.', 'Prepaid Basic', 'Two Year', 'Bank Transfer', '2021-11-30', 55, 0),
('CUST00012', 'Ahmed', 'Joshi', '15343987788', 'US', 'United States of America', NULL, NULL, 'Postpaid Premium', 'One Year', 'Cash', '2023-12-30', 30, 0),
('CUST00013', 'Patricia', 'Farouk', '918289317317', 'IN', 'India (Republic of)', 'landline', NULL, 'Prepaid Basic', 'One Year', 'Mobile Wallet', '2022-03-26', 51, 0),
('CUST00014', 'Harry', 'Sharma', '916079573627', 'IN', 'India (Republic of)', NULL, NULL, 'Prepaid Plus', 'Two Year', 'Mobile Wallet', '2022-07-03', 48, 0),
('CUST00015', 'Meera', 'Martinez', '917973804290', 'IN', 'India (Republic of)', 'mobile', 'Reliance Jio Infocomm Ltd (RJIL)', 'Postpaid Standard', 'Month-to-Month', 'Bank Transfer', '2023-03-22', 39, 1),
('CUST00016', 'Isla', 'Iyer', '201275699771', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Orange Egypt for Telecommunications SAE', 'Postpaid Family', 'One Year', 'Direct Debit', '2024-02-24', 28, 0),
('CUST00017', 'David', 'Walker', '14094465333', 'US', 'United States of America', NULL, NULL, 'Postpaid Premium', 'Month-to-Month', 'Credit Card', '2022-03-26', 51, 1),
('CUST00018', 'Ahmed', 'Iyer', '447378533321', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Hutchison 3G UK Ltd', 'Postpaid Family', 'Month-to-Month', 'Mobile Wallet', '2021-08-13', 58, 0),
('CUST00019', 'Meera', 'White', '19369764879', 'US', 'United States of America', NULL, NULL, 'Postpaid Standard', 'Two Year', 'Credit Card', '2023-02-21', 40, 0),
('CUST00020', 'Oliver', 'Aziz', '201214089697', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Orange Egypt for Telecommunications SAE', 'Postpaid Standard', 'Month-to-Month', 'Direct Debit', '2024-10-25', 20, 0),
('CUST00021', 'James', 'Mansour', '447193217479', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', NULL, 'Postpaid Family', 'Month-to-Month', 'Cash', '2023-06-10', 36, 0),
('CUST00022', 'Hana', 'Walker', '447800004205', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Everything Everywhere Ltd (EE)', 'Postpaid Family', 'Month-to-Month', 'Bank Transfer', '2021-08-06', 59, 1),
('CUST00023', 'Oliver', 'White', '447205534483', 'GB', 'United Kingdom of Great Britain and Northern Ireland', NULL, NULL, 'Prepaid Basic', 'Two Year', 'Direct Debit', '2023-02-05', 40, 1),
('CUST00024', 'Anita', 'Adel', '447685310662', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'paging', NULL, 'Prepaid Plus', 'Month-to-Month', 'Bank Transfer', '2023-09-28', 33, 0),
('CUST00025', 'Jennifer', 'Wilson', '13077245185', 'US', 'United States of America', 'mobile', 'Union Telephone Co. (Union Wireless)', 'Prepaid Basic', 'Two Year', 'Bank Transfer', '2024-03-07', 27, 1),
('CUST00026', 'Ava', 'Hassan', '447127685828', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', NULL, 'Postpaid Standard', 'Two Year', 'Cash', '2021-09-20', 57, 0),
('CUST00027', 'Oliver', 'Mahmoud', '19436751091', 'US', 'United States of America', NULL, NULL, 'Postpaid Standard', 'One Year', 'Direct Debit', '2023-05-17', 37, 1),
('CUST00028', 'Aditya', 'Davis', '201161915124', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Etisalat Misr', 'Prepaid Plus', 'Month-to-Month', 'Credit Card', '2023-06-17', 36, 1),
('CUST00029', 'Ava', 'Farouk', '201050610409', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Postpaid Family', 'Month-to-Month', 'Credit Card', '2022-11-24', 43, 0),
('CUST00030', 'Patricia', 'Farouk', '447324692990', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', NULL, 'Prepaid Basic', 'Month-to-Month', 'Direct Debit', '2021-05-26', 61, 0),
('CUST00031', 'Nour', 'Wilson', '447467707476', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Vodafone Ltd', 'Prepaid Plus', 'Two Year', 'Bank Transfer', '2021-05-26', 61, 0),
('CUST00032', 'Harry', 'Lewis', '447694627642', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'paging', NULL, 'Postpaid Premium', 'Month-to-Month', 'Mobile Wallet', '2025-01-21', 17, 1),
('CUST00033', 'Michael', 'Iyer', '447795378389', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Vodafone Ltd', 'Postpaid Standard', 'One Year', 'Mobile Wallet', '2023-04-14', 38, 0),
('CUST00034', 'Patricia', 'Miller', '201589057621', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Telecom Egypt SAE (te)', 'Prepaid Basic', 'One Year', 'Direct Debit', '2023-08-15', 34, 1),
('CUST00035', 'Mohamed', 'Harris', '201522073889', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Telecom Egypt SAE (te)', 'Postpaid Premium', 'Month-to-Month', 'Mobile Wallet', '2021-08-12', 59, 0),
('CUST00036', 'Fatma', 'Jones', '916904971953', 'IN', 'India (Republic of)', NULL, NULL, 'Postpaid Premium', 'Two Year', 'Credit Card', '2022-01-11', 53, 0),
('CUST00037', 'Oliver', 'Smith', '447491062467', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Hutchison 3G UK Ltd', 'Prepaid Basic', 'Month-to-Month', 'Bank Transfer', '2021-04-14', 63, 0),
('CUST00038', 'Mona', 'Reddy', '917101342686', 'IN', 'India (Republic of)', NULL, NULL, 'Prepaid Basic', 'Month-to-Month', 'Mobile Wallet', '2023-04-13', 38, 0),
('CUST00039', 'Yousef', 'Joshi', '201238087715', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Orange Egypt for Telecommunications SAE', 'Postpaid Standard', 'One Year', 'Cash', '2021-01-05', 66, 1),
('CUST00040', 'Elizabeth', 'Mahmoud', '919883490860', 'IN', 'India (Republic of)', 'mobile', 'Reliance Jio Infocomm Ltd (RJIL)', 'Postpaid Standard', 'Month-to-Month', 'Credit Card', '2024-09-17', 21, 0),
('CUST00041', 'Patricia', 'Sharma', '918891878918', 'IN', 'India (Republic of)', 'mobile', 'Tata Teleservices Ltd (TTSL)', 'Prepaid Basic', 'Month-to-Month', 'Cash', '2024-04-01', 26, 0),
('CUST00042', 'Emma', 'Hassan', '447442736493', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Vodafone Ltd', 'Prepaid Basic', 'Two Year', 'Credit Card', '2023-09-04', 33, 0),
('CUST00043', 'Robert', 'Khalil', '918603093238', 'IN', 'India (Republic of)', 'mobile', 'Tata Teleservices Ltd (TTSL)', 'Postpaid Premium', 'Month-to-Month', 'Cash', '2022-01-16', 53, 0),
('CUST00044', 'John', 'Wright', '201061529077', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Prepaid Basic', 'One Year', 'Cash', '2022-05-20', 49, 0),
('CUST00045', 'Yousef', 'Said', '917348092805', 'IN', 'India (Republic of)', 'mobile', 'Vodafone Idea Ltd (formerly Idea Cellular Ltd)', 'Postpaid Standard', 'Month-to-Month', 'Direct Debit', '2024-03-03', 27, 0),
('CUST00046', 'Hana', 'Joshi', '15329142310', 'US', 'United States of America', 'special_services', NULL, 'Postpaid Standard', 'Month-to-Month', 'Credit Card', '2023-03-22', 39, 0),
('CUST00047', 'Harry', 'Miller', '447327357121', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', NULL, 'Prepaid Basic', 'Two Year', 'Bank Transfer', '2023-07-28', 35, 0),
('CUST00048', 'Arjun', 'Jones', '13478406459', 'US', 'United States of America', 'mobile', 'Cellco Partnership (Verizon Wireless)', 'Prepaid Plus', 'One Year', 'Direct Debit', '2023-11-03', 31, 0),
('CUST00049', 'Oliver', 'Adel', '916611009680', 'IN', 'India (Republic of)', 'landline', NULL, 'Postpaid Family', 'Two Year', 'Cash', '2021-11-20', 55, 0),
('CUST00050', 'Ava', 'Adel', '17209879529', 'US', 'United States of America', 'mobile', 'T-Mobile USA Inc.', 'Prepaid Basic', 'Month-to-Month', 'Direct Debit', '2021-01-17', 65, 0),
('CUST00051', 'Ava', 'Martinez', '918392082665', 'IN', 'India (Republic of)', 'mobile', 'Reliance Jio Infocomm Ltd (RJIL)', 'Postpaid Standard', 'One Year', 'Cash', '2021-08-25', 58, 1),
('CUST00052', 'Mona', 'Mansour', '916315922389', 'IN', 'India (Republic of)', 'landline', NULL, 'Postpaid Family', 'One Year', 'Direct Debit', '2022-03-08', 52, 0),
('CUST00053', 'Kavya', 'Aziz', '201058750983', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Prepaid Basic', 'Month-to-Month', 'Direct Debit', '2021-04-15', 62, 0),
('CUST00054', 'Yousef', 'Hassan', '919564714290', 'IN', 'India (Republic of)', 'mobile', 'Vodafone Idea Ltd (formerly Vodafone India Ltd)', 'Postpaid Premium', 'Two Year', 'Mobile Wallet', '2021-09-25', 57, 0),
('CUST00055', 'Robert', 'Martinez', '917868872476', 'IN', 'India (Republic of)', 'mobile', 'Vodafone Idea Ltd (formerly Vodafone India Ltd)', 'Postpaid Family', 'Month-to-Month', 'Direct Debit', '2024-02-23', 28, 0),
('CUST00056', 'Kavya', 'Rodriguez', '17548545225', 'US', 'United States of America', NULL, NULL, 'Prepaid Basic', 'One Year', 'Direct Debit', '2024-04-07', 26, 0),
('CUST00057', 'Mona', 'Khalil', '447562773077', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Telefonica UK Ltd', 'Prepaid Basic', 'One Year', 'Cash', '2021-03-23', 63, 1),
('CUST00058', 'Elizabeth', 'Khalil', '201056345329', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Prepaid Plus', 'Month-to-Month', 'Mobile Wallet', '2023-04-13', 38, 1),
('CUST00059', 'Priya', 'Nair', '916906781256', 'IN', 'India (Republic of)', NULL, NULL, 'Prepaid Plus', 'One Year', 'Bank Transfer', '2021-02-20', 64, 0),
('CUST00060', 'John', 'Taylor', '447985393338', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Everything Everywhere Ltd (EE)', 'Prepaid Plus', 'Month-to-Month', 'Mobile Wallet', '2024-12-07', 18, 0),
('CUST00061', 'Omar', 'Farouk', '201057136693', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Prepaid Basic', 'Two Year', 'Bank Transfer', '2022-12-18', 42, 0),
('CUST00062', 'Robert', 'Aziz', '201066999380', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Postpaid Standard', 'Two Year', 'Cash', '2023-03-28', 39, 0),
('CUST00063', 'Oliver', 'Patel', '19307361634', 'US', 'United States of America', NULL, NULL, 'Prepaid Basic', 'Month-to-Month', 'Direct Debit', '2023-03-30', 39, 0),
('CUST00064', 'Yousef', 'Williams', '917015852189', 'IN', 'India (Republic of)', 'mobile', 'Reliance Jio Infocomm Ltd (RJIL)', 'Prepaid Basic', 'Two Year', 'Mobile Wallet', '2022-01-01', 54, 0),
('CUST00065', 'Rohan', 'Iyer', '447590886967', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Telefonica UK Ltd', 'Postpaid Family', 'Two Year', 'Credit Card', '2022-12-09', 42, 0),
('CUST00066', 'Mohamed', 'Mansour', '447119957725', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', NULL, 'Prepaid Basic', 'Two Year', 'Mobile Wallet', '2023-02-28', 40, 1),
('CUST00067', 'Oliver', 'Mahmoud', '201066558649', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Postpaid Standard', 'One Year', 'Credit Card', '2021-01-04', 66, 0),
('CUST00068', 'Mia', 'Sharma', '201587334600', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Telecom Egypt SAE (te)', 'Prepaid Basic', 'Two Year', 'Direct Debit', '2024-09-22', 21, 1),
('CUST00069', 'Raj', 'Sharma', '14092291394', 'US', 'United States of America', 'landline', NULL, 'Postpaid Premium', 'Two Year', 'Direct Debit', '2023-11-05', 31, 0),
('CUST00070', 'Raj', 'Gupta', '201032663060', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Prepaid Plus', 'Two Year', 'Cash', '2024-02-10', 28, 0),
('CUST00071', 'James', 'Adel', '201082958385', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Vodafone Egypt Telecommunications SAE', 'Postpaid Standard', 'Month-to-Month', 'Mobile Wallet', '2022-09-09', 45, 0),
('CUST00072', 'Rohan', 'Joshi', '918833900304', 'IN', 'India (Republic of)', 'landline', NULL, 'Postpaid Premium', 'One Year', 'Bank Transfer', '2024-04-02', 26, 0),
('CUST00073', 'Ahmed', 'Garcia', '201272136310', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Orange Egypt for Telecommunications SAE', 'Postpaid Standard', 'Two Year', 'Cash', '2023-11-13', 31, 0),
('CUST00074', 'Fatma', 'Adel', '918406473482', 'IN', 'India (Republic of)', 'landline', NULL, 'Prepaid Plus', 'Month-to-Month', 'Bank Transfer', '2022-11-18', 43, 0),
('CUST00075', 'Liam', 'Wright', '13823604692', 'CA', 'Canada', NULL, NULL, 'Prepaid Basic', 'One Year', 'Mobile Wallet', '2021-02-20', 64, 0),
('CUST00076', 'Vikram', 'Wilson', '201544727200', 'EG', 'Egypt (Arab Republic of)', 'mobile', 'Telecom Egypt SAE (te)', 'Postpaid Premium', 'Month-to-Month', 'Bank Transfer', '2024-07-13', 23, 0),
('CUST00077', 'Michael', 'Iyer', '18437678034', 'US', 'United States of America', 'landline', NULL, 'Prepaid Plus', 'Month-to-Month', 'Cash', '2024-09-05', 21, 0),
('CUST00078', 'Fatma', 'Davis', '13435981052', 'CA', 'Canada', 'mobile', 'Bell Mobility Inc.', 'Postpaid Premium', 'Month-to-Month', 'Mobile Wallet', '2023-08-10', 34, 0),
('CUST00079', 'Ava', 'King', '447795125168', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Vodafone Ltd', 'Postpaid Standard', 'One Year', 'Cash', '2024-09-29', 20, 0),
('CUST00080', 'Kavya', 'Clark', '918392726716', 'IN', 'India (Republic of)', 'landline', NULL, 'Postpaid Premium', 'Month-to-Month', 'Mobile Wallet', '2025-01-13', 17, 1),
('CUST00081', 'Fatma', 'Aziz', '447906979967', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Everything Everywhere Ltd (EE)', 'Postpaid Family', 'One Year', 'Bank Transfer', '2023-07-11', 35, 0),
('CUST00082', 'Karim', 'Khalil', '917542128947', 'IN', 'India (Republic of)', 'landline', NULL, 'Postpaid Standard', 'One Year', 'Direct Debit', '2022-07-17', 47, 0),
('CUST00083', 'Elizabeth', 'Farouk', '917072285016', 'IN', 'India (Republic of)', 'mobile', 'Vodafone Idea Ltd (formerly Vodafone India Ltd)', 'Postpaid Premium', 'Two Year', 'Bank Transfer', '2024-01-12', 29, 0),
('CUST00084', 'Raj', 'Nair', '14069849623', 'US', 'United States of America', 'landline', NULL, 'Postpaid Standard', 'Two Year', 'Mobile Wallet', '2024-12-17', 18, 0),
('CUST00085', 'Raj', 'Gupta', '447261324929', 'GB', 'United Kingdom of Great Britain and Northern Ireland', NULL, NULL, 'Postpaid Family', 'Two Year', 'Credit Card', '2023-05-02', 38, 0),
('CUST00086', 'James', 'Kumar', '447963467161', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'mobile', 'Everything Everywhere Ltd (EE)', 'Postpaid Standard', 'One Year', 'Mobile Wallet', '2024-03-25', 27, 0),
('CUST00087', 'Oliver', 'King', '17262219184', 'US', 'United States of America', 'mobile', 'T-Mobile USA Inc.', 'Prepaid Plus', 'One Year', 'Bank Transfer', '2024-01-08', 29, 0),
('CUST00088', 'Mary', 'Gupta', '447641342079', 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'paging', NULL, 'Postpaid Standard', 'Two Year', 'Mobile Wallet', '2022-07-13', 47, 0)
;
GO


-- Quick sanity check query
SELECT TOP 10 * FROM dbo.Customers;
GO