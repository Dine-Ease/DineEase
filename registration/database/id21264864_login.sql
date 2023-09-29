-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2023 at 12:28 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21264864_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `variation_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `client_ip` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `variation_id`, `quantity`, `price`, `client_ip`, `product_id`) VALUES
(10, NULL, NULL, NULL, NULL, '2402:4000:20c1:8a95:148a:b4be:ab75:a4cc', 27),
(11, NULL, NULL, NULL, NULL, '175.157.15.206', 28),
(12, NULL, NULL, NULL, NULL, '2402:4000:21c1:f052:c8af:77e9:dd1b:93b', 28),
(28, NULL, NULL, 1, NULL, '2402:4000:21c1:f052:61be:af3b:5516:1477', 27),
(29, NULL, NULL, 1, NULL, '2402:4000:21c1:f052:61be:af3b:5516:1477', 27),
(30, NULL, NULL, 1, NULL, '2402:4000:21c1:f052:555a:2367:8db1:2601', 28),
(39, NULL, NULL, 1, NULL, '209.97.175.120', 27);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `email`) VALUES
(29, 'idk', 'tdbtharuka@gmail.com'),
(30, 'Pizza', 'thadithathegreatest@gmail.com'),
(33, 'UNP', 'tdbtharuka@gmail.com'),
(34, 'sdfghj', 'thadithathegreatest@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delivered_to` varchar(150) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `deliver_address` varchar(255) NOT NULL,
  `pay_method` varchar(50) NOT NULL,
  `pay_status` int(11) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `order_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `uploaded_date` date NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  `restaurant_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_desc`, `product_image`, `price`, `category_id`, `uploaded_date`, `email`, `restaurant_name`) VALUES
(27, 'Coca Cola', 'This is a refreshing coca cola', 'uploads/drink.png', 1234, 29, '2023-09-22', 'tdbtharuka@gmail.com', 'Pizza Hut'),
(28, 'Pepsi', 'This is a refreshing Pepsi', 'uploads/pepsi-transparent-pic-5.png', 4567, 29, '2023-09-22', 'tdbtharuka@gmail.com', 'Pizza Hut'),
(31, 'Aquinas', 'Yummy', 'uploads/download.jpeg', 1000, 30, '2023-09-23', 'thadithathegreatest@gmail.com', 'Cafe The Vibe'),
(33, 'qwert', 'Yummy', 'uploads/download.jpeg', 7410, 34, '2023-09-23', 'thadithathegreatest@gmail.com', 'Cafe The Vibe'),
(35, 'Aquinas', '1', 'uploads/mlk.png', 12, 33, '2023-09-23', 'tdbtharuka@gmail.com', 'Pizza Hut');

-- --------------------------------------------------------

--
-- Table structure for table `product_size_variation`
--

CREATE TABLE `product_size_variation` (
  `variation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_size_variation`
--

INSERT INTO `product_size_variation` (`variation_id`, `product_id`, `size_id`, `quantity_in_stock`, `email`) VALUES
(14, 27, 10, 99, 'tdbtharuka@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `contact_no` varchar(255) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `profile_image` longblob DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`contact_no`, `address_line1`, `address_line2`, `city`, `zipcode`, `id`, `name`, `profile_image`, `email`) VALUES
('07111111111', '151/20 Illukmodara Tennekumbura', '1', 'Kandy', '20000', 74, 'Cafe The Vibe', NULL, 'thadithathegreatest@gmail.com'),
('0716942001', '151/20 Illukmodara Tennekumbura', '1', 'Kandy', '20000', 75, 'Pizza Hut', NULL, 'tdbtharuka@gmail.com'),
('911', '2nd lane next to the subway, Ohio', '', 'Just a few miles north', '669', 76, 'big burgers for CHEAP!!!!', NULL, '4rizonxd2007@gmail.com');
INSERT INTO `restaurants` (`contact_no`, `address_line1`, `address_line2`, `city`, `zipcode`, `id`, `name`, `profile_image`, `email`) VALUES
INSERT INTO `restaurants` (`contact_no`, `address_line1`, `address_line2`, `city`, `zipcode`, `id`, `name`, `profile_image`, `email`) VALUES
('0771128140', '468/5D', 'Gohagoda Rd, Katugastota', 'Kandy', '20000', 105, 'Aquinas Villa', 0x89504e470d0a1a0a0000000d4948445200000094000000420806000000b15bffe6000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa86400002e8649444154785eed7df77f94c7b9fd6abb56bdf72ed491846842020910a20a505f153a36601bb06307f7123b76ecd8376e71893bbdd93737d7dfc4761c1bb04d75eeff74bee7ccec2badc40a03c125f9f0c3f9ec6af79d99679ee7cc53e69d77e5aaa89a8582a24264e7e52235351559c929b86feb723c7177175213fcf0783d88f379e10bf8119f1042496929d2d23311e7f1c0e572c11567e1f57b50595981f8f820e2dc2e783c71fcbb1cc9490970f3bab8c8b5fa4ed7666667a0b0a4d0bc26a52421140a211008b09d076eb77b0271717113d0df3e9f0fe9e9e9c8cccc9c4046869061909d9d8ddada5aca116fe58b82ae2da5fc1aabbaba1a816060427e7daf31a483929212242626c2eff723400489f86010a9692928ab28414272227cfa8ef2a6a4a4208fba2b29294261613eaf0b20272b1b39d939662e66ecc81892bdaeae0e41f6a5b1246329c7ca484b87d7eb9d98a78b3a72fbdc484d4f41497931e243f113df4d85f443fbe83ddb082e37db4bcf575d2b38d74fc7543dff10a26de38ec0f9ce554e1224a7a522373f1f0df53558dd31172f3dbe1d432b6b909f934e23a59340e9e6fbaa9a1ae415149010410aee9e340627e20b785151514665f9399825545151017272b23860845051caf5f2fad40c1aafbc04b5f5b546d1f5f5f546d98ec08ed0d190111a1a1a505c5c3c81a2a2a2091416161a23abad432407393939e67a11457d04497e2b0f15c1efd5bfdae93a9152c4cacfcb430151595161164c4a4ab2355a54bf1e8f1bb979d9246b3142ec333b330bd924d55442c519423973d4e76eb707e9a96968a8ab2711e32748257d1ab05d6e412e727273cc7757ebc32108dff3fa9f8350d3e10a71257afc3e78e8859212bc58d6928fbb37af405375260a8b7350904f85e6e623830a0a86e86dbc3e0a4c45a9b1a3509f8784cb416e6e36952601ede729f43c35d5b3e0a3c2f5998836a1600f27eda5703ec2eb36ca773c4b2c4105b54d4848400d89adeb1d38138c9ea8239b037d366bd62ca4a5a519e3882cb9248a3140c408ce75ea53a4932794a7c9a207d4b83eeac8cdb9d8eb27c708d22b55555752f6003d9a0f7924645e6e9ee9c75ca3be69349fd78ffa3a123918e238d6985eb70f59e959463679ce38f62d7d483f6a274f55545c64bcab0839d5907aaf7ef87e0aa126753615cef5d311dde7bf069788a489c75151c90971d8b28e5e6a712552123959bf1b018f1701b7974252395c510614c028346284e4b46454cc2a6708b1de49e4d1e4442eaddadcec2cf8f9de43024d28d84c7e12124644b95e424dfffc5ad0fc140ecbcaca0c516494c4c404949631fcf1358e613d563bf5ed655b2fe71c6d4819cd183ef2596626c337c39de6eba73e0da148d6e984f21a42cd9e4228b74bfd7b91cf08909b9bcb50ca052b9d88507a655b7952c9ae701c1d1a7f19848ad83bf237e7cbf0c3375e1a3b35d9857b37cd43f3ac54ae266b28852ae54046312e092b325952298f12016aebaaa88c54240469f078174201922cc185d44417f2328398df5881c2dc4492340e89bc2644c4f3baf8904588ef13d8a6a5b986f9441089fc3b299ed71ab8ecabfa26b2d24398d35865c610f4995ee3fd54bc8f24a6dc1e2a5661d6ac701a3d815eb8aaaa8a6386f89d2587975e20332b032524951695f13c13f3bc1ad14a8c2694bc4a49493112992baa4f112ad72194882a3922edbdf4eef5f5530915e7a277e6abf4a8702caf18e790290211c578c1aa4ab3100c91690bb59d2484bdcec81625eb5438d7c782be8bd5261674ad73bde636a91f5780c9b69f1fc8a84dcdb9d839d68ae26c0f7c1145d8d515793f013fe2fc2126a9990c8d0d98535b8ab975e958b7b4105b7a6bb12bdc88bbc79b71ef78231ede3e0fcfffaa0bbf3db092a1740eeed8d080f0da72f4af2b466f4f21067a4a31b8b60243dd5578747f0feed9da863d6cbf27dc82ddc32db873b8d96057788ec1becdad78f8ae15e8eb2a41ff8a32a282a8c49af602b4cece4079510a49e727b195b3c421c524d21548675ee3f504e80d5868c4c92bd3fb067c346221cacbcb4c123e758e5331a1b0c8df4ac8550088a8caab8c91694c1f3d88c2a43c8e3f40b290e4011acccfeffdf4f875cc978281282f2c62f055ed258313fabc24a364542eeaf572c10499db65a7a184796988f996879e4dde6d2a18f2d99fc959a7c021d20ca471f908da34aa8d8d4891f03e1d712a6608be379ed1b4b17db94a0b8b50c0fca8a22811db46dbd1b3a201d9a90c735c251eb9573f2fa2077073527ebf17f181205d7c36aa6b8bb1b4a30e3b8797e38ef04a84d7b563edd266742ea8407b4b213ae616a0abb514233dcd78fa81f5f8f89d3bf0f9a13bf1d9fb3b70e28f61bcf7d206bcf1fc1abcf1ec6abcfae43a3c74c772ecdab402dd4b6ab0646e215184c584fa12daf4cabfbbda2a31dabb18ad4dc55832bf0c2b16cf42df9a266c1f5b82fb76afc6c3f7acc5815d1dd8bb7921c6373661496b1993f534f8188e7d0cdf5e2aca47288c299c694165656519efa09093949464c2a2a09c4561cb7a34aff94cc6d6f52a00441a6bfcc930a4eb1da215d3731591b0226d51513e73d23cccaaaa663f8189eba3a17e14d6cacbcb270a8cc2c20214b26d11db96b3e2abadad61d84fa44c1a73ba977148e340fd46ffed7c361d4edb49723851682a911c28052222de734abb8c44565af945185cdd8243afdf4b8336a182c21752b972ddd9b92cd1f359053241afacaa444bd36c34d71563434f0b7ef3f828b6f537a2a92219b9c9f108b959a990ed6e0aa330ea56480cf9d8970fbb8667e3b38f76e0c2e96db8fc3fbb70f1cfbb71febfedebd9537bf1d66fb762f5d279f42cf1f07375fa088510e55d065ca97a0d25c4a3a9a9098d0dcd443ddfd7a0a565163a3a6763a86f017e73ff5afcf9dddd3873621fbe38bc1b6f3e1fc6504f3d0a73fc4809c599852252091e298cdec6218a08a5c2406450ce52c08a56e45042acf715f4744ef5979c9c3c85480ef499aa387d9f9a924e82642285e57f727a22925212297f12f572753b41c415219527aabdaa55212939c942db2bf4623e56d97113b9ac5ea7c292436388400ec9ae1e6f12d1a4b0c4986ce3fc3dd3b55341e7e34390de676b7f13feebb18d28cc4a421e576021575f212bbcfc826ce41564223b279d934a64491cc4cea13adc7547372a2a334c6ea3dcc54fa6fa940fb83411822bc8cd0ac6ebf1f37b2f3252fcd8d4db8caf8f8ee1bb13a3b870720497888ba746f1f5e171bc746029ca483c2fddbc04b7fb1b1450f94414e20cc914b26c31e184041f73a840300e09212fca0a92b0233c17075f5d8f7fb0ef330737e3a3a7576263470973ba782add863cab04ab28c79882c299d993a31e940b89687a2fef25c208bace84b948fbe9fde81a6d0b78a88720df07b440f49d2b40222bbc4c6d178d6859cc3ca54bea5615a13cab1682f25a0faf359e761a4cde6b3c8a63e8d8e34cc2b9cec24d3d4f1457ce67cedf7cb529406cb834d9fc4c1f1eba7b0d46d7cc224118eb39f90049e0e77782bc85a0ebb60eb561dbe07c9414c62318a2f0c61db233c2c66efdcd954365c451016e2acf43d2067c7e54b2cd1b8f77e1ec91715c3c3e88ef4ff5e1f2a9b021d48b0f2e41712e579888a3be4c3e20976bff9e0a8de120f259a49d87320418a6b3d2e2181233f0e223ddf8fcfd715c383c8aff79338c47f6b431df4b457288468b41082945c67048e140e1cf9264eaf6c455605b37496ebea7470d3237ed5b5e82759dccb512a84fe62a76d1c5681b13b407e795c2b4232b99f919d391ec5437b2525c7c752187f3cc49637e1585742235dd87c464da8d0bcd1628d7f254fadc42c4f1a9d861ff6984c6c94a8943760a8b18166dfa3b2559f3d21ca792c9102a21e0c54226b38fecdb80fa32861b7a1b55495e2ac6cb0134799f59652e0cae69c4813ddd9c94f66964441994b1541552c4a013c6a532e5a53c713404e1a3a7ca487263fbc65ae651e3b8727a18ff3cb501574e0d1b42fdfea1c50c8deacbb6179994784ef439816832119221d2462bd213593d7a1ff0b9515e1087c7ef69c7b94324d589217c757010ef3fdb83d6fa0c24d1bb8a3c228114eb7845b577bc4434711c223998344814d41765895388a68e8a8bbc38fe871ebcf5cc065497869020629a7034addd3590c07e5a9bcab035bc02fb76aec3fdbb57e1a17b96e3e1bb97b240e9c443772dc3830ef8d95ee692639b5661e1a25a7a6ccec1e843e1702642c9ab512625e7d4717ca21b4b963762fba6e5b86f67371edadd85fb7776e1573b5763cfa66ef46fec4069792ef5239da87d14a1d249a87de1d9d835be84715b4ab44ad54a17a14406916e2e0db07b5b178af3541ab3210966106dd02818b7497838a021279114ef41e7c24a7cfc3643dde9017aa7216218670e8fd043b5a32447ee3c32bef1505a55d3277f6d584244de734c3f2b3d79c627f72dc357f48ce78f0de2e2e130fef2d600362ecfe74aa31765352665f84946afc285e963b29f6be12ab24b1fd20b499094e4c2c0ca329c39b4197ffd208ccdfdc5667b23563fd7828fe44d0905b8e052d0b3bc16af3ddd8f2f8f8c712ec3b8786408df1d19c537c746718e29c4597afc27ef5b8ef242e65cf4c27eca245d3af24def5b55a1c720b280f99987d56888de70d1dc6cbcfd7c3ffb0ee3d33f8de199fddd686b2c444e46a2d973b409b9fa71f4c531ca32bc78e5892eacec2c31959c943941280a20683f69fb7023ba9654b0b4a5700c7f53083445a9ec98982494fab150389ddf5482930c3d973e19c2257a294ba8f01442696c4ba89956d48d219e2ebcaa2484d79f58857354fea5e343f8e6501f8efea117eb9757203989e346cdfd4608254c7a4ce943a492c776a3bad88fd71e5d61c63c7b7c047f7a61250b1d1a9163c5ea672628675265eaf7fa90961887a659097888a1fbafef8571e5e420a1c539c07cb41fe74ff7b350aae4e2a5ce398ed5a5b5c924012661bc7244d76ee3c194aad0ab31bc1753d647efe9c0c76ff662f3c60a94e77b8c57f7c9b69caf0d794e5ff6bdabb32909afff6e35eaaaec7d2d43260a6058cbf73e0a95c958fdf8fea5a82d4fa6a24826114a1daa132971a263096405537e22ef144da884401c2bc47c126a18973e1ec42592e9a72094c290879e6a616d10275ea1e24f87f1cf130324d520fefbcd31cca7f70d85380fced5ce255a513f04c91829a3cde2e2670cf5018f0f1b9614e18bf706f0edf1617c476ffcc5d111742f2f62a57623fd4bcfd2a50d49aaa01382347661229eba6f19fe71901eeaf846e6a41b71e9441fce935cfbb6ce414a12dbf9450e6ba7c97c2776ff964c7c159994fb7a02a8cc8fc7ef1e1ec2f0ba5264a5d3265a08ecc78639e1eafe5caf3fbd1afbee5cc4ea8d7f88c972f906d6b0dad16eaacfc4eef07ce64e1c54ab4f214f46e2045555e87a1146e431edd9ce21513412185a44a8a3af0de00257d3c593f452c4d78786f1fb036d28ce1689d80fdbdf4a4299db4554504a821ba3abcbf1f5877db8786c00574e30fcd19d7ff8d230e54ab284e2f8b68a89dd574c500f2e17ab4779272e24dd4ac94ef4e2b13b17d01b722c7a910b27fb71e6583f9e7bb40b6545bade8e313956eca4d9f1fa93b063b8b8409a6a93f0ceef36e05beaf03289a4f95c62c87be7f93ed45586cca6aada18424530bd7f338681c6e682365b1a0cff3e0f362eabc6dd638b114f02fb595d7bd507174d2c4fe7c0f5bf1f6e41c7a232c433de9ad5c50946132a8999fdba354de8e9ac413a7320138fa578ad4676e065dcd52e7088e12c9539582aab00edbac726143d54ad08d5ff13138ae04208d0e08d4c8cdf7c6235c310c32e8d70919eea8b43613cb87711b272b442a5f8d8fdcc04b792594328e9d08d781aa3ad211587ffab97f31ce03824148d7d8ef9dba7ef0e63f5924293f00b93fd5c8350268cdaf732b6fd8cd5163dddeab602fced83615c383a8cef99535d3e398c2f0e8ee3c15d8b909ac0fc8b32498f8a38b1e665091ae993f9b23e0b32ac5554a46053ff2254e4fbe9e994ac535e5e7b2d4f27b80e318fc84c63a3481833176bd5c8a07c9f92e64238bc181d732b901e60b52623472624c45388e478375ae7576134bc12c3c34bb0704191c9bb825c45dae094e7128c8722a18efd808732abe99612ca2a4c097716bdd4d0ca7a7c7e7013730eaeecd3cca78ef7e2d4dbfd58d75568720f85dd58fdcc04372b24b74bb722480a1a3e9925f5feadf3f11993f1ef547c9c60f27c328c6f59657e77740807762e425a72d06ccd3846be56596f3dacc2aab589169c74affc3637c583a7f7b59a2af67be66922efb7c786f0d9875bb1a4390f490145108630b355118bb07ca56e0c51694b912629c185fede26cc6bca37f7495d5c20761b48ed672693e0ba7fdb1cc664fee1742c90cd71f43caaf852d33d181b5d8ee52d15c8087a48a8490389fdd98941f4ad6fc1d0600bea6b8ad0d8988fe1c185d831321779e9411ad1ba50214442b5d415e0c46b72cd5ab93428957c86847ae1c136149150ceb576f2b1157ca330398821a7f6d3bc28cca1f7789979cdf1511a81c626b9cf1d1dc087cf2c4359b6aa2a47865888350695adb047c3fb7c6e5414a6e2b1bd2bf0eaa30b98aff5e212c3ea7992f79b4facc77aeff98d68a94e4322f52182587d6a41cf3c5f4583ab3e673b558d0bea389f97a8cf53ac9e3fee337a3d7b680c2f3db81cb38a43ec576494f789d66f04ecc3a9f2f4bd9c4075691a768417203f9bf69387232c9962c8300daeb6d94966f34b9dcb3b4c0c1421544a9a0f43039d58d75e8d0cb2d5dc34360aa0076279d9549b8dce367ec7c45dc96202dd6c56860bc33d8d583cbf1221f5cd6b35583c574b34a12e73e257a209c5903331fe2d2594a330259c1e23c77ddb5bf09559d5617a8f019c3f3e40238c62785515438523432cc41ac3d1891be9cc9dc6d62d64f55883e19559acc4587991ac22d2b71fcb2b0fd27b8c323769349babd28d697b0d0f3523d84e955c1aa3c1be4d73f0d5e1319398abd8f9e668189fbf3388c1ee0a24305571bb75ff50fd5f3d27a5375eea47e94b51961f3bc796d3aeb9268db9e69e5b0cb80a32a870266fea58d5dde4c902ad0a7a95440f962f6d649868408672237d1751423c63ed82965cd457e54d9c4e508cd51196c6599918ed5b622a448501b9eb9f9750d653a94f1d7159dc9cc80a6f84e32b9762724e59ce1f1fa7f708a3aac8d96389851863e85a8620858bbae2541cd8bec2ec28d714bbf1f2a32b8df753883f7f8af3e678dad739f67a1f8af3425ccccabba47b1ace903e46ff33c0d8c98ceb42f3ac100ebd482f7574d02c8e6f8f4bb72378f3c91e946669f1db93b0b1e6242fe9637f09aa4cbb6663685db3d91a50a57ec3840ab1a114a24e45163b883a10ab7586db8d82dc10eeddde89e24c2f439ec8c4866ca3ddf2591569685d5889c424b6635f66825c35d9c9016c1ee84079018d63124a267bd342de4f4d2887543aa75494e9c26b4facc13f4f735573455f62327b81deeaeb23db30b4aa9cde99739990c5c10cfdd3ebe99e658865facad659185f5d8d247a0d25cdeb3acaf08f2323c64389b4972379ce57cca5867b1a909a4483b16f6f44be58fdcf04b3b08d9c1ea4303a0cb02a3b7b907331d51ee77362947f6fc6af3735d2db48cee9f3b11021754fb6a12c0b9b7a3b5198a17cc9997fecb167822b4082c8ddd9d561a1bd0ebb1f41e533194b4df260ff8e3634576798bbf5a66ce580527a62bc0f15e505484e097272ec503197064b4ff263731f0995c31ccab451c8fb790825c868f6ac90e4f33234b9981c2fc495d3a394455e8a1512bdc779aeec87772f4428641fb6703c9548e924d057f71d870017511ef3cdd1f5ad689995cac5a333537128ccf6e2dd67573251e6189cab42ace67d8eb9db1b4faf475d798219438b59c976acfe6786954d91259eba2f21115e7aa09324626ec822400be43b863eddc39cdf90690e234eea7712aac0d318e647d6cdc6c2a662164fb4fdcd8460c2104a959b6e73d8386e8934092f92421eac595a84a19eb948e7c03af568ef7f6932bad7e743c03cb8c0e48fd0030bb34a3330d2d38ebc640acdc96ab0298462f5f35325e5169614ea53c747e219e6c77baaf01d2bb0cb249588758549eda5131bf1c66f56a3303fd510c2ecbbb09d25e3f43e2d4456931c376650470b91c13c4ab98dbc4742c8852d1bcaf0d907238648df93b422ee397aa8bf7f3482be15a5f0aa1aa651d54facfe6706e742888c4a39d2999e74cdcbc5e95706e90987b93818fe8ef5e3cb0f07f1c4dd4b5042729bbdc228684e2125e225a9d835ba1039cc99b589aa3d469b22c41a7766d0714c2ada542bd32ed0e7e67870aa17778eb531c9ab447240f198e489b8693f07f7eb5806c925b2a52579d1db558de5ad3546589739aea164d88d39f505cc1f98b390503fd53e5434cc261e17832a97ae45390c477d384f525fe28abe48ef74e9643f8ebdb2116d8de92647340bc76c0bc87857f727c89b2784fcd8bd691196b414d1b891bd3a1a4c67b82a4a4278f5a9d5668b4284d25817146299403fb1b70dd919d49df258b3486f0e924d2742529313f0f0ae85ac6059e99d6011c0dcedc2b13e7cf1ee00d6b7d3fbe86cbf363c299f0815a0dd4a59cdeddeb402b565b9a6cab37ddea487324c9d5819337420035080b2d224ecd8d489704f3d0af27d0886541d88543a094952d113659178ed2dc5d83a288f13cfcfd4b708a5d39e9e9f9d5013e09c1635a7e1d3777b98246b8393b90743c42526ce7f7967989ea3c4ecc7d83c42fb4533cb22e2d5d564e2ee9d2b919f65cb7393df103a24a86a6ed7c86c9c61f8b9788ca53d93e50b266febc7913ff462f19c4c0444de8837bc1938e9898ed92ca84fc5f1d718ee98565c3aad9dfa7e86dc61bcf47037c9a353185a502420c995e40fa0677913367437987d427b4e8c518a11eba6086512b529a48a0d29d61bd4d3236e6c1faec35dbb57a1b1b90899293ef340819e98292d4cc6486f3bf6ddb11e95c5217b83927ddb4d355baeff620845ccad4dc4a9575733e4721573455f14a128cfe707c7b19b044863a161ef5b291d902c0ea6f693c6b03e3e3c0fad0b4a91c0b0a3d44173d05cb449ece735ed4d6938f147565f47c771f9d418e72e420d72eee378f8cef948644e77a3378d67423a73de4d1b67e31b12577ad67d5311f80b8eb5bdaf925e8afae5bc82b447433913f1c14ee467d23988d0fc5c7335fa8fd1f70fc17aa809424d47e4220da2845bd50c11626e51539d8d8d3d2dd81a9e8b1dc34dd839d4c424bc058be6952299cad1111791c992c3f6130cfefc212f1ab3cb8338f8bb9538f3116561cea1925e327d49c53fb2a7d524eedad833f3e7bc85e9a1409ea1b62a15fb76b52399c4d24d68dd1cd6d11f55c4ca6f94121466f87060773bce1ed9c2715808985c6a88441ec69fdfec4355991ec19ad4b98ca9bccdf9fb46e066c5999b19c4dbcfac66d81bc505114abae6989fbc3e8cdaf24cdac28b649d4f1b68c4c2d905a6d872333c3bb7d5cc8288e2c0f58229051b39a4ba8a58d1175289548c9e8e5025e78ba72b4ff120879545012b399d1bcf4a8d4322c9e6a39b9750eac390437db1ef204bd75f12a16a8b0378efa96e9c3bc484d9e436f452f41c5f1d19c3d3fb1721431e4a0b8973716efccafb383bda0a313a8bdeb5b41eebbaed290255bee6bc3a49a8db4e2a787cd45922c3cbc2d959f8db7b4cfc49a2efcd3e91c6ebc7570c473bc3b3e9ed27756eaa51337f0757cb3f23bc3ec4c77bb0aaa304c7e915b5ff25f25e3939623ce2815d0b30abc88b3975f918eb9d87ec34e5be9a9f33574ba69bf35011634f122af6859a9cee09b9042a524758f480a4925bb3352f459248e63a1de530ab59ae938abf0e42bd680825454e4ee65a798bf93e62589364473e9b7eddb5505d18c45b8faec23754f26526caba59aced833324d4f30f5842397b6b76e56a2c114a8ab3e429c84b4578a013351541f8035676bfc8c0ef744fd0c75c440f6ef8a89354a6002ffcba1ddf1c09e3caf10126e8f48acc73be66d2fcc14bfd68aa4e3686954d4c55c954c110f80609a527b9bdfe3864a407f09bfb9799dced3209ac45a34dd53fff693dc2dd59f8f5ee1e160cc94c45641f4306ce8df3246e469f02fb88fd456c6862d733395da3bd8c494249d1f1f45eb108a56d8397a8e8e21c3b19035eef7849670bc3eee0478cc6bf27c2918cc77154205c2dcbcca82a08e1cd47d6d3436d22a174a7be9f6181f21c1ec5b3fbe75b4239f238c4921c91f7011a62795b2e7ad7b420e8d77167cd55c73c386fbd8f843c19463ad051de551df938f536431de77f45fb5f2495f6befe716410633d5548d2d3d7ecdb786a2dde9b2114c7328b98fd74cecbc2276f8e53d7da12d1e6adee610ee36fef0fe3be6dcdc62636118fddd78de2060975bd88108ade2a9a50cabd6211eaecc111bc7cff5214676945d2584480cacf4c89437d453cda5a72d1bda4022b3b2ab1647ebed90ccc6278714a5cf56dc9670978bda82e8cc75b8fade5f863e614a708a5d0f0d5c1513cb67b1e935bca6d48140d79283dac108794908b05c872cc9d9d6364907711f4defc1d81f3b7363f8b723cf8ed8165f8ee63edd06b6fcae23cc9f5fb8757a024d7cb2a4c64625fc64329ccc6967f2638e3c9cbe5308cee1aac2391ec4955e58a1748ac332c0ef66daa879f32399efe56e02723943033a14649a82e122a60f66d741ba7ac2088f1fe76dc7fd71aec1c6b47efaa1af4adaec5b6702bf6dfb11ae19e7928ccf699dd5f8de1183cb63cb151531cc43b4f31713d48251f1b60f5c55c83f2fcfdc351dcb7a5c51cc1314783d9af0ca4363687d2c6a81bf3eb0ab167f30af3f489b9862131ba6a36468dfcad57555132e0d09a0a569263387f72748250974e8771faad4174b7a5d34bb1fc6788541e395de61b81da07284375be0b5fbeb3c1e46e0ea17423f9de2d0d469e586d6f16bf08427dad87141e59c61cca8bcc340ffa3694e2de9d9d58dd5183a4b41478184e44164fc0cb62c08fcc8c78acef6ec0fd7777606ea39ea29d0c87b1e5898dc6ca441c7a611dce1db444d21e9448f5d7774730b66616ab5512842490ec2674712ee62c353fcb4bd3ca6fc3bcca022469b39079a5850dcf66d58b4cbcd6bc1286f41e1f1aab92f1deb36b99abd1c0cc6bae1c17a9067096c67ef6d7ac2e1374f7c209e19ad38dcdcb7a354b46a51dc5996e7cf1e6465c66fee410ea6be689fbe9a174c47b7afb7f053f69c89b29873acb1ceae507db30b7d28d81d5cdd8412f34ab24640ceaf50568401f4b5a0b79073d37989ee0c1e2f979b87b4737caf213cd31198d33b33c56c1d1985b978253af6d60524eefa4e3c0272da13ef9233dc5fc5c2e00ca4dafa37ead8135273d42e6c1bcba0c3cbd7719e6d726634e753a9a67a5a1b92a1d731c5467604e4d0a9a6b93d0c2efe754a7a2b12619756cd7362715cfec5b8c73c7c7ccde970ec67d7fa29fa5fd00fefcee00e63566d9f9dc24a134d7898a8d242eca8cc3676ff6e1923655ffad09c5575b2d4411aaae00c7a711eadca121bc7e6021b6ae2bc613f7f6a12a37642a0fe371444af6a5437f2697e0dfc6a80c0999c91ef4ae6e414f67b9b9b9a97daf6bc933492a5de7466b533a3e7da78f5517ab3b11ea783f13e5411c7cb197de2bcd6cfc4906eba12ca1bc1e2f92137cd8b8a2014fedebc2f6703bb60c2dc1d681766c1b6cc7f6a1c5d831dc61c1ef768e2ec21dc39dd839bc84e1ba0d9b4797603bf1c08e0e8ead7b6df25022950a029d3b1fc5feed8bccf97d1bf224eb8d1bdd7ac308a1b25cf8db5b9ce3bf23a1ccca50088a6c1bd8cfad5244a8e8d3062293f662be3d3c8c43cf76e3c547d7a0b531158934a22f4e372759f1f0bdc28d1edad4b92df3b7d996a081e9a99a6a7370cf5823b22279cc74792c1402240f496ec21115cd3e962ec8c7d70787584a2be40de2ff68d0ef4f0fe18587ba91ce506b4a69d3a7f5160a777ecea13c3780e19e45a8284c4692971e536338a18dafa64a632ea8038aca9bbce65555a90d8b3a119ace84fed13b9b99cb8c9a85f5fd097a4926cddf1c1ac1891707d0569fc579da33de370e2bb32dfb5d2824a13e7d7b8089f97f10a16498e984728eaf5c3cc6529d89f1eeb11664248b4c6e82462064481f89949d9584d282747b0e9b7d9b3d2abe5695a662dfe6d9c8624e23434e97c7c2124a3067974844ed4a0fafadc2792af78249c6e99d8e6dc4774c94f790a0fa010db575b62f9c7d1955963d9d95e859d188f8782f82c6638aa0768e168e1ea6ca60bd2449c56b93e8819734a6e0f07fad373770cd1e18bde477478771f6c826ecec6b464a20603ce28d57615666b339ccd7ff584269633316a154ce7ef5611f163733ccf8a904ad685e2fc5bba8143d5cbabcb3056579a9248288a43048a271b5d756a49100b39191c671af41a889e3392214bd450a43e4be2d7370e5e3b0394a73e5743f89dd8bbf7e388e650b33278c68137ddbafced0a731dc3db8a7074d3519d0e3f67e1144e178824cd747283dda9f97eac16377b5e21b7a273d4fa7075f2f7d3c82f3a747f1eae3eb519993c0eb747722ba9feb8195d9fc86145f63136afc3f9750dfb1da39fa4237ea4a83d6cb681f46af3a2243b79f9fe5c5daae26928de1830a30b7373886360a572ca9c6e0da5af3d8b776b2a7cb23a83850fe630d4aef47590a335d78e9e115f8bf4f18724ef452169d2b0fe3b90757a0484ff7b2ffe99e21915e454fff6ce95b8acc54ce9372ea193ce57837422819d9e46544cfb262fcbf8f46f0d5913e7a476d788671fe9301fce54f63185c5681101790397f1625c70fe30708c5d7ff68427dc31cea8da73a5159e0a58118e664144ed43c50aa9f02a2f1fad72d40455110c1782a989fc5077c68a949c5de1dab505192012fc9a531a6cb23d81d7b195df2b8e9555c985b1dc4b157347e98e534137286ddaf3e1c41d7c26c2431bf8915660a3202d83342398b5219fa748d64e57566ce76fceb2194739d485559e4c78b8fafc3191af9023dd385d3e338fff1b0a9005f7f7c1593733ffcf4c4d172fc20d8b720af6c08956d097591635cd2ef21f0f5cc0c8422212272df1cd17e1184d2b6c11f1e598c52f328ba40cfe4dcf9f6ba69e038b4cd2d4378e35c9416a7222d3d84c6d96578706f1f2bb57c7a2dbfe97fe67d28e51296500a8bca9fb66eacc4971f6db63be4acb4ce1d1ac3ab8f2c432e937b530018e3dbf6ca9dfc0c77f3eaf271e7c00224ebd93dce53729ae32d1a7b0a1ca3442336a1b4dbdebbb21a7f3facdfcd0a339f1a63056c1fbbfa92b9d4b2054548a4de64e8c97e1c44f73f094706ddba516a506c3c14433a8974590f83b2dad34f2aeddf5c6f0fdb45169a606d67fb30c49cd6f70fe197e1a10e85f1c74797a2385b8ffad8d39df617d8943fe8e76f5ce6d1261ddc1b5adf8270ff5c6cd8d088b2e2147a0a5e6b1eb2b4634c97c7c2ca63e4a2270b51c17f7a663593607a03ca7091af275f0b63455bae3997a410637f894fc462eec476e9213fd62f6b46f7c202f38311d62b297fb2c4883deeb5a18d5279cb920c2f3e7a710d65b1f713bf3fae3db1017c45cff9e4fe761430046bb18854e6bc3f65b33a8a4d2aab0b85f99039ed50c6f0fee9db7d5c3c23e64cfb3f8f8d322a8ce3fe6d8d7005a913f310a94d2fccabf4a4c5fcef4aa8f3cca18e3ddf8daa12fdc4b38e12db3d18731e88ed64309dfc4c2419b4f794c7d0a31fc3d2931c0a91f674a18c7c0d42c93330c70a92301dedf9f8f47ddd94ed63823ac87c62131eb8b31529690c877e9dceb4fde9988e0a80787acbe64a3f766f5e8aa2bc0453691a4f13219c107bdcd8501872a0f02e2f75cf783dfe7e503be6ac3699e768a3f59ba37df8dfb787d0d59a4bb93496c2186532378d23378e39ffe9fd5b1bc8b85e5331379625d21b53e7d4b5f4fdfd718656e2b95fb59a5ffdb3a728ac8da6e2eabe7f08bf084229ae7ffed67accad4f310f38d83344240b57e584f2e5090879ab000dadc45a44b377f5ad51af655cb3cd405216e679b8ea3bf0c5e10126c14c84b96adf7f711075b34286402e91d3e45b92590473239f447be6578bb16f671be2f5035e4cc4754dac71ae07c6f38918945f322530a4af5a94834fded00d6a1d3361a140ef74e938f31e7a93e7ee5f8eb2423da62502aa9d3c943c8af41c7b0c27af93671f5a59697e01460f81ea07352e934cbae573f40feb519a1b3429804322b32805c96610a3ef6be02727d4dc18845262acb033baa1dadcecf5d358faf12f9d78347940e4218189fe4dbfb67f11488472bc9a43ae68994446f5252fb79261edb3f70770e6d800ce92c8275fe9c19cc66c78e575144a0cec784241a61fdb07ebf1d9c130f66f6f303987c99b4cdf52b86471e6797db0bf351034e3682efac9e8ce39d9946504574e8e512f3a4e336a4e3e5c39d68fbf7f3480077735a22833607eab53d5af7e2f4a476562f56f7f4fcacebbb92a80779e5b8dcb1fd3f39dee373a57a857b5f78f8fc6b0a5a71639c9f65ac1f6114d28e7b3ebc3cf42a893afdb938a0ea1f40312a7ffb8162f3fbe060d25ac6aa87011c01ea1b504312b8884b0897ae43d3f93f7b2b7452c627928854e29b834d785171feac6f963e3f8f6e8088ebd3c448215239eab589e4264f4d3c821e61499491eccab49c68377b6e32fef6cc5d747c378e785d55834370d19e9cc4f22ab5ae319ef1735de0fc3e64122ac1e51ab2a4dc063bb17e1cb0fb6d22b6d662e35866f4f8de2db9323f88ed5e7d9a363f8eb079bf1fcafbbb062412ef2d37d2456ecb90a4a05f2333de85c90c5426325ce7ea047d44524bb65a027a42f1ddb640e169e7a7d103bb8606acb129091e4a5b78ae8fa97954359d8cf2894f9dbe63cedcd05248feee3e9ec917285619c3dac27325af13b86957b37b7233bc18778861f19d8b6b7939b20d33442e93a8547fb283dc91c91c5189b460bb252cc4df5e2811df3ccef7b9ea3b7f99fb7c6d1bbacc49c80f0064808f6a7702aef98a427479a2ab173a40d8fdcb50ccfec5f8aa7ef5d8403bb5bb173bc1d8b16569bed0b3bfecc869d1922a0f5aee5a5b918ee6dc743bb3bf19bbb17e3d9bd8bf1d4fe8578f2de5683a7f62ec06ff6b5e3897b2cf66ee9c0aa8e2698070aa49babfa8e436e760a7a56cdc7ae4ded786cd762bcc03e7fb77f119ed9bb104f0bfb16e1b7ec4b633db96f211ed8b314e1de56cc6928b7f72f1d5df33556ffd7c22d2794438068c85b097a3226dc5d894fdf61b83b4517cc50a79f96fef2e0281edfb500dd73e2f1f4feb5185d5d85cc443f430bab37ba78fbbb4b0e51f5defe3d7d6cc733ea557288645e971fd9c93eece8ada707e0eaa4a739f2c20a2c999b8d4426c3da2435f7de1cb0adfdf53ddd7b9b84cec9ebd5fe7703f66fc68a90769a1c370abb9f45624fdcf32322e33970c617cc1119112a860e4c7f8472cbe87e95fc0bf6bd3396f3b9bd76ca3c64bb19087b2dfc08849a0ead442a820a29ca76e1e5875a71e688cae27ee64d368ffa825e6364653d0ad35d68a94dc1f38f6cc0bae515c8cea0d1a83cbb52e40d2c2648ebbc8f1a4b958dc6b3b766e2d8a71fbb069bf0e95b03f8db7b3bf0e45d1d985795607e77c0e443d309c536ce2ef90f61ea3cff75c41ae3da88dd8ff0af92fc66c824fc688432492d7305dd88d5b9a2fcb4380c7415d01b6d64a9ae9ba1fd38cf573da0f0de737da82e4a37558c0cbd9415cf738f8d60606d038a73fde61f11e948b059710c6f228bf17c0eb1a85c41377eb5d998c0ca2c2bd983868a14dcbf63398ebeb20d079f5f872d6baa509ea11c4904673b11c8ac4ebd46e3fa8c1b6bdeff0a628d712dc4eae3e7c68f4228e37295d3783cc8613c5fd0948b03dbe6e1f377c770f1e330fec96ae39f2cd9cf1ee9c31f1eeb423bc38f7effc084289244f1bbb93a07f76fedc08b0f2c464f97fe5f4b32dc810089aacd4426fcf25cca99b44a756b82c4d5d33709f10134d7e660d7500b8efe7e10effe7623b6f53660565106d27cfc9e840cb0bdbcd864d8748819c14daecedbf8113d948c1d6082575f5382ee8ed91858d38cf0fa066c1a6cc0f681d9d8bcbe165d0b73519eef47223d90eedb695f4984d25922fdd8552ec3d582865c6c196cc30377f760cfd6c5d8b0b2146d2d2968aa0ea1be2280d9b38268a94bc68ac5a518ef9b8b07ef5a85c7efebc31d231d5836bfc43cd9a21c2aa4a32026a762ff928f64b2847208341d57cfe9367e183f0aa1d8a909470a2bfab9c5d404fbcf1df5d3cd7a18d2fc0f3c1246b74d749c57a1478452b811a1bcba9d62124f25a31ef32f211aca83d8b8a204776e998f7beee8c0be3b5661ef8e6ef3ba9fd8b37539b60ecec79ac5f9a829f69a1ffcd233fcf294e6e80a43b0cdb1e4d5ac67bb4da85b8f1fcd434dc7ad8cff6aaf0370faaf4df65fb76ae758df59ef732bc6b88d9bc34f46a85b0d87340e71a2ff8efefc367e5afcdb12ca412c22398875fd6dfcb8f8b727d46dfcb2709b50b7714b719b50b7714b719b50b7714b719b50b7714b719b50b7714b719b50b7714b719b50b7714b719b50b7714b719b50b7710b1187ff0f5281314fe2c3920a0000000049454e44ae426082, 'sackjuliansilva@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_status`
--

