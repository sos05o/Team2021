create table position
(
    position_id   integer primary key,
    position_name varchar(32) not null
);

create table department
(
    department_id   SERIAL,
    department_name varchar(32) not null,
    primary key (department_id)
);

create table "user"
(
    user_id       integer primary key,
    last_name     varchar(32) not null,
    first_name    varchar(32) not null,
    birthday      date        not null,
    boss_id       integer,
    position_id   int         not null,
    department_id int         not null,
    mail          varchar(64) not null unique,
    salt          varchar(32) not null,
    pw            varchar(64) not null,
    login_flag    boolean     not null,
    foreign key (boss_id) references "user" (user_id),
    foreign key (position_id) references position (position_id),
    foreign key (department_id) references department (department_id)
);

create table approval
(
    approval_id      SERIAL primary key ,
    title            varchar(32)  not null,
    user_id          integer not null,
    limited          date         not null,
    goods            varchar(32)  not null,
    trader           varchar(32)  not null,
    quantity         int          not null,
    price            int          not null,
    necessity_reason varchar(512) not null,
    trader_reason    varchar(512) not null,
    purchase         boolean default FALSE,
    p_chief          int     default 0,
    p_director       int     default 0,
    p_mdirectop      int     default 0,
    p_president      int     default 0,
    foreign key (user_id) references "user" (user_id)
);

create table remarks
(
    approval_id int,
    user_id     integer,
    remarks     varchar(512),
    foreign key (approval_id) references approval (approval_id),
    foreign key (user_id) references "user" (user_id),
    primary key (approval_id, user_id)
);


insert into department(department_name) values ('その他'),
       ('未所属'),
       ('営業'),
       ('開発'),
       ('システム開発'),
       ('情報システム管理'),
       ('人事');

insert into position
values (1, '管理者'),
       (2, '社長'),
       (3, '常務取締役'),
       (4, '部長'),
       (5, '主任'),
       (6, '一般社員');
insert into "user"
values (00000001, '管理', '者', '2000-01-01', 00000001, 1, 1, 'r.arihara.sys20',
        'Ka8WLaPBTzfwqFnsus91vpqLOpsjXZOW', '776d7d51b1e6d71bb0cb856e1342e937bc37bd0391b9eaec8a2971358e73be44',
        false);

insert into "user"
values (90000001, '社', '長', '1990-01-01', 90000001, 2, 1, 'r.arihara.sys20+sub1',
        '5CNM9MYyHud7OO0Y8t4UdBvlFK2khjfi', '624bf532af7dc9ba0fdab54f760ced1fd7432a5fc46c19c4fd07a089f006ba9d',
        false);

insert into "user"
values (00000002, '常務', '取締役', '1990-01-01', 90000001, 3, 1, 'r.arihara.sys20+sub2',
        'fqxSKShzGHkT2bjU04RP5kYEsf9CAzSV', 'e70de723406741b35b7617c9e4b77e3dcb1952fed0aabc737ef414d464f2fbde',
        false);

insert into "user"
values (90000002, '藤野', '昌光', '1976/07/31', 00000002, 4, 2, 'wHiFd13BRKZBJHJGqgVWGw6jQLBif7Gf',
        '0iX2FB033oZZ8ufBKn34hBUsugST2GCv', 'd3e531eb32aadd77fe35a06fb74713f854a99554b7ce754ef8e730abd0885a70', false);
insert into "user"
values (90000003, '石井', '陽子', '1981/01/28', 00000002, 4, 3, 'Iu3jU0t3lHs0xJoWLuS0Y3zGHN1f91Sy',
        'm043n5v743MJJr1Mv24er90tb5t3TrhD', 'ae447df4e64fb60cf9a0100054925f8d3524b2cf33cf6e9416eaee818655184e', false);
insert into "user"
values (90000004, '本多', '富良', '1991/12/12', 00000002, 4, 4, '6SUMaqlIXt0sLUQA8jox3wpr4xCZcZYk',
        '0GLrC19yL1YzIn8sBydP29LvB1y48sEa', '69ed7fc8a156dcda11d821fe7b22f466dd0aa096a1905ae4e1bde14955093122', false);
insert into "user"
values (90000005, '長谷川', '成美', '1985/05/11', 00000002, 4, 5, 'C8PbPQfit4jCEEAxobAUzEWf19s2SJ4H',
        'Y3dQoByAT08IjSu9ZkMh416yhN6D0E5K', 'd884e8ecc70fdc429bda99460c11bff98bb44f49a0dd28c54befa45e0ba7729b', false);
insert into "user"
values (90000006, '鈴木', '絵里', '1984/07/06', 00000002, 4, 6, 'dtcS6FaBPB0Vj2HCbAWDNDuE146Vin8P',
        '1pIwNjvayyuA5Nt2iR5y33VoI31S7jj0', '4e6b9d8b17ef0ad161c77c22bd003e0d2e97efdf4f2afbea56e846cc0f2e46d4', false);
insert into "user"
values (90000007, '塚本', '鋼三郎', '1970/05/29', 00000002, 4, 7, 'iimhH08kcU6hu2PcmKTGB3TesDeCITOh',
        'BBi5iwNcFpy3FQbEozDhajWCHRNgErny', 'd21a5f755a812a56a009889af5edc98d9f3baa50a0cf8c98788da8335ef8c4b6', false);
insert into "user"
values (90000008, '小森', '迪子', '1975/01/03', 90000002, 5, 3, 'C40XgNVdTH0mjedwYhWm8EODQSpu1ef4',
        'VRzTDKcimlsCW1TrXqxcYfT3MIPjdBDP', 'dd681dc002c1ee530a62cab3a668bf27e60d375c85d6d7165a2d3b7deaddceb5', false);
insert into "user"
values (90000108, '新谷', '喜重', '1974/03/21', 90000008, 6, 3, 'QuyhSeHghTTkkpJPH4m7Jq9hN0YYVsjk',
        'DBl1KHc3fWXuT9cB95U3b6976iq0C5mS', '362634ef07c062fec6b1bb199a71d07b556f9ffb05bcdb0c69a9d70109d4f809', false);
insert into "user"
values (90000109, '石原', '恵治', '1984/10/04', 90000008, 6, 3, 'Ffb5EfDLLTx24P4pYlJSZJmQApj5o4xg',
        'qmG3XjGuwHnLU5xeQFHCdZKKsQc1plUn', 'a2f41f9f0ef8a546891d72b9dd33254dadbdb0a5eba491678c34228201147a02', false);
insert into "user"
values (90000110, '丹羽', '一人', '1984/01/28', 90000008, 6, 3, 'GIiFOhZRnDEkIRS1HieQamlQmRiGWTAY',
        'R7rHrIIuw8PcaD9mtrANPwGFxx63pHyW', 'dbcb4d986cca5bd2a62d7965db45f3aada7e20eebb4499247b9c50dd71e08ff7', false);
insert into "user"
values (90000111, '長谷川', '義幸', '1984/07/06', 90000008, 6, 3, 'ySl2lo3fjGE58fNfjF7sAdIO99KXWrmb',
        'HXe9p3Q6ByPW1aMTBFnMc2uusfupqjkC', '7ffafca51b1665fa883811a8877a6a4a7a1152a4ec7ed76c6924001f8527407c', false);
insert into "user"
values (90000112, '松井', '育雄', '1979/09/14', 90000008, 6, 3, 'bgzm8ih5xP8ZkZnuApAweAhCDaLZAzlG',
        '8KckuC6I9n57dvdNdEIX9E89ooOBFaF2', 'f2bead3f477d0024177f371545b4fecfe4bf509859a103aabb22da3187f5bc2e', false);
insert into "user"
values (90000113, '西原', '茂義', '1974/03/21', 90000008, 6, 3, 'N8OK37BqfJDPLdt5VTxJGOc8Vs9pPBqT',
        'r4B6aDbAtT2MBr94S4AbBm0SFBBnRvnw', '6a0e768ac5090536fbc8a4403e6899a9cc210c35b1c300b385e70a9d1acf5d03', false);
insert into "user"
values (90000114, '藤村', '眞八', '1978/07/11', 90000008, 6, 3, 'cF8rLmB7aAGVHFXZX6bkB77DStZIkCp4',
        'wDK09U8RhrREafg0qnS8OznnxLkLENtE', '195c85a6cc63ce20d0ebd5502b2d401e9ce1781ffbcc1858d500826ea370aa13', false);
insert into "user"
values (90000115, '小森', 'あさ美', '1974/03/26', 90000008, 6, 3, 'hawY1HFwADPbMFzPel2YDPDy0iP4L3f8',
        '8t8ddbLFTX5WLrAGd5HmBsUYE8cNz8nJ', '966da59d3131bfbc4f64ae8d6b8916f152d41a39dd52715af86841811dc0a8b5', false);
