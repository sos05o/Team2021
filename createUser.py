import random as rd
import string
import hashlib

array_last = ["松田",
              "浅井",
              "石原",
              "本多",
              "大塚",
              "溝口",
              "岩田",
              "鎌田",
              "塚本",
              "浜野",
              "荒井",
              "飯島",
              "岡田",
              "浅田",
              "大谷",
              "松永",
              "三宅",
              "高島",
              "宮本",
              "古賀",
              "中田",
              "石崎",
              "比嘉",
              "阿部",
              "久保田",
              "上田",
              "菅",
              "藤野",
              "藤川",
              "土井",
              "古谷",
              "長谷川",
              "齋藤",
              "畠山",
              "長谷川",
              "片桐",
              "大森",
              "丹羽",
              "大内",
              "岩田",
              "森岡",
              "町田",
              "齋藤",
              "小森",
              "松井",
              "谷川",
              "飯塚",
              "平田",
              "佐野",
              "古田",
              "石井",
              "豊田",
              "瀬戸",
              "武藤",
              "荒木",
              "畑中",
              "菅原",
              "大塚",
              "坂口",
              "岩田",
              "高野",
              "米田",
              "早川",
              "大木",
              "小川",
              "竹本",
              "金井",
              "入江",
              "杉山",
              "石黒",
              "福田",
              "関",
              "山岡",
              "南",
              "小倉",
              "萩原",
              "宮本",
              "手塚",
              "黒沢",
              "藤村",
              "長島",
              "河村",
              "矢島",
              "滝沢",
              "早川",
              "笠井",
              "西",
              "矢島",
              "水野",
              "堀",
              "町田",
              "林",
              "鈴木",
              "新谷",
              "及川",
              "西原",
              "相馬",
              "中山",
              "竹内",
              "足立"
              ]

array_first = [
    "聖誉",
    "恵",
    "芙美",
    "菊江",
    "一人",
    "麻紀",
    "一人",
    "弘義",
    "絵梨",
    "満生",
    "数也",
    "心一",
    "朗夫",
    "道彦",
    "迪子",
    "沢子",
    "明博",
    "喜重",
    "希和",
    "昭良",
    "友隆",
    "竹一",
    "信平",
    "一馬",
    "美世",
    "久哉",
    "友良",
    "久仁夫",
    "喜代信",
    "眞八",
    "亮子",
    "裕恵",
    "公紀",
    "幸美",
    "芙美",
    "静市",
    "朋美",
    "準司",
    "心一",
    "浩一郎",
    "眞美",
    "昌光",
    "育雄",
    "聖弘",
    "義幸",
    "玲",
    "定二",
    "新太郎",
    "陽子",
    "ナツ子",
    "祐美",
    "幸信",
    "清一",
    "和海",
    "家継",
    "三男",
    "十志夫",
    "淳子",
    "征二郎",
    "稔郎",
    "僧三郎",
    "友幸",
    "洋和",
    "政治",
    "勝許",
    "茂義",
    "勝英",
    "千恵",
    "金義",
    "成美",
    "織枝",
    "善英",
    "鋼三郎",
    "智",
    "恵治",
    "鋼三郎",
    "悠子",
    "宏季",
    "知生",
    "英博",
    "美則",
    "あさ美",
    "一典",
    "健生",
    "邦美",
    "治次",
    "るり子",
    "成子",
    "喜重",
    "保行",
    "絵里",
    "美智",
    "長一郎",
    "富良",
    "友",
    "麻紀",
    "さやか",
    "ひとみ",
    "圭織",
    "直幸"
]

