create database djangoTeam2021;

use djangoTeam2021;

create table position (
    position_id int primary key ,
    position_name varchar(32) not null
);

create table department (
    department_id int primary key auto_increment ,
    department_name varchar(32) not null
);

create table user (
    user_id int(8) zerofill primary key ,
    last_name varchar(32) not null ,
    first_name varchar(32) not null,
    birthday date not null,
    boss_id int(8) zerofill ,
    position_id int not null ,
    department_id int not null ,
    mail varchar(64) not null ,
    salt varchar(32) not null ,
    pw varchar(64) not null ,
    login_flag boolean not null ,
    foreign key (boss_id) references user (user_id) ,
    foreign key (position_id) references position (position_id) ,
    foreign key (department_id) references department (department_id)
);

create table approval (
    approval_id int primary key auto_increment ,
    title varchar(32) not null ,
    user_id int(8) zerofill not null ,
    limited date not null ,
    goods varchar(32) not null ,
    trader varchar(32) not null ,
    quantity int not null ,
    price int not null ,
    necessity_reason varchar(512) not null ,
    trader_reason varchar(512) not null ,
    purchase boolean default 0 ,
    p_chief int default 0 ,
    p_director int default 0 ,
    p_mdirectop int default 0 ,
    p_president int default 0 ,
    foreign key (user_id) references user (user_id)
);

create table remarks (
    approval_id int ,
    user_id int(8) zerofill ,
    remarks varchar(512) ,
    foreign key (approval_id) references approval(approval_id) ,
    foreign key (user_id) references user(user_id) ,
    primary key (approval_id, user_id)
);


insert into department(department_name) values("その他"), ("未所属"), ("営業"), ("開発"), ("システム開発"), ("情報システム管理"), ("人事") ;
insert into position values (1, "管理者"), (2, "社長"), (3, "常務取締役"), (4, "部長"),  (5, "主任"), (6, "一般社員");
insert into user values(00000001, 'kanri', 'sya', '2000-01-01', 00000001, 1, 1, 'r.arihara.sys20',
                        'Ka8WLaPBTzfwqFnsus91vpqLOpsjXZOW', '776d7d51b1e6d71bb0cb856e1342e937bc37bd0391b9eaec8a2971358e73be44',
                        false);

insert into user values (90000001, '社', '長', '1990-01-01', 90000001, 2, 1,  'r.arihara.sys20',
                         '5CNM9MYyHud7OO0Y8t4UdBvlFK2khjfi', '624bf532af7dc9ba0fdab54f760ced1fd7432a5fc46c19c4fd07a089f006ba9d',
                         false);

insert into user values(00000002, '常務', '取締役', '1990-01-01', 90000001, 3, 1, 'r.arihara.sys20',
                        'fqxSKShzGHkT2bjU04RP5kYEsf9CAzSV', 'e70de723406741b35b7617c9e4b77e3dcb1952fed0aabc737ef414d464f2fbde',
                        false);