insert into "user"
values (90000116, '武藤', '朗夫', '1974/06/24', 90000008, 6, 3, 'rOwPblXjsErZAcLepA3EK3ujvMF4ggI1',
        'cdc8zfLNCEsnioi9jBAC9xtx43n7jbYF', '7495bb0b15b2b490875119b3630f87459103c5824c67f863c1307cfe34db7798', false);
insert into "user"
values (90000117, '宮本', '陽子', '1980/02/16', 90000008, 6, 3, '8qYzNCzSxmdfrJyPL3roZtvr7JIuVExg',
        'RieCpe3vA9llL1apQN3wflUE7UixJfXF', '07894886f091cf44550c72cd295356b3e4421f33d637d12a299eaf7e112c2a36', false);
insert into "user"
values (90000009, '宮本', '育雄', '1988/08/11', 90000002, 5, 3, 'SQ4GBEzybVYpkHBX14RHevZ07aAwx6hG',
        'Urp36pgS54MTftlPyzh4K7t6GOebvKbm', '8f5be045c0e5c00e3e58081a2d70bd6af1a0e91801228a044227aa0bbf0e2bdf', false);
insert into "user"
values (90000119, '上田', '智', '1979/09/14', 90000009, 6, 3, 'ClcfC1ea9UeW0P5Dmq1vP0zUoChcQcyc',
        'mrpexEht63BU7s4XAVWuuTjNXRUqFe0g', '3f8913392b6ff6f931f3e2c582f5d7c7b24b1c54e072b88f3a18d1c3bb0bc89c', false);
insert into "user"
values (90000120, '飯塚', '一人', '1974/06/02', 90000009, 6, 3, 'yejioRlKllcGGvl22YJWR5ZK3Kxj05IL',
        'U9IMm7rkoSaHIa6oQjj65URLtLZPu5hY', '2874f9faf8a2ef8db75fcecf883a929ed3f582a0af0c72571b0bb7cdad7c4448', false);
insert into "user"
values (90000121, '藤野', '芙美', '1976/05/09', 90000009, 6, 3, 'dgWRdpwORTsZnIdVQRngHojV3egAP8iU',
        'nU66k5OHQsHN55rk3aigRlcdOgdDKlGR', 'b5fd3e28ca2821d5661362fda3e1dc0628c64d0cedf202ce595d3639ee8331ef', false);
insert into "user"
values (90000122, '西', '直幸', '1985/07/03', 90000009, 6, 3, 'VvYZB1n7bC59HoUs1N2oq9EETsA6LbSN',
        'tG8RXHJcvLIUoblXVS145cYAaDBmSvtT', 'b7e437ffb3262db9518efe0fd20ac5d4ecb36e056b2062a44ea92f480126fbc6', false);
insert into "user"
values (90000123, '岩田', '昭良', '1991/07/29', 90000009, 6, 3, 'u0sIoD2J4IhvXJ1CJ39ZMZuzFdPskQ9B',
        'D8EdsrgBk5frDLWiqVCuudO5x1xPJX16', '73f18accc80ed64caf8cc9c3bf58ba28a0a6e7a9bb229d234cf599c7bce7a6ab', false);
insert into "user"
values (90000124, '瀬戸', '昌光', '1980/06/15', 90000009, 6, 3, 'tIZgNJXAVzqpE5Fom7Uo6lpf6ClEZyNL',
        'F8uKMYWr8KEG7iMWcwECEi7hHdTpT9me', 'd425d931f2b5faf9178b83e4c5840bdc9ca7a7c26e10467ee1e297a3c0cc6c1f', false);
insert into "user"
values (90000125, '町田', '友良', '1987/03/16', 90000009, 6, 3, 'ngHO6wxlzaEegZuLdarwOWNcoQ5gmEtX',
        '33EbhD9olVId3jRZG8Wi5MLNj3bl9koH', '8cf3c7c08b4cd9275e80d6b60f28e3b59e8828a20a96e0c17d9d2a02705bb7e8', false);
insert into "user"
values (90000126, '古賀', '茂義', '1978/11/01', 90000009, 6, 3, 'Doh79IK0WG1HdqNrMkv2CoUI2MPna1o0',
        'Ms6pGUi9BEc3W3qOiLGePbuwekDeOSPv', '4dcc064cab413c81640d79145f06323b1a1d69b238f6679b4f23473d74334b00', false);
insert into "user"
values (90000127, '早川', '麻紀', '1992/07/15', 90000009, 6, 3, 'hQx3pVahidlSB0vfJuGEHw8TtSg9zRlE',
        'mL5eDJ1d2hLbKFYebnix7HKDoUwMLHI2', '0bfde70e360ddfe01f56def3f472328ee0374267792bb42aac15326d669a3fa5', false);
insert into "user"
values (90000128, '大谷', '淳子', '1990/11/27', 90000009, 6, 3, 'Kp45dPIH8V1IrwvTroywhyzWWlX7pm1z',
        'jthpNlqdCtQoA6Yl54QMQam4ZVGNKOhp', '1cde037b94b8ea710faf70a8e0d2156ce6062b494b57fc88544955268810b4ac', false);
insert into "user"
values (90000010, '金井', '美智', '1977/01/07', 90000002, 5, 3, 'BYNQ7HDLOTsteGk6wHU2zY37hn3Q6f5t',
        'B3DR5Z4YtMfBFX2jXP8q1nReNMNOX4aK', '0fc8e45e3d2a8f0ebea1b6b73ffcc3411d492e9046d23f54c0dae8f694b8d45f', false);
insert into "user"
values (90000130, '大木', '恵', '1986/10/24', 90000010, 6, 3, 'TjyFytCgklyXnNzQ2qOQDRIvn6XO1NXW',
        'FOGVHGmIi6v8NrF7WmQjMjhqrTboeknN', 'bc94d888958d852453af727df7ee2fa4cb9f3c26fd84ef8c01b886f6e3f46fa7', false);
insert into "user"
values (90000131, '杉山', '悠子', '1985/02/24', 90000010, 6, 3, 'Z3V8IRfnW0NYyiEkUATOXU3vQ3ET6sUQ',
        'KbhslEpOeIaVvr73KA0COpDGvLYxlwJr', '50506d9ffc200107ef6e529e73b0288912c61a05b83737121fb8fd6978f861dd', false);
insert into "user"
values (90000132, '早川', '玲', '1988/07/26', 90000010, 6, 3, 'LB0bCOp73vKvP5xW0svZD1pP4Hq7iRn3',
        'pTN7MZnZ4EaWzTEzr5zIREn80nl5Gk4C', '281206b24e4c685edc57d9e3965e875c9f36bebdf420a7248512ce93892d008c', false);
insert into "user"
values (90000133, '荒井', '裕恵', '1991/12/12', 90000010, 6, 3, 'cIEQig7gldxA3ORpKJsznfjyCDZr39zt',
        '1dE78QPo741WVmyjwgDDxXJEfwEJyRjr', '37df52d73aa87b4a688f5345cb41de66ff77a9b040b6f69040536dea778ae250', false);
insert into "user"
values (90000134, '飯塚', '健生', '1970/05/03', 90000010, 6, 3, 'p5oeT75OiG20MZW5icatB102kmGqKn5y',
        '89qkfnep4DKRNmW42kyPHRSg5cpAqm7a', 'dc79e5caec54cb423a6b7a25d3cd0532eda79fa96475656c5110ab052d341e83', false);
insert into "user"
values (90000135, '長谷川', '絵梨', '1993/04/09', 90000010, 6, 3, 'PRBufSKGympj1MQghYEzdOQ4TxWQyZ94',
        '4RKauvbt58ctEGTbTRAzBNbT7woTJDfY', '313292016272069f7d5cc259b23eeb8a49394fecc0de40c6041c5335c271a1b8', false);
insert into "user"
values (90000136, '坂口', '富良', '1974/09/21', 90000010, 6, 3, 'eOJYhLiqOJwBZx4JX937h8bYEeY59qO8',
        '57IbL1oAadv196FjTsEzzqu3xoENzQcA', 'f2c24014beb85c69177b04fac2fcb65597ef649d4a7b8baee7b525a7279f24d3', false);
insert into "user"
values (90000137, '久保田', '金義', '1991/09/10', 90000010, 6, 3, 'K56JYaiBeBCM8oIKZM4aB1FxBFusXBYL',
        't5u3MGbOEkvnTA5kBULCPUWgYJ0sUN7l', '2e39fcf589cc8e0c2b38935c03d511099c62fb7d1d2d5bd1c564e0152b03d30f', false);
