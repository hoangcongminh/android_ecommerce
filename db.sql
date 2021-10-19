SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `markeet_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_version`
--
CREATE TABLE `app_version` (
  `id` bigint(20) NOT NULL,
  `version_code` int(11) NOT NULL,
  `version_name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_version`
--

INSERT INTO `app_version` (`id`, `version_code`, `version_name`, `active`, `created_at`, `last_update`) VALUES
(1, 1, '1', 1, 1629988842993, 1629988842993);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `brief` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `icon`, `draft`, `brief`, `color`, `priority`, `created_at`, `last_update`) VALUES
(1, N'Điện thoại', 'phone.png', 0, N'Điện thoại di động, Smartphone chính hãng.', '#ff6f52', 1, 1629988842993, 1629988842993),
(2, N'Máy ảnh', 'camera.png', 0, N'Máy ảnh DSLR, Máy ảnh không gương lật, Máy ảnh du lịch.', '#8ddd6f', 2, 1629988842993, 1629988842993);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `code` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`code`, `value`) VALUES
('CURRENCY', 'VND'),
('FEATURED_NEWS', '5'),
('SHIPPING', '["GRAB","NOW","LOSHIP"]'),
('TAX', '11'), 
('EMAIL_NOTIF_ON_ORDER', 'TRUE'),
('EMAIL_NOTIF_ON_ORDER_PROCESS', 'TRUE'),
('EMAIL_SENDER', 'your.email@domain.com'),
('EMAIL_SENDER_PASS', 'xxxxxx'),
('EMAIL_REPLY_TO', 'email.address@domain.com'),
('EMAIL_BCC_RECEIVER', '["admin1@domain.com","admin2@domain.com"]');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `code`, `name`) VALUES
(1, 'AFA', 'Afghanistan afghani'),
(2, 'ALL', 'Albanian lek'),
(3, 'DZD', 'Algerian dinar'),
(4, 'AOR', 'Angolan kwanza reajustado'),
(5, 'ARS', 'Argentine peso'),
(6, 'AMD', 'Armenian dram'),
(7, 'AWG', 'Aruban guilder'),
(8, 'AUD', 'Australian dollar'),
(9, 'AZN', 'Azerbaijanian new manat'),
(10, 'BSD', 'Bahamian dollar'),
(11, 'BHD', 'Bahraini dinar'),
(12, 'BDT', 'Bangladeshi taka'),
(13, 'BBD', 'Barbados dollar'),
(14, 'BYN', 'Belarusian ruble'),
(15, 'BZD', 'Belize dollar'),
(16, 'BMD', 'Bermudian dollar'),
(17, 'BTN', 'Bhutan ngultrum'),
(18, 'BOB', 'Bolivian boliviano'),
(19, 'BWP', 'Botswana pula'),
(20, 'BRL', 'Brazilian real'),
(21, 'GBP', 'British pound'),
(22, 'BND', 'Brunei dollar'),
(23, 'BGN', 'Bulgarian lev'),
(24, 'BIF', 'Burundi franc'),
(25, 'KHR', 'Cambodian riel'),
(26, 'CAD', 'Canadian dollar'),
(27, 'CVE', 'Cape Verde escudo'),
(28, 'KYD', 'Cayman Islands dollar'),
(29, 'XOF', 'CFA franc BCEAO'),
(30, 'XAF', 'CFA franc BEAC'),
(31, 'XPF', 'CFP franc'),
(32, 'CLP', 'Chilean peso'),
(33, 'CNY', 'Chinese yuan renminbi'),
(34, 'COP', 'Colombian peso'),
(35, 'KMF', 'Comoros franc'),
(36, 'CDF', 'Congolese franc'),
(37, 'CRC', 'Costa Rican colon'),
(38, 'HRK', 'Croatian kuna'),
(39, 'CUP', 'Cuban peso'),
(40, 'CZK', 'Czech koruna'),
(41, 'DKK', 'Danish krone'),
(42, 'DJF', 'Djibouti franc'),
(43, 'DOP', 'Dominican peso'),
(44, 'XCD', 'East Caribbean dollar'),
(45, 'EGP', 'Egyptian pound'),
(46, 'SVC', 'El Salvador colon'),
(47, 'ERN', 'Eritrean nakfa'),
(48, 'EEK', 'Estonian kroon'),
(49, 'ETB', 'Ethiopian birr'),
(50, 'EUR', 'EU euro'),
(51, 'FKP', 'Falkland Islands pound'),
(52, 'FJD', 'Fiji dollar'),
(53, 'GMD', 'Gambian dalasi'),
(54, 'GEL', 'Georgian lari'),
(55, 'GHS', 'Ghanaian new cedi'),
(56, 'GIP', 'Gibraltar pound'),
(57, 'XAU', 'Gold (ounce)'),
(58, 'XFO', 'Gold franc'),
(59, 'GTQ', 'Guatemalan quetzal'),
(60, 'GNF', 'Guinean franc'),
(61, 'GYD', 'Guyana dollar'),
(62, 'HTG', 'Haitian gourde'),
(63, 'HNL', 'Honduran lempira'),
(64, 'HKD', 'Hong Kong SAR dollar'),
(65, 'HUF', 'Hungarian forint'),
(66, 'ISK', 'Icelandic krona'),
(67, 'XDR', 'IMF special drawing right'),
(68, 'INR', 'Indian rupee'),
(69, 'IDR', 'Indonesian rupiah'),
(70, 'IRR', 'Iranian rial'),
(71, 'IQD', 'Iraqi dinar'),
(72, 'ILS', 'Israeli new shekel'),
(73, 'JMD', 'Jamaican dollar'),
(74, 'JPY', 'Japanese yen'),
(75, 'JOD', 'Jordanian dinar'),
(76, 'KZT', 'Kazakh tenge'),
(77, 'KES', 'Kenyan shilling'),
(78, 'KWD', 'Kuwaiti dinar'),
(79, 'KGS', 'Kyrgyz som'),
(80, 'LAK', 'Lao kip'),
(81, 'LVL', 'Latvian lats'),
(82, 'LBP', 'Lebanese pound'),
(83, 'LSL', 'Lesotho loti'),
(84, 'LRD', 'Liberian dollar'),
(85, 'LYD', 'Libyan dinar'),
(86, 'LTL', 'Lithuanian litas'),
(87, 'MOP', 'Macao SAR pataca'),
(88, 'MKD', 'Macedonian denar'),
(89, 'MGA', 'Malagasy ariary'),
(90, 'MWK', 'Malawi kwacha'),
(91, 'MYR', 'Malaysian ringgit'),
(92, 'MVR', 'Maldivian rufiyaa'),
(93, 'MRO', 'Mauritanian ouguiya'),
(94, 'MUR', 'Mauritius rupee'),
(95, 'MXN', 'Mexican peso'),
(96, 'MDL', 'Moldovan leu'),
(97, 'MNT', 'Mongolian tugrik'),
(98, 'MAD', 'Moroccan dirham'),
(99, 'MZN', 'Mozambique new metical'),
(100, 'MMK', 'Myanmar kyat'),
(101, 'NAD', 'Namibian dollar'),
(102, 'NPR', 'Nepalese rupee'),
(103, 'ANG', 'Netherlands Antillian guilder'),
(104, 'NZD', 'New Zealand dollar'),
(105, 'NIO', 'Nicaraguan cordoba oro'),
(106, 'NGN', 'Nigerian naira'),
(107, 'KPW', 'North Korean won'),
(108, 'NOK', 'Norwegian krone'),
(109, 'OMR', 'Omani rial'),
(110, 'PKR', 'Pakistani rupee'),
(111, 'XPD', 'Palladium (ounce)'),
(112, 'PAB', 'Panamanian balboa'),
(113, 'PGK', 'Papua New Guinea kina'),
(114, 'PYG', 'Paraguayan guarani'),
(115, 'PEN', 'Peruvian nuevo sol'),
(116, 'PHP', 'Philippine peso'),
(117, 'XPT', 'Platinum (ounce)'),
(118, 'PLN', 'Polish zloty'),
(119, 'QAR', 'Qatari rial'),
(120, 'RON', 'Romanian new leu'),
(121, 'RUB', 'Russian ruble'),
(122, 'RWF', 'Rwandan franc'),
(123, 'SHP', 'Saint Helena pound'),
(124, 'WST', 'Samoan tala'),
(125, 'STD', 'Sao Tome and Principe dobra'),
(126, 'SAR', 'Saudi riyal'),
(127, 'RSD', 'Serbian dinar'),
(128, 'SCR', 'Seychelles rupee'),
(129, 'SLL', 'Sierra Leone leone'),
(130, 'XAG', 'Silver (ounce)'),
(131, 'SGD', 'Singapore dollar'),
(132, 'SBD', 'Solomon Islands dollar'),
(133, 'SOS', 'Somali shilling'),
(134, 'ZAR', 'South African rand'),
(135, 'KRW', 'South Korean won'),
(136, 'LKR', 'Sri Lanka rupee'),
(137, 'SDG', 'Sudanese pound'),
(138, 'SRD', 'Suriname dollar'),
(139, 'SZL', 'Swaziland lilangeni'),
(140, 'SEK', 'Swedish krona'),
(141, 'CHF', 'Swiss franc'),
(142, 'SYP', 'Syrian pound'),
(143, 'TWD', 'Taiwan New dollar'),
(144, 'TJS', 'Tajik somoni'),
(145, 'TZS', 'Tanzanian shilling'),
(146, 'THB', 'Thai baht'),
(147, 'TOP', 'Tongan paanga'),
(148, 'TTD', 'Trinidad and Tobago dollar'),
(149, 'TND', 'Tunisian dinar'),
(150, 'TRY', 'Turkish lira'),
(151, 'TMT', 'Turkmen new manat'),
(152, 'AED', 'UAE dirham'),
(153, 'UGX', 'Uganda new shilling'),
(154, 'XFU', 'UIC franc'),
(155, 'UAH', 'Ukrainian hryvnia'),
(156, 'UYU', 'Uruguayan peso uruguayo'),
(157, 'USD', 'US dollar'),
(158, 'UZS', 'Uzbekistani sum'),
(159, 'VUV', 'Vanuatu vatu'),
(160, 'VEF', 'Venezuelan bolivar fuerte'),
(161, 'VND', 'Vietnamese dong'),
(162, 'YER', 'Yemeni rial'),
(163, 'ZMK', 'Zambian kwacha'),
(164, 'ZWL', 'Zimbabwe dollar');