CREATE TABLE `restaurant_status` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `restaurant_added` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`size_id`, `size_name`, `email`) VALUES
(10, 'S', 'tdbtharuka@gmail.com'),
(11, 'M', 'tdbtharuka@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `registered_at` date NOT NULL DEFAULT current_timestamp(),
  `isAdmin` int(11) NOT NULL DEFAULT 0,
  `user_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `contact_no`, `registered_at`, `isAdmin`, `user_address`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', '$2y$10$j9OXXIYS0CG5AYuks62YMeDvuIpo2hZEN4CqfJfujt1yPMnoUq5C6', '9810283472', '2022-04-10', 1, 'newroad'),
(2, 'Test ', 'Firstuser', 'test@gmail.com', '$2y$10$DJOdhZy1InHTKQO6whfyJexVTZCDTlmIYGCXQiPTv7l82AdC9bWHO', '980098322', '2022-04-10', 0, 'matepani-12');

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE `users1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `profile-image` blob DEFAULT NULL,
  `restaurant_added` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users1`
--

INSERT INTO `users1` (`id`, `name`, `email`, `password`, `code`, `mobile_number`, `profile-image`, `restaurant_added`) VALUES
(5, 'Tharuka Wijekoon', 'tdbtharuka@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', '0712727445', NULL, 1),
(7, 'aquinassilva', 'aquinassilvasack@gmail.com', 'f1d56a06d11fb19ecf5667d18cd73b07', '8791c185cc1cb9657c447bf573678ec3', NULL, NULL, 0),
(8, 'aquinassilva', 'sackjuliansilva@gmail.com', 'fac153cbc12b8b0a72ec14be4a0eef79', '', '0771128140', NULL, 1),
(9, 'Himaru Ekanayake', 'himaru.ekanayake08@gmail.com', '69c3e2fbb50aa46c6677bb8728906dfb', '', NULL, NULL, 0),
(10, 'Yoshitha Rathnayake', 'yoshithasbrathnayake@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', '', NULL, 0),
(12, 'mine', 'vckarunarathne@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '09e16089664ffda5c851fbdaa8b57b98', NULL, NULL, 0),
(13, 'Thaditha', 'thadithathegreatest@gmail.com', '505b81cc0c91952b218ee54b239c2dd3', '', '0716942000', NULL, 1),
(15, 'aquinassilva', 'beatrissamarakoon@gmail.com', 'fac153cbc12b8b0a72ec14be4a0eef79', '', '0771128140', NULL, 0),
(16, 'Test', 'prnsverginia@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '27d04d6f137cbf151fb53c313a68c45b', NULL, NULL, 0),
(17, 'Gihan', 'gihan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '12f2605b3c2f46788f162c814309673b', NULL, NULL, 0),
(18, 'Gihan', 'gihandeshapriya9@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', NULL, NULL, 0),
(19, 'Tharuka', 'tharukawije01@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', NULL, NULL, 0),
(20, 'Anuradha', 'gkaslakmali@gmail.com', '202cb962ac59075b964b07152d234b70', '', '0717406502', NULL, 0),
(21, 'obviously not anuttara', 'realemail@email.com', '4bca24304861acde5770fdbe3cc2503b', '2729a88d784eabbe430d79011123e074', NULL, NULL, 0),
(22, 'obviously not anuttara', '4rizonxd2007@gmail.com', '4bca24304861acde5770fdbe3cc2503b', '', '323232', NULL, 1),
(23, 'admin1', 'dineease5@gmail.com', '202cb962ac59075b964b07152d234b70', '', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wish_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `uc_cart` (`user_id`,`variation_id`),
  ADD KEY `variation_id` (`variation_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `variation_id` (`variation_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_size_variation`
--
ALTER TABLE `product_size_variation`
  ADD PRIMARY KEY (`variation_id`),
  ADD UNIQUE KEY `uc_ps` (`product_id`,`size_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_status`
--
ALTER TABLE `restaurant_status`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users1`
--
ALTER TABLE `users1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wish_id`),
  ADD UNIQUE KEY `uc_wish` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_size_variation`
--
ALTER TABLE `product_size_variation`
  MODIFY `variation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `restaurant_status`
--
ALTER TABLE `restaurant_status`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users1`
--
ALTER TABLE `users1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`variation_id`) REFERENCES `product_size_variation` (`variation_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`variation_id`) REFERENCES `product_size_variation` (`variation_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;