insert into "user"
values (90000138, '荒井', '眞八', '1976/05/09', 90000010, 6, 3, 'lpHScdYPL1YjhFAPpWVIutUJ0Ld4oh39',
        'gM5B9zQZsHrnTUB9Sy1oWiM3NCQg330j', '14c466b0902e5f4086ab09fb0728870e788e9d63b6ce72a831bb3e88398cff85', false);
insert into "user"
values (90000139, '菅原', '鋼三郎', '1981/05/17', 90000010, 6, 3, 'FqQ2V38Nht2Nl0UvvZ4yzCIryfwJLmzZ',
        'KK4xUv9qSV4gf3h4yDw2gpPoDjezgTqm', '5872a8f2604457d1f1fa37adcd04af6dc2eb8f04d470748e73160a652ea77673', false);
insert into "user"
values (90000011, '長谷川', '健生', '1991/07/29', 90000003, 5, 4, 'Ldyvem2I42JRmkQ50OHlIchgE9rRrJC1',
        '3WgDfCXSqyi32ukpI3mgybduma0J4kvr', '652a03f07ef0ceab2d202c298bf802d51573b005225fe09a97d415ff5169c8e4', false);
insert into "user"
values (90000141, '新谷', '一人', '1978/07/11', 90000011, 6, 4, '3boIOXWU6ANHDFYFog2RjDGN2q9444Yz',
        'bHtbQQbdCUPstPIEJV01v8hirgMJNwaK', '78cb39da334262881dec938c0a153509deeb44bce08cd1607c1d8e7252e9c701', false);
insert into "user"
values (90000142, '土井', '定二', '1985/07/03', 90000011, 6, 4, 'aRPxToms6OuxMSD9wRByYjMwl9CYfYMW',
        '5dqm8JXAbDV3Rz2zgCKwui2sYp0tz1WL', '9ae81529bdf2c6f3cbc52fa7c553b832c53c57bed1627dfac2b11c0b46503627', false);
insert into "user"
values (90000143, '高野', '昭良', '1970/05/29', 90000011, 6, 4, '90ADGWI38ew1AHJ21sn2iut1qjsVey0r',
        '34TYdynWnZ6szO85aFQGsthpKKdz3JDw', '3eabb7085958e4247b68b264a8bfcf471f66e4870eac1a462499718415266eee', false);
insert into "user"
values (90000144, '飯塚', '明博', '1971/07/20', 90000011, 6, 4, 'OLWNvgvSTejciXDQNclcuqmtA29VIeuv',
        'MsKpsgPyoB1eY8yAHWlMeBBzBmRnXl06', '2958027da1af9530e075af8c41ae5325574648250dc65d907489ffe9d6df5211', false);
insert into "user"
values (90000145, '及川', '喜重', '1985/01/07', 90000011, 6, 4, 'tMconsAb6BMTgCmUa0BXHKgYn6pwlML8',
        'TwDogncwKxjPraX20jzo4UssDN7sCxYR', '813a70e46c4eb1aea9805ee5057062c43da39eb8839f1c8952752cec339a9edc', false);
insert into "user"
values (90000146, '大谷', '勝英', '1990/07/03', 90000011, 6, 4, 'KG23qNPHgQ3F21Cc5syQrK1jh0k6sgYP',
        'MkG5jP3pcYlgkeN8vB7UyYhmuMgq2CdU', '9de7131733b69c94662d06ecf81d89c2868ed9a64242918fef3a6c23ae34d21f', false);
insert into "user"
values (90000147, '大塚', 'ナツ子', '1976/03/11', 90000011, 6, 4, 'a5oTVlYnNGi3b6CFgtjjaESIQ9KgAqzV',
        '26PMFkKy2QNTBx0BSA69pyEz1HcsfF3y', 'a3cd3a657166d75fa8a31d749c1ed57b0650e8f85b51f37362973c7f43afc96a', false);
insert into "user"
values (90000148, '松井', '希和', '1976/05/09', 90000011, 6, 4, 'mCVVuZ5PUlVm4t2JXFBIWCvaX5OVGUND',
        'KwEI0VsPg3aYQQ3yScX1VUKDxeQKS2c3', '20d0913ae44f30c9c09b788ded06c2b15a8b079293558d929f4e9f851dbeb5d6', false);
insert into "user"
values (90000149, '堀', '麻紀', '1973/03/04', 90000011, 6, 4, 'MCX4XBUJ73WcRk9pJx8EcWzmcg45CQuX',
        'UBedlNQ8Acg0IIpBwZomtM8B4Tl80Ewc', 'c166a67da34cd221c0c1013cbdc8340b2dd236da4c53042526d9339736a2daa0', false);
insert into "user"
values (90000150, '飯塚', '友隆', '1980/06/15', 90000011, 6, 4, 'RhN1I0x5Cvh2JYmHRY4C5FAwYRRZF78M',
        'rIwaiAKBdNqgU6bwKD5l0z9jp1DGdJiF', 'ee319877e1dbadba15a452a1fb0e58afa7cf349ee02698ad6f9559c37b2dd874', false);
insert into "user"
values (90000012, '塚本', '眞八', '1978/08/28', 90000003, 5, 4, 'S30AHlK7ggz5yXN9yuzaejDr8Ot8bpQH',
        'csvTxi10RYoJIaOoUJpf6Yr5t3CGjoWd', '0079aee91ec7d47b89e1e97202adc1ea68ebb876cfff4ffe2fef6f3f4940cfb4', false);
insert into "user"
values (90000152, '塚本', '竹一', '1979/09/14', 90000012, 6, 4, '88p4Q9hOhB4blpzvc13QMp71n4NbOFcV',
        '0tisbOUHlc544WSxAfo63d8R7JooZsqU', '1e3776c4792d7f29b9a744894e2086feaa053506217324538a6e10dfe84721f0', false);
insert into "user"
values (90000153, '水野', '亮子', '1993/04/09', 90000012, 6, 4, 'ic4mfw98He8rfPCVBVagfTgPDu92u0kY',
        'usOdKNMi5PX2tdP29bBZpH6QeSgeWRj5', '352b81dd25649739ebdc275043beae78fe1fe320f07c02939333f9676f63e233', false);
insert into "user"
values (90000154, '荒井', '道彦', '1993/04/09', 90000012, 6, 4, 'RZzXG0biIE3B2x2sn1uo1gS0j5hVwRs3',
        '4tJ2O80XNOxHCIClHQTmPrw72bWPqALm', '7dda9940c25f2eaf3510d2bc850cfabcd95f42d0aa40e69460949a3f8e256130', false);
insert into "user"
values (90000155, '瀬戸', '新太郎', '1988/08/11', 90000012, 6, 4, 'hBpxlSDZkXa2IRgG1JZS79iKkwzZYQN8',
        '7uxVODOykfmzSkBLQ3JVySdL2VUNjcac', '5fefbfca17d89db8906b00cdec14d8beb915d03a4e6c643c69f38f2379ce45c7', false);
insert into "user"
values (90000156, '三宅', '僧三郎', '1970/08/11', 90000012, 6, 4, 'FukIPqcp911cvKjKIO0FnOto4N6R2zVt',
        'rsfkkYFgvoYTAr0jpCbE9PXZNaKyhQKO', '19e62fc43c95b05674ec7ccbc3df2040ca9c8b1b66171595b8f7417dbbd87e83', false);
insert into "user"
values (90000157, '鎌田', '一人', '1984/12/11', 90000012, 6, 4, 'enBOcSJd0HPK7tg7cDrhoz1gdnxpz9hO',
        'KbOkdDL14g22vZ0B5qJWSdtnDCiuXpOH', '290fa836cc3d279d9b85ebf6aeac234cd41e551668ee1430f11599649820f4d0', false);
insert into "user"
values (90000158, '入江', '眞八', '1990/11/27', 90000012, 6, 4, 'O9cOz0Z4ZBr6C0Hsf6njN2XswutqaE5b',
        'iB0ZP5PsgffV5HO1UBUay0kKp28esoOX', '5f1b2da83bc2b260fa3ede42722721f82dd607c25f1cc9f2864ce805536a5b9c', false);
insert into "user"
values (90000159, '飯塚', '政治', '1989/06/04', 90000012, 6, 4, 'pgWX0PlsJnV4gnkgBAZTG6EuET1F2DHe',
        'ASHeMCLxPrZX8VSowHqYVxdHbEoCnr8T', 'f4036c5c1a2648cb6a335fe13d21b1b6622c2756fcb69c4a778843f1832de3d5', false);
