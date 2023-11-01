-- migrate:up
CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nickname` varchar(10) UNIQUE,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `profile_image` varchar(512),
  `sns_id` varchar(50) NOT NULL,
  `social_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp,
  FOREIGN KEY (`social_id`) REFERENCES `socials` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `users`;

