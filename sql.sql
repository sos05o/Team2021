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
    first_name varchar(32) not null ,
    birthday date not null ,
    boss_id int(8) zerofill ,
    position_id int not null ,
    department_id int not null ,
    mail varchar(64) not null unique ,
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
insert into user values(00000001, '管理', '者', '2000-01-01', 00000001, 1, 1, 'r.arihara.sys20',
                        'Ka8WLaPBTzfwqFnsus91vpqLOpsjXZOW', '776d7d51b1e6d71bb0cb856e1342e937bc37bd0391b9eaec8a2971358e73be44',
                        false);

insert into user values (90000001, '社', '長', '1990-01-01', 90000001, 2, 1,  'r.arihara.sys20+sub1',
                         '5CNM9MYyHud7OO0Y8t4UdBvlFK2khjfi', '624bf532af7dc9ba0fdab54f760ced1fd7432a5fc46c19c4fd07a089f006ba9d',
                         false);

insert into user values(00000002, '常務', '取締役', '1990-01-01', 90000001, 3, 1, 'r.arihara.sys20+sub2',
                        'fqxSKShzGHkT2bjU04RP5kYEsf9CAzSV', 'e70de723406741b35b7617c9e4b77e3dcb1952fed0aabc737ef414d464f2fbde',
                        false);