insert into "user"
values (90000160, '福田', '富良', '1988/11/18', 90000012, 6, 4, 'pJQeYae4irhgmT3ofvRjYpsMiDPWOARL',
        'UBnlCovdXUhOYF9b7zjwHji4gRlzaOjD', 'c98984fedcec3f4c5dccb2343f4c1cb2ef1aa0bbbf3dd8bf197a193452414b71', false);
insert into "user"
values (90000161, '谷川', '静市', '1987/06/10', 90000012, 6, 4, 'y07w28lkpTA3WR0LQesjwcBq83ukYFsL',
        'b0oRwznyB54wqKupcTS6wTA9ZdctM0mC', 'ebd1fbbca15005ec62509906e272642274a00850d0b0876742c6e85e008aa6e0', false);
insert into "user"
values (90000013, '大内', '長一郎', '1975/07/15', 90000003, 5, 4, 'v8Ibs5NRzfj4vqtWOiXxDDqyYWKIy5n0',
        'bJt1GBkOh9HLDOUpovJxbGFVcYLALVoA', '2cd6ffa6f27e5dff050670997b948bcf32c466d742f7f6abda29609875c2b389', false);
insert into "user"
values (90000163, '竹内', '稔郎', '1991/12/12', 90000013, 6, 4, '8YQ3CUt0nFEjHUMteD2AUdYiKJxhfQER',
        '3SC0lJ2PP5moduXrZL25knbcuXfowvGf', 'b4b2bfa0c4bafbc1500981bf66ef90b77f007bd6620bb994266f2ef845af4ba4', false);
insert into "user"
values (90000164, '大塚', '芙美', '1977/05/14', 90000013, 6, 4, 'dmGQbbVz8RdJkrxGJ290jyXUmdsTzW1p',
        'DJNCniYW3WUzCQTKfM07ajfgqZvCaW3x', '4e951850e4a8f3e708895f3b7568e59472dc6884b58a237da5d9061af120a14e', false);
insert into "user"
values (90000165, '矢島', '圭織', '1984/12/30', 90000013, 6, 4, '91ecLeJr1mhs4QgvUUpdyudpMUY5RPXE',
        '512Hol2GkAIogG7kVW4fs14H7BylJYfO', '26b148be6cab68471f90b3eb5ceb91e3c34db92be53cb098c9c8186dd2320ac4', false);
insert into "user"
values (90000166, '岩田', '心一', '1988/07/26', 90000013, 6, 4, 'usasBbFejzLNlyynBxUlmSMW2u8djtan',
        '1gpdPjv94g1QJUcGWKx1smtIPauq6Ur4', '5772adb04306f99a950524a67d77afcd21148743ba5b6c84a0dc8d260a6c7abc', false);
insert into "user"
values (90000167, '齋藤', '三男', '1974/06/24', 90000013, 6, 4, '1Lk9ZDstLIb5jpGdm21Q5T1DtBLSYs8x',
        'y6sK7K86ZxdloeUJoPEXEpMSgNT6PE2g', '46d93b37daab5418eb84f211c77b761dad2b5282e1f695175ab86ad8b1c7baae', false);
insert into "user"
values (90000168, '藤川', '絵梨', '1974/03/26', 90000013, 6, 4, 'CRehxOQv5tyHy0Z73RreTnh2sYqenrG1',
        'usVA23dcG0K3iPiwLhp7MbqQyU5WLf4r', 'feeea0b813ab50a5d2da8cec0be26ee3c22a3d24db914662f04429f310bc1882', false);
insert into "user"
values (90000169, '浜野', '保行', '1970/05/03', 90000013, 6, 4, 'OCuWecpDMGMaItdrCdroLOTW5dUjkpye',
        'UBs1LQwmRPvcGCZ9r221oE9kO05sCk4h', '7dfe75649c03624e51b1285cd2a1881882d304f51ffec07adaae9c0084e1b393', false);
insert into "user"
values (90000170, '大内', '洋和', '1978/07/11', 90000013, 6, 4, 'uvvNu1g5inrF1bu6ZYo7S5EOGrUkBguU',
        'A75SQb8IJtPotanph2jMNmaM0ucFSooW', '770360207fd9009c3425200752e6ed683123fbe44714625e486ae850a814417b', false);
insert into "user"
values (90000171, '矢島', '千恵', '1978/08/28', 90000013, 6, 4, 'V9huI1ZmxTPvsWOwzihji7uSgLT0vWhP',
        'fap2Qd9sjtZAUKUMNLuY0ZSHUkPSvYIi', 'e4067fc0c873cc48da433886f93f1510a38835264c5fe7228e1af7d4c9e456bf', false);
insert into "user"
values (90000172, '古田', '征二郎', '1987/06/10', 90000013, 6, 4, '1aDJncVDOz6vSNc6cbcdeqAbuTr28JGE',
        'Gf60InAwyEIWojWqRzsOpCe8HUZuL4ld', 'aa3db1f62026ea7f3afdfcf3b54cbd0ae70cf53d7c7952f1a5ca2db7872e95e7', false);
insert into "user"
values (90000014, '新谷', '知生', '1973/03/22', 90000004, 5, 5, 'IKpYdU30z33ne06oQeLSuWD96vZR7KHY',
        'nfrp9oGUE8oO23aDHSzXhuxn1gGITs6g', 'e66be7a9b9caea28001d762aca379f05da75b88a11aac1d8d0343c01f78ecabd', false);
insert into "user"
values (90000174, '足立', '数也', '1989/06/04', 90000014, 6, 5, 'xSqP2cCh6zKPDu49BMS7uc0IL8yEYe9X',
        'gA25sS75sDFab5wH9oCpHaNlBpHBXL2R', 'e993e132f0e9260f3a11cbfef27357c175362183d158661dccb06222b30cad89', false);
insert into "user"
values (90000175, '長谷川', '政治', '1970/09/23', 90000014, 6, 5, 'ciibODKo6XguCYjZ6uxP3OBzttWsLs34',
        '10VZ4XyksevH6mZJZWL6DNPpLXgkrb21', '75ea3f3fb039ed72d885559378ad8a7d90ceb86ec2e2ffb9b95b1a363b9fed11', false);
insert into "user"
values (90000176, '土井', '織枝', '1974/06/24', 90000014, 6, 5, 'qF6Uni85WCbDodUQmTxSG6GKdUsPlSHS',
        'lSaHuRryOzkGzuf5kiBJmKSM32lCgv8k', 'd52c10ba2a0e3f7cec901eb9f32f8db2473ca278e2f9ea3a94c6d9962ee3a77c', false);
insert into "user"
values (90000177, '河村', '智', '1973/07/17', 90000014, 6, 5, 'qXOQM1Twg4uELmkCQTRupLSmnbc4cdu4',
        'ZaCKbxMjuFIAX8tzHosHhk9FKOTvqqVC', 'cd27446f10e3011f42b36db21bd518fef3c8761d0dbc014a895d478b4c39a785', false);
insert into "user"
values (90000178, '古賀', '友隆', '1981/01/28', 90000014, 6, 5, 'zoA9vw6HyzItTMS3cUVH0AJzj4flrAYj',
        'oBK4uugXvThGCb1Q7uyLZUCb9Ovmkebe', '4f2aa06909d6fe110589bbc9cc2dcb5105cfe896763edae1ffbea24e5c6e862c', false);
insert into "user"
values (90000179, '浅井', '保行', '1978/07/11', 90000014, 6, 5, 'FjMC3WaROBM9BDQHQUmeFYYUbFlEMIB5',
        'TPwZOIEyRK13EHaIJK11MOOmzCo0cJzu', '859e9756e08e41a1265fb13d98fa7609e694271edf68f3715da6853541b840bd', false);
insert into "user"
values (90000180, '及川', '保行', '1992/05/11', 90000014, 6, 5, 'V9vVtKfa7AuTkDtKibAdgf6WeZcVU2MS',
        'jzX8q0s96bVHsjKhIR2bOWaONm9Cn1ux', '92bba03fd6ca68b8453085ebca002f115f34eb49ee97c27290589115a409da5c', false);
insert into "user"
values (90000181, '萩原', '征二郎', '1988/11/18', 90000014, 6, 5, 'tTXBhsSJwgJWeou19oFXeNtQeq33eMOT',
        '0sLAUdbpunfGpADqjedrT66bKAymsrCH', '99e29e7faf48b6f9671f26a7b53b573354c06d3e3453cadd614d21e8cacca1cf', false);
insert into "user"
values (90000182, '杉山', '洋和', '1988/08/11', 90000014, 6, 5, 'p0PVuwtELll9Q9SbFBlj042UDTHbaxQj',
        'htwdyoNMW2YBG163Iw2QzHM4ckJUMOr2', '8bc36e740b12c9377d8e46ae20a3fa02796a3f6ee06adef3d7fb5103051f2c11', false);
