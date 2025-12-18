CREATE TABLE `User` (
  `user_id` int PRIMARY KEY,
  `email` varchar(255),
  `password_hash` varchar(255),
  `name` varchar(255),
  `gender` varchar(255),
  `date_of_birth` date,
  `height_cm` int,
  `weight_kg` float,
  `activity_level` varchar(255),
  `goal` varchar(255),
  `created_at` datetime
);

CREATE TABLE `User_Settings` (
  `settings_id` int PRIMARY KEY,
  `user_id` int,
  `language` varchar(255),
  `theme` varchar(255),
  `notifications_enabled` boolean,
  `water_reminder_enabled` boolean,
  `workout_reminder_enabled` boolean,
  `meal_reminder_enabled` boolean,
  `eco_mode_enabled` boolean
);

CREATE TABLE `Medical_Profile` (
  `medical_id` int PRIMARY KEY,
  `user_id` int,
  `conditions` text,
  `injuries` text
);

CREATE TABLE `Health_Log` (
  `health_log_id` int PRIMARY KEY,
  `user_id` int,
  `log_date` date,
  `blood_pressure` varchar(255),
  `blood_sugar` float,
  `mood` varchar(255),
  `sleep_hours` float,
  `water_intake_liters` float
);

CREATE TABLE `Progress_Stats` (
  `stat_id` int PRIMARY KEY,
  `user_id` int,
  `stat_date` date,
  `calories_consumed` int,
  `calories_burned` int,
  `steps` int
);

CREATE TABLE `Ingredient` (
  `ingredient_id` int PRIMARY KEY,
  `name` varchar(255),
  `unit` varchar(255),
  `calories_per_unit` float,
  `protein_per_unit` float,
  `carbs_per_unit` float,
  `fat_per_unit` float,
  `eco_score` float,
  `allergen_flag` boolean
);

CREATE TABLE `User_Allergy` (
  `user_allergy_id` int PRIMARY KEY,
  `user_id` int,
  `ingredient_id` int
);

CREATE TABLE `Meal` (
  `meal_id` int PRIMARY KEY,
  `meal_name` varchar(255),
  `calories` int,
  `protein` float,
  `carbs` float,
  `fat` float,
  `eco_score` int,
  `has_video` boolean
);

CREATE TABLE `Meal_Ingredient` (
  `meal_ingredient_id` int PRIMARY KEY,
  `meal_id` int,
  `ingredient_id` int,
  `quantity` float
);

CREATE TABLE `Recipe` (
  `recipe_id` int PRIMARY KEY,
  `meal_id` int,
  `instructions` text,
  `video_url` varchar(255)
);

CREATE TABLE `Meal_Plan` (
  `plan_id` int PRIMARY KEY,
  `user_id` int,
  `plan_date` date,
  `total_calories` int
);

CREATE TABLE `Meal_Plan_Item` (
  `item_id` int PRIMARY KEY,
  `plan_id` int,
  `meal_id` int,
  `meal_time` varchar(255)
);

CREATE TABLE `Meal_Log` (
  `meal_log_id` int PRIMARY KEY,
  `user_id` int,
  `meal_id` int,
  `log_date` date,
  `quantity` float
);

CREATE TABLE `Pantry_Item` (
  `pantry_item_id` int PRIMARY KEY,
  `user_id` int,
  `ingredient_id` int,
  `quantity` float,
  `expiry_date` date
);

CREATE TABLE `Grocery_List` (
  `list_id` int PRIMARY KEY,
  `user_id` int,
  `created_at` date
);

CREATE TABLE `Grocery_Item` (
  `grocery_item_id` int PRIMARY KEY,
  `list_id` int,
  `item_name` varchar(255),
  `checked` boolean
);

CREATE TABLE `Workout` (
  `workout_id` int PRIMARY KEY,
  `workout_name` varchar(255),
  `category` varchar(255),
  `difficulty` varchar(255),
  `duration_minutes` int
);

CREATE TABLE `Exercise` (
  `exercise_id` int PRIMARY KEY,
  `exercise_name` varchar(255),
  `description` text
);

CREATE TABLE `Workout_Exercise` (
  `workout_exercise_id` int PRIMARY KEY,
  `workout_id` int,
  `exercise_id` int,
  `reps` int,
  `sets` int,
  `rest_seconds` int
);

CREATE TABLE `Workout_Plan` (
  `plan_id` int PRIMARY KEY,
  `user_id` int,
  `start_date` date,
  `focus` varchar(255)
);

CREATE TABLE `Workout_Session` (
  `session_id` int PRIMARY KEY,
  `user_id` int,
  `workout_id` int,
  `session_date` date,
  `duration_minutes` int,
  `calories_burned` int,
  `completed` boolean
);

CREATE TABLE `AI_Chat` (
  `chat_id` int PRIMARY KEY,
  `user_id` int,
  `message` text,
  `sender` varchar(255),
  `timestamp` datetime
);

CREATE TABLE `Notification` (
  `notification_id` int PRIMARY KEY,
  `user_id` int,
  `title` varchar(255),
  `message` text,
  `type` varchar(255),
  `sent_at` datetime
);

CREATE TABLE `Reward` (
  `reward_id` int PRIMARY KEY,
  `reward_name` varchar(255),
  `points_required` int
);

CREATE TABLE `User_Reward` (
  `user_reward_id` int PRIMARY KEY,
  `user_id` int,
  `reward_id` int,
  `earned_date` date
);

ALTER TABLE `User_Settings` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Medical_Profile` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Health_Log` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Progress_Stats` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `User_Allergy` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `User_Allergy` ADD FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient` (`ingredient_id`);

ALTER TABLE `Meal_Ingredient` ADD FOREIGN KEY (`meal_id`) REFERENCES `Meal` (`meal_id`);

ALTER TABLE `Meal_Ingredient` ADD FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient` (`ingredient_id`);

ALTER TABLE `Recipe` ADD FOREIGN KEY (`meal_id`) REFERENCES `Meal` (`meal_id`);

ALTER TABLE `Meal_Plan` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Meal_Plan_Item` ADD FOREIGN KEY (`plan_id`) REFERENCES `Meal_Plan` (`plan_id`);

ALTER TABLE `Meal_Plan_Item` ADD FOREIGN KEY (`meal_id`) REFERENCES `Meal` (`meal_id`);

ALTER TABLE `Meal_Log` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Meal_Log` ADD FOREIGN KEY (`meal_id`) REFERENCES `Meal` (`meal_id`);

ALTER TABLE `Pantry_Item` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Pantry_Item` ADD FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredient` (`ingredient_id`);

ALTER TABLE `Grocery_List` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Grocery_Item` ADD FOREIGN KEY (`list_id`) REFERENCES `Grocery_List` (`list_id`);

ALTER TABLE `Workout_Exercise` ADD FOREIGN KEY (`workout_id`) REFERENCES `Workout` (`workout_id`);

ALTER TABLE `Workout_Exercise` ADD FOREIGN KEY (`exercise_id`) REFERENCES `Exercise` (`exercise_id`);

ALTER TABLE `Workout_Plan` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Workout_Session` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Workout_Session` ADD FOREIGN KEY (`workout_id`) REFERENCES `Workout` (`workout_id`);

ALTER TABLE `AI_Chat` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `Notification` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `User_Reward` ADD FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`);

ALTER TABLE `User_Reward` ADD FOREIGN KEY (`reward_id`) REFERENCES `Reward` (`reward_id`);