insert into user values (90000001, '齋藤', '準司', '1992/11/18', 00000002, 4, 3,  'QTg79UUSfsZeZouNHGwKEtgc0S3xNQBU', 'd9AZElxEsYb1dEJmjRpOjVQSuLUMbpsZ', '7e1065dc19fecbaa5f3c577cd454bbf7c69c5aba7e6b1fc6299130d1e6dc1295', false);
insert into user values (90000002, '高島', 'さやか', '1990/11/27', 00000002, 4, 4,  'g6I2j27hL3xIXryVXBfhgKuzIqh0ebhf', 'SDFAI3uGVkU6bFxKsuRfTWtQgvLQfxWA', 'd5225c594b1f7b0a511f472678ebf76ab9f7b5dfc4f39d8c00a09013604d3eb7', false);
insert into user values (90000003, '谷川', '勝許', '1993/04/09', 00000002, 4, 5,  '1u5gqbFgBaJxyaKu9BO2o2evuLmweNp7', 'fHNQV0jnRneMakTZ5RxI5LPAPZEC1oYq', '3fa97449d5ec9601528a9c788850cb1db90da167bd3b49b9eff75637b3b0421a', false);
insert into user values (90000004, '荒井', '友幸', '1977/03/22', 00000002, 4, 6,  'xCyVeRAPEjjnC8FirTts3K5PRomZmyWB', 'V4M5YS94eRv4uqtDEz3bTrOp3JFB45sj', 'dd50f238d2ad49b43440dd6b76455f1504508fedc82771bd976d19d5ff033738', false);
insert into user values (90000005, '及川', '希和', '1977/01/07', 00000002, 4, 7,  'x0vXVnV3NIyCcD0Uh0Yr3tJw7AOjaDy3', 'KIPQugLiz0tfvzQwLrdoqd1JhV0XGreK', '5f9f93518430fbc3db57e5a1ee4c43545033a4febc7300a75993cdedb57d573f', false);
insert into user values (90000006, '入江', '幸信', '1978/10/09',90000002 , 5, 3,  'WSuxS2esWp1aMXAMgzjXaco00TyZOBog', 'FOH2LlXWtQAcb3svtX8eS90l8Moyhge2', 'a20fd5527a93f9fc72775345252db8205eb8fdebb80be3ad19cec14c57694136', false);
insert into user values (90000106, '小川', '準司', '1970/09/23',90000006 , 6, 3,  'mBUlw1GzPfuQ87sHiuq4AAgX4LQNLMWM', 'YGodH8Y6SRA4cXOnqFzqWu1PRLVwAC98', '9fa21ff3830507597240cbbc69884375204dc00d7a757ecb3f4301269c61cafd', false);
insert into user values (90000107, '菅', '美世', '1970/05/03',90000006 , 6, 3,  'G790qh2QKDpOPqHNwP7RObpZhf6jtRPF', 'Ig4rBzbMaflx1NfORlRy1GuDu3oXv9Ku', 'd95b470193d00f617c0991f4508e5aee68f81537842e4db3dd57eae554f1f956', false);
insert into user values (90000108, '大木', '幸美', '1978/08/12',90000006 , 6, 3,  'NeN2oeH636UmKfODtmoz7kupzBzYhc1w', 'd7yDV7hfMkNPgCzlmbcENqjpBrt3C8be', '53881d65949116b4cefd2ddc2697642982b1993f62e974897f43cd58dbd6b615', false);
insert into user values (90000109, '大森', '朗夫', '1972/02/25',90000006 , 6, 3,  'YdwWpTNwVIhVwkRLB0qUtHYV12OS6Kaw', 'mW3K7WevgkzEQNrAmCfbCTQORAJy2xcz', 'c0d534c2e87e450bae070f3d14b3d9e2e66fd97436b31c005b0b598095668d57', false);
insert into user values (90000110, '藤村', '征二郎', '1985/09/22',90000006 , 6, 3,  'HcXa5C8FGQCgUzth11c8ze2dvXUP0BLK', 'Rcv732Eg0JD0zj8Qa5g4h9NPaNQwAVSB', '2347a70f96d742f2dd4bb11006753d6c360b017c23876e5cc48cf6c1c405613a', false);
insert into user values (90000111, '中山', '洋和', '1973/03/22',90000006 , 6, 3,  'x5yOJSwZ9GTutlLIIEm9WT1wCHONSnqI', 'I0Dm2icptBUV6skmSr40qAscgvl6DJn0', '03dc35d68ab72ace0d27f80dbb12cfb09fb67d3487af16ad948af52b48246097', false);
insert into user values (90000112, '大木', '織枝', '1973/03/04',90000006 , 6, 3,  'NjNZ5uyOolBPban05tTHxivqCAXd2Y7D', '0sp5cI6RqH6mfGSFHUD6qHBJBXwBT1Kq', '07aec8e1f752391e0179881ec7afac1de2c8a9dbb66018dc6a540586ab6a81a7', false);
insert into user values (90000113, '堀', '僧三郎', '1987/06/10',90000006 , 6, 3,  '6wuRi6fGenHhc4QZiKgPbeobK45OI7zs', 'N9fyYR0BrF1nSxMYbF3bC8WmAYjb3wqw', '1641bcba20facba0f64c336c4411dc5a3a25aefc1a9e4f3d363b29d17a17cf7c', false);
insert into user values (90000114, '長谷川', '稔郎', '1985/01/07',90000006 , 6, 3,  'Q96f3wbOzLrLfzyaR7N5JWNuEw3Q32bD', 'm898CdQasGIHQwF6LFFSFPDO4UrePheL', 'da9dee86727e37054f70adf743a955309aa415f7b352b7de3a781628c762f5fa', false);
insert into user values (90000115, '高野', '満生', '1978/11/01',90000006 , 6, 3,  'mCAmKUXs6ERikOaQnEqdudhWSLeEufXI', 'pCebCQaNtNwHk3U8DuNm58GAZ7xDLfHj', '52e72421e2909ef590da063a5e78e0ead2b2adcd5f0b08d1a280b27ab2a1dfba', false);
insert into user values (90000007, '荒木', '一人', '1990/07/29',90000002 , 5, 3,  'jcCmpYnzfQVESbVcEkP8WPb5oXaZ3AZN', 'AHE1aYbNnoDBlzYOhO2iYBuAfkL5DsWx', 'b19fadc5e3a52962cd4fe2bb7af1c2ff73ee09a547d8017e69336014c636e116', false);
insert into user values (90000117, '竹本', '織枝', '1980/02/16',90000007 , 6, 3,  '0T9D32pDkQuQoDHoJ5Ge3fOLoL6RpCXL', '4XT6UpWkcYGyfDIwJxNe8wYH15EZKDlx', '29a1959378b38a585d855e0f462962ba9643aab8825a09d05663155432b48a3d', false);
insert into user values (90000118, '古田', 'るり子', '1993/04/09',90000007 , 6, 3,  'zJNwwBorMgCWjWK7Eeim5yUlOig7OTHh', 'OQcad2tYC2s39Pnqg8u7hoV4IS3uvYpS', '8b20748249efa3df300a0a9646402d4785a16151c0efa44d3e50148df56bd0bc', false);
insert into user values (90000119, '石井', '幸美', '1984/12/30',90000007 , 6, 3,  'SDLKmGYfxILuyVA8ydsgy8jgjSVCYIKM', 'tAO3dqIuAYnakOWt1ZgYdox8Xk39HOTz', '6cc8a908ac4146ffb0c22eaccf3d09a86bdc0cf291d3b04b2c5be26e71f841d9', false);
insert into user values (90000120, '土井', '僧三郎', '1984/01/28',90000007 , 6, 3,  'L0Bbscuxv0Z7hX9whIgxTMv1JBw3M0Hb', 'cJZ98xaDZo3zcIdJqRvkktHvbGRdAkrD', '13f5b333957f797f1ff359cd4971a94d63d30e597b7d92422291aa7395ac7508', false);
insert into user values (90000121, '石原', '竹一', '1974/03/13',90000007 , 6, 3,  'hxe3bFYAb0o0lB2yTdHN2vGAUKlsOZnm', '0ta7eye2twxYVPamxGnsUPxbnQ7oTfxZ', 'e815226f072c6e1e504b0dfdbe8c09ef702ecf1d388d4773457897074d26a623', false);
insert into user values (90000122, '古谷', '智', '1977/01/07',90000007 , 6, 3,  'zbOULSyORQ4Qzpf5C1njv5szmNGQdEq0', 'R4YBb0ZYifllQHYugNJvFZb3uxjSPOC9', '715a15e4a96d09ded07048bc61a4906de599f413ede1d5863d29287751e6373b', false);
insert into user values (90000123, '岩田', '喜代信', '1978/08/12',90000007 , 6, 3,  'SKUiF5SZGxmZCoiiYrFPvPiFd0NhcHHP', 'RiynS9hLsr1otUUmbMHtXi4EgyG08HMd', 'aaf4e3a40875e1efc18dff80bf141743fbba6da2d0881685b82d8cff49b849eb', false);
insert into user values (90000124, '滝沢', '三男', '1978/10/09',90000007 , 6, 3,  'ZAtc77lUGSTj3aYxZM0QmHpheKuCqojE', 'BVEXmjx5FAJUU1N36hVzj82iDciAvgyw', '4b399b3ccfba91033ed8945597f1bc0422abff10a750eea3e2772528079dbae0', false);
insert into user values (90000125, '新谷', '迪子', '1973/07/17',90000007 , 6, 3,  'VrtvKW8yl4ZOMcy3tdpN7RDiLl46GVVP', 'k79vD0oirQjKNriyRB76IxtVf0gixob4', 'f43afa6a2333774e862f4b3db355054c928ad4b875c494cf62576ba66cec87ec', false);
insert into user values (90000126, '宮本', '久哉', '1989/02/03',90000007 , 6, 3,  'XFuvpqb6gD551X5mo7jw8Tkwm4hf9wkK', 'W1lxbn7PPGRQYv7PxOimOxRQNkiWSOdt', '9f585e6caa8037a1094a70782b37911c0a2a663d92ab53061c2b4b3d5538e079', false);
insert into user values (90000008, '平田', 'さやか', '1973/03/22',90000002 , 5, 3,  'fhpcHSKU3E0kGzmM8n3owaeeSUCiXUFa', 'H3ibsdH3IAEpMFWlqoltIlbXQA8UvFJG', '32c772efba0648244abf0a503c05b9ef67ff2926e3cb67575dc95a8610d81a77', false);
insert into user values (90000128, '岩田', '眞八', '1991/07/29',90000008 , 6, 3,  'SiuA19Qc1u1Kjm012SXaL5ThaFnJXldw', 'vn4E3qMJrPoVnQWLPK8JFwYceTgyMZtw', 'd6a60a742d064c36e250e073998bfe9d5a2a4b13c0a78958c085222ebf97be62', false);
insert into user values (90000129, '浜野', 'ひとみ', '1989/01/19',90000008 , 6, 3,  '1XnTVjCd8XtzPxUn48xp26iYp6Rcbpng', '165JBsjlzD6JR17wTNCoAEdMcP9F2rs9', 'bb0cd6ed7aee485a51ce928f7d40104fbc0e7f0af46b8ef6196371350afad04f', false);
insert into user values (90000130, '石原', '喜重', '1980/07/14',90000008 , 6, 3,  'DHHGKyfT38IAYhjrCJefMMKZkMrihyAk', 'bmO4BDibHq77RWlmnKNGzopoLHZKNWSR', 'ba7deca19d513f3755a8d34400571b61b345f966ae1b4c7ffa515647d615fa38', false);
insert into user values (90000131, '大塚', '政治', '1985/03/08',90000008 , 6, 3,  'kbky0RMWmaPfIbgVUXbBOBQeK1GOEnQE', '5bjLgOv7QptMeQhcZndWv1kXOOGp8Beg', 'ad28223a0e1c7011135c749dad617fafaf7d12e9798b1ef301204a168ce1f34c', false);
insert into user values (90000132, '豊田', '宏季', '1976/12/31',90000008 , 6, 3,  'Ctwdz9OZRWLSGXWv88sgxRvQwOrxhGG1', 'N0lXyI0h9KJi6d4Tap0VOJo5yTv59IWy', 'f1893cd5abe1f6db5f3e1a1affa0447b4f3a5fece3ac8b0be413cca260fb8bb0', false);
insert into user values (90000133, '大谷', '圭織', '1977/12/20',90000008 , 6, 3,  'dzqu7SWxfDNOUlzaozLdfcq2L70mBB7m', 'JB7R3VTgPuw2v5b8CmB9BdJuy8HO6DCF', 'd408381244ea9da96696fbbe92d10a877fa4e4bb4dd87e6a9dc177032de263de', false);
insert into user values (90000134, '滝沢', '幸美', '1972/06/14',90000008 , 6, 3,  'K1qm87hgFo1bpp0jQEiBKHbqSfiBrRSB', 'RbuApoFYTO6FTVUgomTZTIgzqZq9Mud3', '2e57aef2cf1d93264af28fe82198422b4e422b43ee4b0d281e4eb0bd5d879693', false);
insert into user values (90000135, '荒井', '信平', '1976/05/09',90000008 , 6, 3,  'sqWDWjcdOIH5YrEjU39VnwISfwHRQMmU', 'NGhrD48RdbcfLNvSca7lntHtQfXtIOM5', '1eef41cf7b7ac4f6726f1c5feb57297a52131582825855b6ac69df3e0cb34400', false);
insert into user values (90000136, '松田', '聖誉', '1976/03/11',90000008 , 6, 3,  'jKnrCEZzYOrnBDXm0A2eZXcQP1oSPLpJ', '2OTbUwDdpHSLkp47eI4T8HzGfPdR85mG', 'df4f201d3c0573da73e45dd60516b0923bc10b678c1bf1a5be2ea0d3d24694fe', false);
insert into user values (90000137, '大谷', '公紀', '1978/04/15',90000008 , 6, 3,  'nhcmwf4LYo3tAsxtn0h7ZxzKxSkjo1jz', 'RW5M5Tmv3z41WlG1QOuEAVk0Dx6o0GR3', 'dcc7eee024f505204380da58aac5490b40304f4251c75e7576efda6b0102a0f1', false);
insert into user values (90000009, '竹内', '洋和', '1990/07/03',90000003 , 5, 4,  '9agqRQQg3MEJlVLd7wAEl6WQVdZAaEkd', 'rc7x1Uwlqjy69aeZlEZbjLjqrxHUcFda', '8e848686625b0b8ec47bc4a1426cc3e2b2d15ff6d106492c11939a708b23f261', false);
insert into user values (90000139, '石原', '一人', '1981/04/07',90000009 , 6, 4,  'qu7e2voj3pAIstvAjF9dfXaUxOtM8rgQ', 'DKbs7tmlJXEs1dF9bih3tQkzOS8vnzXS', '293de25864ea37dac8cb243773918929fe3324016883d7cd7c6441bc647b6af4', false);
insert into user values (90000140, '高野', '一典', '1980/06/15',90000009 , 6, 4,  'EzLT6S3FJqnTBPpcj2PaN8kDyJ5i9MXo', 'nQ1MBVAJFXc4XIFju2qUpcArmaMITf4v', 'f8c56d8ee50b599178c528a1c0ee37cddee73e54f8f4d13ae7be75cf8c128eb4', false);
insert into user values (90000141, '鈴木', '聖誉', '1986/12/13',90000009 , 6, 4,  'RtD7NjPosnyR7VqY1ITRuluONkzScABV', '9zXxyojQkE5FYtAjpw6bHlekXDz6LPu7', '04009e001af9598bdb6da4aa6e031d27bb1b281ad324047ce45a797a83386b88', false);
insert into user values (90000142, '畠山', '静市', '1972/02/25',90000009 , 6, 4,  '0ckRwiaxTZOe77ylTwdYaEb21j6BMr9y', '4jgklrRxmVqoZr0l0r2i1gJZnXgJMl2C', '1e5fbcf7012478aeb76b2b1096d4a8e915604d572a45a111a40edf4ffd6f4c5d', false);
insert into user values (90000143, '中田', '勝英', '1984/07/06',90000009 , 6, 4,  '90JZhwgEm50pHTYRjSdeagO6NN1lsg8y', '9ihMGzMxkl3ENI6aek2XjMaXbQhUCXDK', '86382553182a51cd489c976c3e9de65117d861908d7f6b95beab99b2ab88bdb7', false);
insert into user values (90000144, '早川', '成美', '1984/12/11',90000009 , 6, 4,  'jwHcgAL3LaBgrAQJbFWgNGih3ZG4CrFD', 'Ssf290sDE94vN6ZBh9L2w4lMufF42w0z', '20457f41ca2c3f491606ef4835b12db2d3f829df131741ed9e1cc5da2e74fb85', false);
insert into user values (90000145, '早川', '十志夫', '1988/04/09',90000009 , 6, 4,  'Q9qXvKt0fO5UMF80IJXXYh4tLwO4y8uB', 'ZVgYlst4twVSgkABY5L92zoOC5eGlGl3', 'b2cfc693ab3510812cf0be90b5bfe143249c0aef365eb44e35f830912cb07f1f', false);
insert into user values (90000146, '坂口', '新太郎', '1978/08/28',90000009 , 6, 4,  'E6FF5DK115IH2oAfzvUXetNgubEC3ktU', 'uMSvxux7Yt3F70ngoNSs1GQqDqelDAwS', '6f39aae4c4fec43e48635b759c43e8139cad19b9f35a9758d61e1f562074b5c7', false);
insert into user values (90000147, '萩原', '喜代信', '1974/03/21',90000009 , 6, 4,  'egV4CDoY01zsk7cEdLjLYhAaRlvos1Uc', '7IqbCDFOrd1pZx9dEKPCjIbSBD4186t4', 'ca4873e031eb0120d815a780d7cc6095cfa09ab41daca31531083344ab084f8d', false);
insert into user values (90000148, '藤野', '恵治', '1976/12/31',90000009 , 6, 4,  'D3MrHXe0Tz056MAH2Ybs4ndYcgX3cle7', 'JBiTA7nCkvhMdHz52MvzQcNA405lX1Zu', '5892fa16f33ca8aa2e067726536c0211fdf485421d24454ffcbe73e4736677fe', false);
insert into user values (90000010, '齋藤', '定二', '1986/12/13',90000003 , 5, 4,  'LJ5gPl1MrvyYeSrhv1LprEG6OJSO9w4l', 'UJ44Re660FADmKDccQD0Ct7KrhqUQj3c', '1c992c1ba3ecd1a5cad440ebbaf5176805aa2aa7f779b3370a3511bd6efede2f', false);
insert into user values (90000150, '早川', '保行', '1972/02/25',90000010 , 6, 4,  'e1yfweAXd5luCnK4KSwLUfxc5KZgozoa', 'ZX7tIT7UlvFWEkcEV9oCve6CbBnVBqIS', '7019e15ddcca86e2a0663a42a96f53fa98e79dcc8f01e37d81ac7a9968d594a1', false);
insert into user values (90000151, '矢島', '定二', '1974/03/13',90000010 , 6, 4,  'lCKwxuUnLm7ySRjiEjEZEpiHTkrbjLSa', 'sgnk4Uq3S0aF5cpqTwB5k6F9JeeX7Z2Y', 'ba85c5b1b363de130f6113f39f4e9b7f260027c39365ee35b8c3c5ebf6d76087', false);
insert into user values (90000152, '矢島', '眞美', '1975/07/13',90000010 , 6, 4,  'ZbHM8R3VOOp4r2P8IpCb1dyrNqu20b0M', 'BurHu0BTKvcUzkZHzFlaep6l1jwyeRlH', '28a68aefc2ca1654dd9e8b07b227290b924d721c393dc616011e58adfd4d4e6c', false);
insert into user values (90000153, '小倉', '定二', '1974/06/02',90000010 , 6, 4,  'fGpNUmt8kocNBU5MOOrTTW9xvoya9EmD', 'S9h6i79rFbybUD5njeKQ5xjkeugZlORa', 'e9617b392fbd7c10425314524d3a7f8d01cb097360b168c9c978affa99a60625', false);
insert into user values (90000154, '福田', '淳子', '1993/09/24',90000010 , 6, 4,  'aiPzw2nw9HlqTrUEKTIrQ4e3R9ijtQBa', 'lu6ZY6BWbsvBk1WoXag3URvDUzE0z9O1', 'c7215e1443c766f647835f5d44e48f0d87aec2fdcf63c34a93fbf95b1fc22ba2', false);
insert into user values (90000155, '溝口', 'ナツ子', '1993/12/04',90000010 , 6, 4,  'QFCYFa5HmICrnWCUW4P8XgsvF0t5Ze3y', 'BzpQXHDGeULYLtOuFU8AepLsTFi69dP9', 'c5480a4fbfff119cece88c72364389714388c683c1d1a989fcb132bbe5157e37', false);
insert into user values (90000156, '足立', '織枝', '1971/09/18',90000010 , 6, 4,  'tMPe5NAst73ZZkDId605pMilvB5zK86Q', '4oRquCXCzzKP1YTOd5NXklavJMNa2d9B', '99c646e06d8c68fc76b88cfec218b3c8ff4f71f21df87ca8de0790821e9085be', false);
insert into user values (90000157, '町田', '友幸', '1980/07/14',90000010 , 6, 4,  'VYD6vNuLWmA19NUa6eA8w3SV39QQh0TT', '5OR9WQZXx1vkDQWzlC7jcd9eND34kBA6', '7b83c57fd3fb41f67307d5d90a531ae19982eb909548afdd0d331d6672a9c051', false);
insert into user values (90000158, '古賀', '幸信', '1990/11/27',90000010 , 6, 4,  '8fvRl5MGOl9bVlVJqrwJoUtwsdjQuhhx', 'F59q44dIOTCJgu5ZDBUIwRWGGqaA6xul', '72dcb0cdfaf2c976b679fb9016b6fbec58dc0911a260c68ad7d8b4b005443049', false);
insert into user values (90000159, '山岡', '健生', '1992/03/11',90000010 , 6, 4,  '1FOeUfMMWNlhT8ZA9Ppr2amx131a8NnB', 'voLikRVnysCiJa8bU8rXZkhexM471rqK', '8f2268b10008c25f460ddd8b4f096ad1bc36c0424d9678ccae9947874bc56902', false);
insert into user values (90000011, '大森', '久仁夫', '1985/05/11',90000003 , 5, 4,  'kBEAmD4IMX2mgZqEA91ga920GyZGS6Tp', 'kKEdQqtKMJanxXZwh7PD9LMMXqeeZjB7', '1310b47311e1ed02085a4479a4041cf41c6333e3e0695074c174e666a5b7ece7', false);
insert into user values (90000161, '久保田', '亮子', '1978/10/09',90000011 , 6, 4,  'iynhOPNnACTwuEKqZW9V2wX8VeS7lFug', '2DcShv3hU1G30kXmcSjwWEuqC5kS7BX0', 'ff7bfd98c578ce10a70c1fdf5de2eed2bf03d3f56795f099ff050993368d4f31', false);
insert into user values (90000162, '高島', '定二', '1971/12/27',90000011 , 6, 4,  'B4yDE1F65ZNIYGKwRGRP6p4cvA8HcJ0C', 'yxs7vSJgvnsrDO60tSJT6kxMCsxteI49', 'd97797233d548efe68713f64880f50bbbb45a7bf7d583c892b136d36d615e0c6', false);
insert into user values (90000163, '谷川', '友', '1992/07/15',90000011 , 6, 4,  'ZxEB5hO177ZCMFq7laWek52RayaoH4Rj', '87yfZR3N7PmGGen6KaItf4pkdNjwFRaC', '9c5519e02079d67f2ab01ec430e265c7406dc1580610444f8945816045ffc09c', false);
insert into user values (90000164, '宮本', '玲', '1973/08/09',90000011 , 6, 4,  'o4ZXftluSU4QTQbeWfzLGdrjWqOMbhyG', 'wlEDWXE9bwbidaxZG4lQZ0DvMyKmuBde', 'a76e785136b4d876ad704e6046831b2e26249ec47964db20523e463f7654b2f6', false);
insert into user values (90000165, '竹内', '喜代信', '1972/08/11',90000011 , 6, 4,  'kghfFuTNnp0jhoy5BMaHEJs7CI1sAxmx', 't41DDyLvwQZhOk0YLswtlYhO8prX5qOJ', 'bdf59a9457563d9433967134c3481eaa9421a221ef539869e993091cf35dcdbe', false);
insert into user values (90000166, '竹内', '道彦', '1992/03/11',90000011 , 6, 4,  '95gEksQSyZVtYsIjlL4RbeObZk1v7rVv', 'bpOVpT7aIp63HoryiyXuFV8v0y90vUyf', 'b331ead92769bf7942462e37ac272932126cc68a9f4a973122fcbbcd5ceb8221', false);
insert into user values (90000167, '畠山', '満生', '1977/03/22',90000011 , 6, 4,  'IBrdfwFI7pteRNANbU1NycejQ1Qofv06', 'Z2Uq3gNjv6NsgHALHgWy7DgoT6NMlEdy', '675bb9823cd577da6d5eb5b3b621a229567a1e8b6b0b733dc11eaef2060736b6', false);
insert into user values (90000168, '浅井', '久仁夫', '1991/07/29',90000011 , 6, 4,  'Qp3Jw8T7n0baeIONn6b39MU9V1RNDLnk', 'EQkiHoryIipureBtuz8tEbeVMZdtadg2', 'c7002092f35ab96c2cc36d7b85b17179bbf766ac2c43119d765ce80d2c17b972', false);
insert into user values (90000169, '飯島', 'あさ美', '1993/01/03',90000011 , 6, 4,  'yPh7PTyP75AwdO7YlIrwKhQjbEk00CjA', 'lksK50PD4xG8p8wBVRvZgxwxpYgOVL0L', '6e2843dae5c9ef8511489931691a790c4ea3c6b2eae039c8013a9cfdf23b0be2', false);
insert into user values (90000170, '鈴木', '沢子', '1978/08/28',90000011 , 6, 4,  'oC1BrnsSZKDDXDTkNe6iTgKiWGjWIhqY', 'NHI26I4Bk4t0x4Rdl0mRtbos2tD2S1YC', 'e211658e5e5aabe4959d24683de358ac981abfd9f7d2d2eeda4592eab39ebb68', false);
insert into user values (90000012, '高島', '義幸', '1977/03/22',90000004 , 5, 5,  '5jSAPihbui5BWHqLvGHBG6xrVHOH16Cz', 'nVRsAdjW4PFz9oQhkvQzQ4ehZMqiU1mS', '6362754da6e7e06b7b536367339bd7d4b48df04aa01b5bdcec4575d84ab5ac6d', false);
insert into user values (90000172, '宮本', '稔郎', '1985/01/07',90000012 , 6, 5,  'xbl1lJNrdfdqnQ2H9ruKJ7WBiuk9Bk2s', 'hfEXc5vObsUywAuvHAqgpwF4Qb9huDrL', '1203e6e2fcd491c982c3af23280056ef7a8ff8480b98e19705b0f737cd2e0b92', false);
insert into user values (90000173, '竹本', '心一', '1988/04/09',90000012 , 6, 5,  '3evwAeDgREqSwUYNNix6GtUkklNHTZAa', '438oHcdOBAbLeVaqHVRLxnpRBgqiLEAx', '77be32eba5fba797b9d0f1da6874a559f4d227ff935a942a9e2711bdd9cc6ca9', false);
insert into user values (90000174, '岩田', 'ナツ子', '1981/05/17',90000012 , 6, 5,  'xnWwNlqL9j5e3RdwroHY1wi0r4EAst2g', 'pZXJzVlAesk5r3OMD0Ag8eGvVdEkEnd2', '0b0bc1f8e55553f83e7df5ddd8e04d3ec8a0ef624edc3b1a029c54f3962881ce', false);
insert into user values (90000175, '入江', '久哉', '1976/03/11',90000012 , 6, 5,  'KNCu1wOsZJlvKdR3nPNNHQYmtKVJ7fr7', 'sC9AdWVpbx2oMXIqWpzJeztrLkHSuYUr', 'ca8c48f3807263a29e90e277bad600e88151ba8d776584ec72d9c345592209e9', false);
insert into user values (90000176, '足立', '定二', '1975/01/03',90000012 , 6, 5,  'bm0vyjZPVUGJQ1MU1qXYE5eML0Wp7B96', 'V7RbnjuUK0oQBBzlKWWTaf2ahJeymczh', '42d3b4c203adecf88ea848ea2f13ebb0ff335e8d6ce718a3f85d0d6b5dbd1d0a', false);
insert into user values (90000177, '長島', '祐美', '1984/01/28',90000012 , 6, 5,  'xDi72pjaVjhCWVRcaIDM5TyZCm1WEolk', 'QNL4vyiLgy0Z3EliKF7plEz8XAyjCo8I', '95a9429510d4c57e090a1d21ba7452a4eab7bb580cc32fcd2fd8d1425d15b14f', false);
insert into user values (90000178, '竹本', '政治', '1992/03/11',90000012 , 6, 5,  'XxcEaPbragqaElJozLlQ8yY977wmCo61', 'gF0j9k3tZmavIQvmISAGKMwpW6cSjlkH', '8be8f5fdf8ae4881e09c9aa79a2aba8aafa8e6e3896f3ee6d7ec75615155442f', false);
insert into user values (90000179, '松田', '竹一', '1985/03/08',90000012 , 6, 5,  'd4400gLNrT2MvUstJZdFKYAOoefo2d6B', 'pVflSY3xolud1dWc5alOi4Ejei2YXSrt', '4b1708db4b1ac8044f41a975f029cde2b89b5ff2cf153c6879e050e97e59f5e9', false);
insert into user values (90000180, '大木', '稔郎', '1993/04/09',90000012 , 6, 5,  'YhjzbukRDvNNeVeUglLSfTUBZufrZIfG', 'aYFnSkt8RfnZsEknBGOeCGkU2NGwxfmf', '0b6ceb68d1b0055e1cb5b542ea3602ff9d7ee9dc2342ec30bd255a56ff868a6a', false);
insert into user values (90000181, '三宅', '定二', '1987/06/10',90000012 , 6, 5,  'tVvSldp1jXGHL9fiQHJYS5hD3Vsp513a', 'I4Tk1hj5UhDGq2oWap9lEp0x99Qsn0U9', '30b620e2a370ac752190e00d690bafc7ff2289af2de978f8835f93513012475a', false);
insert into user values (90000013, '本多', '成美', '1981/05/17',90000004 , 5, 5,  'XjAZrOU6XRwdtqWgbC7fIQJEdkcg1jv7', 'HHBdcGLmU7AuHE1mYKI0trggCjQWB0fM', '2c8758068b4e46f428fa183a6b73fee997c47cf2d50717cbbe480152e98b8adb', false);
insert into user values (90000183, '鈴木', '喜代信', '1981/01/28',90000013 , 6, 5,  'fQmlJhRVJejj1idAfzoZMEmjIfC0Iysw', 'EJhJPB3TEyC4d1IrPGenFItq0ZGIE2Y9', '1ebc738e5db7a632d8cd674ce4f6f217e42fd479a9ba6b9369f2502992b6f7e8', false);
insert into user values (90000184, '森岡', '直幸', '1991/12/12',90000013 , 6, 5,  'FP8LptK04mOqNLAAAWGSDhXndorVUQ5b', '2RTKhw2mLO4qsW24ZfesfRqApnYXwxsv', 'ff47721086334acd37032fd92fed79c09ee215bef4657cb75b81956ea2b1ecd3', false);
insert into user values (90000185, '土井', 'あさ美', '1978/10/09',90000013 , 6, 5,  'VaqZ99hbGvnM7YDvv6afdbsButbX94ur', 'iW6G53DwsIvSF3EOx3YWo6CR61g8BaYo', 'c8c07a0c8e4e1efb0ce4c5bdbf0aac58c124f03be13be5c77c2ffddf3e2ed6b2', false);
insert into user values (90000186, '町田', '喜重', '1973/08/09',90000013 , 6, 5,  'WBxbQlJ4JuUuUHkQds7Zlilo4k03R5Tp', 'TYzyNXIJur3hDp15NMULZ6QfqFn15sdg', 'c3e81606ba22f949f3c4f1157efdf29b09fa962ed536f9e9dee2716af004b21b', false);
insert into user values (90000187, '小川', '陽子', '1989/01/19',90000013 , 6, 5,  'itaCnpDTdhOkFsV79z4VH8IUHZtjqbup', 'YUsQvXn5cGEVVkihrPVI1Oe3yDPgAWgF', 'c5dbd6cbed42925205e33fdcc337ca5ac9db472eeecacc748170fbd75f1dd07c', false);
insert into user values (90000188, '武藤', '恵', '1978/10/09',90000013 , 6, 5,  'fjVxqQMl6UvCNdETTTC8eW1CRllZbL6p', 'Vy8D0JXPSxApHpT9gQqvvXgNl2p0fWiB', 'f3756d845e3aa67d4ff498d1dfe0906b2933a57a779ea4134c5c7e0d782c44df', false);
insert into user values (90000189, '手塚', '友良', '1978/10/09',90000013 , 6, 5,  'muVuwIj8CI9XJPbuTzI5fpzuY5wDMGRL', 'p3UXjd0IqwnZKImVQokxnfBji3HFQy34', '75cdd1c5e6367c373e85f551ab53bee86408ed49b574668280ce212e9c829a1d', false);
insert into user values (90000190, '畠山', '美則', '1982/09/19',90000013 , 6, 5,  'pUZqSog4sKVZ4UOUWMDzGpD8scor6QF3', 'orvFPYynW9ESHDMBj3IIofijCiXY8FGA', '6c42780fd56fdd92c6a6ce8bfb0f3a0c9ab71b3464b51eb166ec199415e656c9', false);
insert into user values (90000191, '矢島', '義幸', '1985/03/08',90000013 , 6, 5,  'nxjcn6ftlF3PmXR8T1aRBHKLbAioZ0zl', '9udaiO7XGVkJ9sMfiu2eC5Z6PYybTNS4', 'd152ab9169a2cdf2b560c17ffb3d8ad70faf8bc7d128b054a88df306939d3c8d', false);
insert into user values (90000192, '石黒', '玲', '1976/03/11',90000013 , 6, 5,  '8izphS6Tbw7NBCjgFQH0nAjcjnyqSQtk', 'm6AIK5ZL354Rb2cXkvQoze4ZqRnnSrBt', '49ecdb3ecc2d24e1195bf7738b9757bbfdd331fde2659c816479b08782e5076a', false);
insert into user values (90000014, '米田', '新太郎', '1989/06/04',90000004 , 5, 5,  '7oA5FDAEKNzOTgPjAYDT4BHieJM8JnVW', '7Xytodc3FVMHhfCQXrPXzJtNN2vn7e5E', '4c82d2e85f1781745abc831f843baac663f24794d00ac50304324d84836e0f2b', false);
insert into user values (90000194, '杉山', '聖弘', '1981/04/07',90000014 , 6, 5,  'jQDlBCiAOknBduWWnpSOXjkaa4uvpXl4', 'nu1HwSaMGn8QQ71lHXdArCBGK3XiyOwg', '5d77cc98817778c44182608a84ae6d24248d5a7467de3c0efedf9f5ccf84b7ec', false);
insert into user values (90000195, '佐野', '準司', '1992/03/11',90000014 , 6, 5,  'wR4E4qUF5YzFayS2qnB06ZYeLshWQsG7', 'Vu5ZfOQXtnQsVv6fZBv3R1uzGCZbYHro', 'a1ddcc01b3d813430f3fc31e6dab521a7bd7acd63d89de4905dc695bee799976', false);
insert into user values (90000196, '竹本', '浩一郎', '1975/07/15',90000014 , 6, 5,  'EhmfU9zmJNfW6UB5miCEAenBqljRDcci', 'FdPggcJ49qeQbfaaBe6w2B9QoKVV1CIf', '68a7de84e94055057be661bce7ef37ca358459ac5a35344f8bf8ab5fe6adfd47', false);
insert into user values (90000197, '小倉', '麻紀', '1987/03/16',90000014 , 6, 5,  'khwXlgbjlYps9eJPC9Vl6OwdSZkLNywY', 'rhWq8rsF6nX8wEuWtwpgMwF4Flkp1cvN', 'a048a63b5dced11ae4df422e58e6836451ec849c75cdabfd7464174a879edaaa', false);
insert into user values (90000198, '町田', '宏季', '1971/12/27',90000014 , 6, 5,  '6BcRHOpbezEYe2gY82k9WPx6oVgmOfv7', 'Gt457dq6FcPLunYN7VfRdXGUIXeJXaru', 'f6c5d0b136cf3939887025cd0e20a9ba8bd3756af33cb9d2fc6d357fc3352e9c', false);
insert into user values (90000199, '岩田', '公紀', '1991/07/29',90000014 , 6, 5,  'Dp6IDJd5jSX9Njnn92KKdEyHbQPF8sSN', 'FoDirsMbcgjwl14JiXhhmfxEKc7yxZw9', '5252990053e402371fb7f0b3804c81519deabe865027396c94751f5c4f091bf7', false);
insert into user values (90000200, '新谷', 'あさ美', '1991/07/29',90000014 , 6, 5,  'NLPPenLqVSlImx3RUXLep3lCmcDLsAdB', '9NylFaiKxFpVCYEXBRpdJOXpherNmyvD', '80d1228dc9cf714151581ec95ca843bdd648dfd3ec82d5899c30619d9ff2b8b8', false);
insert into user values (90000201, '南', '鋼三郎', '1989/06/04',90000014 , 6, 5,  'BJkcXhb3TLu1NOWFlDidWF5D4TpYLH8F', 'AOjGRmCVTVSrrXuvtWDbHAJOuJe9a3Mv', '0d78f4f0cd7ff60831e2897bc8f84f43daa9ad15661e5d7896286181957541c0', false);
insert into user values (90000202, '菅原', '洋和', '1974/06/24',90000014 , 6, 5,  'u1LHayz8cWEpgvz0QI8pUtwUZhN8hyi0', 'y8Np4T94hGnwsfzOC47n0iQJ9ypmT8B3', '93344bf41f26510497055d4e6a194e947c32f60939933d13ec2a666bb497d822', false);
insert into user values (90000203, '浜野', '幸信', '1976/07/31',90000014 , 6, 5,  'HDHt1fbAKDnQAzqtPK5ZnS7TAkR4Tge6', 'ut995frCojcaxN0c5BQWplgxEiwipMd0', '75e628b1138c7f2428203f7648236bf66051f58cc761e6c8ae4fffd54af56937', false);
insert into user values (90000015, '矢島', '恵治', '1974/03/26',90000005 , 5, 6,  'uJkxVpo3MvIVIimuccFNK1x3FYvo661Q', '4Zj3sJNQ1VeTbX1tBQmW9siUKa9TBAct', '732aaa5e754fc2940e305010ee45666ffb2ac89c6c5046feada850ffb2985657', false);
insert into user values (90000205, '金井', '友', '1988/11/18',90000015 , 6, 6,  'rTo94mcP32RLReSLJY7wDgQBnXnrfR8W', 'xTTekFQ6e8UGDVIx8pV6JK2CTWmQiAXp', 'f57aa302161fedd2778d3b52f5fbeb2e75e32b2c80a721c807661f77fc91b3a6', false);
insert into user values (90000206, '武藤', '明博', '1984/12/30',90000015 , 6, 6,  'xHi90mGKN38A0FVO7EaD0hhdSbGYJM5Q', 'KwGipYP5VeTy3q4eQ1MvLi7YHJUKTL5e', '8b7c050d9bf31f8bcce0e50daf865f835f6c44abf9f4afb2dd68d6c566e1150f', false);
insert into user values (90000207, '足立', '幸美', '1993/09/24',90000015 , 6, 6,  'c0cCbwOu0qy0AB3iybBJTI5e1mnXiTUp', '2ApgL7q9EEoNc33O96V7ZhVADlxlJ1md', '5c40f0a479c7acc5e8caed248d3ffe3d2fa01b695c45b4b75c73e712d75929a1', false);
insert into user values (90000208, '齋藤', 'ひとみ', '1976/12/31',90000015 , 6, 6,  'SunGDsDetSBAoZPveRd3EbOSsZuUcqwz', 'vRk9GSV7Vv2v6YBUn0r3OOKQRp4g3uHY', '34aff88168d2ab76d740442c581d1db8ed51821be951317f2f50c45d97df71e8', false);
insert into user values (90000209, '浜野', '英博', '1974/09/21',90000015 , 6, 6,  'EBxsU3UKp7qG9SYUCuKmFpm0cdnrR82o', 'Jq544PxsCHyX8J2X3w7DQ7dZihJ3MEB7', '45a7a5f2e04ccac77a3453d357ca97056d2bc3cbf72db97948fe38a4e8190bbb', false);
insert into user values (90000210, '中山', '昌光', '1974/03/26',90000015 , 6, 6,  '2RHWLrMwisT4baSRPCT8qR3srNfN0BVD', 's6JqvYpzOyGGPnvoTkVcZqr9k24cDKdb', '8889178d06ae301d7031e16acd2fd48f284f932612d636cf785e10589ad8cd51', false);
insert into user values (90000211, '武藤', '公紀', '1973/08/09',90000015 , 6, 6,  'SPCPxQJHH4iwXuPUvY3ieWqmYjnlIzFO', 'vSqtNyK8Hpd5vqT4rEvGw7V3txvswkdq', 'bfcdc43a4d87971d8cd7aef79685cb595319ceb467997d1dfdec40c80420878a', false);
insert into user values (90000212, '鈴木', '恵', '1977/01/07',90000015 , 6, 6,  'YZjHtfX4SJlEgepj34Q36CPbf933QiWA', 'NqDK4YVI16jZWsCAfnCfWcCxRacBydgI', '97377950a04b7b6a88faa173cc047aeca66f227080ea77fadc239cc683d3b976', false);
insert into user values (90000213, '荒木', '勝許', '1993/01/03',90000015 , 6, 6,  'd2AQIvVd1uGaehV55osDMSFQmL6JoZrq', 'KD0lZo6VfER9Ag0Wu2ZyJp1A0CNDfeid', 'edbca02316637011f4cba7cede39d6d1edc1ecdf57b34232aaf266149f93982c', false);
insert into user values (90000214, '畠山', '久仁夫', '1978/08/28',90000015 , 6, 6,  'TucjXldMKb4WaAMe579E3l850aDOqcQi', '5jfZvrdXC09UK4l3KiiEpDVzTWVYGlPG', '700efdaef70d568df3ada0d987cddd6e882ee267be55e5c579837f9ab960ad66', false);
insert into user values (90000016, '大木', '美世', '1972/06/14',90000005 , 5, 6,  'Z6nNzVQlDb4SzGLiYztnrjMzJydaPOir', 'VGyMUV5XYh7IuEy4iKwQXlWLeYdC0ALG', 'fd368511f7ed8a616739e630011aae7bd7735f9e27573b43a307a0abbcc61c9b', false);
insert into user values (90000216, '河村', '邦美', '1988/08/11',90000016 , 6, 6,  'tG4QY4riPfXwmRHwV4UxwEQV87G3ie9V', 'qcJmNAIqFbk2ypyxVKQfZrS2xynZg7k8', 'c683626784bf1ff870dba888f5ef219f1b8de12df351d074ca8094192f8372cd', false);
insert into user values (90000217, '宮本', '和海', '1986/10/24',90000016 , 6, 6,  'k9XH6uSKaocAXKr0hwFzP3uisK3MouhK', 'LKnDAvfxBOcYpPAqD48BuvKgGjC016nE', '966fe31e30fc8e013c461a642f99e20d2cbedd54d5173c6000067a226f705c86', false);
insert into user values (90000218, '石黒', '洋和', '1985/01/01',90000016 , 6, 6,  'EP1XHQstcVA7TGzEQ4oiyGRuteUHXyMm', 'HGCYMU2by9Bj3khZcIYLHkZVUWKxs8z6', 'b40e790a449d29367f5356580a3ffd98936f7b7f9733ef09b5547a385da034b6', false);
insert into user values (90000219, '杉山', '友幸', '1972/08/11',90000016 , 6, 6,  'kEnCTGbJpUU8KxUXhN66NenrshlWyneB', 'mZvMrgw29t7mtmXIhS5XfdEgMTYoQAg4', 'd2bd2c5f2acf0a6d75d0ea7bebce3510a1f5da5102ff0f34350d177c6bf5d0c5', false);
insert into user values (90000220, '足立', '鋼三郎', '1976/03/11',90000016 , 6, 6,  'e5394eqzZlCQ2Eo4cJ8TqYu6u0p4L5bw', '50C8qt4xf7P2Ih9LBdZa8iODwlAuqsHB', '5859bc1f5ef963fe41b27ea1724180e26850179da3a86371140924352a3a4688', false);
insert into user values (90000221, '畑中', '心一', '1993/01/03',90000016 , 6, 6,  'tApD48DSnTJbGTdi3kauctT9g2bkMSdE', 'Bxkp4ytkCymlBFiomiRCLoVFvzpwDzIk', '1f0ec78f97022090c9130cf3e198eb0018445f45b46743f9f747a7c9dfe2f1b4', false);
insert into user values (90000222, '米田', '悠子', '1993/01/03',90000016 , 6, 6,  'DNUTEnON54dOfkMFSdN6xIUVGfdW8VuW', 'AtAkBVfaOD9g4FMeJhFmi9VTIyB0toxe', 'a0efb488e68e0b45dcd27deabd478bcd3dbbca06066eb9bb85a660eaa29f3eb1', false);
insert into user values (90000223, '石原', '道彦', '1976/03/11',90000016 , 6, 6,  '35TnUj1MMsGiIhPHmIrb8w9uyJQvX2bu', '7xaT7JPOCiSoeNGk9Zr9BsbEwmtdgu8b', '87bdf38f4ec3441dd7d9c15ed734799aba088f3bea131bd0a77446c7128c3285', false);
insert into user values (90000224, '菅', '祐美', '1993/09/24',90000016 , 6, 6,  'FsFWlBk598DtZbCjFkCY1I4jjfo9lUJy', 'fmt0A2AdBzM1bzEP2E16lVcoNSUi7oJf', 'c3d7072404ce7a5c8a098eb851169946746bab4fce6bead3ac955b042b7a4ad1', false);
insert into user values (90000225, '藤川', '明博', '1975/07/15',90000016 , 6, 6,  'qXsUQlunb32NMVAaY97VzBj5SzdM82Y4', 'lNSS8DKeKlAcx0Arg7T6twHQhAewryPM', 'a58a5ae99a21dbf40b50675a16c1e16df31bef6d78a43bddcb9ffa538b8b565f', false);
insert into user values (90000017, '杉山', '芙美', '1974/06/02',90000005 , 5, 6,  'JMDBGszDDTupmwoadBlX29JF4sRGbziB', 'NWehEc2qHrIxuy9bcD3D5VA9btyNT0wO', '9a58f02afde181d7783b1276636753e1185d6f4186853291048c9e6da8afc2c7', false);
insert into user values (90000227, '大木', '迪子', '1984/09/07',90000017 , 6, 6,  'KTNuIsA8SNGn9EgwPP8t7dTkJ6ogUWXu', 'jK322ea88MWtrAmseS5WQ1w4hPaIqrZK', 'ef561154d60e6274d8e2ec781a8515d48d7657d231894b40d15095f87dfa7be9', false);
insert into user values (90000228, '阿部', '鋼三郎', '1989/01/19',90000017 , 6, 6,  '4sudT7L5PcmeAOWMoANkhkXWMlslj6Sh', 'uhTXPDtVU8g7Zq2ykYSyzbnNsfo04llQ', '1919591f2205bfcd817f277590fb9abe1f86a51c796f1215e503b57cba2159ef', false);
insert into user values (90000229, '飯塚', '淳子', '1982/09/19',90000017 , 6, 6,  's3oFg32FHhbahOIaelpFACpO07L3Sr4z', 'iSBxdaOktHdn6PuuH7imL18qt3hlaoE4', '7ff1fd289eb784e4a26ad5ec0661863b5574319acad31a5bc2ad1c383870ade0', false);
insert into user values (90000230, '笠井', '朋美', '1982/09/19',90000017 , 6, 6,  'csjS3cnjwiRTk7wvUEpL3bdoleeRiwh9', 'K73K9Rzze5MBdUgEqSZ0mDZxL3PZ9czO', '3d55d6ee81a4c6962249069391c1d0bf697439df4ea045b9b1e75b6abdb3e846', false);
insert into user values (90000231, '林', '金義', '1984/07/06',90000017 , 6, 6,  'N7s77CK81stjXGiE9Zr7050LE2WAzM3h', '7yekDmzcpJHOhfowXkWvpJ09508tZd3S', 'd0915fbe04558d34cdffbc82157ab21af607da5cf2f6ea6efb3ea3ab4cc85e3c', false);
insert into user values (90000232, '浅井', '静市', '1970/09/03',90000017 , 6, 6,  'AJOzOJdU6obhcF0AfwStULHDQD0koDHc', 'WskEMdNrWoXxWS322yoHHQ67tVzPVjoc', 'db4e1f1052955ed713e022ecb91b35e4e2a78eed42cdb89d3ee816a87e8a0dc2', false);
insert into user values (90000233, '石原', '眞美', '1978/08/28',90000017 , 6, 6,  'P5d0RD7sFtcfAm9FVHDSXrmW1hT5E29N', 'UiFFdUZyEO0epbkPwVJbknFBVVDxWbsy', 'e684ac3489dbdfe17fdf865e2dc3eea3e083fc55bdc35d85b3e05da6fe2ba716', false);
insert into user values (90000234, '及川', '信平', '1988/11/18',90000017 , 6, 6,  'NiMfVEL8NIIw8GtxTSkZUa1Wfl3Ox4jW', '88U86MT1vY51bCMQhGTu5srndRpPkgtn', '5589dcbd2713d615305ec568fd4675651599eb6e797042905f8f8e5445a82645', false);
insert into user values (90000235, '小森', '浩一郎', '1991/05/17',90000017 , 6, 6,  'dFRHsWnFPtlgaT3oqwAczt1xpOdjRQIK', 'NsYNcfCu5Sxfs5wzIItYJYVkAbAhvZaQ', '7c2e8472904d8be32e7a2e96c6d38f9e67c8a03995a3d7ed3869332039d05451', false);
insert into user values (90000236, '石井', '満生', '1970/05/29',90000017 , 6, 6,  'ssKkVPKiYKHCcDrOoGWMT3kBtNOwpHuM', 'bUB8QrSpGgSXGoEvmpOdOP2SHWAeZWKh', 'dfd8b485c035b997e6a8cee4c4e34dae5d65855f70816b78cc6c92ae33f16b7a', false);
insert into user values (90000018, '瀬戸', '僧三郎', '1987/06/10',90000006 , 5, 7,  'muCJgOiVyyqtpdMsaugQ5nTQXCWhc4XN', 'FlOUPcrIgnooEE3C6LXFnIPiom3bwLcj', 'e84bcaeb81d9e0e41c0a1a0dec7ff4b53f17043795b6da9ee04ce67b8522a0b9', false);
insert into user values (90000238, '三宅', '十志夫', '1980/02/16',90000018 , 6, 7,  'Kc74Jju7NvryKZgUEjkGzpY6sFPUWR6V', '0xHdEC8dFUgrrQIx4K17ywMszciMOelr', 'cf28ea6b2f26d2031516ea34e8a0d76a8ef291fd1ff65f3aefd0cf55015e9de2', false);
insert into user values (90000239, '古賀', '昌光', '1971/09/18',90000018 , 6, 7,  'qyMDC6SATBxsSF2SmhPZZJxZcAvdt7En', '5bDWZ4vveibD3I5dlOFsO52LPMmuyQDO', '6932ae7d2aaeeab463e5728bce93294e5e0c0ab390cbf86a471a27454fee80e4', false);
insert into user values (90000240, '宮本', '昭良', '1985/02/24',90000018 , 6, 7,  'AATQlJvirD7wzuCO0vAAXDvCLYOE53Oa', 'hVr6893oXmzKRzLez2dFHhyUGGtNa94m', '16dd7d2ec5f228d980a34b81159310de07ecf7a8bac322425e172a43eacf460e', false);
insert into user values (90000241, '岩田', '圭織', '1973/07/17',90000018 , 6, 7,  '2x1ASe6x7tZt8SsFd9dbhLz9exz44guf', '6kWVpIYjfgSfL6AhMkF5rNjUkWsfVtir', 'f138b64de131f887cbe0cf4408b90649ee970c62c19962bb6663c161bada977e', false);
insert into user values (90000242, '鎌田', '育雄', '1970/09/03',90000018 , 6, 7,  'Z7pDSvmFrMD0yvD4OP1uTL1VWsD6AF7l', 'AmN3ph4wwWBtIR0gPZyHAwc8gAggpW5h', 'c02919a12220ecc58fdcf0012a69cb04deaadc7ff879c85c3265b970bf82d5f8', false);
insert into user values (90000243, '町田', '一人', '1987/06/10',90000018 , 6, 7,  'Dvu0EU7Q1hygnlDI07Xn7HLkbF97XYLj', 'p9y2x6TuXLcTKFQcX08OFr7bCgQqB6vk', '7cb8b0fdfe3d1c024834d3618bd13379d8d432d3b40f7e0da9a252bc55b69510', false);
insert into user values (90000244, '菅', '直幸', '1992/03/11',90000018 , 6, 7,  'BjXjBy8erLTEbwEWFAM4lBiT7tA9KYBc', 'E8GRvEVhMaKYcmw9uJLqPWSlQcgnkBeu', 'ad177ec5cbfe898017acc6e5ba3b9b6122d948ac84fa9614dfed5ac71d340d40', false);
insert into user values (90000245, '長島', '勝許', '1971/07/20',90000018 , 6, 7,  '9LJDNkSmq0blv1Cgv0UHREXXIaOowwjF', 'PbCglGv9g7AdfqRpSlg5qmnhf88JPBJI', '4a492db72a270410e3380b1046da53c37411eb2b68f47242b67e95bb25539414', false);
insert into user values (90000246, '佐野', '悠子', '1977/03/22',90000018 , 6, 7,  'NmteFeMkuSpeZJ0Qh9E9AwAcka8FmpPj', 'ZrkhMKv4APugwh2RrH3FFFU7XAf1Ck34', 'e9e1f009edb73bff5a302629518e37e2d0425225a94b8815ae62a572dab5ea5b', false);
insert into user values (90000247, '岩田', '鋼三郎', '1971/07/20',90000018 , 6, 7,  'NzocQ0QxtwB54Y2C4kGIeO92dt8wT4WX', 'aTIVvWTTXQuEuPdcbsXL9RXLQngOglTy', 'eb9ddde8dec0117ee33d6b1fdc4d48340d2e158ece125cc3a028c47b9639a50b', false);
insert into user values (90000019, '片桐', '喜重', '1993/01/03',90000006 , 5, 7,  'bmWMsRlN5B6awwCrnGKh7xvB0NCnzx8s', '0RiXu34NJbpX3aFWZKwrTKn4CfstnBKU', 'ec1a040961805d1090d59c5664561da51e1f17d88486a5a00de357be8627c7d9', false);
insert into user values (90000249, '中田', '直幸', '1980/07/14',90000019 , 6, 7,  'MUkF99ADAqZV3qQDsxuqiMGoxBBLnjcd', 'a4CcecBlnhCj7gtr7lGxVGIrnBHZsX2y', '317558c68d9f7388aa6c014c15b1b37432a3421c1e3dd3b6739eea5adcbe7c59', false);
insert into user values (90000250, '小森', '一典', '1985/07/03',90000019 , 6, 7,  'x3NaGG4ngOuw0I0YdopG0l9LY9DX5x3G', '9rumJ2S1DuSdrwEEwsqeEoV6Hea5eatQ', 'f501ec2c1edf9ff51f00784395312677cbffe9247ecf1800a1875b7428f28bcc', false);
insert into user values (90000251, '藤村', '義幸', '1988/11/18',90000019 , 6, 7,  'boPtRGFtsKeccPXoKIHnuRnNOZ7a5rEo', '5DazoBSZ90IOAuakPFAVRjgVjue898oK', '3a3518aaac0700051d4910419a35135bc9768d75afb9fe0bdf00495aec0ae763', false);
insert into user values (90000252, '大木', '昌光', '1990/11/27',90000019 , 6, 7,  'Ptf2t07NiNCXwc3YtUfd3JNicnS0JINd', 'ZSSMeRZhzdNuVztcPnjm801AhyHi4BQH', '3d85a525f205d667cb41d37a315e9fc1a8efe22a250986007d03f2984eb320f9', false);
insert into user values (90000253, '荒井', '茂義', '1988/11/18',90000019 , 6, 7,  't6Af0nvMq7GBYEiH9wxqcJ1X0iAvYI19', 'YSgokq7JQXX8bC3TCJ4CrUtFJUHLbHyR', '0d26c4348107b2dcbf62b73a77d769597348ae88592dbb9e01e287a1b2e51c67', false);
insert into user values (90000254, '入江', '芙美', '1988/04/09',90000019 , 6, 7,  'Gl7LHYLWPIvhDQ3qp3VVzVOmIc3UNyKB', '4YLrxberMkSDNuDWD09EnVoW7x7LDDGa', '5f9ccaa07a226f42368db5c5a63c4309baec7d0c9141cee602851edc4bb27ca9', false);
insert into user values (90000255, '大塚', '迪子', '1985/09/22',90000019 , 6, 7,  'lPUgeHMMgv7dw7bHtC67Zr7vF7L73mE9', 'ARucOZjbyFNRtZTTA6hfE4a5UVtLWrYR', '29fc983c4a88359770609b19d65476f7e79159b9d6a15ab7286e0c93ef940715', false);
insert into user values (90000256, '宮本', '恵', '1990/07/03',90000019 , 6, 7,  'O15yrU8c72wH2KSq7XsdwXmSUxFL8q2o', 'qx2IXck4zu15AkwsSQd565afCSa8AzwX', '672dd7fe89ff9e70a127b3f41c2f68bbc9c8cfb76665dc58b3021bee50aea527', false);
insert into user values (90000257, '矢島', '幸美', '1973/08/06',90000019 , 6, 7,  'JwkIX6Pck4MLgt87VVGOpWZ17wgJEiyI', 'hOkCBbCHfTJWT2IID8pQVL4eNZ6OxzJD', '39e5958f763f7e2209311d6321f9e9dac3d4b9209902f707c644fb679d1ce16c', false);
insert into user values (90000258, '大森', '麻紀', '1982/09/19',90000019 , 6, 7,  'cMWSCfvtYDb4jMJ2rPVUq4Aklr38FjgH', 'PmcnR1sJL5O4jkrxuIIEGKzy870vdWpw', '620fb4cd518368d0d5cc36aa164744c555c71d4f1ead56965dc8ae0998210cf0', false);
insert into user values (90000020, '武藤', '美則', '1993/04/09',90000006 , 5, 7,  '2hjjM8sjYJrTEnumGzwkUbDlXcqWBuVt', 'MmRJWWEB3m5aVHRzuDIxAjLj2ZyxFsCq', '2225252022db0c272dde2ac4bdf29dcf9db5b860eb116e2ffdc8f5138ba5adad', false);
insert into user values (90000260, '滝沢', '数也', '1975/07/15',90000020 , 6, 7,  'y4DLMnFdI79auxVqUKwlow8uUnIhL347', 'rStATbmHTR73DtIwiDoNthQBgUyb0MIk', '3e99b1412565862f5571c0dcd9112de48296dc8fcacf17f797e7c26a05e4e7a9', false);
insert into user values (90000261, '岩田', '恵治', '1973/07/25',90000020 , 6, 7,  '9hkL285stLyaZmQQk4DdHg8A6KLTKve5', 'MxowJrtPI4VW9xJ70a0refi95KRhJ9RZ', '46f5fad8a8fa8959e24112e3db031e5ed88769615d3036a1a2274c90bad12e57', false);
insert into user values (90000262, '荒井', '和海', '1974/09/21',90000020 , 6, 7,  'xVfdWtrhoIxVxx1iC1AfhGtSZqVkC2nE', 'RbCZ7Ok7egLu08o3pCn8lK7c8GRG0D4e', '9b2865856dd05ea1649f5db350b1dad3afaef0daa4e2290838aa484853a6272e', false);
insert into user values (90000263, '齋藤', 'ひとみ', '1982/09/19',90000020 , 6, 7,  '7N5H2M9mt2H1oZRFGA9BYPJbULoqzCYw', 'RMzBXyhGZ3MZSr7MJXooRb6aK2ROKzTB', 'ffa3d64c1202832257d176137ae43b4a11862bf453993b13896056ac3834309f', false);
insert into user values (90000264, '新谷', '菊江', '1981/01/28',90000020 , 6, 7,  'rDalrX12HTnKdxFDeg4XXNPYt9Rxq6oh', 'Bf0PH5ZgB16Cmr16gRVMlDEvaY2gZj4n', '6e9ad69f21b3bab77fd3634e2d9aa3f3bdae8d37e5fbfbeea7725a9ef5bfb0b5', false);
insert into user values (90000265, '三宅', '眞八', '1979/09/14',90000020 , 6, 7,  'OunhwSj6DFqeF3mK9PuHX0F1QZAy98Uu', 'WgZE3e9xEyjaQh5tafvEVgvxxUuuV7bZ', 'e0874d0add47d9e69a26bd2fcdbe539fd5fc7bbb1d8bf6fb892e66c9c57dbcdf', false);
insert into user values (90000266, '高島', '友良', '1993/04/09',90000020 , 6, 7,  '33RpAHp4Fqrt6uYY5B62wyipUeNUKlZS', 'XtmgcbPx4qdIFd137SZYNhJ5bhe4h1wT', '9e825e145e7cae86bc4bbb97e9f3bb2c6f7f39b108f849996bb14a227517c4e5', false);
insert into user values (90000267, '溝口', '一人', '1980/02/16',90000020 , 6, 7,  'KYdFFJ1ppDXlfiLCmQC9bqpz7nO1ZBsG', 'EqISE7PzrSA3L8Pa7Evv5WTL8ffcEInH', '2e6a64d9489a439d54804b888e667d335f8263962ccf0f270c2dfc2146a832ec', false);
insert into user values (90000268, '堀', '喜重', '1986/10/24',90000020 , 6, 7,  'O0VKjfJAQA6CHocQpaZmlItU3CaJz03P', 'NRRJ0DBc1MjqQWatgybTOowbTMG9LELB', '475b5e45786d4f31fbebff63d5365642259afcdefb8c0b3406f6f2194929bef1', false);
insert into user values (90000269, '武藤', '亮子', '1980/02/16',90000020 , 6, 7,  'SXslhG8jCs6aOacQzGF3ZYsFGK6DTkYR', 'YkWmeqsJbdgQkS2tROOn47s78WGJX0Y2', '8c8aeabd206ee1242a67cf572d5158b18d82532067fdad7e4af73b9a73f995f7', false);


select a.user_id as '社員ID', concat(a.last_name, a.first_name) as '社員名', b.position_name as '役職名', c.department_name as '部署名', concat(d.last_name ,d.first_name) as '上司名' from user as a inner join position as b on a.position_id = b.position_id inner join department as c on a.department_id = c.department_id inner join user as d on a.boss_id = d.user_id;