insert into "user"
values (90000183, '宮本', 'るり子', '1980/07/14', 90000014, 6, 5, '6allfbK2dtTzn6FQT5loVZ3DYc7WECfA',
        'cy6BziE46BRYKRBGZAYQJz6yK3pd2Vcu', 'e74a2849e694232d01ed3237c1548a34498f164d49669fb158039565e6c552ce', false);
insert into "user"
values (90000015, '浅田', '満生', '1988/08/11', 90000004, 5, 5, 'sny2tvetCUSN31u7ua6U67cPreL6jOV6',
        'DsJ7kNHjOeCmcAl40iYeonOhd18clLsE', '65deb568fa5ee187715bb6268c99e6feec6baf6bbe71de01878c6d9b221059a0', false);
insert into "user"
values (90000185, '堀', '成美', '1991/12/12', 90000015, 6, 5, '7PxhR3W06G528mFh6GVG7FH47QozGTgx',
        'y6453DlGW7DJAw9mZyARw93HL3mIzhUu', 'b1bd119df3021ecf6da4d37d2f818bf0ecf2d525ae20614138276c5933ea2c28', false);
insert into "user"
values (90000186, '宮本', '浩一郎', '1982/09/19', 90000015, 6, 5, 'zXD2E5zmjWtzu8dAPJUQywVPIhfLYH0I',
        'aKXLAvtYGhUgXDOVQ6s5ioXPBkw0fbSq', 'edf5e28a5715bb61feb03fd5442d0bfccff5802aaa6e63e0cc2349790a6dd18d', false);
insert into "user"
values (90000187, '藤野', 'あさ美', '1991/12/12', 90000015, 6, 5, '29C7w0GYsx8tsYY0n9uFYOU6Zv5BToR9',
        'iYAHjzXOger9GaG2KqPdNmThcujQh4Iv', 'e31b257add5b67bb8a181ec59443437759f4d558b35aac5d4e298083a3dcd0a4', false);
insert into "user"
values (90000188, '滝沢', '和海', '1975/01/03', 90000015, 6, 5, '1caMzEQ5tXqI4Mgln3KjTGnYjMmIDsx4',
        'Sl2tOHh9GNbGvcGsbr6JXFrb4lE88Nmd', '715f474bcc076ecd6a89192a5102447c470034305cd584a667d5ca00876d83b7', false);
insert into "user"
values (90000189, '菅', '織枝', '1994/02/11', 90000015, 6, 5, 'I1FHm88hjrM1TRNA00VJzeS4jS2fSQBD',
        'lqQkyntk13BPu7JznvwA1XT2vxjsdZ3P', '486e3d84d9516ec84ead5a82c2e822111a6968317eb8da8820ee055b0f885da3', false);
insert into "user"
values (90000190, '小森', '勝英', '1992/11/18', 90000015, 6, 5, 'XLhuW6v5bT6dqTIq7EK1UWcaGF8n60I7',
        'o1QPjZiCxG1905NKQupFseANKrKr2obm', 'b72e6821bdc0680c5d4f74f451421c5c8d95744eb612dc66c0b12d281aa4614a', false);
insert into "user"
values (90000191, '浅井', '定二', '1985/01/07', 90000015, 6, 5, '1OhhTPGo4QLVoeOg74S4lwpIjEQeFbdz',
        'lTc2p7q5fxZ0f7V8dZx63vt2Gib7sJeR', '715d602c5e440c3969798d55ac5c7a14b006c098248c6e7a8f6f7c1aa52facef', false);
insert into "user"
values (90000192, '杉山', '幸信', '1974/03/26', 90000015, 6, 5, 'W1noCiEmniLIMrpulyWyq68VKrnJmOCF',
        'TPGQIIet8y9GBsVfrI1j9PDP6EfjgK3O', '93215d73747fd99a6f94a55d8a37441a95493a046ab5388927bba4bfd1637f9e', false);
insert into "user"
values (90000193, '松永', '征二郎', '1980/07/14', 90000015, 6, 5, 'MJXSoB1aoarUwmhXRszH4Fcpw1zRqjVA',
        '35XA7VrxQTVIVJlme2bM9kHCIAPfKH4O', '5f49721947e0292bf69251bda8ea076e5e11e73b9a2d509116b4f520769805f6', false);
insert into "user"
values (90000194, '片桐', '沢子', '1973/10/15', 90000015, 6, 5, 'klnb66fatzF6YtXAJVqCku5znyEQEsHT',
        'EgMQopWRAGt3dhRzaxojudQRFPGQ6a6d', '7be6fdc48c532e751720662242092e26636de7f822f6364e73ed9226afe7cc05', false);
insert into "user"
values (90000016, '黒沢', '一馬', '1971/07/20', 90000004, 5, 5, 'GBVd2Umw9MddszGHD3AC4j9YhyYPSWHv',
        'pKM2ij3WrZxNntaQKcr4WI5cYDEbjGsh', '2bd1866bd0ad4c19582087fe55f1133a4e039f3eeace043dee68e0a98199b202', false);
insert into "user"
values (90000196, '松田', '保行', '1987/03/16', 90000016, 6, 5, 'ySzXo1GbWQ2miTUVuv7eSVBERGsDSkQl',
        'i5ITd9xewOn3JDSkCc0mxeqVTSaRaiuB', '788f07d0958ab4659e9ce93b360ca04bb59a180b776963a2b5679a2e223cd0bd', false);
insert into "user"
values (90000197, '長島', '富良', '1991/09/10', 90000016, 6, 5, 'bz78CEIlmWYoq9iL0MNgsAFICq37AclE',
        'Luo6Ck8PgTB33bq1Swtk7j7GR4ucJ8XK', '0eab03362eb4ab5a469ebdd3d23e523084a28feed87204426bb07a1d41c2c653', false);
insert into "user"
values (90000198, '松井', 'ナツ子', '1974/04/23', 90000016, 6, 5, 'x6tB74Qli3voRrbg9fIsKwVk8In1cdNu',
        'OFEDZAiFgJEytQsU4Gpuc9EvzJ7Dt4Gy', '0b15d3fe0763c5858c7ca327959dc6904592854ddd7019feb6e5b7c0db430a2c', false);
insert into "user"
values (90000199, '大塚', '政治', '1985/02/24', 90000016, 6, 5, 'NPzjfoitSUCL1aPjQkbWuXufiu7zEuJC',
        'sbuo6sNsqD9kheXgaxeXFVGlFZwSGfSV', 'eadedf9b97e030111fc45c7a1b844b35c6c863572d90ccfedcf94955631d9d78', false);
insert into "user"
values (90000200, '荒井', '心一', '1977/05/14', 90000016, 6, 5, 'BGkfiZFrAHPWnklUztC3S1rrmqLImKMj',
        'F7HZ3jSIDs4IqDgJmlcWo7Z0ySe65Z8h', '983e8f02cb0fddb8a1f51b4f1eeca66c980718d3c39b8e1dd08169254ebd32ab', false);
insert into "user"
values (90000201, '阿部', '聖誉', '1974/11/21', 90000016, 6, 5, '56UA359GcQikggnp4ZaqwGosZVr7uXjC',
        '6GMJ4QMUMX2mIDyQfRpxyMlIuyc9eVZb', '6c0cfbafe1d6c4032c42c7fc325e9170ec40ecd4ce8ccc8e01850209e1a3edc6', false);
insert into "user"
values (90000202, '米田', '友隆', '1977/03/22', 90000016, 6, 5, 'LvvIvPz0FP4JvBNAajDNZZeR4s5kUNsq',
        'inKZPc7pjOJMtIJYYSRqAkHWPGsqEK2z', '9e9384a9f1d7961cd2d42ab69b9c3c95789df9cb39b958b4092e5fb7657cadca', false);
insert into "user"
values (90000203, '矢島', '芙美', '1989/01/19', 90000016, 6, 5, 'Mtosvo8xW3hkxltGHPCrGQDkgPiV9SrB',
        'gYGvB5poprs3gR6YUoT63fEXNpOf8itf', '0643b4d19d857db7a1d682c77f37a5f68526fd999240d200f8c0613cd5dc5eb3', false);
insert into "user"
values (90000204, '大谷', '和海', '1975/07/13', 90000016, 6, 5, 'WigTydEPv2r8FDtJHNzXO3HJPeH2tLq7',
        'y1LuXcd0k49QAZFhhZRLdoOrA8GYBCsj', '9159a26819e79fe65f8fd07b8f126227086c38aa7a96d3ffe14530f2fa734956', false);
