-- seed_user.sql

-- Drop existing data (optional, only if you want to start fresh)
DELETE FROM `user`;

-- Insert user data
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`, `date_of_birth`, `contact`, `role`) VALUES
(1, 'Bipin Paudel', 'paudelbipin05@gmail.com', 'bipin123', '2007-01-05', 2147483647, 'admin'),
(2, 'Abiskar Gurung', 'abiskar@gmail.com', 'abiskar123', '2016-01-14', 980110222, 'admin'),
(3, 'Chirag Tamang', 'chiragtmg4@gmail.com', 'chirag123', '2025-04-01', 9893661287, 'cashier'),
(5, 'Nirvana Bhandari', 'nirvana@gmail.com', 'nirvana123', '2025-04-10', 988279173, 'cashier');
