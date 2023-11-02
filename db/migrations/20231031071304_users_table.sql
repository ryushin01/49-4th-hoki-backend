-- migrate:up
CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nickname` varchar(10) UNIQUE,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `profile_image` varchar(512),
  `provider` varchar(20),
  `uid` varchar(100) UNIQUE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `users`;