-- --------------------------------------------------------

--
-- Table structure for table `fcm`
--

CREATE TABLE `fcm` (
  `id` bigint(20) NOT NULL,
  `device` varchar(100) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `app_version` varchar(10) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `regid` text NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fcm`
--
-- --------------------------------------------------------

--
-- Table structure for table `news_info`
--

CREATE TABLE `news_info` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `brief_content` varchar(200) NOT NULL,
  `full_content` text NOT NULL,
  `image` varchar(110) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_info`
--

INSERT INTO `news_info` (`id`, `title`, `brief_content`, `full_content`, `image`, `draft`, `status`, `created_at`, `last_update`) VALUES
(1, N'Fujifilm ra mắt GFX50S II - máy ảnh medium format rẻ nhất từ trước đến nay, giới thiệu X-T30 II và X-T3 WW', N'Fujifilm GFX50S II dự kiến sẽ có mặt trên thị trường vào cuối tháng 10.', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec scelerisque urna ut metus sagittis, vel congue lorem iaculis. Sed hendrerit mauris id tempor faucibus. In facilisis nibh vulputate ante porttitor, et venenatis arcu placerat. Vestibulum tempor nisi enim, eget consectetur ex accumsan fermentum. Mauris ipsum lacus, imperdiet eget purus vel, convallis euismod augue. In sed fringilla sem. Aenean ultricies ullamcorper euismod.</div><div><br></div><div>Cras non nunc est. Nunc quis dapibus lorem. Proin dignissim interdum interdum. In vitae aliquet odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non venenatis nunc, id molestie velit. Vestibulum sagittis dui at nibh lacinia faucibus. Curabitur auctor sem diam. Aenean eu libero eget lorem tincidunt eleifend. Integer in diam felis.</div><div><br></div><div>Aliquam sed lorem quis urna eleifend aliquam ac ut urna. Sed tempus nisl tellus, vel tempor velit rutrum ac. Ut facilisis eget augue quis pulvinar. Nam a felis eu tortor convallis dapibus efficitur vel turpis. Etiam hendrerit pulvinar leo ac venenatis. Donec non felis et massa semper convallis nec id augue. Proin sit amet mollis nisl. Sed vestibulum auctor imperdiet. Nam ut enim non lacus blandit rhoncus non at turpis. Donec vel arcu malesuada, vulputate dui a, varius leo. Proin volutpat libero ultricies est auctor, eget facilisis ligula accumsan. Sed quis sapien hendrerit, luctus augue nec, aliquam urna. Mauris vestibulum convallis malesuada. Sed et ex cursus, fringilla tellus ac, maximus ipsum.</div>', 'news1.jpg', 0, N'NỔI BẬT', 1629988842993, 1629988842993),
(2, N'Apple Watch Series 7 sẽ có màn hình lớn hơn, đẹp hơn', N'Kích thước màn hình của Apple Watch Series 7 tăng lên 1.9 inch, độ phân giải theo đó cũng được cải thiện.', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec scelerisque urna ut metus sagittis, vel congue lorem iaculis. Sed hendrerit mauris id tempor faucibus. In facilisis nibh vulputate ante porttitor, et venenatis arcu placerat. Vestibulum tempor nisi enim, eget consectetur ex accumsan fermentum. Mauris ipsum lacus, imperdiet eget purus vel, convallis euismod augue. In sed fringilla sem. Aenean ultricies ullamcorper euismod.</div><div><br></div><div>Cras non nunc est. Nunc quis dapibus lorem. Proin dignissim interdum interdum. In vitae aliquet odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam non venenatis nunc, id molestie velit. Vestibulum sagittis dui at nibh lacinia faucibus. Curabitur auctor sem diam. Aenean eu libero eget lorem tincidunt eleifend. Integer in diam felis.</div><div><br></div><div>Aliquam sed lorem quis urna eleifend aliquam ac ut urna. Sed tempus nisl tellus, vel tempor velit rutrum ac. Ut facilisis eget augue quis pulvinar. Nam a felis eu tortor convallis dapibus efficitur vel turpis. Etiam hendrerit pulvinar leo ac venenatis. Donec non felis et massa semper convallis nec id augue. Proin sit amet mollis nisl. Sed vestibulum auctor imperdiet. Nam ut enim non lacus blandit rhoncus non at turpis. Donec vel arcu malesuada, vulputate dui a, varius leo. Proin volutpat libero ultricies est auctor, eget facilisis ligula accumsan. Sed quis sapien hendrerit, luctus augue nec, aliquam urna. Mauris vestibulum convallis malesuada. Sed et ex cursus, fringilla tellus ac, maximus ipsum.</div>', 'news2.jpg', 0, 'NỔI BẬT', 1629988842993, 1629988842993),
(3, N'Các chuyên gia dự đoán giá TV sẽ giảm trước cuối năm nay sau hơn nửa năm tăng giá mạnh', N'Tình hình cung ứng tấm nền được cải thiện hứa hẹn sẽ giúp giá TV của nhiều thương hiệu “hạ nhiệt” dần vào cuối năm nay.', '<div>Cras in dapibus ligula. Vestibulum elementum ante at sapien consectetur porta. Nulla laoreet mauris a orci posuere eleifend. Duis dictum nisl scelerisque lectus tincidunt, id tristique lorem eleifend. Curabitur nibh risus, commodo in consequat eget, consectetur vel tellus. Suspendisse dignissim, lorem ut luctus congue, mi justo lobortis ex, non suscipit est est id urna. Ut eget tortor accumsan, consectetur justo sit amet, tincidunt enim.</div><div><br></div><div>Proin efficitur justo eget tempus vulputate. Nunc viverra felis tortor, a porttitor tortor vehicula dictum. Nam quis sapien nec tellus ultricies dictum. Praesent vulputate dolor sed nisl consectetur, vel varius dui suscipit. Maecenas vulputate ligula a sem sollicitudin viverra. In a libero viverra, eleifend nisi vitae, vehicula arcu. Donec sagittis sem sit amet nulla aliquam, a convallis risus ultricies. Praesent tristique magna odio, a dictum felis hendrerit quis.</div>', 'news3.jpg', 0, 'THÔNG THƯỜNG', 1629988842993, 1629988842993);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(110) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `price_discount` DECIMAL(12,2) NOT NULL DEFAULT '0',
  `stock` int(10) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `stock`, `draft`, `description`, `status`, `created_at`, `last_update`) VALUES
(1, N'Điện Thoại iPhone 12 Pro Max 128GB', '12promax.jpg', '28450000.00', 90, 0, '<div>Hàng chính hãng VN/A
Bộ nhớ trong 128 GB
Loại SIM Dual SIM (nano‑SIM and eSIM)
Loại màn hình Super Retina XDR OLED, HDR10, Dolby Vision, Wide color gamut, True-tone
Kích thước màn hình 6.7 inches
Độ phân giải màn hình 1284 x 2778 pixels
Hệ điều hành iOS
Phiên bản hệ điều hành iOS 14<h5>Điện Thoại iPhone 12 Pro Max</h5>
<p>iPhone 12 Pro Max. Mạng 5G siêu nhanh.<sup>1</sup> A14 Bionic, chip nhanh nhất trên điện thoại thông minh. Hệ thống camera chuyên nghiệp cho ảnh chụp tuyệt đẹp trong điều kiện ánh sáng yếu. Cùng với màn hình Super Retina XDR lớn hơn. Một bước tiến nhảy vọt.</p>
<h5>Nội dung về tính năng</h5>
<p>iPhone 12 Pro Max. Mạng 5G giúp tải xuống các tập tin có dung lượng lớn khi đang di chuyển và xem trực tuyến video HDR.<sup>1</sup> Màn hình Super Retina XDR 6.7 inch lớn hơn.<sup>2</sup> Ceramic Shield với khả năng chịu va đập khi rơi tốt hơn gấp 4 lần.<sup>3</sup> Ảnh chụp tuyệt đẹp trong điều kiện ánh sáng yếu với hệ thống camera chuyên nghiệp tốt nhất trên một chiếc iPhone cùng phạm vi thu phóng quang học 5x. Quay phim, biên tập và phát video Dolby Vision đẳng cấp điện ảnh. Chụp ảnh chân dung ở chế độ Ban Đêm và trải nghiệm thực tế ảo tăng cường đẳng cấp mới với LiDAR Scanner. Chip A14 Bionic mạnh mẽ. Tính năng vô vàn, khả năng vô hạn.</p>
<h5>Tính năng nổi bật</h5>
<ul>
<li>Màn hình Super Retina XDR 6.7 inch<sup>2</sup></li>
<li>Ceramic Shield, chất liệu kính bền chắc nhất từng có trên điện thoại thông minh</li>
<li>Mạng 5G cho tốc độ tải xuống siêu nhanh, xem video và nghe nhạc trực tuyến chất lượng cao<sup>1</sup></li>
<li>A14 Bionic, chip nhanh nhất từng có trên điện thoại thông minh</li>
<li>Hệ thống camera chuyên nghiệp 12MP với camera Ultra Wide, Wide và Telephoto; phạm vi thu phóng quang học 5x; chế độ Ban Đêm, Deep Fusion, HDR thông minh thế hệ 3, Apple ProRAW, và khả năng quay video HDR Dolby Vision 4K</li>
<li>LiDAR Scanner cải thiện trải nghiệm thực tế ảo tăng cường và chụp ảnh chân dung ở chế độ Ban Đêm</li>
<li>Camera trước TrueDepth 12MP với chế độ Ban Đêm và khả năng quay video HDR Dolby Vision 4K</li>
<li>Khả năng chống nước đạt chuẩn IP68 đứng đầu thị trường<sup>4</sup></li>
<li>iOS 14 với các tiện ích được thiết kế lại trên Màn Hình Chính, Thư Viện Ứng Dụng hoàn toàn mới, App Clips cùng nhiều tính năng khác</li>
</ul>
<h5>Pháp lý</h5>
<p><sup>1</sup>Cần có gói cước dữ liệu. Mạng 5G chỉ khả dụng ở một số thị trường và được cung cấp qua một số nhà mạng.&nbsp;Tốc độ có thể thay đổi tùy địa điểm và nhà mạng.&nbsp;<a href="http://apple.com/iphone/cellular">Để biết thông tin về hỗ trợ mạng 5G, vui lòng liên hệ nhà mạng và truy cập apple.com/iphone/cellular</a>.</p>
<p><sup>2</sup>Màn hình có các góc bo tròn. Khi tính theo hình chữ nhật, kích thước màn hình là 6.68 inch theo đường chéo. Diện tích hiển thị thực tế nhỏ hơn.</p>
<p><sup>3</sup>Xác nhận dựa vào mặt trước có Ceramic Shield của iPhone 12 Pro Max so với iPhone thế hệ trước.</p>
<p><sup>4</sup>iPhone 12 Pro Max có khả năng chống tia nước, chống nước và chống bụi. Sản phẩm đã qua kiểm nghiệm trong điều kiện phòng thí nghiệm có kiểm soát đạt mức IP68 theo tiêu chuẩn IEC 60529 (chống nước ở độ sâu tối đa 6 mét trong vòng tối đa 30 phút). Khả năng chống tia nước, chống nước và chống bụi không phải là các điều kiện vĩnh viễn. Khả năng này có thể giảm do hao mòn thông thường. Không sạc pin khi iPhone đang bị ướt. Vui lòng tham khảo hướng dẫn sử dụng để biết cách lau sạch và làm khô máy. Không bảo hành sản phẩm bị hỏng do thấm chất lỏng.</p>
<h5><strong>Thông số kỹ thuật</strong></h5>
<p>Truy cập <a href="https://www.apple.com/iphone/compare/">apple.com/iphone/compare</a> để xem cấu hình đầy đủ.</p></div>', N'CÓ HÀNG', 1629988842993, 1629988842993),
(2, N'Điện thoại Samsung Galaxy A32', 'samsunga32.jpg', '5599000.00', 90, 0, N'<div><h3>samsung galaxy A32 4G &nbsp;thuộc phân khúc tầm trung nhưng sở hữu nhiều ưu điểm vượt trội về màn hình lớn sắc nét, bộ bốn camera 64 MP cùng vi xử lý hiệu năng cao và được bán ra với mức giá vô cùng tốt.</h3>
<h3>Thiết kế thời thượng cùng màu sắc bắt mắt</h3>
<p style="font-weight: 400;">Samsung Galaxy A32 4G có mặt lưng nhựa cao cấp với thiết kế đơn giản, trang nhã, không chỉ giúp bảo vệ máy mà còn tăng độ bóng bẩy cho smartphone, mang đến vẻ ngoài đẳng cấp cho người sở hữu.</p>
<p style="font-weight: 400;">Tổng kích thước thân máy mỏng chỉ 8.4 mm và có trọng lượng 184 g, hai cạnh bên cũng được vát cong nhẹ nhàng nên việc cầm nắm cũng chắc chắn hơn và thuận tiện cho mọi tác vụ</p>
<p style="font-weight: 400;">Samsung Galaxy A32 4G cũng đem đến nhiều màu sắc để bạn có thể thoải mái lựa chọn theo sở thích của riêng mình.</p></div>', N'CÓ HÀNG', 1629988842993, 1629988842993),
(3, N'Máy Ảnh Canon Powershot G7X Mark II', 'canong7x.jpg', '12243700.00', 90, 0, '<div>Cảm biến CMOS Sensor 20MP
Màn hình LCD cảm ứng
Kết nối Wi-Fi, NFC, Bluetooth 
Chống rung Dynamic IS, Time-Lapse
Khẩu độ f/1.8 - f/2.8<p style="text-align: justify;"><strong>Thiết kế nhỏ gọn</strong></p>
<p style="text-align: justify;"><strong>Máy Ảnh Canon Powershot G7X Mark II</strong> là dòng máy ảnh du lịch với thiết kế vô cùng nhỏ gọn, có thể nằm gọn trong lòng bàn tay, cho phép bạn bỏ vào túi trong những lúc di chuyển. Chiếc máy ảnh là sự kết hợp giữa những đường nét sắc cạnh, bổ sung thêm báng cầm giúp người sử dụng cầm chắc tay hơn.</p>
<p style="text-align: justify;"><strong>Cảm biến CMOS 1 inch 20MP </strong></p>
<p style="text-align: justify;">Máy được trang bị cảm biến hình ảnh DIGIC 7 không chỉ cải thiện khả năng chụp ảnh trong điều kiện thiếu sáng mà còn giúp tạo độ tương phản tự nhiên đối với các cảnh chụp ngược sáng cũng như tạo độ phân giải cao cho bức ảnh. Chức năng lấy nét tự động được cải tiến hiệu quả theo dõi đối tượng và cho phép chụp các đối tượng quan trọng một cách chính xác hơn.</p>
<p style="text-align: justify;">&nbsp;</p>
<p style="text-align: justify;"><strong>Màn hình LCD cảm ứng 3.0 inch </strong></p>
<p style="text-align: justify;">Với màn hình LCD rộng 3 inch có tính năng cảm ứng, bạn chỉ việc chạm tay và nhanh chóng tùy chỉnh các thông số hay chụp ảnh ngay trên màn hình. Hơn thế nữa, độ phân giải 1.04 triệu điểm ảnh của LCD cũng giúp việc hiển thị hình ảnh khá tốt, giảm thiểu tối đa hiện tượng chói sáng khó chịu. Ngoài khả năng nghiêng lên bình thường 180°, nó còn có thể nghiêng xuống 45° giúp bạn dễ dàng chụp những bức ảnh ở góc hẹp mà một chiếc máy ảnh thường không làm được.</p>
<p style="text-align: justify;">&nbsp;</p>
<p style="text-align: justify;"><strong>Quay phim full HD </strong></p>
<p style="text-align: justify;">Canon Powershot G7X Mark II có khả năng quay phim Full HD 60p/50p, tích hợp tính năng quay phim Time-lapse tự động, khả năng xử lý ảnh RAW trực tiếp ngay trên màn hình máy ảnh. Công nghệ ổn định hình ảnh Intelligent IS được cải tiến với khả năng chụp ảnh chuyển động theo dạng panning, dễ dàng khoá chủ thể chuyển động giúp người dùng dễ dàng tạo bức ảnh panning tốt hơn.</p>
<p style="text-align: justify;">&nbsp;</p>
<p style="text-align: justify;"><strong>Điều khiển từ xa, chia sẻ nhanh chóng </strong></p>
<p style="text-align: justify;">Để phù hợp với xu thế hiện đại, tính năng Wi-fi được trang bị sẵn trên Canon Powershot G7X Mark II giúp người dùng kết nối với smartphone, laptop, máy tính bảng…. để chia sẻ ảnh nhanh chóng cũng như có thể điều khiển các hoạt động của máy từ xa một cách dễ dàng.</p></div>', N'CÓ HÀNG', 1629988842993, 1629988842993);
-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `shipping` varchar(20) NOT NULL,
  `date_ship` bigint(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_fees` decimal(12,2) NOT NULL,
  `tax` decimal(12,2) NOT NULL,
  `serial` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_order_detail`
--

CREATE TABLE `product_order_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `price_item` decimal(12,2) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'User Markeet', 'user_markeet', 'user@mail.com', 'ee11cbb19052e40b07aac0ca060c23ee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_version`
--
ALTER TABLE `app_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`name`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fcm`
--
ALTER TABLE `fcm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_info`
--
ALTER TABLE `news_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_unique_name` (`name`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD KEY `fk_product_category_1` (`product_id`),
  ADD KEY `fk_product_category_2` (`category_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD KEY `fk_table_images` (`product_id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table_orders_item` (`order_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_version`
--
ALTER TABLE `app_version`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;
--
-- AUTO_INCREMENT for table `fcm`
--
ALTER TABLE `fcm`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `news_info`
--
ALTER TABLE `news_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_product_category_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_category_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_table_images` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  ADD CONSTRAINT `fk_table_orders_item` FOREIGN KEY (`order_id`) REFERENCES `product_order` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