array_birth = [
    "1985/07/03",
    "1985/05/11",
    "1988/07/26",
    "1981/05/17",
    "1971/12/27",
    "1989/01/19",
    "1974/09/21",
    "1989/05/11",
    "1992/05/11",
    "1993/12/04",
    "1989/02/03",
    "1976/05/09",
    "1974/03/21",
    "1991/05/17",
    "1993/09/24",
    "1993/01/03",
    "1980/06/15",
    "1970/09/23",
    "1976/07/31",
    "1976/12/31",
    "1988/11/18",
    "1974/11/21",
    "1979/09/14",
    "1971/07/20",
    "1985/03/08",
    "1976/03/11",
    "1973/10/15",
    "1974/03/26",
    "1990/07/03",
    "1990/11/27",
    "1974/03/13",
    "1977/12/20",
    "1988/08/11",
    "1985/01/01",
    "1980/09/07",
    "1992/07/15",
    "1977/03/22",
    "1992/03/11",
    "1977/05/14",
    "1973/08/06",
    "1987/06/10",
    "1980/07/14",
    "1985/01/07",
    "1973/07/17",
    "1970/05/03",
    "1975/07/13",
    "1991/11/19",
    "1984/07/06",
    "1992/11/18",
    "1990/07/29",
    "1989/06/04",
    "1993/04/09",
    "1978/10/09",
    "1985/09/22",
    "1970/09/03",
    "1991/07/29",
    "1974/06/02",
    "1974/04/23",
    "1992/10/19",
    "1987/03/16",
    "1992/04/11",
    "1973/05/05",
    "1983/12/09",
    "1982/09/19",
    "1973/03/04",
    "1971/09/18",
    "1986/10/24",
    "1991/09/10",
    "1972/06/14",
    "1988/04/09",
    "1984/12/11",
    "1978/04/15",
    "1978/11/01",
    "1980/02/16",
    "1977/01/07",
    "1972/08/11",
    "1970/05/29",
    "1977/02/18",
    "1975/01/03",
    "1978/08/28",
    "1973/07/25",
    "1984/12/30",
    "1972/02/25",
    "1984/10/04",
    "1981/04/07",
    "1981/01/28",
    "1984/01/28",
    "1978/08/12",
    "1978/07/11",
    "1986/12/13",
    "1974/06/24",
    "1973/08/09",
    "1973/03/22",
    "1991/12/12",
    "1970/08/11",
    "1994/02/11",
    "1984/09/07",
    "1973/11/06",
    "1975/07/15",
    "1985/02/24"
]


def main():
    # file = open("usersql.txt", mode="w", encoding='utf-8')
    startid = 90000002
    start_position_id = 2
    file = open("usersql.txt", mode="x", encoding='utf-8')
    b_pw = bytes('user', 'utf-8')
    rd_list = string.digits + string.ascii_letters
    for i in range(2, 8):
        salt = create_salt(rd_list)
        b_salt = bytes(salt, 'utf-8')
        hashed_pw = hashlib.pbkdf2_hmac('sha256', b_pw, b_salt, 100).hex()
        mail = create_salt(rd_list)
        text = f"insert into user values ({startid}, '{rd.choice(array_last)}', '{rd.choice(array_first)}', " \
               f"'{rd.choice(array_birth)}', 00000002, 4, {i},  '{mail}', '{salt}', '{hashed_pw}', false);\n"
        file.write(text)
        startid += 1

    boss_id = 90000002

    add_id = 100
    for i in range(3, 8):
        for j in range(3):
            salt = create_salt(rd_list)
            b_salt = bytes(salt, 'utf-8')
            hashed_pw = create_hashed_pw(b_salt, b_pw)
            mail = create_salt(rd_list)
            # user_id 90000002-90000005 が部長
            # user_id 6-20 が主任
            text = f"insert into user values ({startid}, '{rd.choice(array_last)}', '{rd.choice(array_first)}', " \
                   f"'{rd.choice(array_birth)}',{boss_id} , 5, {i},  '{mail}', '{salt}', '{hashed_pw}', false);\n"
            file.write(text)
            for k in range(10):
                salt = create_salt(rd_list)
                b_salt = bytes(salt, 'utf-8')
                hashed_pw = create_hashed_pw(b_salt, b_pw)
                mail = create_salt(rd_list)
                text = f"insert into user values ({startid + add_id}, '{rd.choice(array_last)}', '{rd.choice(array_first)}', " \
                       f"'{rd.choice(array_birth)}',{startid} , 6, {i},  '{mail}', '{salt}', '{hashed_pw}', false);\n"
                file.write(text)
                add_id += 1

            startid += 1
        boss_id += 1


def addBlank():
    # 使用済み: 90000000~90000300
    start_id = 90000400
    pw = "user"
    file = open("usersql.txt", mode="x", encoding='utf-8')
    b_pw = bytes(pw, 'utf-8')
    for i in range(1, 10):
        salt = create_salt()
        b_salt = bytes(salt, 'utf-8')
        hashed_pw = hashlib.pbkdf2_hmac('sha256', b_pw, b_salt, 100).hex()
        mail = create_salt()
        text = f"insert into user values ({start_id}, '{rd.choice(array_last)}', '{rd.choice(array_first)}', " \
               f"'{rd.choice(array_birth)}', null, 6, 1,  '{mail}', '{salt}', '{hashed_pw}', false);\n"
        file.write(text)
        start_id += 1


def create_salt():
    rd_list = string.digits + string.ascii_letters
    salt = "".join([rd.choice(rd_list) for i in range(32)])
    return salt


def create_hashed_pw(b_salt, b_pw):
    hashed_pw = hashlib.pbkdf2_hmac('sha256', b_pw, b_salt, 100).hex()
    return hashed_pw


# main()
addBlank()
# print(create_hashed_pw(bytes('Ka8WLaPBTzfwqFnsus91vpqLOpsjXZOW', 'utf-8'), bytes('user', 'utf-8')))