insert into "user"
values (90000205, '黒沢', '眞美', '1989/06/04', 90000016, 6, 5, 'FvJIuNWtyA6TckUp1oQad5tJDo1TYjcB',
        'bNgz908tgXYNMxvc71B79ElTSzgc8VQt', '968aacfbff77601809ba7d7bc100c62fc0b3fc6ea3ceba2cdedd0817b3117c53', false);
insert into "user"
values (90000017, '笠井', '知生', '1977/03/22', 90000005, 5, 6, 'Wj5DBmYFAJhNpV63eP0AaxhoUmR4Vb0N',
        'aNyXVTfXXntrFuTiYL28CLUkL1cx8faF', '9561de5ec0029c4e49c4b7f8ebb96cf0359257a211167b83d4de3af5729f82a3', false);
insert into "user"
values (90000207, '藤村', '定二', '1989/06/04', 90000017, 6, 6, 'hvG7Um8uHXEciprSZV31EXY03pcSwaWO',
        '1C2yNYeL1mL2DGPXG8QnM95ugBWdsFmM', 'aa52eba81c3bf758ad015e75ba98960e252add4270519abea9c651dbc1af0328', false);
insert into "user"
values (90000208, '比嘉', '一人', '1994/02/11', 90000017, 6, 6, 'aupZdqJZzj3jvcYci5Sgh8SyeBpu82Zk',
        'q53HOnMXbDVXfSAOtGSHgqBBAVjJQqGO', 'b0c3d9ffa481d7f11c3166e3b84575da75bef32fc147c0ce3b0ffd648d83eec1', false);
insert into "user"
values (90000209, '長島', '浩一郎', '1984/10/04', 90000017, 6, 6, 'e64oDUUn8SqJJEov9wAANaT0OVSC7lKQ',
        'SMEEu5KM8txdaQTTjWiRlgKL4DC2JzpJ', 'fbafd67bf044b20de6196217f32981c727a5c7254c7f7d8efc27605c8f0e1e70', false);
insert into "user"
values (90000210, '浜野', '一人', '1970/09/03', 90000017, 6, 6, 'eWuo6AqXG8TkxKpsK40f1nq12goTQ4ZG',
        'AwkKfOZTDoVf3SKQkON21OFLoH3lC5yN', 'c9d2e72d0c9aac0fc1ee7032dbc8db755966a313b49a1f15f7746ea0fe1739a0', false);
insert into "user"
values (90000211, '宮本', '準司', '1974/03/26', 90000017, 6, 6, '1wFiXYfKizufFvwYsWcJ6S5IOAUeRohI',
        '0WJo3xqdb5mkAxxcdAm0Home3k0SPKvH', '3d3bba32c9cc3fc32734cf66a22dc79ccb8d685584b6efb183aacaa2e844cf46', false);
insert into "user"
values (90000212, '長谷川', '心一', '1988/04/09', 90000017, 6, 6, '2Dwc6Uof6778vmepCP3UO1Qt7nnw3wpk',
        'kdqVi5FHdzI35miCrlzyPzICTmYn9a7z', 'a34f2c3df4bc9c7208dff1d7b0a72a3fa656c73e6ee75fab39144847128ef052', false);
insert into "user"
values (90000213, '佐野', '恵', '1972/08/11', 90000017, 6, 6, 'K7tfYhkgyhGYnuDoTrwJhTEGy8tje4DS',
        'OGMxkcpFuD7UCynpW3rsKI16T6oB3vEd', 'b2b3763f3d103be2064c886acf27337597c4ac1898ef053bcb7553d50b1b5d63', false);
insert into "user"
values (90000214, '畠山', '一人', '1990/07/29', 90000017, 6, 6, 'ZOqVX13OLOpV90ZTkYTpKjn806jkUoO1',
        'mYBy7AZ4RGVnp88cHZemkytSN8u69U1X', '82e1a37c864cf44e613330514f623b868aa9c5c257e123adfd2df09f36a21c5f', false);
insert into "user"
values (90000215, '小倉', '喜重', '1976/12/31', 90000017, 6, 6, '6jQr5Lf47djXljH2zI0Oeon2zhySalgp',
        'EWJ0TKqF1vDu8aw90jyRhP2XvNzq4LJz', 'a785adee89daf0b602a93b5321d1f0d19211a88010b185f301790a3ba71bda59', false);
insert into "user"
values (90000216, '滝沢', '一馬', '1974/06/02', 90000017, 6, 6, 'WGIoXGgoGKynUSNOn5TAeJHu3bPV9wJg',
        'y50sjqI2sfwEFijPBd2jasHJEoVuyTFH', 'a37964d4bc9a720469b7e47f06ca21a742a1a71ce8104411668b25055df78816', false);
insert into "user"
values (90000018, '豊田', '恵治', '1985/03/08', 90000005, 5, 6, 'RsWe3dOO2K03jGAEzvaPCCDwtvq40Utp',
        'Fl7xriwxM1sOu42SoJpzLuDAKIB46Plc', '63cf4fa4ad765825af3577625699df40e9ad7f8eb037a09f3830e1f73a4ebeb0', false);
insert into "user"
values (90000218, '大塚', '治次', '1973/07/17', 90000018, 6, 6, 'qSxcC6akrqZ5YGw984JCWNZq5gBe6cfc',
        'M7I3PuacoTtiYir1joFHwZtiWeU3ofcJ', 'f0355668f9bd34cd4dedfe0b035a02b8c211ab0538ebcb543a9f5d66b1b93b24', false);
insert into "user"
values (90000219, '荒木', '和海', '1982/09/19', 90000018, 6, 6, 's2G5geb09SzOv9jn90WI4HJEwv8BHy2i',
        'bcmonGqDoyb0zFNcKpH06D9ccTqY4KaK', 'ac4a05c06be298b918fa94da83a8b7a6ee28be51bd258d1c61ca98dd3b961fe1', false);
insert into "user"
values (90000220, '上田', '朗夫', '1991/12/12', 90000018, 6, 6, 'N5WQjYN9Z12obv8trFaWGC14eLXBlTNg',
        'hw0B5bIc68SJcLGslG1MDugHgVcmuyKb', '5ad17ccd40d02a0547be39ffe0b19f822eb9013c7202a0f9949c92b7267aecf8', false);
insert into "user"
values (90000221, '笠井', '千恵', '1989/02/03', 90000018, 6, 6, 'HE9vBJH9nJvbxAqcpvwf2VU1GQd7bAKA',
        'OywcooSU3iiCByHKw13IqFjtnnhNo399', 'd876d0e813b766f718f40475a62adc0341e7ab6cdbcb00a06d794b3f0be81820', false);
insert into "user"
values (90000222, '手塚', '淳子', '1993/12/04', 90000018, 6, 6, '7hustUufW2YMxX5FPKd3o4MYDm8AR5xQ',
        'SqNFc7phbb4eQyzFmVvIgN1465T8vA2W', 'e3c17678ff25e4961e8849c271975dfacdd783065372eecb381c742d5e4d49d6', false);
insert into "user"
values (90000223, '藤村', '洋和', '1985/07/03', 90000018, 6, 6, 'UetzYJWot663sdSiFN8TtExXAFEeJQU6',
        'H1a0i4nwHZgDj1z1kgBhtWHrt6TTjjyI', 'b021d87bed24e6bab881d4186e234ab2c3367e899db87c2f213d09914bde320f', false);
insert into "user"
values (90000224, '石原', '芙美', '1972/02/25', 90000018, 6, 6, 'tVA3DGOgRH4EikQyRqLhPKveialVRXA3',
        '808ggOxD6u57NEjtz5jBBAuSRTjS6wg3', '384a274c78b2f1740a329f7a82344a879dac19b50d87bcd61f062e0f33dfb4be', false);
insert into "user"
values (90000225, '河村', '一馬', '1978/10/09', 90000018, 6, 6, 'cjK9caPm3em4nQcf3Y68xMPJYU2XDZ3a',
        'Zt39jfGwHw307tc6pHMifB9ldV8efN3Q', 'dc5a66910949931401e2c56a47a82f8ebcb31fe4ce734ed95f7f700a91fdc5e8', false);
insert into "user"
values (90000226, '齋藤', '恵', '1972/08/11', 90000018, 6, 6, 'XTm1ITiRA1p1omZ0pKVjyyELwyF2S1Ow',
        '2wOFzgrWZ3e6rLejU9rzyOEFcwwBaVQY', 'c5647156fa1e8cd270bb85069f7a309c5d5fb0de49e32e85602d0c38d146aa54', false);
insert into "user"
values (90000227, '片桐', '喜重', '1973/07/17', 90000018, 6, 6, '1mwTiwIUjn3kTrcwVORrVSB0C4b3PzbH',
        'aWpFax2kPh10XdjCf45EgctSs0INw82V', '9b57752d6218b3e4775f23fc82341821f198d96b6acfc1682bf96a3889679f0e', false);
