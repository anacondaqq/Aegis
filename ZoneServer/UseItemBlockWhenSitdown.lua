
-- 이파일은 lua 문법에 따라 작성해야 합니다.
-- 이 파일은 앉은상태에서는 사용할수 없는 아이템 리스트를 정의합니다.
-- 타겟-플레이어 레벨 입니다.



-- main함수의 리턴값은 받드시 2개여야 하며 첫번째것은 bool값 두번째것은 문자열이어야만 한다.
-- bool add(아이템아이디,아이템명) 
--      아이템아이디와 아이템명은 받드시 일치해야만한다.

function main()


	tbl={
--캐시아이템
		{12215,"Blessing_10_Scroll"},
		{12216,"Inc_Agi_10_Scroll"},
		{12217,"Aspersio_5_Scroll"},
		{12218,"Assumptio_5_Scroll"},
		{12219,"Wind_Walk_10_Scroll"},
		{12220,"Adrenaline_Scroll"},
		{14529,"Greed_Scroll"},
		{14593,"Magic_Power_Scroll"},
		{14606,"Job_Manual25"},
		{14592,"Job_Manual50"},
		{14594,"Quagmire_Scroll"},
		{14587,"Repair_Scroll_"},
		{14599,"Greed_Scroll_C"},
		{12415,"Siege_Teleport_Scroll2"},
		{14591,"Siege_Teleport_Scroll"},

--스크롤류
    {686,"Earth_Scroll_1_3"},
    {687,"Earth_Scroll_1_5"},
    {688,"Cold_Scroll_1_3"},
    {689,"Cold_Scroll_1_5"},
    {690,"Fire_Scroll_1_3"},
    {691,"Fire_Scroll_1_5"},
    {692,"Wind_Scroll_1_3"},
    {693,"Wind_Scroll_1_5"},
    {694,"Ghost_Scroll_1_3"},
    {695,"Ghost_Scroll_1_5"},
    {696,"Fire_Scroll_2_1"},
    {697,"Fire_Scroll_2_5"},
    {698,"Fire_Scroll_3_1"},
    {699,"Fire_Scroll_3_5"},
    {700,"Cold_Scroll_2_1"},
    {12000,"Cold_Scroll_2_5"},
    {12001,"Holy_Scroll_1_3"},
    {12002,"Holy_Scroll_1_5"},
		{12027,"Giggling_Box"},
		{12028,"Box_Of_Thunder"},
		{12029,"Gloomy_Box"},
		{12030,"Box_Of_Grudge"},
		{12031,"Sleepy_Box"},
		{12032,"Box_Of_Storm"},
		{12033,"Box_Of_Sunlight"},
		{12034,"Painting_Box"},
		{12236,"Choco_Tart"},
		{12235,"Strawberry_Choco"},
		{12237,"Choco_Lump"},
		{14521,"Repair_Scroll"},
--룬스톤류
		{12725,"Runstone_Nosiege"},
		{12726,"Runstone_Rhydo"},
		{12727,"Runstone_Verkana"},
		{12728,"Runstone_Isia"},
		{12729,"Runstone_Asir"},
		{12730,"Runstone_Urj"},
		{12731,"Runstone_Turisus"},
		{12732,"Runstone_Pertz"},
		{12733,"Runstone_Hagalas"},
		{12388,"Runstone_Crush"},
		{12389,"Runstone_Storm"},
		{12390,"Runstone_Millennium"},
--테이밍 아이템
		{619,"Unripe_Apple"},
		{620,"Orange_Juice"},
		{621,"Bitter_Herb"},
		{622,"Rainbow_Carrot"},
		{623,"Earthworm_The_Dude"},
		{624,"Rotten_Fish"},
		{625,"Lusty_Iron"},
		{626,"Monster_Juice"},
		{627,"Sweet_Milk"},
		{628,"Well_Dried_Bone"},
		{629,"Singing_Flower"},
		{630,"Dew_Laden_Moss"},
		{631,"Deadly_Noxious_Herb"},
		{632,"Fatty_Chubby_Earthworm"},
		{633,"Baked_Yam"},
		{634,"Tropical_Banana"},
		{635,"Horror_Of_Tribe"},
		{636,"No_Recipient"},
		{637,"Old_Broom"},
		{638,"Silver_Knife_Of_Chaste"},
		{639,"Armlet_Of_Obedience"},
		{640,"Shining_Stone"},
		{641,"Contracts_In_Shadow"},
		{642,"Book_Of_Devil"},
		{659,"Heart_Of_Her"},
		{660,"Prohibition_Red_Candle"},
		{661,"Sway_Apron"},
		{12373,"Boy's_Naivety"},
		{12374,"Flaming_Ice"},
		{12358,"Fan_Of_Wind"},
		{12359,"Very_Soft_Plant"},
		{12360,"Very_Red_Juice"},
		{12361,"Delicious_Shaved_Ice"},
		{12362,"Kuloren"},
		{12363,"Fit_Pipe"},
		{12364,"Staff_Of_Leader"},
		{12365,"Charming_Lotus"},
		{12366,"Gril_Doll"},
		{12367,"Luxury_Whisky_Bottle"},
		{12368,"Splendid_Mirror"},
		{12369,"Oilpalm_Coconut"},
		{12370,"Gril's_Naivety"},
		{12371,"Magical_Lithography"},
		{12372,"Hell_Contract"},
--기타 아이템
		{12706,"Lucky_Cookie01"},
		{12707,"Lucky_Cookie02"},
		{12708,"Lucky_Cookie03"},
		{11702,"Moon_Cookie"},
		{12290,"Mysterious_Can"},
		{12291,"Mysterious_PET_Bottle"},
		{12376,"Mysterious_Can2"},
		{12377,"Mysterious_PET_Bottle2"},
		{12350,"Angeling_Potion"},
		{12225,"Sweet_Candy_Striper"},
		{12340,"Mysterious_Rice_Powder"},
		{12310,"Spray_Of_Flowers"},
		{12311,"Large_Spray_Of_Flowers"},
		{12313,"Protection_Of_Angel"},
		{12323,"N_Fly_Wing"},
		{12324,"N_Butterfly_Wing"},
		{12325,"N_Magnifier"},
		{12347,"Acorn_Jelly"},
		{12396,"Fools_Day_Box"},
		{12397,"Fools_Day_Box2"},
		{12473,"RWC_Parti_Box"},
		{12474,"RWC_Final_Comp_Box"},
		{14532,"Battle_Manual25"},
};	
	
	for k,v in pairs(tbl) do	
		if not add(v[1],v[2]) then return false,v[2]; end	
	end
	
	
	--if not add(14529,"탐욕스크롤") then return false,"탐욕스크롤"; end
	--if not add(14593,"마증스크롤") then return false,"마증스크롤"; end
	--if not add(12215,"블레싱10스크롤") then return false,"블레싱10스크롤"; end
	--if not add(12216,"민첩성10스크롤") then return false,"민첩성10스크롤"; end
	--if not add(12217,"아스5스크롤") then return false,"아스5스크롤"; end
	--if not add(12219,"윈드워크10스크롤") then return false,"윈드워크10스크롤"; end
	--if not add(14606,"잡교범25") then return false,"잡교범25"; end
	--if not add(14592,"잡교범50") then return false,"잡교범50"; end	
	
	return true,"Success";
end
