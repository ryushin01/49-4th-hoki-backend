-- migrate:up
CREATE TABLE `interests` (
  `id` int PRIMARY KEY NOT NULL,
  `game` TINYINT NOT NULL,
  `movie` TINYINT NOT NULL,
  `restaurant` TINYINT NOT NULL,
  `music` TINYINT NOT NULL,
  `mbti` TINYINT NOT NULL,
  `celebrity` TINYINT NOT NULL,
  `date` TINYINT NOT NULL,
  `job` TINYINT NOT NULL,
  `alcohol` TINYINT NOT NULL,
  `car` TINYINT NOT NULL,
  `fashion` TINYINT NOT NULL,
  `interior` TINYINT NOT NULL,
  `festival` TINYINT NOT NULL,
  `device` TINYINT NOT NULL,
  `baby` TINYINT NOT NULL,
  `beauty` TINYINT NOT NULL,
  `tip` TINYINT NOT NULL,
  `cooking` TINYINT NOT NULL,
  `camping` TINYINT NOT NULL,
  `trip` TINYINT NOT NULL,
  `user_id` int NOT NULL,
  `feed_id` int NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- migrate:down
DROP TABLE `interests`;