insert into "user"
values (90000019, '及川', '聖誉', '1985/07/03', 90000005, 5, 6, 'mmMfY9VKqJI8CuluzMLRGDbyG1GhzMZf',
        'Z38BbDYE7okfgnuhrZ0rIVjm3erILtJ7', 'c29a8399bc5fc6484405f3cd75a59d443eae2b280370c47a641541d155815e0c', false);
insert into "user"
values (90000229, '藤川', '鋼三郎', '1980/07/14', 90000019, 6, 6, 'MmzvvOiNw2EtEMHCEfvDGnClkpRdoF96',
        '7BVO1Y1tJ7w8LtRsDuCISyq4vbiF7RDy', 'a30d9607867a0b8f78352c01665ab8a05a2ee1b716b24ecf3d5fb40a0a890bba', false);
insert into "user"
values (90000230, '及川', '昌光', '1973/08/06', 90000019, 6, 6, 'cEKTbfUFLvRO9zwB7rx5g7nNbbyrOlVp',
        'UD9qrPuFgeyRZdKlJVihBkqtC77SaD8p', '72be814c598e82fb723cfccb5da460bc79d77ac448d53a11ab6c2c5ecc4d77c0', false);
insert into "user"
values (90000231, '滝沢', '浩一郎', '1994/02/11', 90000019, 6, 6, 'mGwmg5ZZD6ipof3tFaw1gRnLSjy95WpW',
        'hCrRkPmVVgiEE0d9mgCgaiRiT1Mulxyf', 'b31cfc35abefb34c7758371813d520a322d4e80079c5f54fb20b82bc9a472c3d', false);
insert into "user"
values (90000232, '豊田', '茂義', '1992/04/11', 90000019, 6, 6, 'DG4V03DxvFhX6xCdeloQpMDh6vDlgSYQ',
        'TEPo0wbHnMQZjQzV2U7QrQJqmRyjaDEQ', '061ca294a57b1f3e6851142f39ef98156c7429c0bac6b9f76185ad0fbc5d3ea8', false);
insert into "user"
values (90000233, '南', '宏季', '1978/08/28', 90000019, 6, 6, '4uOp930oVK0HRYRcrdK8W3PXyU6DMqUC',
        'jMbhlfbiYHdzpMXliQBL5mXZoB4BdXFf', '616adad27d636ab13b4fa87a0c92135ca697dc5482785d1bcabfd9a6f5ead03e', false);
insert into "user"
values (90000234, '萩原', '菊江', '1972/02/25', 90000019, 6, 6, 'vPNs7R6Eq6T1CxqRdJGvXKW6TKF7Bral',
        'uZAk1vOuKNAL0Lqfj2aXw76laFyxcUDw', 'b9ae7a5e67f9c85e1cd10eed576f118dc8dc4dfd36235442458f6c262b37421d', false);
insert into "user"
values (90000235, '大塚', '直幸', '1980/07/14', 90000019, 6, 6, 'FgnxjiLQNiSbA5em7mIzs2Nk0wjmH957',
        'xH792Jqam6Y7CI7znXHJ4r4Xg1K6Do3T', '9c913a89a63790d974799595474387cccb1f75839727509a9e91a8e0954a37b2', false);
insert into "user"
values (90000236, '南', '玲', '1973/03/22', 90000019, 6, 6, 'aOhRZfRISy3PFTYfJ4RKP8N9LjQueNRy',
        'TOD9FcJv8sOlQe8b3XyWWzJTzO07n62S', '969448c2f3fbb4f63a468da07b4e707ea85eb806c610adfc8b301054ee232787', false);
insert into "user"
values (90000237, '入江', '弘義', '1973/03/22', 90000019, 6, 6, 'Ps8o21ufJAX9RYSRQJHKv9jbhBhTySQW',
        'MAURgOrS2Eg8sQu5MBZ6jn4ZddgQvr64', 'c206db4ecc423d470b7edf41faca39178a85b17afdb197777c171056de59faf4', false);
insert into "user"
values (90000238, '岡田', '玲', '1973/08/06', 90000019, 6, 6, 'jPMqmc8e7KuxvKzKpDQOS9oooJKQNQG3',
        'Ap4QQDJeU8xpz0fk2EOjn1FnQkMUy9RP', 'd3b58f678cf2a74629bdbf6c5b42ce9c59ab634ed5bfbc4d585ed110205a7817', false);
insert into "user"
values (90000020, '土井', '一人', '1985/05/11', 90000006, 5, 7, 'ZVMloIiPCmZC3kpyfz4obbemN5tWqvrx',
        'Kvx5JXqn9TXY60vc3bpIdoq5BqCdg7Ai', 'f50235208ee1aa3c63b3e9148bf2ae14af4045095a3a5f4f5095f82e09fb1dce', false);
insert into "user"
values (90000240, '黒沢', '明博', '1992/07/15', 90000020, 6, 7, 'rv6swKK7PbSBVS0b1tyxHe74viGLPUTZ',
        'c7Q2z6Yec8SdBqnJfeyAmTNCBQLBdSun', '58d7f46f8c71f5f3b517e85e1308506a55b21b8ec213888ff2487b2e041494c3', false);
insert into "user"
values (90000241, '豊田', '僧三郎', '1986/12/13', 90000020, 6, 7, 'WCFvs8yO6NDeBrUedB7IWHZYy3n8HF77',
        'lpIoCFan6uY02ezMk0XNTXtEpCfzma2c', '26f4b8a30c79c98b19dfa6f1b7ab728b5b531e93d4566d14f6d7bbd67b1c70ef', false);
insert into "user"
values (90000242, '林', '美世', '1984/12/30', 90000020, 6, 7, 'xFFDA2qftRY3fSihDVmxlph2pd2MHmfL',
        'WYHXyUmhtV0j4ee7FaOhAehSCkpTiMYP', '13cf2c2f0c8af71a05c37d970eb851beee2fbfd768ea6047b2e7db23e858b286', false);
insert into "user"
values (90000243, '石崎', '明博', '1974/03/21', 90000020, 6, 7, 'l1JTGMTwrXUxkvXJsmLCCGwAQJbN6WxF',
        'Xn1BF49ydjCWFzZb8IGUmjNjpbdOkLQr', 'a2f536eead7d0a66d796284ec61e4dbac7dd111dae65d9b89c2db7941a45af69', false);
insert into "user"
values (90000244, '藤村', '三男', '1990/11/27', 90000020, 6, 7, 'kJMHlEsHDJ45rnxshw5lfLAl6Lch5s6o',
        '7i6qwHXZfpXt98JipEBf16KLuXgYUtVD', '77e67e6964d209ac679f60e5238ca9908651ec5e6bbd24a01bea2dc1d7a288d0', false);
insert into "user"
values (90000245, '小森', '一人', '1989/02/03', 90000020, 6, 7, 'BgvdEzieGzEzhOjzZHq0wa00q3eRHhVn',
        '4QI4YdrZhGoTMS1VxDTblDytuSnumqNY', 'd4f36f5f7777bd23706932dd0e8fd8b541cb8221953a3b8c869ba8f854148256', false);
insert into "user"
values (90000246, '佐野', '幸信', '1992/05/11', 90000020, 6, 7, 'RZOnfMYIAJFhpHUatU5Y4ObC5S8VF9pi',
        'w0UAV9DIwZ6U7vrWfFWWPKSiOVVoB0M7', '4554f76d97c515d2b1cfd960b73029a6dc26034da7e39191afcaddce67116a53', false);
insert into "user"
values (90000247, '大谷', '明博', '1993/09/24', 90000020, 6, 7, 'PJjXCoT6pJC6wTZyKYEd1to8XWr8zCPL',
        'CnBjAF2QnOC17KqXaUzYOhqn8TllHh6D', 'e85f300ff9563fe411b7aa2afd42304d7e8d704929c794dc54f1ec2668fa3ec8', false);
insert into "user"
values (90000248, '大塚', '朋美', '1978/07/11', 90000020, 6, 7, 'nDD6bUs0WDjK0zKiKN6EGsvDjj3MEmww',
        'tB6cEOrxreHOmGidS3AmzF19c7MpKHuV', 'b16404289c474856d39d749f5a1e23a247add9971cfe7e97fe6b2cad025a66dc', false);
insert into "user"
values (90000249, '竹内', '喜重', '1973/07/25', 90000020, 6, 7, 'k6ZeeZr0smwKIMZljvdsqxTlnq4acqkp',
        'OYOSClkdcN5FjlAZ5kksVErRKo4ih4V9', 'db23036e01e7eb4d5d9bab4897e6646f806c71a9b9cd02f2bdf0dfe27bb508f3', false);
