--==============================================================================================
-- �� ������ lua ������ ���� �ۼ��Ǿ�� �մϴ�.
-- �� ������ ĳ���� �������� SecondPassword ���� ������ �ϴ� �����Դϴ�.
-- �������� ������ ������ ���� �����մϴ�.
--
-- Date : 14, Feb, 2011
-- Author : InGeon, Kim (Program Unit/RO1/Gravity)
--==============================================================================================

-- Second Password ���õ� ���� �����Դϴ�.


--//////////////////////////////////////////////////////////////////////////////
-- Second Password�� ����� �� ���θ� ��Ÿ���ϴ�. (1:���, 0:�̻��)
--//////////////////////////////////////////////////////////////////////////////

EnableSecondPW = 
{
	UseSecondPW = 1;
}


--//////////////////////////////////////////////////////////////////////////////
-- Second Password �̿���ϱ� ����� ���� �ʾ��� ���θ� ��Ÿ���ϴ�.
-- (1:���, 0:�̻��)
--//////////////////////////////////////////////////////////////////////////////
UsedSecondPWNotAvail = 
{
	SecondPWNotAvail = 1;
}

--//////////////////////////////////////////////////////////////////////////////
-- Second Password�� ����� �� ���� ��Ģ�� Ű���� ����Ʈ�� �� ���� �����մϴ�.
-- ex) ������� : "{ [[����Ű����]] }, "
--//////////////////////////////////////////////////////////////////////////////

SecondPWRestrictKeyTbl = 
{
	{ [[0000]] }, 
	{ [[1111]] }, 
	{ [[2222]] }, 
	{ [[3333]] }, 
	{ [[4444]] }, 
	{ [[5555]] }, 
	{ [[6666]] }, 
	{ [[7777]] }, 
	{ [[8888]] }, 
	{ [[9999]] }, 
	{ [[0123]] }, 
	{ [[1234]] }, 
	{ [[2345]] }, 
	{ [[3456]] }, 
	{ [[4567]] }, 
	{ [[5678]] }, 
	{ [[6789]] }, 
	{ [[7890]] }, 
};


--//////////////////////////////////////////////////////////////////////////////
-- Second Password�� ������� �ʴ� IP ����Ʈ�� ����մϴ�.
-- ex) ������� : "{ [[192.168.5.50]] },"
--//////////////////////////////////////////////////////////////////////////////

SecondPWNoCheckIP = 
{
	{ [[59.10.115.39]] },
	{ [[59.10.115.28]] },
	{ [[59.10.115.40]] },
};


function main()	
	--/////////////////////////////////////////////////
	-- �ϴ��� ������ ���� �������� �ʾƾ� �մϴ�.
	--/////////////////////////////////////////////////
	
	result, msg = SetEnableSecondPW( EnableSecondPW.UseSecondPW );
	if( not result ) then 
		return false, msg;
	end
	
	result, msg = SetUsedSecondPWNotAvail( UsedSecondPWNotAvail.SecondPWNotAvail );
	if( not result ) then 
		return false, msg;
	end
	
	for k, v in pairs( SecondPWRestrictKeyTbl ) do
		result, msg = SetRestrictSecondPW( v[1] );
		if( not result ) then
			return false, msg;
		end
	end
		
	for k, v in pairs( SecondPWNoCheckIP ) do
		result, msg = SetSecondPWNoCheckIP( v[1] );
		if( not result ) then
			return false, msg;
		end
	end
	
	return true, "good";
end