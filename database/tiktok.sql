-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 07, 2023 lúc 06:20 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tiktok`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `video_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follows`
--

CREATE TABLE `follows` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id_1` int(10) UNSIGNED NOT NULL,
  `user_id_2` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `follows`
--

INSERT INTO `follows` (`id`, `user_id_1`, `user_id_2`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '2022-07-31 21:50:18', '2022-07-31 21:50:18'),
(3, 2, 5, '2022-08-07 13:24:48', '2022-08-07 13:24:48'),
(4, 2, 3, '2022-08-07 13:51:27', '2022-08-07 13:51:27'),
(5, 6, 1, '2022-08-08 05:06:36', '2022-08-08 05:06:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hashtags`
--

CREATE TABLE `hashtags` (
  `id` int(10) UNSIGNED NOT NULL,
  `hashtag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hashtags`
--

INSERT INTO `hashtags` (`id`, `hashtag_name`, `created_at`, `updated_at`) VALUES
(1, 'tag1', '2022-07-31 20:09:16', '2022-07-31 20:09:16'),
(2, 'tag2', '2022-07-31 20:34:59', '2022-07-31 20:34:59'),
(3, 'tag3', '2022-08-07 10:14:08', '2022-08-07 10:14:08'),
(4, 'tag4', '2022-08-07 10:26:07', '2022-08-07 10:26:07'),
(5, 'xinh', '2023-03-17 12:24:11', '2023-03-17 12:24:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `like_comments`
--

CREATE TABLE `like_comments` (
  `status` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED DEFAULT NULL,
  `reply_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `like_videos`
--

CREATE TABLE `like_videos` (
  `status` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `video_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `like_videos`
--

INSERT INTO `like_videos` (`status`, `user_id`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-07-31 20:09:54', '2022-07-31 20:09:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_01_10_031426_create_users', 1),
(3, '2022_01_10_031513_create_hashtags', 1),
(4, '2022_01_10_041807_create_videos', 1),
(5, '2022_01_10_042119_create_comments', 1),
(6, '2022_01_10_043302_create_replies', 1),
(7, '2022_01_10_044022_create_follows', 1),
(8, '2022_01_25_045213_create_table_like_videos', 1),
(9, '2022_01_25_092136_create_table_like_comments', 1),
(10, '2022_02_05_105124_create_table_nortifications_table', 1),
(11, '2022_02_11_062953_create_table_rcmdt', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nortifications`
--

CREATE TABLE `nortifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `nortificable_id` int(10) UNSIGNED NOT NULL,
  `nortificable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nortifications`
--

INSERT INTO `nortifications` (`id`, `user_id`, `sender_id`, `nortificable_id`, `nortificable_type`, `read`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, 'App\\Models\\TiktokApi\\Follows', 1, '2022-07-31 21:41:53', '2022-08-07 10:11:43'),
(2, 2, 1, 2, 'App\\Models\\TiktokApi\\Follows', 1, '2022-07-31 21:50:18', '2022-08-07 13:24:39'),
(3, 5, 2, 3, 'App\\Models\\TiktokApi\\Follows', 0, '2022-08-07 13:24:48', '2022-08-07 13:24:48'),
(4, 3, 2, 4, 'App\\Models\\TiktokApi\\Follows', 0, '2022-08-07 13:51:27', '2022-08-07 13:51:27'),
(5, 1, 6, 5, 'App\\Models\\TiktokApi\\Follows', 0, '2022-08-08 05:06:36', '2022-08-08 05:06:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `replies`
--

CREATE TABLE `replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table_rcmdt`
--

CREATE TABLE `table_rcmdt` (
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `follow` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `fullname`, `age`, `gender`, `avatar`, `password`, `description`, `facebook`, `created_at`, `updated_at`) VALUES
(1, 'Minh0612', 'mvu0612@gmail.com', 'Vũ Ngọc Minh', 22, 'male', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1659323600/tiktok_image/ztbso5jdi3ijatbhyon8.webp', '2e32fb996ef8fe57caa2846960f440f6', 'Tôi là người vui vẻ', 'https://www.facebook.com/profile.php?id=100077323845846', '2022-08-01 02:40:07', '2022-07-31 20:13:23'),
(2, 'minh123', 'ming@gmail.com', 'Vũ Công Ming', 23, 'male', 'https://res.cloudinary.com/diw0u2vl1/image/upload/v1641639419/default_avatar/mnuue0txf2qv1zhpsbno.jpg', 'ddc83bf88c241349a4211172137545e0', NULL, NULL, '2022-08-01 03:28:48', '2022-08-01 03:28:48'),
(3, 'nam123', 'nam123@gmail.com', 'Đàm Phương Nam', 23, 'male', 'https://res.cloudinary.com/diw0u2vl1/image/upload/v1641639419/default_avatar/mnuue0txf2qv1zhpsbno.jpg', '54e193277215c92570bc9659bd48ff40', NULL, NULL, '2022-08-01 03:34:08', '2022-08-01 03:34:08'),
(4, 'Annguyen', 'annguyen@gmail.com', 'Nguyễn Văn An', 45, 'male', 'https://res.cloudinary.com/diw0u2vl1/image/upload/v1641639419/default_avatar/mnuue0txf2qv1zhpsbno.jpg', '808a64acbbb55bb93873322b1883c042', NULL, NULL, '2022-08-07 17:21:17', '2022-08-07 17:21:17'),
(5, 'Linh0612', 'linhtran@gmail.com', 'Trần Mỹ Linh', 23, 'female', 'https://res.cloudinary.com/diw0u2vl1/image/upload/v1641639373/default_avatar/c2xkuolzbms9xhsxh7cr.png', '7807ee0256fc3a36cf5b2becdfca04e4', NULL, NULL, '2022-08-07 19:07:08', '2022-08-07 19:07:08'),
(6, 'VanHoang', 'vanthai@gmail.com', 'Hoàng Văn Thái', 30, 'male', 'https://res.cloudinary.com/diw0u2vl1/image/upload/v1641639419/default_avatar/mnuue0txf2qv1zhpsbno.jpg', '995b02ee1b1d4bf54122578bae90406e', NULL, NULL, '2022-08-08 11:18:06', '2022-08-08 11:18:06'),
(7, 'MinhVu', 'anna112233@gmail.com', 'Vu Minh', 19, 'male', 'https://res.cloudinary.com/diw0u2vl1/image/upload/v1641639419/default_avatar/mnuue0txf2qv1zhpsbno.jpg', '2e32fb996ef8fe57caa2846960f440f6', NULL, NULL, '2023-03-17 19:23:08', '2023-03-17 19:23:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_view` double NOT NULL,
  `hashtag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `hashtag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `videos`
--

INSERT INTO `videos` (`id`, `url`, `background_video`, `description`, `time_view`, `hashtag_name`, `user_id`, `hashtag_id`, `created_at`, `updated_at`) VALUES
(1, 'http://res.cloudinary.com/diw0u2vl1/video/upload/v1659323342/qpbqldmedtxmpyf2cnj8.mp4', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1659323346/background/muw291zl6fkb5poyixzi.png', 'video 1', 0, 'tag1', 1, 1, '2022-07-31 20:09:16', '2022-07-31 20:09:16'),
(2, 'http://res.cloudinary.com/diw0u2vl1/video/upload/v1659324894/lv2snv6rjqod3vmembaa.mp4', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1659324900/background/nluhar5a6nvppbxsqim1.png', 'Minh 0612', 0, 'tag2', 3, 2, '2022-07-31 20:35:11', '2022-07-31 20:35:11'),
(3, 'http://res.cloudinary.com/diw0u2vl1/video/upload/v1659892389/pexzhzfvcqpdkym6skeu.mp4', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1659892391/background/qfhdrsyjswkl8svgjlpx.png', 'Video', 0, 'tag3', 3, 3, '2022-08-07 10:14:08', '2022-08-07 10:14:08'),
(4, 'http://res.cloudinary.com/diw0u2vl1/video/upload/v1659892737/mlnecbpc6aqmvfkk3ezm.mp4', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1659892748/background/arldvsbwjjnxcj3zv7ut.png', 'Bàn tay', 0, 'tag3', 3, 3, '2022-08-07 10:19:14', '2022-08-07 10:19:14'),
(5, 'http://res.cloudinary.com/diw0u2vl1/video/upload/v1659893150/pwgh9m0jutmdppy0vyig.mp4', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1659893164/background/owipboqwwk0bqk5sxktu.png', 'Video 1234', 0, 'tag4', 4, 4, '2022-08-07 10:26:07', '2022-08-07 10:26:07'),
(6, 'http://res.cloudinary.com/diw0u2vl1/video/upload/v1659893207/lmiomuzxdh15g7thkluu.mp4', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1659893227/background/mpakchswpgep0adozgfx.png', 'Video 456789', 0, 'tag2', 4, 2, '2022-08-07 10:27:09', '2022-08-07 10:27:09'),
(7, 'http://res.cloudinary.com/diw0u2vl1/video/upload/v1679081028/tiktok_video/xjkhintsv8jmrravhtet.mp4', 'http://res.cloudinary.com/diw0u2vl1/image/upload/v1679081035/background/hfdywzwg4mzwcdxqwsw7.png', 'xinh xinh', 0, 'xinh', 7, 5, '2023-03-17 12:24:11', '2023-03-17 12:24:11');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_video_id_foreign` (`video_id`);

--
-- Chỉ mục cho bảng `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follows_user_id_1_foreign` (`user_id_1`),
  ADD KEY `follows_user_id_2_foreign` (`user_id_2`);

--
-- Chỉ mục cho bảng `hashtags`
--
ALTER TABLE `hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `like_comments`
--
ALTER TABLE `like_comments`
  ADD KEY `like_comments_user_id_foreign` (`user_id`),
  ADD KEY `like_comments_comment_id_foreign` (`comment_id`),
  ADD KEY `like_comments_reply_id_foreign` (`reply_id`);

--
-- Chỉ mục cho bảng `like_videos`
--
ALTER TABLE `like_videos`
  ADD KEY `like_videos_user_id_foreign` (`user_id`),
  ADD KEY `like_videos_video_id_foreign` (`video_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nortifications`
--
ALTER TABLE `nortifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nortifications_user_id_foreign` (`user_id`),
  ADD KEY `nortifications_sender_id_foreign` (`sender_id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replies_user_id_foreign` (`user_id`),
  ADD KEY `replies_comment_id_foreign` (`comment_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_user_id_foreign` (`user_id`),
  ADD KEY `videos_hashtag_id_foreign` (`hashtag_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `nortifications`
--
ALTER TABLE `nortifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_user_id_1_foreign` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_user_id_2_foreign` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `like_comments`
--
ALTER TABLE `like_comments`
  ADD CONSTRAINT `like_comments_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `like_comments_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `replies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `like_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `like_videos`
--
ALTER TABLE `like_videos`
  ADD CONSTRAINT `like_videos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `like_videos_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `nortifications`
--
ALTER TABLE `nortifications`
  ADD CONSTRAINT `nortifications_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nortifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_hashtag_id_foreign` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags` (`id`),
  ADD CONSTRAINT `videos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