insert into "user"
values (90000021, '藤村', '直幸', '1993/04/09', 90000006, 5, 7, 'bPKAUzOcHxvTnIgPKNr40iESre8dFYqA',
        '8rHtoVpjIgrmr78BEJwP6KOwFwsOSKwl', '66deb33204b7e93209250cc8aef23668787175e01e8cb9bc41363868a8a943e9', false);
insert into "user"
values (90000251, '萩原', '玲', '1985/05/11', 90000021, 6, 7, 'PpV7Xo1CfuYZVNIpls5Qe1zRhWJzVjnv',
        'GdWyjBBZbw9rQ4OitUn73JGqh5rOIDd5', '416556501a91c8358bb3c12319e2359fdec33a61c28017febef86dd1ff4d9f5c', false);
insert into "user"
values (90000252, '溝口', '芙美', '1992/04/11', 90000021, 6, 7, '2eVSNsee8uOaueRTwoIJNXK33vP4ybP8',
        'TH3ht8AByx2qwxfiEE8P7dHGE88VDZK3', '2a3566006f3833fc214668af6d7d0fe7fa0ee12cbb69c37b3eff728c77be6a4a', false);
insert into "user"
values (90000253, '大塚', '祐美', '1973/08/06', 90000021, 6, 7, 'RtkXfbvALHOFSP5rx4fCVUACV34hPUK8',
        'fzH9SszHivQcweG42BYNJKJlKwhdvlEU', 'fac398e84cf5ecf3d42c8dd3cb67cfede55e734d659111a6c6f09dcada94e82b', false);
insert into "user"
values (90000254, '町田', '千恵', '1989/02/03', 90000021, 6, 7, 'Y8tUSYFJLCdDTj1NSzIbVrhFsEDNFd0z',
        '5N7SpN4jeWGEv6VDXdDmlP9jqJnoYnqz', '4fcc2f38b7d189a41393aba06a34bb28c31619aec1e841ca02fd31fb97936b6a', false);
insert into "user"
values (90000255, '新谷', '育雄', '1976/07/31', 90000021, 6, 7, 'rsAw4qPZ6WdhSKQSK0pynjHoNC9HuYis',
        'iEZnBLlbHWiVXpXVgcQdxWsduJGvcYCE', '0d50f5580c516378f9f2c30c5ebc114253214e8d2ced2b1305f87b692d489f1e', false);
insert into "user"
values (90000256, '三宅', '邦美', '1991/11/19', 90000021, 6, 7, 'Efm716yCNz66UfsxvfSvYXHlHCqhDGYz',
        '7zcERrxf8mfDPYf44VC45Hnfo3HpNeTI', '90a1634e1bfe0bde38de92c21016890f48823e0bf0acda7a5d435782be95208d', false);
insert into "user"
values (90000257, '中田', '美則', '1987/06/10', 90000021, 6, 7, 'GQvS5vvkokR5yLE4GRsWik60Mno61LwY',
        '1kgsa2wYQhA0ParQrQtjD5T2x8yFEO1l', '77f1fc7b187aa063d78aeecd97035cc98318ccbbd892aaa1f3fda720c452cc22', false);
insert into "user"
values (90000258, '平田', '邦美', '1986/12/13', 90000021, 6, 7, '6a9tdwH5Y9pl5knK6ujbwgdKVy6HwPUE',
        'rWCJ3NlKnfNNFLNQZOTgfR5txU8bdLzd', '908faaeb92ca350bd6cb1e5eedda3fae850124498a5f4bb16e10a3928de31b4f', false);
insert into "user"
values (90000259, '齋藤', '友', '1986/10/24', 90000021, 6, 7, '3vP0i9ozDF4CwuMymeqNb9PZKRVi7gDk',
        'GEenMCbK8LtqBmrnrntsJOmHz2HcJuQ1', '8254923a4085a7fe546fcfcd7f542d304cc0b803ab610ce05e081f66c1a0ac77', false);
insert into "user"
values (90000260, '畠山', '眞八', '1971/12/27', 90000021, 6, 7, '4NEZwZhn4JAluJcjbJIMJOMvTkXNmIeb',
        'fuclQA9cYtisDUDF0PWrDuarXUClwMuz', 'ffd0b24141addc00ad9ff6dc43778bf1f4cd8080950d4061841f325b80d4b8d7', false);
insert into "user"
values (90000022, '藤川', '心一', '1973/11/06', 90000006, 5, 7, 'stCnZwSFVEGn6pBVwnKzGo2gNLXty3E3',
        'jYKWnW4dl5olktk7qp6myvmdg0ws99wT', 'c91af7cb1f8c07577317a257469b3412e12cdf65a6def8642360084bb1d5fbc7', false);
insert into "user"
values (90000262, '浅田', '茂義', '1971/12/27', 90000022, 6, 7, 'l7RvmJRcQgmz8yhZF0n6TbvE75kuWqyM',
        'l0ijWA80IaZAiFkrsJkjCgVCEPAQdr6l', 'b597711455809de568a85361337241d096dc8848bc90aaf2f15770e82a376b99', false);
insert into "user"
values (90000263, '黒沢', '幸美', '1973/08/09', 90000022, 6, 7, '2RCgU5LDhYoQnQbwbVYwIyLmCkEcpPiD',
        '3apxLHjcAIPJpqmKwoVYhTULk3irx4iG', 'c53b48e389805bd412f9858c187b252749936039eede49f2e650b652433bbd87', false);
insert into "user"
values (90000264, '入江', '成子', '1976/05/09', 90000022, 6, 7, 'DIMN79k12rwegcSAAkuqMFt06Wr7vyjE',
        'oWV9ccwUjoB0lG8Ps5K7OxeNhQ4yt19H', '8dfb29798ab7797e4689fa5d7ab7f2dfb778099decbcf87b8b4b56186ab741b7', false);
insert into "user"
values (90000265, '新谷', '知生', '1974/06/24', 90000022, 6, 7, 'ieQrNGOtdBsUV50NsxvCDQSXb5WynJ3j',
        'F3wD0ZrqW0hdSJdCgUPDAmGC6JD9cpMe', 'e4a8c40eaa76e84f0be7271e7196af09edbd1bc975cc43c7c6eb508b3dbce499', false);
insert into "user"
values (90000266, '西', '美智', '1980/06/15', 90000022, 6, 7, 'ooqEGGHKZmQ7aY20SewPC7iayCgTDQtV',
        'Bltz6gFuQRl6U6WdqUqOKbbtxqyiqQe2', '750691421cb483508fc4ab4a4a21a9824d86b89c1a478a0f732fc91c1897d71c', false);
insert into "user"
values (90000267, '大内', '迪子', '1981/04/07', 90000022, 6, 7, 'W2JqRcbQttt1Cvxi0AnbDoqqhzJXgcT7',
        'WVGaZdTgIGEtNx1gFRvOV8eqgwIzMvlH', '70abcfed77ddcfb2060c942777f3cba326241bebb90cc988d3a21d95487e9a83', false);
insert into "user"
values (90000268, '溝口', '聖弘', '1974/09/21', 90000022, 6, 7, 'Cm49wUcN9ux2w47MqzS6EgVnRzxqTeFe',
        'iKMNsvvunWk7hFTaNjnrbfq6ZwHkUiO1', '1eb0e084cff44e328d84d2ca673d008c7f953be824cbbecdc9e7ec78d8af5994', false);
insert into "user"
values (90000269, '相馬', '芙美', '1986/12/13', 90000022, 6, 7, 'N6YcpkelXo5IhJVUzEH3TtZad4rTK7Zq',
        'R37kcFE7l3jKBzlPk4ZaAzkedFgkxXTX', '473e96815edcef744b69d7ce8e93350c76fa902d0509def7deae0de4ae10d313', false);
insert into "user"
values (90000270, '古田', '千恵', '1984/12/30', 90000022, 6, 7, 'Jh5MijyOcvEMX4Zf1HB7PDWYkUUVfkfJ',
        'ySz6s3BEXcD9cEEA66xSNxW6jWf2yT7p', '731886e909d5dbbd0af29e45c8baa309f347ce63df68801649e230d581356753', false);
insert into "user"
values (90000271, '三宅', '喜重', '1991/11/19', 90000022, 6, 7, 'S0Pc5EDN3nRKfqe9pg72v0jqWBSvB4au',
        'DQPbOmDVEBiCjXAiqrIvQUXWBlj2Gzh9', '02309152ff7c376181a755687e28a6b745cbd3f60ecaf70d51a80f69dcfe5a40', false);
