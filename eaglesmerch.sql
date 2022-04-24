-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 20 2022 г., 10:56
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `eaglesmerch`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `size_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`user_id`, `product_id`, `count`, `size_id`) VALUES
(1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`) VALUES
(34, 'Мужчинам', 'default.jpg'),
(35, 'Женщинам', 'default.jpg'),
(36, 'Детям', 'default.jpg'),
(37, 'Аксессуары', 'default.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `delivery`
--

INSERT INTO `delivery` (`id`, `name`, `price`, `deadline`) VALUES
(1, 'Самовывоз', 'Бесплатно', 0),
(2, 'Курьером', '350₽', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `name`) VALUES
(1, 'Хлопок'),
(2, 'Полиэстер'),
(3, 'Шёлк'),
(4, 'Полиэстер');

-- --------------------------------------------------------

--
-- Структура таблицы `ordered_products`
--

CREATE TABLE `ordered_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ordered_products`
--

INSERT INTO `ordered_products` (`order_id`, `product_id`, `size_id`, `count`, `price`) VALUES
(9, 3, 7, 10, '1199'),
(9, 3, 6, 2, '1199'),
(9, 2, 1, 1, '1199'),
(10, 3, 6, 1, '1199'),
(11, 2, 1, 154, '1199'),
(12, 3, 4, 5, '1199'),
(12, 3, 1, 1, '1199'),
(13, 3, 3, 1, '1199'),
(13, 3, 1, 1, '1199'),
(14, 3, 1, 1, '1199');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `final_price` decimal(10,0) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_registration` date NOT NULL,
  `date_of_receiving` date DEFAULT NULL,
  `delivery_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `final_price`, `address`, `date_of_registration`, `date_of_receiving`, `delivery_id`, `status_id`) VALUES
