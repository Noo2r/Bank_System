-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2025 at 11:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `account_number` varchar(20) NOT NULL,
  `account_type` varchar(20) DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT 0.00,
  `opened_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `customer_id`, `account_number`, `account_type`, `balance`, `opened_at`) VALUES
(1, 1, 'ACC123456', 'Savings', 1000.00, '2025-07-16 05:41:10'),
(2, 1, 'ACC10001', 'Savings', 3200.00, '2025-07-16 05:43:30'),
(3, 1, 'ACC10002', 'Checking', 850.00, '2025-07-16 05:43:30'),
(4, 2, 'ACC10003', 'Savings', 5400.50, '2025-07-16 05:43:30'),
(5, 3, 'ACC10004', 'Savings', 1090.75, '2025-07-16 05:43:30'),
(6, 3, 'ACC10005', 'Checking', 220.20, '2025-07-16 05:43:30'),
(7, 4, 'ACC10006', 'Savings', 2999.99, '2025-07-16 05:43:30'),
(8, 5, 'ACC10007', 'Checking', 980.30, '2025-07-16 05:43:30'),
(9, 6, 'ACC10008', 'Savings', 4300.10, '2025-07-16 05:43:30'),
(10, 7, 'ACC10009', 'Savings', 1450.00, '2025-07-16 05:43:30'),
(11, 8, 'ACC10010', 'Savings', 2100.00, '2025-07-16 05:43:30'),
(12, 9, 'ACC10011', 'Checking', 780.60, '2025-07-16 05:43:30'),
(13, 10, 'ACC10012', 'Savings', 3700.00, '2025-07-16 05:43:30'),
(14, 11, 'ACC10013', 'Checking', 650.00, '2025-07-16 05:43:30'),
(15, 12, 'ACC10014', 'Savings', 4800.99, '2025-07-16 05:43:30'),
(16, 13, 'ACC10015', 'Savings', 1950.00, '2025-07-16 05:43:30'),
(17, 14, 'ACC10016', 'Savings', 3600.10, '2025-07-16 05:43:30'),
(18, 15, 'ACC10017', 'Checking', 740.00, '2025-07-16 05:43:30'),
(19, 15, 'ACC10018', 'Savings', 2500.00, '2025-07-16 05:43:30'),
(20, 16, 'ACC10019', 'Savings', 3200.75, '2025-07-16 05:43:30'),
(21, 17, 'ACC10020', 'Savings', 2990.00, '2025-07-16 05:43:30'),
(22, 18, 'ACC10021', 'Checking', 670.00, '2025-07-16 05:43:30'),
(23, 19, 'ACC10022', 'Savings', 3800.00, '2025-07-16 05:43:30'),
(24, 20, 'ACC10023', 'Checking', 900.00, '2025-07-16 05:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `email`, `phone_number`, `address`, `created_at`) VALUES
(1, 'John Doe', 'john@example.com', '1234567890', '123 Main St', '2025-07-16 05:41:10'),
(2, 'Sarah Johnson', 'sarah.johnson@example.com', '01234567890', '12 River Road, Cairo', '2025-07-16 05:42:28'),
(3, 'Ahmed Hassan', 'ahmed.hassan@example.com', '01023456789', '45 Nile Street, Giza', '2025-07-16 05:42:28'),
(4, 'Emily Brown', 'emily.brown@example.com', '01598765432', '88 Palm Ave, Alexandria', '2025-07-16 05:42:28'),
(5, 'Mohamed Ali', 'mohamed.ali@example.com', '01112345678', '34 Lotus St, Nasr City', '2025-07-16 05:42:28'),
(6, 'Amina Khaled', 'amina.khaled@example.com', '01219876543', '9 El Tahrir Sq, Downtown Cairo', '2025-07-16 05:42:28'),
(7, 'David Smith', 'david.smith@example.com', '01501239876', '77 New Cairo Heights', '2025-07-16 05:42:28'),
(8, 'Hanaa El-Sayed', 'hanaa.elsayed@example.com', '01056341234', '5 Maadi Gardens, Cairo', '2025-07-16 05:42:28'),
(9, 'Omar Youssef', 'omar.youssef@example.com', '01145678901', '21 October City Block A', '2025-07-16 05:42:28'),
(10, 'Linda Wilson', 'linda.wilson@example.com', '01233445566', '99 Zayed Compound', '2025-07-16 05:42:28'),
(11, 'Karim Magdy', 'karim.magdy@example.com', '01599887766', '3 Heliopolis Plaza, Cairo', '2025-07-16 05:42:28'),
(12, 'Noor Adel', 'noor.adel@example.com', '01033445577', '14 El Rehab City', '2025-07-16 05:42:28'),
(13, 'James White', 'james.white@example.com', '01122334455', '32 Garden City, Cairo', '2025-07-16 05:42:28'),
(14, 'Laila Nour', 'laila.nour@example.com', '01244332211', '56 Mansoura Town', '2025-07-16 05:42:28'),
(15, 'Ali Mostafa', 'ali.mostafa@example.com', '01077889900', '23 Minya Central St', '2025-07-16 05:42:28'),
(16, 'Fatma Saeed', 'fatma.saeed@example.com', '01566778899', '18 Fayoum Corniche', '2025-07-16 05:42:28'),
(17, 'John Carter', 'john.carter@example.com', '01188990077', '67 Smart Village, Giza', '2025-07-16 05:42:28'),
(18, 'Nadine Rashad', 'nadine.rashad@example.com', '01277665544', '4 Mokattam Hills', '2025-07-16 05:42:28'),
(19, 'Khaled Nasser', 'khaled.nasser@example.com', '01066554433', '11 Sheraton Heliopolis', '2025-07-16 05:42:28'),
(20, 'Rania Morsi', 'rania.morsi@example.com', '01512344321', '66 Garden Hills, 6th October', '2025-07-16 05:42:28'),
(21, 'Tom Hardy', 'tom.hardy@example.com', '01155443322', '87 Zamalek Tower, Cairo', '2025-07-16 05:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `sql_query` text NOT NULL,
  `created_by` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `name`, `description`, `sql_query`, `created_by`) VALUES
(1, 'Customer Summary', 'Shows basic customer information', 'SELECT * FROM customers;', 'farida\r\n'),
(2, 'Active Accounts', 'Lists all active bank accounts', 'SELECT * FROM accounts WHERE status = \"active\";', 'mariam'),
(3, 'Transactions Report', 'Shows all transactions made this month', 'SELECT * FROM transactions WHERE date >= CURDATE() - INTERVAL 30 DAY;', 'kareem'),
(4, 'High Value Transfers', 'Transactions above $10,000', 'SELECT * FROM transactions WHERE amount > 10000;', 'abdelrahman'),
(5, 'Accounts per User', 'Counts how many accounts each user has', 'SELECT user_id, COUNT(*) FROM accounts GROUP BY user_id;', 'nour'),
(6, 'Low Balance Accounts', 'Accounts with less than $100', 'SELECT * FROM accounts WHERE balance < 100;', 'youssef'),
(7, 'Customer by City', 'Shows customer distribution by city', 'SELECT city, COUNT(*) FROM customers GROUP BY city;', 'mazen'),
(8, 'Suspicious Activity', 'Unusual login patterns', 'SELECT * FROM logins WHERE suspicious = 1;', 'farida\r\n'),
(9, 'Monthly Deposits', 'Deposit totals per month', 'SELECT MONTH(date) as month, SUM(amount) FROM transactions WHERE type = \"deposit\" GROUP BY MONTH(date);', 'mariam'),
(10, 'Monthly Withdrawals', 'Withdrawal totals per month', 'SELECT MONTH(date) as month, SUM(amount) FROM transactions WHERE type = \"withdrawal\" GROUP BY MONTH(date);', 'kareem'),
(11, 'Account Status Summary', 'Number of accounts by status', 'SELECT status, COUNT(*) FROM accounts GROUP BY status;', 'abdelrahman'),
(12, 'Frequent Users', 'Users with more than 10 logins last week', 'SELECT user_id, COUNT(*) FROM logins WHERE date >= CURDATE() - INTERVAL 7 DAY GROUP BY user_id HAVING COUNT(*) > 10;', 'nour'),
(13, 'New Customers', 'Customers who joined this month', 'SELECT * FROM customers WHERE signup_date >= CURDATE() - INTERVAL 30 DAY;', 'youssef'),
(14, 'Top Senders', 'Top 5 users who sent the most money', 'SELECT sender_id, SUM(amount) as total_sent FROM transactions GROUP BY sender_id ORDER BY total_sent DESC LIMIT 5;', 'mazen'),
(15, 'Top Receivers', 'Top 5 users who received the most money', 'SELECT receiver_id, SUM(amount) as total_received FROM transactions GROUP BY receiver_id ORDER BY total_received DESC LIMIT 5;', 'farida\r\n'),
(16, 'Inactive Users', 'Users with no activity in last 3 months', 'SELECT * FROM users WHERE last_active <= CURDATE() - INTERVAL 90 DAY;', 'mariam'),
(17, 'Account Openings', 'Number of new accounts opened per week', 'SELECT WEEK(open_date) as week, COUNT(*) FROM accounts GROUP BY WEEK(open_date);', 'kareem'),
(18, 'Transaction Failures', 'Failed transactions overview', 'SELECT * FROM transactions WHERE status = \"failed\";', 'abdelrahman'),
(19, 'User Login Summary', 'Total logins per user', 'SELECT user_id, COUNT(*) FROM logins GROUP BY user_id;', 'nour'),
(20, 'Customer Age Groups', 'Distribution of customers by age group', 'SELECT CASE WHEN age < 20 THEN \"Under 20\" WHEN age <= 40 THEN \"20-40\" ELSE \"40+\" END AS age_group, COUNT(*) FROM customers GROUP BY age_group;', 'youssef');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(10) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `account_id`, `transaction_type`, `amount`, `transaction_date`, `description`) VALUES
(1, 1, 'debit', 200.00, '2025-07-16 05:41:10', 'ATM Withdrawal'),
(2, 1, 'credit', 1000.00, '2025-07-16 05:43:45', 'Salary Deposit'),
(3, 1, 'debit', 150.00, '2025-07-16 05:43:45', 'Electric Bill Payment'),
(4, 2, 'debit', 50.00, '2025-07-16 05:43:45', 'Grocery Store'),
(5, 2, 'debit', 75.00, '2025-07-16 05:43:45', 'Restaurant'),
(6, 3, 'credit', 3000.00, '2025-07-16 05:43:45', 'Freelance Payment'),
(7, 3, 'debit', 500.00, '2025-07-16 05:43:45', 'Laptop Purchase'),
(8, 4, 'credit', 500.00, '2025-07-16 05:43:45', 'Cash Deposit'),
(9, 5, 'debit', 100.00, '2025-07-16 05:43:45', 'Internet Bill'),
(10, 5, 'debit', 30.00, '2025-07-16 05:43:45', 'Mobile Recharge'),
(11, 6, 'credit', 2000.00, '2025-07-16 05:43:45', 'Transfer from Employer'),
(12, 6, 'debit', 400.00, '2025-07-16 05:43:45', 'ATM Withdrawal'),
(13, 7, 'debit', 200.00, '2025-07-16 05:43:45', 'Online Shopping'),
(14, 8, 'credit', 1000.00, '2025-07-16 05:43:45', 'Project Bonus'),
(15, 9, 'debit', 50.00, '2025-07-16 05:43:45', 'Coffee Shop'),
(16, 9, 'debit', 75.00, '2025-07-16 05:43:45', 'Taxi Fare'),
(17, 10, 'credit', 500.00, '2025-07-16 05:43:45', 'Cash Deposit'),
(18, 10, 'debit', 200.00, '2025-07-16 05:43:45', 'Utility Payment'),
(19, 11, 'debit', 300.00, '2025-07-16 05:43:45', 'Furniture'),
(20, 12, 'credit', 1200.00, '2025-07-16 05:43:45', 'Transfer from Friend'),
(21, 12, 'debit', 500.00, '2025-07-16 05:43:45', 'Car Repair'),
(22, 13, 'debit', 50.00, '2025-07-16 05:43:45', 'Streaming Subscription'),
(23, 14, 'credit', 1500.00, '2025-07-16 05:43:45', 'Freelance Work'),
(24, 14, 'debit', 200.00, '2025-07-16 05:43:45', 'Fuel'),
(25, 15, 'debit', 60.00, '2025-07-16 05:43:45', 'Supermarket'),
(26, 16, 'credit', 2000.00, '2025-07-16 05:43:45', 'Business Revenue'),
(27, 16, 'debit', 300.00, '2025-07-16 05:43:45', 'Rent'),
(28, 17, 'credit', 1000.00, '2025-07-16 05:43:45', 'Loan Received'),
(29, 18, 'debit', 100.00, '2025-07-16 05:43:45', 'Dining Out'),
(30, 18, 'debit', 40.00, '2025-07-16 05:43:45', 'Taxi'),
(31, 19, 'credit', 800.00, '2025-07-16 05:43:45', 'Salary Deposit'),
(32, 20, 'debit', 250.00, '2025-07-16 05:43:45', 'Furniture Shopping'),
(33, 21, 'credit', 1000.00, '2025-07-16 05:43:45', 'Consulting Fee'),
(34, 22, 'debit', 400.00, '2025-07-16 05:43:45', 'Appliance Purchase'),
(35, 23, 'credit', 1500.00, '2025-07-16 05:43:45', 'Business Transfer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','viewer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'farida\r\n', '123456', 'admin'),
(2, 'mariam', '7891011', 'admin'),
(3, 'kareem', '56789', 'admin'),
(4, 'abdelrahman', '67543', 'viewer'),
(5, 'nour', '678934', 'viewer'),
(6, 'youssef', '765342', 'viewer'),
(7, 'mazen', '234632', 'viewer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