insert into user values (90000001, '三宅', '成子', '1978/04/15', 00000002, 4, 3,  'r.arihara.sys20', 'tZrYlHcwBalz4ZOCgJfB6rYOQpQldPLJ', '022280ae81d6365fbaf888399fc438e82df4fe7b9053563a7326f0c405c58b7a', false);
insert into user values (90000002, '大塚', '朋美', '1978/08/28', 00000002, 4, 4,  'r.arihara.sys20', '5tahYG0pZPmoUwKCEU7aU5GNNlF08FBb', '63041ad480f6b23719c4639843a0436bcb898baaa4d9faed30aeab7ef1e05cc8', false);
insert into user values (90000003, '溝口', '一馬', '1973/05/05', 00000002, 4, 5,  'r.arihara.sys20', '2tzPeBNi32llF06CPY4cIJ2mKqBa5Xbu', '10f695bd7bade6931389fce0fc22c8c15945d1c49f26910dc7b1e4c28e769c3c', false);
insert into user values (90000004, '阿部', '聖誉', '1992/04/11', 00000002, 4, 6,  'r.arihara.sys20', 'axy6CsixR3sEPtGaatmNoPtkNIbWdG2u', '78997aa3b3a7f597594e8d0746fcca041e5eb70e5317c367eb115be0df90daca', false);
insert into user values (90000005, '阿部', '聖弘', '1985/05/11', 00000002, 4, 7,  'r.arihara.sys20', 'Z2XuZ9dZfD0xOlmJ5JRKuchf00nEJ1rD', '4fcdf346b739ef30bdbd2d4c075a587a772f4a1bc7c80df32d4c62a5da6a1d2c', false);
insert into user values (90000006, '手塚', '宏季', '1970/05/03',90000001 , 5, 3,  'r.arihara.sys20', 'fqNlE2uRTwWZ3ieP61J2oan5y8NuZEBA', 'ccdb33f03d1a9c1f9abfb99d3a491fdab436d68e204fc29426836169288508d1', false);
insert into user values (90000106, '大森', '満生', '1982/09/19',90000006 , 6, 3,  'r.arihara.sys20', 'UsbYAMGOQhL26dQW4DbMmwJyXzfliZLf', 'a1c592d8c8efd31873910a489f6034b9dcf0b8f18a2917be094192fa6765d6d9', false);
insert into user values (90000107, '飯島', '聖誉', '1989/06/04',90000006 , 6, 3,  'r.arihara.sys20', 'ByZqL9pZLgHRjz92zFF4qj76w7P44ooc', '7311b361b28992cb17679d6faef17f3a08931bc3935cfc7717316e4b27096e38', false);
insert into user values (90000108, '大内', '家継', '1978/07/11',90000006 , 6, 3,  'r.arihara.sys20', 'WXyRHzUBs3UPhLxEH8HrNpB3vUjBmUBQ', '566aa9545bcc201fe84b358e1ad1d1660924b75faea596dbbe995f7ff6bb7016', false);
insert into user values (90000109, '坂口', '希和', '1981/04/07',90000006 , 6, 3,  'r.arihara.sys20', 'H6BpINAT9SfjsJRCIBH7TfEuHmswcA8I', 'c522b9e70b413fdea749df8e124a63d6673e5b08574e0084044a0cc1b6900cbf', false);
insert into user values (90000110, '丹羽', '菊江', '1984/12/30',90000006 , 6, 3,  'r.arihara.sys20', 'aKDfNvGv8Sq6ie9jjzMvUJicXv9GBLEn', '091fca9c05fd7b00899efc972360dbde2c893f0dd8ccc7c3b1d1ca663475c573', false);
insert into user values (90000111, '笠井', '家継', '1985/01/07',90000006 , 6, 3,  'r.arihara.sys20', 'PmT42mkxZGcQs6fO1KKidtMidBmTX9Gx', '00dc2e997e241c2898efdc3415c343f953573e31da9f885c7722240a1e0f2166', false);
insert into user values (90000112, '飯島', '富良', '1985/05/11',90000006 , 6, 3,  'r.arihara.sys20', 'ba06A6E07BcVVayNU356Lpa67PgdI9ir', '16134aec8291e9f095cb97159672a40c934a84a39e518a3754c3c29f94a5daad', false);
insert into user values (90000113, '中田', '定二', '1970/05/03',90000006 , 6, 3,  'r.arihara.sys20', '9E1yXUbTho0zWjQbisaaycLohNXdPtw3', 'd0b6665ebc2ae9af7a8cc796b74d77ff45134a8a7e3398f915ac680db50939c3', false);
insert into user values (90000114, '長谷川', '圭織', '1973/05/05',90000006 , 6, 3,  'r.arihara.sys20', 'PvSocHRsUSN1fYkXhdK9Ss0dSO43w27y', '11c36bb01c86181e508b00222ea712d76ae76436bb466dc3df44eac933cbbddf', false);
insert into user values (90000115, '足立', '友良', '1974/03/21',90000006 , 6, 3,  'r.arihara.sys20', 'SmqRuJrW2UdhZvyUk75dLNv4NPtQRxfB', 'cd008e55936e38cde376c88f865f2ba33da8a896309508a2102af60892653634', false);
insert into user values (90000007, '堀', '弘義', '1977/03/22',90000001 , 5, 3,  'r.arihara.sys20', '2iNYiUg1jOI1v6X1ej4z6EZCI9kCYvM5', '67d363f026ca04852315c80fef6e9e4e6c94bc91f541c6be9fbeff36af2cdb34', false);
insert into user values (90000117, '米田', '公紀', '1986/10/24',90000007 , 6, 3,  'r.arihara.sys20', 'cQs3AVhQwzIAH8xUjVKXbbQ1ReoFvRUF', '9cb985e1b6214af0f3199b580d2a1dbcdbf33b7377edaa43041a63ef3f38078f', false);
insert into user values (90000118, '黒沢', '家継', '1973/11/06',90000007 , 6, 3,  'r.arihara.sys20', 'iZuPjCptaxbYIoFN5RKTCYeSEHY2r6So', 'ddc1fd042df229a74a34d69ea67514079f02e0c7aeaa27e99febb08352173e3a', false);
insert into user values (90000119, '宮本', '織枝', '1985/05/11',90000007 , 6, 3,  'r.arihara.sys20', 'oJ2dGHxAVSiWDVVc6z2qcyut3Af65Yln', 'f4316b71e9047f6a664c27a596c91935460ccd4065f77409458f22c094732171', false);
insert into user values (90000120, '久保田', '昭良', '1976/12/31',90000007 , 6, 3,  'r.arihara.sys20', 'yckIO4lZ92eMzbnaywQzMxeZbYIZIapl', 'a4521db838a0d77e65cf5cce1b1e068c78f3f090982eb624466bd3446c01ffeb', false);
insert into user values (90000121, '岩田', '陽子', '1988/07/26',90000007 , 6, 3,  'r.arihara.sys20', 'hMhntAp9JNrNC1hH2F2ALSrLYigr6UPU', '4607e3404edbf0978fcf200bb81ff1eaecd29217818c3130f38dc4014ec90665', false);
insert into user values (90000122, '小倉', '悠子', '1976/03/11',90000007 , 6, 3,  'r.arihara.sys20', 'r0OFkVAaWtGdF0fJbvA7MYIyMoDJ94Ew', '28c8f57041e3f72ddadecdf0e53e0cdb2da13e982ae06739dd270add8e4ac794', false);
insert into user values (90000123, '長谷川', '眞八', '1993/04/09',90000007 , 6, 3,  'r.arihara.sys20', 'lFnjWn19vq7El5Q7IwZRDKNScvjPBr8r', '02f183fa66fba2892f6d528b0979b74db2cc5f1f7d6ddb630b22dcc9a3280cb7', false);
insert into user values (90000124, '岩田', '友隆', '1988/11/18',90000007 , 6, 3,  'r.arihara.sys20', 'ImHbU6Xx2YMnMB889uVa06IiwUqlv9Mo', 'faae9ebfc0590ba0b164b85bcbac0efb78d0011ab5941a32df4b5254c1b22a4b', false);
insert into user values (90000125, '大木', '圭織', '1973/11/06',90000007 , 6, 3,  'r.arihara.sys20', 'hatHRXfRVUrnLomvYNUoI0YHRowjPQ3z', 'f823f572d141ed2d97b3154054e1e70b344fe081bae0ffb1c90eb7d1195beec0', false);
insert into user values (90000126, '飯島', '眞八', '1988/07/26',90000007 , 6, 3,  'r.arihara.sys20', 'nPoF75Mpg3zn9wO646RPp48CgwzilTlz', '51e36d2429caa385756b2eccde531a498fc469c267ca233a5cf2c1d210241105', false);
insert into user values (90000008, '小川', '千恵', '1978/08/12',90000001 , 5, 3,  'r.arihara.sys20', '9Kg2H2ErJ23GnVk3jMZkARu4ZYuQeSHZ', '5cec31ce57474b8b65da1e94c77e96307eafcc01673f82042c9890255f3921a1', false);
insert into user values (90000128, '手塚', '勝英', '1981/01/28',90000008 , 6, 3,  'r.arihara.sys20', 'XRQHod1sOAOJ06Qt9NiR1z8QpWOGECpC', '41842bf8357a2fe7a69a85761534b890296a244621f03c55b78bd42b4866fe87', false);
insert into user values (90000129, '中田', '一馬', '1985/03/08',90000008 , 6, 3,  'r.arihara.sys20', '7GOyUuFvvYBa0IyVeTAWZ75J98b7UxMQ', 'b4bdc263c70f98f412e7771ed101acd854a3b8fdf88637ec5fc17e43aedd5370', false);
insert into user values (90000130, '中山', '公紀', '1972/02/25',90000008 , 6, 3,  'r.arihara.sys20', 'K7ON2EmsD2rIeGYx4KLyGvzgZcDNmhWz', '52ff08ad6ef59730fcd23dbfc226777c43fdc2f6e0107de0fe79b53fafdda165', false);
insert into user values (90000131, '大塚', '幸美', '1992/11/18',90000008 , 6, 3,  'r.arihara.sys20', 'S1Qw04Mwqhv81FPf6htidZ7QPTbKTGE6', 'b145b0fd6b432f133482e19fe28ee2f8df11396a2c26b8dcbff8132a44d6a14f', false);
insert into user values (90000132, '坂口', '喜重', '1973/03/22',90000008 , 6, 3,  'r.arihara.sys20', 'm3bmP32J5cPkkFSWyLZ1kQ0mOmxlgrMF', '01e71856b8ca47783c5361b252d0dc1a9f651f51d4cea56a097888f226a3b81f', false);
insert into user values (90000133, '滝沢', '一人', '1990/07/03',90000008 , 6, 3,  'r.arihara.sys20', 'wYWDNBjg4anBAtxtvSmAehUf7ehXh2nS', 'a6d230dca2f2dece78e2e565a35b81fe3563eb469c710ab548bf9dc8a4be7edb', false);
insert into user values (90000134, '森岡', 'るり子', '1989/05/11',90000008 , 6, 3,  'r.arihara.sys20', '9Rny9EWJC0HDuG7vZAK9TNZHwdb34stH', 'e6cac47c8e7d64944c3b644197afc92c7faa9d62eab2b853f5a0d90958fe2fdd', false);
insert into user values (90000135, '関', '昌光', '1971/12/27',90000008 , 6, 3,  'r.arihara.sys20', 'aXTBdxn62wyf0iW4NYk6453jW7PplNkR', '39d32e8fe7b5abfd4bb3ffe50efcf3f057030e20a7b155b39cba4bc13a6af968', false);
insert into user values (90000136, '高島', '浩一郎', '1983/12/09',90000008 , 6, 3,  'r.arihara.sys20', 'QQVz1G7GI6JEJLlZGnB3L3sWWnBcVgwS', '3d166b5308f6a8c8327cf06d3ffa54263d47b7a6b14008cee71687d0d70341a0', false);
insert into user values (90000137, '比嘉', '聖弘', '1974/04/23',90000008 , 6, 3,  'r.arihara.sys20', 'Q5l7ytQfQ2zEphFpki3ZbQqInVRqkKT6', 'eb4018228680098877d76b63702c15ee158a9c7986f23ce65fc56777141a8a65', false);
insert into user values (90000009, '竹本', '宏季', '1991/07/29',90000002 , 5, 4,  'r.arihara.sys20', 'gYDDlZTqBEv4jbg0xXK1n5r7hMGdmi9s', '447054643a1f31e78c0ac9430fda009f35983d53dc238a50d7bb8563f6049cad', false);
insert into user values (90000139, '大谷', '心一', '1985/07/03',90000009 , 6, 4,  'r.arihara.sys20', 'K9PYzheda8ctbFdFYfFToCjxHQbRxbsQ', '87378d415df68ba84d879bd57fa97728dadc4d671f9fb0d0d1ece6945f9951d8', false);
insert into user values (90000140, '藤川', '弘義', '1973/07/17',90000009 , 6, 4,  'r.arihara.sys20', 'eZEOv0yElObZkJqENXCxUkirJIhjznjS', 'c6dd6b67d4ea9d42a2620b07f56fe4cc372df951b9085c7514088d00c09e5652', false);
insert into user values (90000141, '豊田', '陽子', '1988/07/26',90000009 , 6, 4,  'r.arihara.sys20', 'iDYd8FfT6dSmrwnjzMu6xotDupuoJaHj', 'e9ac1249b45ad08caed68061aafe205719a35dc2a460c3c2e65ac969c2a5cb97', false);
insert into user values (90000142, '古田', '満生', '1992/10/19',90000009 , 6, 4,  'r.arihara.sys20', 'ULaz7s27YsKqlj9Q7gCaQhrKXZ7HEzrz', '508affc406188d4e7ca3063ae6d6101014453cd62f658037daf98a479d540491', false);
insert into user values (90000143, '三宅', '健生', '1978/11/01',90000009 , 6, 4,  'r.arihara.sys20', 'Ou26CXgBHzic0zZDllH3kUKZBZ9lienz', 'a3767b98e9432255ce14a2b775529a6aa35e60e88d0fc39b45e2cfcc4a2b6f0a', false);
insert into user values (90000144, '塚本', '清一', '1984/09/07',90000009 , 6, 4,  'r.arihara.sys20', '5b6AU0FpI9uQTEDyjg8eHkgpFD0hE9k0', '6b4561f94cd578c831359c8c43a09f5450a20cf33352e6e115d812206c21a53e', false);
insert into user values (90000145, '長谷川', '美智', '1971/09/18',90000009 , 6, 4,  'r.arihara.sys20', '6umGNJAiwSu1oLvRX1aCoDTWYXk0DeAy', 'acb3e0f07e2d368e89dd339953ebb9923862aad256e46cc3268e6a11e0afd624', false);
insert into user values (90000146, '小森', '朗夫', '1985/07/03',90000009 , 6, 4,  'r.arihara.sys20', 'tYpM7BENjgSWV9PrmErWxkAzEZuNIjkg', 'b9e9d39e84a89c36c9a23ec7109bda4f499db1b417a9b23411081d71dd2796ab', false);
insert into user values (90000147, '米田', '弘義', '1979/09/14',90000009 , 6, 4,  'r.arihara.sys20', 'yYPmsUrht4VFFD0cKLV3Dw8jsPyRM8lc', '9149eb64edb92172f4fa794d97f745588796b44ae0b302c8ab26d5bf738e9a76', false);
insert into user values (90000148, '町田', '数也', '1974/03/21',90000009 , 6, 4,  'r.arihara.sys20', 'jOt32cBScgujx8EzfFs3QwO9n5SEqmnL', '4a662b63d2aee50e14bf0f0822314deaaa0582e3dd447cf6f365246b4d1f8990', false);
insert into user values (90000010, '藤野', '和海', '1977/12/20',90000002 , 5, 4,  'r.arihara.sys20', 'erIIOyAgJg6FsCiczDIu7FNhOP4OZouW', '8e0c17e6007548e4131fb56fa417366d9a6531c885da355c4eed2ccd41b7218e', false);
insert into user values (90000150, '岡田', '絵梨', '1993/12/04',90000010 , 6, 4,  'r.arihara.sys20', '7XDAl5Cw0sp0t2DuKsjkVM6x3g30XeV2', '22c0d9b139de2ccde43ee28fa6f8e2cdce9606970f47b166b250e0d70e1471b9', false);
insert into user values (90000151, '山岡', '絵梨', '1985/05/11',90000010 , 6, 4,  'r.arihara.sys20', 'VWpEy64WPFDWoAMVwizMJFEphDwxoWc4', '345d096211476a55181a83841dced55385aff4735d6e04273ff82df202ccd2c9', false);
insert into user values (90000152, '早川', '迪子', '1973/11/06',90000010 , 6, 4,  'r.arihara.sys20', 'LsRKZ3D8stIF4qMTBZzcY6tTzV2j1CGe', '90eed33b8a1e01da5e5d8a45536f6f8986110619bddd3495f71f0eb4d9986eaa', false);
insert into user values (90000153, '大谷', 'ひとみ', '1988/11/18',90000010 , 6, 4,  'r.arihara.sys20', 'JmjAFYfj6zPVAd0VpU2pBjgaUjGt7jP2', 'dd2c55dc8746d395ea7119dee26660bba52a7277268c5a35388a55d1bb7e7a01', false);
insert into user values (90000154, '菅', '数也', '1974/03/21',90000010 , 6, 4,  'r.arihara.sys20', 'Z1qrOPm9emtPvGELAMFjDLaqwl3zGOEB', '17bab569b50fbdc6e3980aeeb77457e09f3a3acfebf0d8be26643fdb07643ad4', false);
insert into user values (90000155, '石黒', '一人', '1974/03/21',90000010 , 6, 4,  'r.arihara.sys20', 'RNBqYGPvmDnmMxPGMclViw3PzaLmURmm', 'f6c784ed3080561ed48ac5ad3e6c24bf90d039bf3ddc42e7264094a9ed228b54', false);
insert into user values (90000156, '福田', 'るり子', '1985/05/11',90000010 , 6, 4,  'r.arihara.sys20', 'y4uZ1JatDwFHkzM6dfqo3LRUuvdx9exs', '4669b8ae1cae5042a2b104d50dda87a858617f3b1556ec35ca8eb165f4f94eae', false);
insert into user values (90000157, '町田', '和海', '1985/01/07',90000010 , 6, 4,  'r.arihara.sys20', 'UQwxpWpq43ek5oR27miOTU1puSXC2KGG', '2a864964a08e008f1b4f25046ec38a239e9e453688f48e0ad7adf9ff7ee55f34', false);
insert into user values (90000158, '大塚', '玲', '1980/02/16',90000010 , 6, 4,  'r.arihara.sys20', 'c6uMFlf0Jun726e2ouvQ3cj7YzqXs7gE', '37833ede805949963d6a1a7462b6c7e708ba5a481114f474e06a3c2d4aefda2d', false);
insert into user values (90000159, '菅', '三男', '1977/03/22',90000010 , 6, 4,  'r.arihara.sys20', 'XDzu4RdsekZunAPpgNJsNtSDbukdsQwh', 'e648e8a720a62a66cf819b4b8a4bd12f722ed8651c8556b663246460eb6139e3', false);
insert into user values (90000011, '長島', '清一', '1974/03/13',90000002 , 5, 4,  'r.arihara.sys20', 'yW6Z1YUDUjYzkuHZqE25e5u5uWF8LN3n', '73fa02b794730ea1835d3e5dc194a75e722f2905c87a2372b976776a8d2e3f90', false);
insert into user values (90000161, '古賀', '和海', '1984/10/04',90000011 , 6, 4,  'r.arihara.sys20', 'Kp4JA9ypDbhwt3ulBUUi1HHIbthV6MqO', '5a4716387ef53542a47121399399c8e60b1ab1e622d4b9652096957c27d9a21a', false);
insert into user values (90000162, '石原', '長一郎', '1974/03/21',90000011 , 6, 4,  'r.arihara.sys20', 'NfIkrAacWCusiS5Ywz9ohPZYAYPI2KH6', '537a0936d27635d3e62a82ced056793be8cfa4dce3c9417a32428b5cb214f7b1', false);
insert into user values (90000163, '浜野', '希和', '1974/03/26',90000011 , 6, 4,  'r.arihara.sys20', 'Wzte8rMFqBkeN7rMCWOFGMkjY8jtA5MY', '4ec1d1024351aee6340c17f02981a39eb2a7d0cc13a70a9e5fc4752c6a19804e', false);
insert into user values (90000164, '金井', '心一', '1970/05/29',90000011 , 6, 4,  'r.arihara.sys20', '1S348HZP1SpEe94Mc0LqYISEryxHQDyR', '2811a66a0da4ae3528ce64a9321755a90f8ee5c07c5ae6f224b92eff57db9309', false);
insert into user values (90000165, '長島', '一人', '1970/05/03',90000011 , 6, 4,  'r.arihara.sys20', 'qK22rrPENsElhHqRp8T8TDyKGobYwvsJ', '2342631d0da662206be89a84d0e6f46b1ae9dbdf753b7969b176e3b13c223959', false);
insert into user values (90000166, '小川', '公紀', '1970/05/03',90000011 , 6, 4,  'r.arihara.sys20', 'ztkscnLORy7Fm0YBEwIiZPgU8fSDvHYq', 'aef4942f9ca4ae3858da7aa2ff07b5c038f8816bee716e8254868733a615d5fe', false);
insert into user values (90000167, '佐野', '金義', '1985/01/07',90000011 , 6, 4,  'r.arihara.sys20', '5ja9zLlOUKQx8wYp62yoyVL660moOQNn', '2b5387d359ff7079c3e15fd696feb1bc4c4fb5a88d2fdb4ec68e657c36686ad6', false);
insert into user values (90000168, '矢島', '善英', '1991/09/10',90000011 , 6, 4,  'r.arihara.sys20', 'VkUfQF9FJ2qvTnpM309SF1cXyF2X4GJG', '08d22ff3f41123cd40ecd12067df0c33263837c7ae3781f09e6d92f839d7a05a', false);
insert into user values (90000169, '関', '育雄', '1993/01/03',90000011 , 6, 4,  'r.arihara.sys20', 'uaZG2tiqYq6Sgh3wY0fPDE7fL59rRxLE', 'abde19b78f969ad4b8f9054ba8d42d18cec90b603444161303a6145861c5597b', false);
insert into user values (90000170, '林', '鋼三郎', '1984/09/07',90000011 , 6, 4,  'r.arihara.sys20', 'ES9F9v2W8UW5fWuObQjE5cOceNaivOkZ', '0a38710dcc3875bb026d667ec52d33d5523ac524adfd8da2e5c05a1cdf5d4e15', false);
insert into user values (90000012, '荒木', '眞八', '1985/02/24',90000003 , 5, 5,  'r.arihara.sys20', '8TuzYRSQMCu3hz7fg0tXpKX9kI6fmr0U', '872eab0bad17e93dc91a6aa3c82ab337ad49fde3ac5628e24bbc1b06070e190f', false);
insert into user values (90000172, '町田', '治次', '1994/02/11',90000012 , 6, 5,  'r.arihara.sys20', '58vrPznlvj9FuaItfwVjUK9F9fM6XqwR', '88af315e8fa946610ac52f0f7d4eed7c22eabc24ad749e46cff8918a9f711da4', false);
insert into user values (90000173, '西原', '芙美', '1977/12/20',90000012 , 6, 5,  'r.arihara.sys20', 'WUFMLxerPZ9y5oxWaOYQ7SHdKtdqDu8l', '4952c3a820613706fc384e3dc25acc59d23ef8cc0da4b9932bd78ab3eecad631', false);
insert into user values (90000174, '塚本', '喜重', '1972/02/25',90000012 , 6, 5,  'r.arihara.sys20', 'ByiWgUtRzSJFrmscorlK3u5xJSyZ4gSo', 'ecfeaa16d4865896922aeb592577949ef33d5137c048e43c1dd417f5ecd032ce', false);
insert into user values (90000175, '石原', '美則', '1984/07/06',90000012 , 6, 5,  'r.arihara.sys20', 'bjrPSz7Kyh9IgbPnEKiBlBmCufekZBxQ', '77f5efc61a00346d8314b2b53b0b562e8e4f7396b4a2e4e036c1ed0f6dbef1e6', false);
insert into user values (90000176, '浅井', '善英', '1988/07/26',90000012 , 6, 5,  'r.arihara.sys20', 'c53eddWFlrYJjQdLlszxePj4nkVC1XsO', 'a0740e5656882e9bf61ca42b9b058bfb92604b0b53eb19ccf39a0d66a0210c51', false);
insert into user values (90000177, '西原', '宏季', '1977/03/22',90000012 , 6, 5,  'r.arihara.sys20', 'BI2cirBt1eN77qXWQE6mo6pY1F0wAjT2', 'cc9877a55305c6a9a69516062ad505a9a8f4994593e395945784c342c7e52c8a', false);
insert into user values (90000178, '比嘉', '保行', '1977/03/22',90000012 , 6, 5,  'r.arihara.sys20', 'hAuXkeQnXci9BzHz2Fazr1wyXwhiZYnj', 'd2670a9c29d96f5401fbb7168ca167557b1eadd102fa19897697e8f814502673', false);
insert into user values (90000179, '鈴木', '喜重', '1974/06/02',90000012 , 6, 5,  'r.arihara.sys20', 'ysuaMEfDavbkPOyL8PuvVPe0Tthk24eX', '3e20d3bc36b44d3e421d612a45fa27a5719eccded3bb83b47313b708d3300c69', false);
insert into user values (90000180, '阿部', '美世', '1980/06/15',90000012 , 6, 5,  'r.arihara.sys20', 'TVOV7SnairmJUuMgTHGejAW2PmBFTtTs', '2e08135192c85bb62cc6c2d5aa40f8cab7dea6bac09503a5cb351f4b18c5297d', false);
insert into user values (90000181, '大木', 'るり子', '1980/06/15',90000012 , 6, 5,  'r.arihara.sys20', 'mbka3doHgC98py2qyZ15SftrVhf5TTlz', 'c3b72123fbed466c9d67945dc1174555a3bb4a8837073cd513990f45785c463f', false);
insert into user values (90000013, '長谷川', '善英', '1984/10/04',90000003 , 5, 5,  'r.arihara.sys20', 'rFeRfz95RXbpCGIC6Bb9JJu6UwyCcfGC', '691e301b38a274bd0758d67d889c58afe77dd39a17be9bee7fc372a2fc18b7ba', false);
insert into user values (90000183, '武藤', '迪子', '1992/07/15',90000013 , 6, 5,  'r.arihara.sys20', 'YFD6EhUDgast8PBUEiovbtPTZxMoOjqT', 'dc486a2d8bdb8fecc738ef23bb74e953fb637fbcf8d71bd08621012667618698', false);
insert into user values (90000184, '石原', '朋美', '1994/02/11',90000013 , 6, 5,  'r.arihara.sys20', 'siUZ8jwlOnHoQAsPCo676LzxHzej7m65', 'ebffd3a9d8955cfe95945e347e76e9b3da5fcf9599b2a74caddd73a38b22fef1', false);
insert into user values (90000185, '小森', '家継', '1981/01/28',90000013 , 6, 5,  'r.arihara.sys20', 'KTwjN8Br2OnGHK63kiUBhL8BXsz0UQI3', 'ffe222112317af1a27414a6f049611eeb448869d5c2db338d041815e10ab3755', false);
insert into user values (90000186, '松田', '芙美', '1973/03/04',90000013 , 6, 5,  'r.arihara.sys20', 'tDrzY5HItcVZsjPKdZIO5Z2d5gXV43sN', '6583a9f23915782079ca576253a19e0fbff3d10e2f688d85708bbe40af11933f', false);
insert into user values (90000187, '竹内', '久哉', '1971/09/18',90000013 , 6, 5,  'r.arihara.sys20', 'cB2q4aFzHyaOWye2MaYNHyXSjGFnAVNk', '789aef16ae602e762e67dc42ae13e2f95530e7e3736ac025dbc5d128c632481a', false);
insert into user values (90000188, '入江', '陽子', '1977/02/18',90000013 , 6, 5,  'r.arihara.sys20', 'a0EpUCVVVYsC0IKCjh8nyIpgeP1HYgta', '74661b9055f1790c3de6bbf6e6c281e954dcb2a2a00c375724436bec53ff6783', false);
insert into user values (90000189, '荒木', '明博', '1970/09/03',90000013 , 6, 5,  'r.arihara.sys20', 'SDBZ8YbctefFYPfaJ5GSE2720rA8ttk4', 'acefb7a1544dc689627ff7fbdab811a1eee34f664a637160f73b8ecd0b8e4452', false);
insert into user values (90000190, '瀬戸', '友隆', '1985/09/22',90000013 , 6, 5,  'r.arihara.sys20', 'zwyiLQixvQgPze72FxaBphSm9TjEGUeA', '508790500b5c2431cc01725f9444fc26f05ec84773fc950394527738a07b23c7', false);
insert into user values (90000191, '矢島', '心一', '1978/08/28',90000013 , 6, 5,  'r.arihara.sys20', 'Pe6eKvA2JK4Dn2hCfVqcaSzCNjYCeK7m', '4425ee34bfe2beca8f2f8a78d32969cef92a25e546eaf2721505bba99c43e7fb', false);
insert into user values (90000192, '荒井', '家継', '1975/07/15',90000013 , 6, 5,  'r.arihara.sys20', 'dtHaQKJzJlkBoHqIBoBIkVS7kEjAhAjI', '0f337e4d9ae5aba83f4110fd82b133323901aa5119973b4eef8c7ccbc3060f40', false);
insert into user values (90000014, '竹本', '三男', '1973/03/04',90000003 , 5, 5,  'r.arihara.sys20', 'cS2znSVvqWUV9tJE3m2B9e1vuHkVhIyi', '1b61d48646c18ad137cc150858f36eef642b8b5cdefe4c72d857ce5de9c7b405', false);
insert into user values (90000194, '溝口', '恵', '1980/09/07',90000014 , 6, 5,  'r.arihara.sys20', 'erd34rqjBLUWBdSFIsdg7bS5vg8fX02U', '4a8378e395b03fd8f0247b1c98b9dce7a0bd1653131c7836ea5a767184c86d83', false);
insert into user values (90000195, '丹羽', '織枝', '1985/01/01',90000014 , 6, 5,  'r.arihara.sys20', 'HjGhTOhn54xs36jUBYvO8XNBT6ooLcYp', '6502d508c45556a87d42bcb7e9a3181408497da8faf5b9d90e1da4ca5764b83e', false);
insert into user values (90000196, '相馬', '恵治', '1975/01/03',90000014 , 6, 5,  'r.arihara.sys20', 'DnLSd5RFaWuewoVckSFekJqq4VbBrUOD', '19b0ca5943be829a6db2bf852223ea82dc7a0a7f7d11125ebbaa70a5645b56af', false);
insert into user values (90000197, '宮本', '竹一', '1980/06/15',90000014 , 6, 5,  'r.arihara.sys20', '0zmaDm4MhDlK0yVuuBtLsWIgaiDXrE1Z', '4b042828c0a56e504aeeee62ac7d5354a8049d66bf51d077f63caeddb47d153e', false);
insert into user values (90000198, '萩原', '保行', '1992/05/11',90000014 , 6, 5,  'r.arihara.sys20', 'RCKhB4hDP6n4ligHdKNLPu5csp52Wj01', 'e1946ca148e238e0f4fe61587c27858f42c291523a102feca8482f330e86d502', false);
insert into user values (90000199, '平田', '知生', '1991/07/29',90000014 , 6, 5,  'r.arihara.sys20', 'YTnXIQwXgj1Y5Lery5UH9pNEX4YCkumI', 'dd634d533eec44d5a9cb02b0538569dd43cdd8cc7bf81b3871747d228d08d135', false);
insert into user values (90000200, '西原', '喜重', '1984/12/11',90000014 , 6, 5,  'r.arihara.sys20', 'FYhJXhoPl7hL2M62cHVCR7ZcUwUEJwuw', 'b40a9107c082edc12b24b8ace0442f1bdc52a64291ae96f9a4c9130e05dfc1e3', false);
insert into user values (90000201, '石井', '迪子', '1988/07/26',90000014 , 6, 5,  'r.arihara.sys20', 'keCanHvepAwAOczY569N9quEgafUzay8', '027873e35e7dae7ea28e9c8e901c51c8c05fb9d76d568a1ebba297ca3e7d83a9', false);
insert into user values (90000202, '高島', '準司', '1984/07/06',90000014 , 6, 5,  'r.arihara.sys20', '7gGwVj2cog0dnXOMUFUy4HGemDrDIjmQ', '31e360893d64b01f3ccb51d09aea87cd89e7cff3c004b7d906e32558b8a0bbb5', false);
insert into user values (90000203, '松田', '一人', '1979/09/14',90000014 , 6, 5,  'r.arihara.sys20', 'WXrtYEXfojHsHbWnC3Uv4FdabtUpatk2', '79240e27233cb6d9387775e90ec5bdff1b7d37bd689515dbcc380b91def2bffd', false);
insert into user values (90000015, '石原', '芙美', '1986/12/13',90000004 , 5, 6,  'r.arihara.sys20', 'L1gsVWqnfKle8M9EKBC1q5r8Q8mfgPJO', '11bc36a432959134f4e5bec30d2d27a11b232fa336a7ac80835440f8f8f93d6a', false);
insert into user values (90000205, '中山', '希和', '1973/08/06',90000015 , 6, 6,  'r.arihara.sys20', 'HTRVKejG3bqjWHK0ZSFjH0yOgn8Kxpdw', 'f0feed83f9dc6773d428d0c1ea6e6208d52876fbf875ec14e77516cbeb52dc6d', false);
insert into user values (90000206, '藤川', '一典', '1990/11/27',90000015 , 6, 6,  'r.arihara.sys20', '7VPQbm68cduQGrdFHcSJW8jRg9KWPX9f', '91a20c331b4411c3560e1316ef6eecb429b34a03b6b962f2a3d604d0c330019c', false);
insert into user values (90000207, '大塚', '心一', '1972/02/25',90000015 , 6, 6,  'r.arihara.sys20', 'GRPflHn85ibdIcv38dl47QlSRlG4qRjD', '13f87ebf146c9424c8136349cfc5408a09ad804fffe13db1dc6b1fe8a122c5a1', false);
insert into user values (90000208, '矢島', 'ひとみ', '1975/07/15',90000015 , 6, 6,  'r.arihara.sys20', 'X7K9Wg5N4XOBVeUO49MmSd6rY1j0lFuq', 'ac3db884ea008ad7fb516ad12c6cbb1cb0dd28b2123e8a3c1309fb14297a720f', false);
insert into user values (90000209, '小倉', 'ナツ子', '1993/04/09',90000015 , 6, 6,  'r.arihara.sys20', 'FSWD7rb9ythruqyBChvcW9Vl4KgdFwaz', 'ccf55a596997a12b395f66bc1f48fb30bbdc70fda0f8a17cafc86afccfa63489', false);
insert into user values (90000210, '手塚', '金義', '1970/08/11',90000015 , 6, 6,  'r.arihara.sys20', '2MBeA0C7ZD6E3VHStsnc31PtpcDKJLfb', '3d5d4e6792cf1d69c4296c25efefa72a51cbcbc241f7c511aad001b4b77ff113', false);
insert into user values (90000211, '荒木', '僧三郎', '1973/07/25',90000015 , 6, 6,  'r.arihara.sys20', '9oPQkc4VhIFZ21fUFN2cwGSbd8H8Dd3U', 'e3c6b1677ff070079bf3cbd79dd5b22a8e46d6784303c78caa715d433e8a35ac', false);
insert into user values (90000212, '藤村', '恵', '1993/01/03',90000015 , 6, 6,  'r.arihara.sys20', 'QfSmMzUzUwKEyfqV8ZDTaIm1ByLZR1BV', '31cc432e9d93d4e65e079b2c17ec8030fff62d263d01287538e4fa004127873a', false);
insert into user values (90000213, '片桐', '玲', '1986/12/13',90000015 , 6, 6,  'r.arihara.sys20', 'egZhNrPc8BhbuT3T5HY2Fguaru0KHou1', 'a20db872dfc1c260852e0442141619720a827e84ac23e2644ea7d48c9e6ef619', false);
insert into user values (90000214, '早川', '幸美', '1989/06/04',90000015 , 6, 6,  'r.arihara.sys20', 'IJdVgtDK1CFh7FBG9QIoHIq3g357yBwa', '08be2f04cecea507cf664c668d2e3c8e4fb3e11dd330d94b8c0c9c34d6572113', false);
insert into user values (90000016, '菅', '一典', '1977/01/07',90000004 , 5, 6,  'r.arihara.sys20', 'qsuiXDzFs92BIWOlvBNDtL3rz3udgktj', '210a8620ad6b1b011ec209c6c119ea3b77d9d6cc60f7805ea25174e6607ee2e8', false);
insert into user values (90000216, '中山', '絵梨', '1989/01/19',90000016 , 6, 6,  'r.arihara.sys20', 'X2buzFMDNyA9kkWQVXruRS5OaUezwEvA', 'a072a163ed81a0a63f55eea757e7b2ad3e082562ae9af6273c1548c9d2fe7d38', false);
insert into user values (90000217, '大木', '朗夫', '1989/01/19',90000016 , 6, 6,  'r.arihara.sys20', 'fTP98uq0iCp648mKlqSufSUF9O2UPCJS', 'c3f338b67ddd4eaf2332adf2ea730c772890ec864f5418d7be67a0e140bf6ebd', false);
insert into user values (90000218, '藤野', '圭織', '1993/09/24',90000016 , 6, 6,  'r.arihara.sys20', 'NBZgKSFjQevdByNdvPeR1HaGxxkr4xE3', '4d87a61241f19f13965aee05466eea7c39f51fbbafc7850e269d221e09b89add', false);
insert into user values (90000219, '久保田', '直幸', '1993/01/03',90000016 , 6, 6,  'r.arihara.sys20', 'pFEFLmeuWluJG3UsxTFpR1D4tWXDhA3Z', '7f8ca88fc8287b03de842b78bd453648470ca86d9a132bdc1d693200c66c1bff', false);
insert into user values (90000220, '岩田', '幸信', '1973/08/06',90000016 , 6, 6,  'r.arihara.sys20', 'nSRRvijiHAidKE5k0R76tOz4g8oLSlV8', '472e33e0a6e7b9d41316f3f179b8854453208a6d4a061dd52c0c40d3043e215d', false);
insert into user values (90000221, '滝沢', '鋼三郎', '1989/01/19',90000016 , 6, 6,  'r.arihara.sys20', 'KJtOUZvisgVkkMAOJ7Px2uf0JJ4grpeG', 'cb2dc9e697d9ca29c290f752a55eb6e994adc2b369352859980566327c29f7d6', false);
insert into user values (90000222, '矢島', '眞八', '1988/07/26',90000016 , 6, 6,  'r.arihara.sys20', 'w3re4UebN6hkE98COaTQLXCSAi3clbwT', 'f89602fa5450745aca6a327a92d1f711973bec25f8a5aadb58f31a93e4575d33', false);
insert into user values (90000223, '武藤', '勝許', '1988/07/26',90000016 , 6, 6,  'r.arihara.sys20', 'jAJUf7vozc0392BqJidwTEwMT2caMMIM', '6919c435543ea09b1aa439ed6c3ed4f7ed646c9b2bdba10668654add38343040', false);
insert into user values (90000224, '齋藤', '裕恵', '1992/05/11',90000016 , 6, 6,  'r.arihara.sys20', 't8yA8achdj8HzxYJWH8creqFeYg5AGRG', '6930d8ee1af60f0a67f3b3fa5a8171c93fcd0ae4aa04d35dd89b1a6f090f5c12', false);
insert into user values (90000225, '関', '昭良', '1974/04/23',90000016 , 6, 6,  'r.arihara.sys20', '7UMnVJnVAG1b5g8lpLQn77VAnovQ6GOb', 'd76e7d6c9827b22e3b18d756a31bc557006f4068928317f999da1fdd200db667', false);
insert into user values (90000017, '武藤', '心一', '1978/04/15',90000004 , 5, 6,  'r.arihara.sys20', '9U8jErGOykI30E4G1kUy9td74KOCh9Te', '33bfeef498f58b093f777c4f25258bb08dd07caaff2e7e7a03ae7c9b6fbac599', false);
insert into user values (90000227, '西原', '邦美', '1991/07/29',90000017 , 6, 6,  'r.arihara.sys20', 'YCiupRKRJN0AzEm2Sutad2Y5EZFIZT18', 'c39c9604375cf5844735c1eb6e1f8d869046be72e907439f21739c5be3f23324', false);
insert into user values (90000228, '長谷川', '織枝', '1973/08/06',90000017 , 6, 6,  'r.arihara.sys20', 'wSKV6PidAcwz6s24EGvuZsRUt5YmszBZ', 'aceb9139bbb360b48655484f5759dbbf4b4b78a8b76e2d5d24506675e74d323b', false);
insert into user values (90000229, '笠井', '直幸', '1973/07/17',90000017 , 6, 6,  'r.arihara.sys20', 'SFw3v2rc7UkBGfnMrz8wboNUqRGZvTxj', '79d37d9e229aad984f9e5f8fb51de528226324d296925af81f8d352373f5cbdf', false);
insert into user values (90000230, '長谷川', '一典', '1992/04/11',90000017 , 6, 6,  'r.arihara.sys20', '8aE6ydMRMaVTXMjsLztIK8sZgUI1QOEC', 'c62a216b7f410172c90e1a423b269bd6af9c6ffa746f532fd7c3ae0ccbd5f704', false);
insert into user values (90000231, '阿部', '陽子', '1977/05/14',90000017 , 6, 6,  'r.arihara.sys20', '3YqhlaHLwv9hVoYFEzsghkcs3JNsAdqh', '69cd6ed6dc7f41d0530b3510b8f596443d423a9fddfee10d6c4a1014ff59ee3c', false);
insert into user values (90000232, '古田', '鋼三郎', '1993/01/03',90000017 , 6, 6,  'r.arihara.sys20', 'Ux8Aa43O2zv8moB0msFNEXJRf2OizkWb', 'c0cd7921d29c6e746563de236d231722df2605d59b27f1fcd37e41e7131a894e', false);
insert into user values (90000233, '河村', '政治', '1977/05/14',90000017 , 6, 6,  'r.arihara.sys20', 'nNSPNKNaUdVJu7b6aAoZNDhxtPC9vz2I', '33d972ed2af240a17788c143d7b711f61e8e69ab973916789efac25b23a5781c', false);
insert into user values (90000234, '関', '成美', '1973/11/06',90000017 , 6, 6,  'r.arihara.sys20', 'Km2X3Stx9Crb1yUeBlWHgIKjhkwyjjsF', '4bdb8d79a89a18d0b012946b153ee9c74d9e1f693b9e5aa05e12bc37d321259e', false);
insert into user values (90000235, '河村', '浩一郎', '1981/01/28',90000017 , 6, 6,  'r.arihara.sys20', 'zNinxXnSHgjCvBY4MRV2I503f6cDvdMu', '76aa223bc202699e55b7e8d0e92ac740841cf51d57ca17a544030264a0433a37', false);
insert into user values (90000236, '長谷川', '茂義', '1970/09/03',90000017 , 6, 6,  'r.arihara.sys20', 'F9mdzBh42Fs6SgHu6yx9hgzRBYlURKXW', '920278348a77e0c46cb8f25e9ee59993e56c314ddce31dfe64d66bf485464404', false);
insert into user values (90000018, '矢島', '幸信', '1992/10/19',90000005 , 5, 7,  'r.arihara.sys20', '8tWpyMBqJKGaIXekmXSsfMEY3TBIP4Y4', '051415470c6a129e1f40e2f64800897e73826d5333767bfb850c8f4505bb09aa', false);
insert into user values (90000238, '浅井', '恵', '1976/12/31',90000018 , 6, 7,  'r.arihara.sys20', 'bFMnGJKQHNvPfGqWnh2cF0Z2i9qPt6ZS', 'acfa8eda8f8b42dcf374d0313a47969e478e154c125f90125d1fb7762f3f216a', false);
insert into user values (90000239, '萩原', '治次', '1973/10/15',90000018 , 6, 7,  'r.arihara.sys20', '3pHQl0X5ILyHD2AOcmnxUSVB7gUX00JN', 'ec0e05cba02168529413d1fb53192d6883cbe8f65faae1cbba7b6f4a60d4a79a', false);
insert into user values (90000240, '西', '邦美', '1976/03/11',90000018 , 6, 7,  'r.arihara.sys20', 'Cgvbn3DBvtNmYkYn0KA7k9GMrkL8eCfq', '8df994fd5a0a5f3122958a7c54b77b2d1e2316e21048bc8505daea6ea88a63bf', false);
insert into user values (90000241, '手塚', '芙美', '1985/01/07',90000018 , 6, 7,  'r.arihara.sys20', '5QwQp1UydzwfGiVBEyxtvI9G5Z0EQAsx', '29a5b4c335c7e09d65486e327d48bf524df766c60e995e2f49fb10d5cd009d89', false);
insert into user values (90000242, '早川', '育雄', '1988/11/18',90000018 , 6, 7,  'r.arihara.sys20', 'fU47PF1ZT8aLvPzjuUJRnW4V28YEKvaK', 'ff6bb581dbc9f581f565ab1ff4ad3344fcbf520f8491f0f94defdf1ff1839e4a', false);
insert into user values (90000243, '矢島', '淳子', '1980/06/15',90000018 , 6, 7,  'r.arihara.sys20', 'fcOPLs4LQccoy2vMl4hnXfNktBmaWWmN', 'fa693bf7fa1b116f16122b21f9b54b648f568a51f8c0f9c47a2cb3115a2e6597', false);
insert into user values (90000244, '菅原', '洋和', '1975/01/03',90000018 , 6, 7,  'r.arihara.sys20', 'LuDqIKtZqpUsJpFtNeDztTrvu0sDDbrv', '4cd21cca783260508192af8e90a1d7753c30c029562cfd44936d5876dd76f7fa', false);
insert into user values (90000245, '新谷', '亮子', '1984/12/30',90000018 , 6, 7,  'r.arihara.sys20', 'ncT45L7jd70zD3V09lAQgO2StXr6lyWj', '82494e4baea6ec8f76e5e17d1601e00d035c74977e9bfc29362c9b4b11d53e95', false);
insert into user values (90000246, '笠井', '恵治', '1978/11/01',90000018 , 6, 7,  'r.arihara.sys20', 'C4D3o8wgMzm4FbDA2fIbGqdZG7QVJ2in', '9fccab1300bec685f3975b889672439fe607a48f873a72ac6271c25060a13d0f', false);
insert into user values (90000247, '豊田', '政治', '1973/08/09',90000018 , 6, 7,  'r.arihara.sys20', 'yn3Wj61q6lLmmhd4mqgjqcoIqiIVVXuL', '7631d66ae8b2c6c2aa2265b29921171727bb0c623be1cf46d2e8a669978c910e', false);
insert into user values (90000019, '古田', '清一', '1977/02/18',90000005 , 5, 7,  'r.arihara.sys20', 'kN69I8BpZBj0CAOascOVj5XbK425kBkC', '76b053d859577912240011861e307d817d082169acbc8d467b27fb24f84f93e3', false);
insert into user values (90000249, '荒木', '勝許', '1970/09/03',90000019 , 6, 7,  'r.arihara.sys20', 'l2r7FKAyYdNBACfxJQLkvOjXp0eJlF7W', '83b307f8bf7c9b8bdcb0c55b31308f2236d162c7f39d1ee7568671357b329385', false);
insert into user values (90000250, '竹本', '朋美', '1990/11/27',90000019 , 6, 7,  'r.arihara.sys20', 'yvOtEntxdttLINF6WeCioc93XpkUdWGB', '930ae407d9227534951217fd5e92b65ab64789b68b12c19465b29d4b5c303732', false);
insert into user values (90000251, '丹羽', '眞八', '1970/05/03',90000019 , 6, 7,  'r.arihara.sys20', 'MyM6P0RaetcC4Hs41vZwW8klmKK86gJk', 'a70ced72e2c3633404457be4cfa48c6ceb68080afcc45386d8ce8d295872eecc', false);
insert into user values (90000252, '溝口', '英博', '1973/03/04',90000019 , 6, 7,  'r.arihara.sys20', 'jpSnkn4nWLKc76kPcgTHI8mrB7oBDEfD', 'c9b9a6c634e41dd2c4915e8894d2b7ff1921e94c56ec5a226a765a1253c9d560', false);
insert into user values (90000253, '笠井', '心一', '1986/10/24',90000019 , 6, 7,  'r.arihara.sys20', 'TWkqKOn5DH5dVWDl8niiZPwVv5qbjZSS', '1f2b7adc83073b7a44e3ed7a670041f3b87fee633496b2f25019c2d2430fa9e7', false);
insert into user values (90000254, '久保田', '征二郎', '1977/05/14',90000019 , 6, 7,  'r.arihara.sys20', 'xLGLalOPGUOLxDU4AZMHWoc6HrXwBo5R', '9869423a0592d501ca565f99f3fe3e3b6cabbb93ab226bbef529d98d4fe97205', false);
insert into user values (90000255, '藤村', '友幸', '1974/09/21',90000019 , 6, 7,  'r.arihara.sys20', 'a8FJpIzTKKlGdq2ChCsEi8tCAbxlyane', 'db9347f9ed0f758e48211cae910fd1e2e441377cb2f1680e8f1311f249db7715', false);
insert into user values (90000256, '藤野', '満生', '1988/07/26',90000019 , 6, 7,  'r.arihara.sys20', '58EVEA7RTGtheLtfntXRidCvG8CQyd1s', 'c4895cb972c5ae7efb6b6736d90dab3e028ecc0ee58c79b8e213be6adacfbed4', false);
insert into user values (90000257, '長島', '征二郎', '1973/07/17',90000019 , 6, 7,  'r.arihara.sys20', 'Q3mIOULzBksKkW19hd7RGAKLDuJ4DbS1', '3ff9bf1b0e3381418a8b6220d488b6b4fea8bae305aa002fd7c34b70abf0f41a', false);
insert into user values (90000258, '中山', '久哉', '1993/04/09',90000019 , 6, 7,  'r.arihara.sys20', 'IWOfoXMUe5JIHqlJHD1pZzuwJwpcPIea', '87df61c9a6369237b2842c90e083e8e75bc83d0c5a7353d7ed0c7788a4916479', false);
insert into user values (90000020, '高島', '眞八', '1974/03/21',90000005 , 5, 7,  'r.arihara.sys20', 'dysXNAukj6fbzI1FlWxfWI20oYLYcX8q', '549d9c384ca58948797c0ccc7523d89b33487c134e8c9db5d395b75d2afc28b6', false);
insert into user values (90000260, '足立', '一馬', '1977/01/07',90000020 , 6, 7,  'r.arihara.sys20', 'BS3pmHewzEzNEe58XMoUm6TNMm9GmIaF', '2d2f1fd93a6f95cd45a7c741d1d92e8ccf88aac7792d3c72397b46b1423fcd92', false);
insert into user values (90000261, '南', '静市', '1993/01/03',90000020 , 6, 7,  'r.arihara.sys20', 'QBwDvKBHiifNYigJjU0UaUKWlWRzQ9LG', '670a2737e857b8d568ce65abdcd12b661cd7c3b9ccdefcad7c3db84f22b78885', false);
insert into user values (90000262, '浅田', '鋼三郎', '1989/01/19',90000020 , 6, 7,  'r.arihara.sys20', 'YMEZMt8ZHet0q301vg8C2HwXuyX0tBi5', '0385949683a480ae9d866c831e394291404b2a4823948aaef893bcc844205338', false);
insert into user values (90000263, '森岡', '祐美', '1990/07/29',90000020 , 6, 7,  'r.arihara.sys20', 'AACbx3GAbeyovbNetvQv7H7POTl8accb', 'a5002661c0ce76730caef0c650c2da3b55d47972aa403d4b8b040d414daeb22a', false);
insert into user values (90000264, '森岡', '眞美', '1992/03/11',90000020 , 6, 7,  'r.arihara.sys20', 'CtnPhfN0Vwzixh5C7J1lsMhjmQlbRblE', '23efd0165fca2af04f754e23ff8366f6ae020fb67049a59ac34bf6e012728dfc', false);
insert into user values (90000265, '岩田', '邦美', '1986/10/24',90000020 , 6, 7,  'r.arihara.sys20', '2eK7NUW6cvfQYDrtDdfeNBdHlArRO6Ub', 'fc0dd705948bd4fd210e81376605277b2cf0d65bfb9c29afc85e54727edd1a14', false);
insert into user values (90000266, '石黒', '富良', '1974/06/02',90000020 , 6, 7,  'r.arihara.sys20', 'H6EtgoMR1drk08Z3JeloQXmEIUgLmESE', '29fd489390dbcc10b50b37bcf355baebcc821d160ebaf44aaa70b80684eded3a', false);
insert into user values (90000267, '久保田', '一人', '1977/05/14',90000020 , 6, 7,  'r.arihara.sys20', 'u5luNfN0JXhMSqANJVyiMjpfLZ6ID71J', '32bfce23906d008ffe8f75169910aa26e0f683b53703447d5d3d086de772f5c8', false);
insert into user values (90000268, '大谷', 'るり子', '1991/11/19',90000020 , 6, 7,  'r.arihara.sys20', 'tlIHh0fz1cjSKFqTByjNtuJwqLVfRDFd', '2e97a8660f40b141b8fe1436064c4f227050e36e5590f210ee5d802e59ad11cd', false);
insert into user values (90000269, '竹内', '金義', '1980/06/15',90000020 , 6, 7,  'r.arihara.sys20', '7OEEOcooFakMqIUQdwHNLuZaGJ1Xj2RL', 'd29925ea618f17f4a49122c23574388cd4d877182abb0331d9af8fc63bd636bb', false);


select a.user_id, b.position_name, c.department_name, d.last_name, d.first_name from user as a inner join position as b on a.position_id = b.position_id inner join department as c on a.department_id = c.department_id inner join user as d on a.boss_id = d.user_id;