(9, 1, '15587', '', '2022-04-08', NULL, 1, 1),
(10, 1, '1549', 'уг Гагарина 7', '2022-04-08', NULL, 2, 2),
(11, 1, '184996', 'к Ярику домой', '2022-04-08', NULL, 2, 1),
(12, 1, '7544', 'уг Гагарина 7', '2022-04-09', NULL, 2, 2),
(13, 1, '2398', '', '2022-04-12', NULL, 1, 3),
(14, 1, '1549', 'уг Гагарина 7', '2022-04-13', NULL, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Заказ принят'),
(2, 'Ожидает выдачи'),
(3, 'В пути'),
(4, 'Доставлено'),
(5, 'Возврат');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `subcategory_id`) VALUES
(2, '3D ПЛИТЫ', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(3, 'Drain Face', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(4, 'GTA VICE CITY', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(5, 'Пивозавр', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(6, 'CS GO', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(7, 'КОТ ПРОГРАММИСТ', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(8, 'Футболка 7', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(9, 'Футболка 8', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(10, 'Футболка 9', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(11, 'Футболка 10', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(12, 'Футболка 11', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(13, 'Футболка 12', 'Футболка однотонная, в составе натуральный 100% хлопок, хлопок гипоаллергенный, не раздражает кожу и позволяет ей дышать. Футболка прямого кроя, с коротким рукавом и круглым воротом. За счет свободного кроя не сковывает движений и прекрасно подходит как для повседневной носки , так и для занятий спорта и отдыха. Швы у футболки качественно прошиты. Носите с удовольствием и комфортом.', '1199', 22),
(14, 'Monsters Rick and Morty', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(15, 'JINX NEON ARCANE', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(16, 'Slipknot People', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(17, 'ZXC SF', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(18, 'MARSHMELLO КРАСКИ', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(19, 'Инь Янь', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(20, 'Skull One Piece', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(21, 'FORTNITE x MARSHMELLO NEON', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(22, 'САКУРА | SAKURA | ВИШНЯ', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(23, 'Инверсия', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(24, 'Гачимучи Билли Херрингтон', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(25, 'NASA', 'Толстовка сшита из ткани с тонким мягким внутренним слоем. Свободная посадка по фигуре, капюшон, большой карман спереди, в который удобно прятать или греть руки. Сшита из гладкой синтетической ткани, с полным покрытием принтом.', '2490', 23),
(26, 'Billie Herrington', 'Круглый брелок из пластика, который можно прикрепить к рюкзаку или ключам. Изображение наносится с одной стороны.', '95', 31),
(27, 'Попугайчик', 'Квадратный брелок из пластика, который можно прикрепить к рюкзаку или ключам. Изображение наносится с одной стороны.', '95', 31),
(28, 'Эсканор', 'Квадратный брелок из пластика, который можно прикрепить к рюкзаку или ключам. Изображение наносится с одной стороны.', '95', 31),
(30, 'Brawl Stars CROW', 'Вместительный рюкзак в стиле унисекс, который подойдет для похода и в школу или университет, и в магазин за продуктами, а также для небольшого путешествия. Сделан из плотного текстиля, вся внешняя поверхность которого покрывается принтом, в том числе верхняя часть лямок.', '3090', 35),
(31, 'Marshmello Cosmos pattern', 'Вместительный рюкзак в стиле унисекс, который подойдет для похода и в школу или университет, и в магазин за продуктами, а также для небольшого путешествия. Сделан из плотного текстиля, вся внешняя поверхность которого покрывается принтом, в том числе верхняя часть лямок.', '3090', 35),
(32, 'Кот', 'Значок — аксессуар, который добавит вам индивидуальности. Его можно носить на одежде или приколоть на рюкзак. Можно сделать и со своим дизайном: от простой надписи на белом фоне до рисунка по всей поверхности значка.', '95', 32),
(33, 'Лёха', 'Значок — аксессуар, который добавит вам индивидуальности. Его можно носить на одежде или приколоть на рюкзак. Можно сделать и со своим дизайном: от простой надписи на белом фоне до рисунка по всей поверхности значка.', '95', 32),
(34, 'BRAWL STARS SPIKE', 'Кружка с принтом, который наносится по всей внешней поверхности, кроме прямоугольника у ручки. У кружки цветной ободок сверху и ручка.', '650', 34),
(35, 'Собака качок', 'Кружка с принтом, который наносится по всей внешней поверхности, кроме прямоугольника у ручки. У кружки цветной ободок сверху и ручка.', '650', 34);

-- --------------------------------------------------------

--
-- Структура таблицы `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`) VALUES
(3, 2, '1_1648787467.jpg'),
(4, 2, '2_1648787467.jpg'),
(5, 2, '3_1648787467.jpg'),
(8, 3, '1_1648787505.jpg'),
(9, 3, '2_1648787505.jpg'),
(10, 3, '3_1648787505.jpg'),
(11, 3, '4_1648787505.jpg'),
(12, 3, '5_1648787505.jpg'),
(13, 4, '1_1648787520.jpg'),
(14, 4, '2_1648787520.jpg'),
(15, 4, '3_1648787520.jpg'),
(16, 4, '4_1648787520.jpg'),
(17, 4, '5_1648787520.jpg'),
(18, 5, '1_1648787536.jpg'),
(19, 5, '2_1648787536.jpg'),
(20, 5, '3_1648787536.jpg'),
(21, 5, '4_1648787536.jpg'),
(22, 5, '5_1648787536.jpg'),
(23, 6, '1_1648787553.jpg'),
(24, 6, '2_1648787553.jpg'),
(25, 6, '3_1648787553.jpg'),
(26, 6, '4_1648787553.jpg'),
(27, 6, '5_1648787553.jpg'),
(28, 7, '1_1648787870.jpg'),
(29, 7, '2_1648787870.jpg'),
(30, 7, '3_1648787870.jpg'),
(31, 7, '4_1648787870.jpg'),
(32, 7, '5_1648787870.jpg'),
(33, 8, '1_1648788272.jpg'),
(34, 8, '2_1648788272.jpg'),
(35, 8, '3_1648788272.jpg'),
(36, 8, '4_1648788272.jpg'),
(37, 8, '5_1648788272.jpg'),
(38, 9, '1_1648788288.jpg'),
(39, 9, '2_1648788288.jpg'),
(40, 9, '3_1648788288.jpg'),
(41, 9, '4_1648788288.jpg'),
(42, 9, '5_1648788288.jpg'),
(43, 10, '1_1648788305.jpg'),
(44, 10, '2_1648788305.jpg'),
(45, 10, '3_1648788305.jpg'),
(46, 10, '4_1648788305.jpg'),
(47, 10, '5_1648788305.jpg'),
(48, 11, '1_1648788324.jpg'),
(49, 11, '2_1648788324.jpg'),
(50, 11, '3_1648788324.jpg'),
(51, 11, '4_1648788324.jpg'),
(52, 11, '5_1648788324.jpg'),
(53, 12, '1_1648878056.jpg'),
(54, 12, '2_1648878056.jpg'),
(55, 12, '3_1648878056.jpg'),
(56, 12, '4_1648878056.jpg'),
(57, 12, '5_1648878056.jpg'),
(58, 13, '1_1648886315.jpg'),
(59, 13, '2_1648886315.jpg'),
(60, 13, '3_1648886315.jpg'),
(61, 13, '4_1648886315.jpg'),
(62, 13, '5_1648886315.jpg'),
(63, 14, '1_1649429605.jpg'),
(64, 14, '2_1649429605.jpg'),
(65, 14, '3_1649429605.jpg'),
(66, 14, '4_1649429605.jpg'),
(67, 14, '5_1649429605.jpg'),
(68, 15, '1_1649775038.jpg'),
(69, 15, '2_1649775038.jpg'),
(70, 15, '3_1649775038.jpg'),
(71, 15, '4_1649775038.jpg'),
(72, 15, '5_1649775038.jpg'),
(73, 16, '1_1649775083.jpg'),
(74, 16, '2_1649775083.jpg'),
(75, 16, '3_1649775083.jpg'),
(76, 16, '4_1649775083.jpg'),
(77, 16, '5_1649775083.jpg'),
(78, 17, '1_1649775121.jpg'),
(79, 17, '2_1649775121.jpg'),
(80, 17, '3_1649775121.jpg'),
(81, 17, '4_1649775121.jpg'),
(82, 17, '5_1649775121.jpg'),
(83, 18, '1_1649775196.jpg'),
(84, 18, '2_1649775196.jpg'),
(85, 18, '3_1649775196.jpg'),
(86, 18, '4_1649775196.jpg'),
(87, 18, '5_1649775196.jpg'),
(88, 19, '1_1649775269.jpg'),
(89, 19, '2_1649775269.jpg'),
(90, 19, '3_1649775269.jpg'),
(91, 19, '4_1649775269.jpg'),
(92, 19, '5_1649775269.jpg'),
(93, 20, '1_1649775310.jpg'),
(94, 20, '2_1649775310.jpg'),
(95, 20, '3_1649775310.jpg'),
(96, 20, '4_1649775310.jpg'),
(97, 20, '5_1649775310.jpg'),
(98, 21, '1_1649775344.jpg'),
(99, 21, '2_1649775344.jpg'),
(100, 21, '3_1649775344.jpg'),
(101, 21, '4_1649775344.jpg'),
(102, 21, '5_1649775344.jpg'),
(103, 22, '1_1649775388.jpg'),
(104, 22, '2_1649775388.jpg'),
(105, 22, '3_1649775388.jpg'),
(106, 22, '4_1649775388.jpg'),
(107, 22, '5_1649775388.jpg'),
(108, 23, '1_1649775441.jpg'),
(109, 23, '2_1649775441.jpg'),
(110, 23, '3_1649775441.jpg'),
(111, 23, '4_1649775441.jpg'),
(112, 23, '5_1649775441.jpg'),
(113, 24, '1_1649775494.jpg'),
(114, 24, '2_1649775494.jpg'),
(115, 24, '3_1649775494.jpg'),
(116, 24, '4_1649775494.jpg'),
(117, 24, '5_1649775494.jpg'),
(118, 25, '1_1649775530.jpg'),
(119, 25, '2_1649775530.jpg'),
(120, 25, '3_1649775530.jpg'),
(121, 25, '4_1649775530.jpg'),
(122, 25, '5_1649775530.jpg'),
(123, 26, '1_1649779525.jpg'),
(124, 27, '1_1649779603.jpg'),
(125, 28, '1_1649779622.jpg'),
(134, 30, '1_1649779843.jpg'),
(135, 30, '2_1649779843.jpg'),
(136, 30, '3_1649779843.jpg'),
(137, 30, '4_1649779843.jpg'),
(138, 31, '1_1649779901.jpg'),
(139, 31, '2_1649779901.jpg'),
(140, 31, '3_1649779901.jpg'),
(141, 31, '4_1649779901.jpg'),
(142, 32, '1_1649780918.jpg'),
(143, 33, '1_1649780974.jpg'),
(144, 34, '1_1649781320.jpg'),
(145, 34, '2_1649781320.jpg'),
(146, 34, '3_1649781320.jpg'),
(147, 34, '4_1649781320.jpg'),
(148, 35, '1_1649781369.jpg'),
(149, 35, '2_1649781369.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `product_materials`
--

CREATE TABLE `product_materials` (
  `pr_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_materials`
--

INSERT INTO `product_materials` (`pr_id`, `product_id`, `material_id`, `value`) VALUES
(3, 13, 1, 100),
(4, 13, 2, 100),
(7, 2, 1, 100),
(8, 3, 1, 100),
(10, 14, 1, 100),
(11, 4, 1, 100),
(12, 5, 1, 100),
(13, 7, 1, 100),
(14, 6, 1, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `product_sizes`
--

CREATE TABLE `product_sizes` (
  `sz_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_sizes`
--

INSERT INTO `product_sizes` (`sz_id`, `product_id`, `size_id`, `count`) VALUES
(3, 13, 1, 111),
(4, 2, 1, 100),
(5, 3, 1, 11000),
(6, 3, 2, 100),
(7, 3, 3, 100),
(8, 3, 4, 100),
(9, 3, 5, 100),
(10, 3, 6, 100),
(11, 3, 7, 100),
(12, 14, 1, 100),
(13, 14, 2, 100),
(14, 14, 3, 100),
(15, 14, 4, 100),
(16, 14, 5, 100),
(17, 14, 6, 100),
(18, 14, 7, 100),
(19, 26, 8, 100),
(20, 27, 8, 100),
(21, 28, 8, 100),
(22, 32, 8, 100),
(23, 33, 8, 100),
(24, 30, 8, 100),
(25, 31, 8, 100),
(26, 34, 8, 100),
(27, 35, 8, 100),
(28, 2, 2, 100),
(29, 2, 3, 100),
(30, 2, 4, 100),
(31, 2, 5, 100),
(32, 2, 6, 100),
(33, 2, 7, 100),
(34, 4, 1, 100),
(35, 4, 2, 100),
(36, 4, 3, 100),
(37, 4, 4, 100),
(38, 4, 5, 100),
(39, 4, 6, 100),
(40, 4, 7, 100),
(41, 5, 1, 100),
(42, 5, 2, 100),
(43, 5, 3, 100),
(44, 5, 4, 100),
(45, 5, 5, 100),
(46, 5, 6, 100),
(47, 5, 7, 100),
(48, 7, 1, 100),
(49, 7, 2, 100),
(50, 7, 3, 100),
(51, 7, 4, 100),
(52, 7, 5, 100),
(53, 7, 6, 100),
(54, 7, 7, 100),
(55, 6, 1, 100),
(56, 6, 2, 100),
(57, 6, 3, 100),
(58, 6, 4, 100),
(59, 6, 5, 100),
(60, 6, 6, 100),
(61, 6, 7, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `review_images`
--

CREATE TABLE `review_images` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Пользователь'),
(2, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `percentages` int(11) NOT NULL,
  `beginning_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sizes`
--

INSERT INTO `sizes` (`id`, `value`) VALUES
(1, 'XXS'),
(2, 'XS'),
(3, 'S'),
(4, 'M'),
(5, 'L'),
(6, 'XL'),
(7, 'XXL'),
(8, 'One size');

-- --------------------------------------------------------

--
-- Структура таблицы `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `image`, `category_id`) VALUES
(22, 'Футболки', 'default.jpg', 34),
(23, 'Толстовки', 'default.jpg', 34),
(24, 'Худи', 'default.jpg', 34),
(25, 'Футболки', 'default.jpg', 35),
(26, 'Толстовки', 'default.jpg', 35),
(27, 'Худи', 'default.jpg', 35),
(28, 'Футболки', 'default.jpg', 36),
(29, 'Толстовки', 'default.jpg', 36),
(30, 'Худи', 'default.jpg', 36),
(31, 'Брелоки', 'default.jpg', 37),
(32, 'Значки', 'default.jpg', 37),
(33, 'Браслеты', 'default.jpg', 37),
(34, 'Кружки', 'default.jpg', 37),
(35, 'Рюкзаки', 'default.jpg', 37);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `phone_number`, `email`, `password`, `image`, `role_id`) VALUES
(1, 'Максим', 'Балдин', '+72909676923', 'eaglesmerch@gmail.com', '$2y$10$NZWQQS0c9cuSqLyPubFY/.LPHPGoF3pepKnhoF0/rZFu8gwtYf7ma', 'profile_image.jpg', 2),
(5, 'Алексей', 'Князев', '+79911471114', 'kaden77@mail.ru', '$2y$10$la/Sm5LeBMv9tyxD85mf5u3IR63QALcL6z5qzxLF2e2CZSt/O4QEK', 'profile_image.jpg', 1),
(6, 'Роман', 'Соколов', '+77309603615', 'colson@gmail.com', '$2y$10$21R6hyp/TpTmxN/W3KiT8.wWP5dFovyQL.kej1onyoKT5TKMnf446', 'profile_image.jpg', 1),
(7, 'Софья', 'Лапина', '+73060952039', 'queen82@gmail.com', '$2y$10$j1pVDdErjlfqRdL4JVz4Cuoh3l1xY5dD1.lqFL/ofVGElbmF/Cji.', 'profile_image.jpg', 1),
(8, 'Иван', 'Большаков', '+74903936458', 'chaim73@mail.ru', '$2y$10$WG7xy6LpvXwlQeaZUk12J.CIjXGb5Oc64d2tq4v3etiBy5zyzSgRW', 'profile_image.jpg', 1),
(9, 'Александра', 'Зубкова', '+74286081988', 'alda03@gmail.com', '$2y$10$yrx59MJG3/w1DKwENBeEruoB1QAdX6ESbjHk5sbdsdUNGkMvdb3sW', 'profile_image.jpg', 1),
(10, 'Василий', 'Левин', '+72314138320', 'elmer57@mail.ru', '$2y$10$CNtMVCDmhIa.2rUV/XzhROSy9lTc6EPIIgd5NFbKrZmnEwU1p5jbu', 'profile_image.jpg', 1),
(11, 'Ксения', 'Борисова', '+72143984854', 'jaylen35@gmail.com', '$2y$10$DidzK9baZDkJuuyPod3ThOLB8Jrhkc1EqarChICFaZUUtPXoIwgea', 'profile_image.jpg', 1),
(12, 'Никита', 'Данилов', '+79226041144', 'ukeeling@mail.ru', '$2y$10$eKZqaJQcQ9Xq121kCAzTz.NPSLAYbMzM7Tj2hwu.kW6Cii8ZN/6QS', 'profile_image.jpg', 1),
(13, 'Виктория', 'Коновалова', '+72954893377', 'era64@gmail.com', '$2y$10$NmAjt7zcHETR73tnfeSqfe6STkHj2K5zVrNhw54bgakwnkUi/OKLy', 'profile_image.jpg', 1),
(14, 'Кирилл', 'Виноградов', '+70783326128', 'ryder72@gmail.com', '$2y$10$m56xS2.Gfh5YTIK1iQMmMOpOBxXeojqxUdGE/u1BkOus/axI9HkX.', 'profile_image.jpg', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `delivery_id` (`delivery_id`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Индексы таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `product_materials`
--
ALTER TABLE `product_materials`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Индексы таблицы `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`sz_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `review_images`
--
ALTER TABLE `review_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT для таблицы `product_materials`
--
ALTER TABLE `product_materials`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `sz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordered_products_ibfk_3` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_materials`
--
ALTER TABLE `product_materials`
  ADD CONSTRAINT `product_materials_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_materials_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sizes_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `review_images`
--
ALTER TABLE `review_images`
  ADD CONSTRAINT `review_images_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
