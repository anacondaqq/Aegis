--무덤관련 정보--
--각 나라마다 문자가 달라 lua파일에 출력할 텍스트를 지정한다
--NPC 이름 도 여기서 지정한다
function main()
	tbl={
		[[펅밉]],--npc쫁붙
		[[쫇┨뎡�悽F탒셜ずΝ쯗]],        --뱄멎캴��#1
		[[┷�`��땀]],			--뱄멎캴��#2
		[[캿쫤�㎳㎦オ벡H]],               --뱄멎캴��#3
		};	
		
	if not SetMobTombInfo(tbl[1],tbl[2],tbl[3],tbl[4]) then return false,tbl[1];end
	return true,"success";
end


