-- //////////////////////////////////
--�ļ���:      Scp\\LUA\\WGQ_Heroisland.lua
--��    Ȩ:	(C)  �������������������޹�˾
--��    ��:      ���ǿ
--/////////////////////////////////////
-- �汾��:   2007.10.10  
-- ��    ��:   NPC�Ի���ʽ���Թ��߿�ܹ���
--********************************************
-- �汾��:   2007.10.12  
-- ��    ��:   ֧������lua��ʽ
--********************************************
-- �汾��:   2007.10.15
-- ��    ��:   ���32������NPC,,֧��NPC����������Ʒ
--********************************************
-- �汾��:   2007.10.26
-- ��    ��:   1���Ż��˲��ִ���,���뼢���Ȼָ�����..
--                 2���޸�ԭ�Ѽ���ID��״̬ID��bug
--                 3��������������
--********************************************
-- �汾��:   2007.11.19
-- ��    ��:   1������Ӷ��������
--********************************************



local nServerID = API_GetServerID()
--[[if not wth_CurrentServer then
	os.execute("d:\\ourpack\\servername.bat "..nServerID)
	require 'd:\\ourpack\\wth_servertemp"..nServerID..".lua'
end
if wth_CurrentServer == nil or (wth_CurrentServer ~= "HEROTEST" and wth_CurrentServer ~= "herotest") then
	API_TraceError('���ű�Ϊ�ڲ������ýű�������Ʒ���ڲ�����ʹ�ã��ű����Զ���ֹ��')
	return
end
--]]--

local wth_SomeName = 'soso'
--local skyfix = string.upper('SKY')
--local skya, skyb = nil, nil

local yxd_gmID = 16565  --��Ϸ��ɫ��ID
local yxd_gmName = "Sevenؼ"  --��Ϸ��ɫ������



wth_Globe_serverlist = {[2]=2, [3]=3, [4]=4,[5]=5,[10]=10}

-- ע������ú���
API_AddLUAReqFunc("WGQ_Heroisland_main")
API_AddLUAReqFunc("WGQ_Heroisland_gotohome")
API_AddLUAReqFunc("WGQ_Heroisland_renascence")
API_AddLUAReqFunc("WGQ_Heroisland_Getgoods")
API_AddLUAReqFunc("WGQ_Heroisland_monster_recall")
API_AddLUAReqFunc("WGQ_Heroisland_SetResource")
API_AddLUAReqFunc("WGQ_Heroisland_GotoMap")
API_AddLUAReqFunc("WGQ_Heroisland_GOTODungeon")
API_AddLUAReqFunc("WGQ_Heroisland_GetTile")
API_AddLUAReqFunc("WGQ_Heroisland_SetCon")
API_AddLUAReqFunc("WGQ_Heroisland_about")
API_AddLUAReqFunc("WGQ_Heroisland")
API_AddLUAReqFunc("WGQ_Heroisland_Dragon")
API_AddLUAReqFunc("WGQ_Heroisland_SetVarData")
API_AddLUAReqFunc("WGQ_Heroisland_SetZDFB")
API_AddLUAReqFunc("WGQ_Heroisland_clearall")
API_AddLUAReqFunc("WGQ_Heroisland_updateact2")
API_AddLUAReqFunc("WGQ_Heroisland_upgrade")
API_AddLUAReqFunc("WGQ_Heroisland_equip")
API_AddLUAReqFunc("wth_Sdcc")
API_AddLUAReqFunc("wth_GetInfo")
API_AddLUAReqFunc("wth_khbd")
API_AddLUAReqFunc("wth_GodMode")
API_AddLUAReqFunc("wth_Gmact")
API_AddLUAReqFunc("wth_Gmact")
API_AddLUAReqFunc("WGQ_Heroisland_code")
API_AddLUAReqFunc("WGQ_Heroisland_runfun")
API_AddLUAReqFunc("wth_ChangeTime")
API_AddLUAReqFunc("wth_OnlineList")
API_AddLUAReqFunc("wth_TakeThisOne")
API_AddLUAReqFunc("wth_Choujiang")
API_AddLUAReqFunc("wth_AddGoodsForTiger")
API_AddLUAReqFunc("wth_ChoujiangDigt")
API_AddLUAReqFunc("wth_SetZXTask")
--API_AddLUAReqFunc("Fun_ClsCompletedTask")
API_AddLUAReqFunc("wth_temp_monster")
API_AddLUAReqFunc("wth_zdml")
API_AddLUAReqFunc("wth_WPtest")
API_AddLUAReqFunc("wth_itemtest")
API_AddLUAReqFunc("wth_lajupinjiatest")
API_AddLUAReqFunc("yx_ziliaopian")
API_AddLUAReqFunc("yx_Bus")




 -- ��������б�

if not wth_OLActorIDTab then
	wth_OLActorIDTab = {}
end


if wth_addexpTrigger ~= nil then
	API_DestroyTrigger(API_RequestGetActorID(), -1, wth_addexpTrigger)
end



function wth_OnLogin()
	local ActorID = API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)

--	if yxd_gmName == ActorName then
	if yxd_gmID == ActorID then
		API_RemoveTaskScroll(ActorID,326)
		API_AddTaskScroll(ActorID,326,10160,'WGQ_Heroisland')
		wth_OLActorIDTab[ActorID] = ActorID
		API_ActorAddStatus(ActorID,38001,999999999999)
	end

	--skya, skyb = string.find(string.upper(ActorName),skyfix,1)
	--if skya == 1 and skyb == string.len(skyfix) then
	--	API_ActorAddStatus(ActorID,457001,999999999999)
	--	wth_OLActorIDTab[ActorID] = ActorID
	--else
		-- API_RemoveTaskScroll(ActorID,326)
		-- API_AddTaskScroll(ActorID,326,10160,'WGQ_Heroisland')
		-- wth_OLActorIDTab[ActorID] = ActorID
		-- API_ActorAddStatus(ActorID,38001,999999999999)
	--end
end

function wth_OnLoginMap()
	local ActorID = API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)

--	if yxd_gmName == ActorName then
	if yxd_gmID == ActorID then
		API_RemoveTaskScroll(ActorID,326)
		API_AddTaskScroll(ActorID,326,10160,'WGQ_Heroisland')
		API_ActorAddStatus(ActorID,38001,999999999999)
	end

	--skya, skyb = string.find(string.upper(ActorName),skyfix,1)
	--if skya == 1 and skyb == string.len(skyfix) then
		--API_ActorAddStatus(ActorID,457001,999999999999)
	--else
		-- API_RemoveTaskScroll(ActorID,326)
		-- API_AddTaskScroll(ActorID,326,10160,'WGQ_Heroisland')
		-- API_ActorAddStatus(ActorID,38001,999999999999)
	--end
end


function wth_OnLoginOut()
	local ActorID = API_RequestGetActorID()
	wth_OLActorIDTab[ActorID] = nil
end



local OnLoginLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginFuncNameList) do 
	if GLOBAL_ActMain_OnLoginFuncNameList[i] == 'wth_OnLogin' then
		OnLoginLoadOK = 1
		break
	end 
end 
if OnLoginLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginFuncNameList,'wth_OnLogin') 
end

local OnLoginMapLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLoginMapFuncNameList) do 
	if GLOBAL_ActMain_OnLoginMapFuncNameList[i] == 'wth_OnLoginMap' then
		OnLoginMapLoadOK = 1
		break
	end 
end 
if OnLoginMapLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLoginMapFuncNameList,'wth_OnLoginMap') 
end

local OnLogoutLoadOK = 0
for i, v in pairs(GLOBAL_ActMain_OnLogoutFuncNameList) do 
	if GLOBAL_ActMain_OnLogoutFuncNameList[i] == 'wth_OnLoginOut' then
		OnLogoutLoadOK = 1
		break
	end 
end 
if OnLogoutLoadOK == 0 then
	table.insert(GLOBAL_ActMain_OnLogoutFuncNameList,'wth_OnLoginOut') 
end


if not WGQ_Heroisland then
	if API_GetServerID() == 1 then

		API_CreateMonster(1, 200016, 213, 201, 4, 0, -1)		--Ʒ�ʵ۹�ͷ������
		API_CreateMonster(1, 200017, 213, 203, 4, 0, -1)		--Ʒ�ʵ۹��ؼ�����
		API_CreateMonster(1, 200018, 213, 205, 4, 0, -1)		--Ʒ�ʵ۹���������
		API_CreateMonster(1, 200019, 213, 207, 4, 0, -1)		--Ʒ�ʵ۹���������
		API_CreateMonster(1, 200020, 213, 209, 4, 0, -1)		--Ʒ�ʵ۹���������
		API_CreateMonster(1, 200021, 213, 211, 4, 0, -1)		--Ʒ�ʵ۹���������
		API_CreateMonster(1, 200022, 213, 213, 4, 0, -1)		--Ʒ�ʵ۹�ѥ������

		API_CreateMonster(1, 200027, 221, 201, 4, 0, -1)		--Ʒ�ʵ۹���˽����
		API_CreateMonster(1, 200015, 221, 203, 4, 0, -1)		--Ʒ�ʵ۹���������
		API_CreateMonster(1, 200023, 221, 205, 4, 0, -1)		--Ʒ�ʵ۹���Ʒ����
		API_CreateMonster(1, 200024, 221, 207, 4, 0, -1)		--Ʒ�ʵ۹���������
		API_CreateMonster(1, 200025, 221, 209, 4, 0, -1)		--Ʒ�ʵ۹��䷽����
		API_CreateMonster(1, 200026, 221, 211, 4, 0, -1)		--Ʒ�ʵ۹���ʯ����
		API_CreateMonster(1, 200028, 221, 213, 4, 0, -1)		--Ʒ�ʵ۹�ҩƷ����

		API_CreateMonster(2, 200002, 236, 162, 4, 0, -1)		--Ʒ�������ؼ�����
		API_CreateMonster(2, 200003, 236, 164, 4, 0, -1)		--Ʒ�����������
		API_CreateMonster(2, 200004, 236, 166, 4, 0, -1)		--Ʒ��������������
		API_CreateMonster(2, 200005, 236, 168, 4, 0, -1)		--Ʒ������ѥ������
		API_CreateMonster(2, 200006, 236, 170, 4, 0, -1)		--Ʒ��������������
		API_CreateMonster(2, 200007, 236, 172, 4, 0, -1)		--Ʒ��������������
		API_CreateMonster(2, 200008, 236, 174, 4, 0, -1)		--Ʒ��������������

		API_CreateMonster(2, 200013, 246, 161, 4, 0, -1)		--Ʒ��������˽����
		API_CreateMonster(2, 200001, 246, 163, 4, 0, -1)		--Ʒ��������������
		API_CreateMonster(2, 200009, 246, 165, 4, 0, -1)		--Ʒ��������Ʒ����
		API_CreateMonster(2, 200010, 246, 167, 4, 0, -1)		--Ʒ��������������
		API_CreateMonster(2, 200011, 246, 169, 4, 0, -1)		--Ʒ�������䷽����
		API_CreateMonster(2, 200012, 246, 171, 4, 0, -1)		--Ʒ�����ʯ����
		API_CreateMonster(2, 200014, 246, 173, 4, 0, -1)		--Ʒ�����ʯ����
	end
end


function WGQ_Heroisland(ActorID)	
	local ActorID = ActorID or API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)


	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 326 and API_ActorIsOnline(ActorID) and API_ActorIsDying(ActorID) then
		API_ActorRelive(ActorID, API_GetActorMapID(ActorID), API_GetActorPosX(ActorID), API_GetActorPosY(ActorID), -1, -1)
		API_ActorSendMsg(ActorID, 1, "�㴥�������صķ��ѣ����Ѵ�����������µ�����!")
	end


	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		API_ResponseWrite('<name>�񡡡�ʯ</name>')
		---------���ؽ���----------
		API_ResponseWrite('<text>May i help you SIR��</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text> ����</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">��ѻس�</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_renascence">ȫ��ָ�</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=1">������Ʒ</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_monster_recall?1=1">�ٻ�����</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=1">�޸���Դ</a><br>')
		API_ResponseWrite('<text> ����</text>')
		API_ResponseWrite('<a href="wth_khbd?1=3">��а����</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=1">�ر���</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=1">�ع�����</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=100">��̬�任</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')			
		API_ResponseWrite('<a href="WGQ_Heroisland_GetTile">GetTile.</a><br>')
		API_ResponseWrite('<text>   ��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=1">���ñ���</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=1">�����޸�</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="wth_khbd?1=5">���سɴ�</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_clearall?1=1">��ձ���</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_upgrade?1=1">��������</a><br>')
		API_ResponseWrite('<text>   ��</text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=10">ʿ��װ��</a>')
		API_ResponseWrite('<text>����</text>')
--		API_ResponseWrite('<text>��</text>')
--		API_ResponseWrite('<a href="wth_khbd?1=1">�ӵ��Թ�</a>')
--		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=1">ִ�д���</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_runfun?1=1">ִ�к���</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		--API_ResponseWrite('<a href="WGQ_Heroisland_about">������ʯ</a>')
		API_ResponseWrite('<a href="wth_ChangeTime?1=1">�޸�ʱ��</a>')
		API_ResponseWrite('<text>    ��</text>')	
		API_ResponseWrite('<a href="wth_OnlineList">�鿴����</a><br>')
--		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>   ��</text>')
		API_ResponseWrite('<a href="wth_khbd?1=2">��ȡ��Ϣ</a>')
		API_ResponseWrite('<text>����</text>')
--		API_ResponseWrite('<text>��</text>')
--		API_ResponseWrite('<text>        </text>')
	--	API_ResponseWrite('<a href="wth_SetZXTask?1=1">��������</a>')
		--API_ResponseWrite('<text>��</text>')
	--	if API_GetActorName(ActorID) == 'soso' then
			--	API_ResponseWrite('<a href="wth_OnlineList">�鿴����</a>')
	--			API_ResponseWrite('<text> SelectItem��ֵΪ  '..SelectItem ..'</text>')
	--	end
	--	API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="wth_zdml?1=1">�ܶ�����</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text>��</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=3">����˵</a>')
--		API_ResponseWrite('<text>   ��</text>')	
--		API_ResponseWrite('<a href="wth_itemtest?1=1">��Ʒ����</a>')
		API_ResponseWrite('<text>����  </text>')
		API_ResponseWrite('<text>��</text>')	
		API_ResponseWrite('<a href="wth_lajupinjiatest">��������</a>')
		API_ResponseWrite('<text>������</text>')
		API_ResponseWrite('<a href="yx_ziliaopian">����Ƭ���</a>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<text>��������ǰʱ��</text>')

		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>'..Year..'��'..Month..'��'..Day..'��'..Hour..'��'..Minute..'��'..Second..'��..</text><br>')
		local wth_weeklist = {[1]="һ",[2]="��",[3]="��",[4]="��",[5]="��",[6]="��",[7]="��",}
		if wth_weeklist[Week] ~= nil then
			API_ResponseWrite('<text>����'..wth_weeklist[Week]..'</text>')
		end
		API_ResponseWrite('<br><br>')
--		API_ResponseWrite('<a http="http://172.16.0.236:8080/">���λ����</a><br>')
		--API_ResponseWrite('<br>')
		--API_ResponseWrite('<img src="LuaUse\\Hero\\��Ů.bmp">')
		--API_ResponseWrite('<img src="TradeWnd\\����-d.bmp" href="WGQ_Heroisland_checksex">')
		--API_ResponseWrite('<img src="TradeWnd\\����-d.bmp" close="1">')		
		--API_ResponseWrite('<img src="TradeWnd\\����-d.bmp" http="http://172.16.0.236:8080/">')		
		--API_ResponseWrite('<img srcgd="1000" href="WGQ_Heroisland_checksex"><br>')
		API_ResponseFlush(ActorID)
end
function WGQ_Heroisland_gotohome()
	local ActorID = API_RequestGetActorID()
	local ActorCamp = API_GetActorCamp(ActorID)
	--0����ɫ�����Ӫ���۹�
	--1����ɫ�����Ӫ������
	--2��ϵͳ��Ӫ
	--3��а������
	--4����Ȼ����
	if API_IsEctypeServer() then
		wth_UnRegfukongdao(ActorID)
		if ActorCamp == 0 then 
			API_ActorGoToMapEx(ActorID, 1, 1, 217, 208)
		else
			API_ActorGoToMapEx(ActorID, 1, 2, 241, 170)
		end	

	else
		wth_UnRegfukongdao(ActorID)
		if ActorCamp == 0 then
			API_ActorGoToMap(ActorID, 1, 217, 208)
		else
			API_ActorGoToMap(ActorID, 2, 241, 170)
		end
	end
end

function WGQ_Heroisland_renascence()
	local ActorID = API_RequestGetActorID()
	API_ActorAddHP(ActorID,999999)
	API_ActorAddMP(ActorID,999999)	
	API_ActorAddHunger(ActorID,999999)
	API_ActorSendMsg(ActorID, 1, "����ħ������ȫ��!")
end

function WGQ_Heroisland_GetTile()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local Actor_x , Actor_y = PublicFun_GetActorPosXY(ActorID)
	local wth_StaticMapid = API_GetStaticMapID(MapID)
		API_ResponseWrite('<name>GetTile.</name>')
		API_ResponseWrite('<text>��ȡ��ɫ��ǰ���ڵ�Tile:</text><br>')
		API_ResponseWrite('<br><br>')
		if MapID == -1 or (Actor_x == 0 and Actor_y == 0) then
			API_ResponseWrite('<br><text>��ȡ���ݴ���..</text><br>')
			API_ResponseWrite('<br><a>��֪����..</a><br>')
		else
			API_ResponseWrite('<br><text color="0,255,255">�����ڵķ�����IDΪ:'..nServerID..'..��ͼ����Ϊ: '..API_GetMapNameFromConfigID(wth_StaticMapid)..' </text>')
			API_ResponseWrite('<br><text color="0,255,255">�����ڵĵ�ͼIDΪ: '..MapID..'..�侲̬IDΪ: '..wth_StaticMapid.. ' ..����IDΪ: '..API_GetMapConfigID(MapID)..' </text>')
			API_ResponseWrite('<br><text color="0,255,255">�㵱ǰ��TileΪ:('..Actor_x..','..Actor_y..'),,,</text><br>')
			local subisland = '��û��'
			if API_IsBranchServer() then
				subisland = '��'
			end				
			API_ResponseWrite('<br><text color="0,255,255">�㵱ǰ '..subisland..' ���� �ӵ� ����</text><br>')
			API_ResponseWrite('<br><a>��֪����..</a><br>')
		end
end

function WGQ_Heroisland_GotoMap()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)

	if wthtranSelect == 1 then
		API_ResponseWrite('<name> �ر���</name>')
		API_ResponseWrite('<text>�㵱ǰ���� '..nServerID..' �ŵ�������</text><br>')
		if not API_IsEctypeServer() or API_IsBranchServer() then
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=7">�絺����</a><br>')
			API_ResponseWrite('<br><text> �۹�������Χ��</text>')
			API_ResponseWrite('<text>����       </text>')
			API_ResponseWrite('<text> ����������Χ��</text>')
			API_ResponseWrite('<text>����       </text>')
			API_ResponseWrite('<text> ���ڰ汾�µ�ͼ</text>')
			API_ResponseWrite('<text>����       </text>')
			API_ResponseWrite('<text> ά�ô�����¥</text><br>')
			--API_ResponseWrite('<text>����       </text>')
			--API_ResponseWrite('<text> �����ܵش�����</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=2">ǰ��:�۹�����</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=3">ǰ��:��������</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=4">ǰ��:����ũׯ</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=14">ǰ��:˫�ӵ� </a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=5">ǰ��:������  </a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=9">ǰ��:����ƽԭ</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=41">ǰ��:��սƽԭ</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=16">ǰ��:����Ѩһ��</a><br>')
			-------------------------------------------------------------------------
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=8">ǰ��:��������</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=6">ǰ��:ɺ��֮��</a>')			
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=42">ǰ��:��ɴʪ��</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=54">ǰ��:����Ѩ����</a><br>') -- ά�ô���
			-----------------------------------------------------------------------------
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=10">ǰ��:�������</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<text>����          </text>')
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=11">ǰ��:ʱ������</a>')
			API_ResponseWrite('<text>����        </text>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=43">ǰ��:��Ļ�ݳ�</a>')
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=15">ǰ��:���µ��³�һ��</a><br>') -- ά�ô���
			--------------------------------------------------------------------------
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=12">ǰ��:��ɽ��ԭ</a>')
			API_ResponseWrite('<text>����        </text>')
			API_ResponseWrite('<text>����          </text>')
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=13">ǰ��:��ɽ��ԭ</a>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<text>����          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=44">ǰ��:ɳ������</a>')
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=55">ǰ��:���µ��³Ƕ���</a><br>') -- ά�ô���
			------------------------------------------------------------------------------
			API_ResponseWrite('<text>����          </text>') --�۹�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<text>����          </text>') -- ����
			API_ResponseWrite('<text>����        </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=45">ǰ��:̾Ϣƽԭ</a>') -- ���ڰ�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=56">ǰ��:���µ��³�����</a><br>')	 -- ά�ô���
			-----------------------------------------------------------------
			API_ResponseWrite('<text>����          </text>') --�۹�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<text>����          </text>') -- ����
			API_ResponseWrite('<text>����        </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=46">ǰ��:��������</a>') -- ���ڰ�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=49">ǰ��:�λó�һ��(�ر�)</a><br>') -- ά�ô���
			-----------------------------------------------------------------
			API_ResponseWrite('<text>����          </text>') --�۹�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<text>����          </text>') -- ����
			API_ResponseWrite('<text>����        </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=47">ǰ��:��ɳɳĮ</a>') -- ���ڰ�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=50">ǰ��:�λóǶ���(����)</a><br>') -- ά�ô���
			-------------------------------------------------------------------
			API_ResponseWrite('<text>����          </text>') --�۹�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<text>����          </text>') -- ����
			API_ResponseWrite('<text>����        </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=48">ǰ��:�����ż�</a>') -- ���ڰ�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=51">ǰ��:�λó�����(����)</a><br>') -- ά�ô���			
			-----------------------------------------------------------------------
			API_ResponseWrite('<text>����          </text>') --�۹�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<text>����          </text>') -- ����
			API_ResponseWrite('<text>����        </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=53">ǰ��:ҹݺɽ��</a>') -- ���ڰ�
			API_ResponseWrite('<text>����          </text>') -- �հ׷ָ���
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=52">ǰ��:�λó��Ĳ�(����)</a><br>')  -- ά�ô���
		else
			API_ResponseWrite('<text> �㵱ǰλ��ר�ø����������У��ݲ��ṩ�˹��ܣ����Ȼس��������ԡ�</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">��ѻس�</a><br>')
		end
		API_ResponseWrite('<br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
	elseif wthtranSelect == 2 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 1, 219, 209)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹�����")
	elseif wthtranSelect == 3 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 2, 250, 151)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:��������")	
	elseif wthtranSelect == 4 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 99, 263, 492)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����ũׯ")
	elseif wthtranSelect == 5 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 9, 151, 386)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:������")
	elseif wthtranSelect == 6 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 10, 131, 308)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����ɺ��Ⱥ��")
	elseif wthtranSelect == 7 then
		API_ResponseWrite('<name> ���䴫��</name>')
		if API_IsBranchServer() then 
			for k, v in pairs(wth_Globe_serverlist) do
				if API_ServerIsOpen(v) then
					--local indexw = k + 20
					if v == nServerID then
						API_ResponseWrite('<text>ǰ��:'..v..'�ŵ� [ ��ǰ���ڵ��죬���봫�� ]</text><br>')
					else
						API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=20&2='..v..'">ǰ��:'..v..'�ŵ�</a><br>')
					end
				end
			end
		else 
			API_ResponseWrite('<text>ȥ�ӵ���ȥ�����ﻻ���ͻ���Ҫ�ҵ���</text>')
		end

		API_ResponseWrite('<br><a href="WGQ_Heroisland">����..</a>')
	elseif wthtranSelect == 8 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 23, 118, 337)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:��������[�۹�]")	
	elseif wthtranSelect == 9 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 25, 131, 319)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����ƽԭ[����]")	
	elseif wthtranSelect == 10 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 70, 101, 230)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�������")	
	elseif wthtranSelect == 11 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 71, 155, 19)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:ʱ������")	
	elseif wthtranSelect == 12 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 8, 428, 778)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:��ɽ��ԭ")	
	elseif wthtranSelect == 13 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 8, 391, 459)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:��ɽ��ԭ")
	elseif wthtranSelect == 41 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 100, 526, 447)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:��սƽԭ")
	elseif wthtranSelect == 42 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 98, 367, 368)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:��ɴʪ��")
	elseif wthtranSelect == 43 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 101, 286, 373)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:��Ļ�ݳ�")
	elseif wthtranSelect == 44 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 102, 430, 700)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:ɳ������")
	elseif wthtranSelect == 45 then
		wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 113, 96, 404)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:̾Ϣƽԭ")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 46 then
		wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 120, 250, 236)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:��������")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 47 then
		wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 112, 256, 269)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:��ɳɳĮ")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 48 then
		wth_UnRegfukongdao(ActorID)
		local playercamp = API_GetActorCamp(ActorID)
		if playercamp == 1 then		
			API_ActorGoToMap(ActorID, 111, 359, 190)
			API_ActorSendMsg(ActorID, 2, "��ӭ�����������ż���ħ����")
		elseif playercamp == 0 then
			API_ActorGoToMap(ActorID, 111, 216, 522)
			API_ActorSendMsg(ActorID, 2, "��ӭ�����������ż�����Ӱ��")
		else
			API_ActorSendMsg(ActorID, 2, "���ﲻ��ӭ������ϵ��������")
		end
	elseif wthtranSelect == 49 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 114, 216, 203)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:�λó�һ��(�ر�)")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 50 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 115, 231, 396)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:�λóǶ���(����)")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 51 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 116, 187, 78)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:�λó�����(����)")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 52 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 117, 99, 214)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:�λó��Ĳ�(����)")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 53 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 110, 194, 487)
		--API_ActorSendMsg(ActorID, 2, "��ӭ����:ҹݺɽ��")
		API_ActorSendMsg(ActorID, 2, "�õ�ͼ��ʱֹͣ����")
	elseif wthtranSelect == 14 then
		wth_UnRegfukongdao(ActorID)
		local playercamp = API_GetActorCamp(ActorID)
		if playercamp == 1 then		
		API_ActorGoToMap(ActorID, 104, 442, 290)
		API_ActorSendMsg(ActorID, 2, "�������˫�ӵ�Ŷ")
		elseif playercamp == 0 then
		API_ActorGoToMap(ActorID, 104, 437, 581)
		API_ActorSendMsg(ActorID, 2, "�۹���ɫ���ǻ���")
		else
		API_ActorSendMsg(ActorID, 2, "���ﲻ��ӭ������ϵ��������")
		end
	elseif wthtranSelect == 15 then
		wth_UnRegfukongdao(ActorID)
		local playerCamp = API_GetActorCamp(ActorID)
		if playerCamp == 1 then
			API_ActorGoToMap(ActorID,105,222,210)
		else
			API_ActorGoToMap(ActorID,105,418,391)
		end
		API_ActorSendMsg(ActorID,2, "���³�һ�㣬С������")
	elseif wthtranSelect == 16 then
		wth_UnRegfukongdao(ActorID)
		local playerCamp = API_GetActorCamp(ActorID)
		if playerCamp == 1 then
			API_ActorGoToMap(ActorID,108,145,250)
		else
			API_ActorGoToMap(ActorID,108,430,407)
		end
		API_ActorSendMsg(ActorID,2, "����Ѩһ��~")
	elseif wthtranSelect == 54 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID,109,240,264)
		API_ActorSendMsg(ActorID,2, "����Ѩ����~")
	elseif wthtranSelect == 55 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID,106,426,253)
		API_ActorSendMsg(ActorID,2, "���µ��³Ƕ���~")
	elseif wthtranSelect == 56 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID,107,152,225)
		API_ActorSendMsg(ActorID,2, "���µ��³�����~")

	elseif wthtranSelect == 20 then
		local wth_island = API_RequestGetNumber(2)
		local wthMapid = API_GetActorMapID(ActorID)
		local wthMapX = API_GetActorPosX(ActorID)
		local wthMapY = API_GetActorPosY(ActorID)
		local wthPZid = API_GetMapConfigID(wthMapid)
		if wthMapid ~= API_GetStaticMapID(wthMapid) then
			API_ActorSendMsg(ActorID, 2, "�㵱ǰ������ͼλ�ڸ�������ѡ��سǺ��ٳ��Կ絺����")
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">��ѻس�</a><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">���ǲ�����..</a><br>')
		elseif wthMapid <= 0 or wthMapid == nil	then
			API_ActorSendMsg(ActorID, 2, "��ȡ��ͼID��Ϣ�����볢�ԻسǺ��ٴ���")
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">��ѻس�</a><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">���ǲ�����..</a><br>')
		else
			if nServerID == wth_island then
				API_ActorSendMsg(ActorID, 2, "����������ѽ")
			else
				--local realmapid = wthPZid + 150*(wth_island-1)
				API_ActorGoToMapEx(ActorID, wth_island, wthPZid, wthMapX, wthMapY)
				API_ActorSendMsg(ActorID, 2, "��ӭ����"..wth_island.."�ŵ������硫")
			end
		end

	
	else
		API_ActorSendMsg(ActorID, 2, "ѡ������������")
	end
end


function WGQ_Heroisland_GOTODungeon()
	local ActorID = API_RequestGetActorID()
	local ActorCamp = API_GetActorCamp(ActorID)
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> �ع�����</name>')
		API_ResponseWrite('<text> ������ȥʲô��ͼ?������ȥ�ɡ���</text><br>')
		if not API_IsEctypeServer() or API_IsBranchServer() then
			API_ResponseWrite('<br><text> �۹�������Χ��</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=11">����ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=12">�о��ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=13">�߼��о��ռ䴫����</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=14">�Ӿ��ռ䴫����</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=15">�߼��Ӿ��ռ䴫����</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=16">�����ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=17">�߼������ռ䴫����</a><br>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=18">����ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=19">�߼�����ռ䴫����</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=20">�����ռ䴫����</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=21">�߼������ռ䴫����</a><br>')
			if ActorCamp == 0 then
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=22">������Դ�ɼ���</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=23">1����Դ�ɼ���</a>')
				API_ResponseWrite('<text>         </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=24">1����Դ�ɼ���B</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=25">2����Դ�ɼ���</a>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=26">2����Դ�ɼ���</a>')	
				API_ResponseWrite('<text>       </text>')		
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=27">3����Դ�ɼ���</a><br>')
--				API_ResponseWrite('<text>       </text>')
			end
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=28">�۹�Ӣ�۹㳡</a><br>')	
			
			API_ResponseWrite('<br><text> ����������Χ����</text><br>')
			--API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=7">ǰ��:�ռ䴫����</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=101">����ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=102">�о��ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=103">�߼��о��ռ䴫����</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=104">�Ӿ��ռ䴫����</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=105">�߼��Ӿ��ռ䴫����</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=106">�����ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=107">�߼������ռ䴫����</a><br>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=108">����ռ䴫����</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=109">�߼�����ռ䴫����</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=110">�����ռ䴫����</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=111">�߼������ռ䴫����</a><br>')
			if ActorCamp == 1 then
--				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=112">������Դ�ɼ���</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=113">1����Դ�ɼ���</a>')
				API_ResponseWrite('<text>         </text>')
--				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=114">1����Դ�ɼ���B</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=115">2����Դ�ɼ���</a>')
				
--				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=116">2����Դ�ɼ���B</a>')	
				API_ResponseWrite('<text>       </text>')		
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=117">3����Դ�ɼ���</a><br>')	
--				API_ResponseWrite('<text>       </text>')
			end
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=118">����Ӣ�۹㳡</a><br>')	
		else
			API_ResponseWrite('<text> �㵱ǰλ��ר�ø����������У��ݲ��ṩ�˹��ܣ����Ȼس��������ԡ�</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">��ѻس�</a><br>')
		end		
		API_ResponseWrite('<text> ��������������������</text><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')

		
	-- ����Ϊ�۹��ռ������ͷ�Χ	
		
	elseif wthtranSelect == 11 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 33, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹�����ռ䴫����")	
	elseif wthtranSelect == 12 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 42, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹��о��ռ䴫����")		
	elseif wthtranSelect == 13 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 43, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹��߼��о��ռ䴫����")		
	elseif wthtranSelect == 14 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 44, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹��Ӿ��ռ䴫����")		
		
	elseif wthtranSelect == 15 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 45, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹��߼��Ӿ��ռ䴫����")		
	
	elseif wthtranSelect == 16 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 46, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹������ռ䴫����")		
	
	elseif wthtranSelect == 17 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 47, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹��߼������ռ䴫����")			
	
	elseif wthtranSelect == 18 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 48, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹�����ռ䴫����")	
		
	elseif wthtranSelect == 19 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 49, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹��߼�����ռ䴫����")		
		
	elseif wthtranSelect == 20 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 50, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹������ռ䴫����")		
		
	elseif wthtranSelect == 21 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 51, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹��߼������ռ䴫����")		
		
	elseif wthtranSelect == 22 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 18, 185, 191)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:������Դ�ɼ���")

	elseif wthtranSelect == 23 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 11, 188, 194)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:1����Դ�ɼ���")	
	elseif wthtranSelect == 24 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 12, 187, 192)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:1����Դ�ɼ���B")
	elseif wthtranSelect == 25 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 17, 185, 190)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:2����Դ�ɼ���")
	elseif wthtranSelect == 26 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 84, 185, 190)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:2����Դ�ɼ���B")	
	elseif wthtranSelect == 27 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 86, 185, 190)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:3����Դ�ɼ���A")	
	elseif wthtranSelect == 28 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 92, 127, 78)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�۹�Ӣ�۹㳡")	

	-- ����Ϊ����ռ䴫������Χ
		
	elseif wthtranSelect == 101 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 32, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�����ռ䴫����")	
		
	elseif wthtranSelect == 102 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 52, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�����о��ռ䴫����")	
	elseif wthtranSelect == 103 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 53, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����߼��о��ռ䴫����")	
		
	elseif wthtranSelect == 104 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 54, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�����Ӿ��ռ䴫����")			
		
	elseif wthtranSelect == 105 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 55, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����߼��Ӿ��ռ䴫����")	
	elseif wthtranSelect == 106 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 56, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:������ռ䴫����")	
	elseif wthtranSelect == 107 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 57, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����߼������ռ䴫����")			
	elseif wthtranSelect == 108 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 58, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:�������ռ䴫����")	
	elseif wthtranSelect == 109 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 59, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����߼�����ռ䴫����")	
	elseif wthtranSelect == 110 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 60, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:������ռ䴫����")	
	elseif wthtranSelect == 111 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 61, 131, 90)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����߼������ռ䴫����")	
	elseif wthtranSelect == 112 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 20, 185, 191)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:������Դ�ɼ���")
	elseif wthtranSelect == 113 then
		wth_UnRegfukongdao(ActorID)	
		API_ActorGoToMap(ActorID, 13, 188, 194)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:1����Դ�ɼ���")	
	elseif wthtranSelect == 114 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 14, 187, 192)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:1����Դ�ɼ���B")
	elseif wthtranSelect == 115 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 19, 185, 190)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:2����Դ�ɼ���")
	elseif wthtranSelect == 116 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 83, 185, 190)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:2����Դ�ɼ���B")		
	elseif wthtranSelect == 117 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 85, 185, 190)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:3����Դ�ɼ���")	
	elseif wthtranSelect == 118 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 91, 127, 78)
		API_ActorSendMsg(ActorID, 2, "��ӭ����:����Ӣ�۹㳡")	
		
	else
		API_ActorSendMsg(ActorID, 2, "ѡ������������")
	end
end

function WGQ_Heroisland_Dragon()
	local wthStatusSelect = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	if wthStatusSelect == 1 then
		API_ActorAddStatus(ActorID,38001,999999999999)
	elseif wthStatusSelect == 2 then
		API_ActorAddStatus(ActorID,285020,999999999999)
	elseif wthStatusSelect == 3 then
		API_ActorAddStatus(ActorID,301020,999999999999)
	elseif wthStatusSelect == 4 then
		API_ActorAddStatus(ActorID,282020,999999999999)
	elseif wthStatusSelect == 5 then
		API_ActorAddStatus(ActorID,33008,999999999999)
	elseif wthStatusSelect == 6 then
		API_ActorAddStatus(ActorID,284001,1)
	elseif wthStatusSelect == 7 then
		API_ActorAddStatus(ActorID,280020,999999999999)
	elseif wthStatusSelect == 8 then
		local wth_emptyocc = API_ActorGetEmptyOfMorale(ActorID)
		local wth_flyshoesPlace = API_ActorGetGoodsOfMorale(ActorID, 10000)  
		if wth_emptyocc < 0 then
  			API_ActorSendMsg(ActorID, 2, "���ʿ��װ�������������ʧ��")
		else
			API_ActorAddGoodsToMorale(ActorID, 10000,"")
			if wth_flyshoesPlace < 0 then
				wth_emptyocc = API_ActorGetEmptyOfMorale(ActorID)
				if wth_emptyocc >= 0 then
					API_ActorAddGoodsToMorale(ActorID, 10000,"")
				end
			end
		end
		
	elseif wthStatusSelect == 9 then
		API_ActorAddStatus(ActorID,299020,9999999999)
	elseif wthStatusSelect == 10 then
		API_ResponseWrite('<name> ���ʿ��װ�� </name>')
		--API_ResponseWrite('<text color="232,164,23">�Կ�������������:</text><br>')
		API_ResponseWrite('<text>����������Ҫ��ʿ��װ������ӵ�ʿ��װ��ID..</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>����ID:</text><input type="number" name="11" size="20">')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_equip?1=1">��������..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_equip?1=2">���ȫ��ʿ��װ��..</a><br>')

	elseif wthStatusSelect == 11 then
		API_ActorAddStatus(ActorID,205001,999999999999) --���������˺�
		API_ActorAddStatus(ActorID,204001,999999999999) --��������״̬����

	elseif wthStatusSelect == 12 then   --��ɱ
		API_ActorAddHP(ActorID, (1-API_ActorGetPropNum(ActorID, 2))) 
		local wth_CreateMonsterID = API_CreateMonster(API_GetActorMapID(ActorID), 55754, API_GetActorPosX(ActorID), API_GetActorPosY(ActorID), 0, 0, -1)
		local round = 0
		while API_ActorIsOnline(ActorID) and ( not API_ActorIsDying(ActorID) ) and round < 2 do
			API_MonsterAddStatus(wth_CreateMonsterID,33008,1000)
			API_MonsterAddStatus(wth_CreateMonsterID,229001,1000)
		--	API_MstUseSkill(wth_CreateMonsterID, 49, 2, 0, 0, 1, ActorID)
		--	wth_DelayTime(1)
			round = round + 1
		end
		--wth_DelayTime(1)		
		API_MonsterAddStatus(wth_CreateMonsterID, 284001, 99999999)

	elseif wthStatusSelect == 13 then
		API_ActorAddStatus(ActorID,44001,99999999)
		--����
		API_ActorAddStatus(ActorID,38001,99999999)
		--������Ѫ
		API_ActorAddStatus(ActorID,32008,99999999)
		--��������
		API_ActorAddStatus(ActorID,33008,99999999)
		--�����Ӽ���
		API_ActorAddStatus(ActorID,34005,99999999)
		--��ҫ
		API_ActorAddStatus(ActorID,316020,99999999)
		--�˺�����
		API_ActorAddStatus(ActorID,318020,99999999)
		--��ѹ�⻷
		API_ActorAddStatus(ActorID,319020,99999999)
		--��Ȼ֮��
		API_ActorAddStatus(ActorID,321020,99999999)
		--����⻷
		API_ActorAddStatus(ActorID,323020,99999999)
		--����
		API_ActorAddStatus(ActorID,324020,99999999)
		--�Զ�֮��
		API_ActorAddStatus(ActorID,326020,99999999)
		API_ActorAddStatus(ActorID,285020,999999999999)
		for i = 1 ,300 do 
			API_ActorAddStatus(ActorID,45100,99999999)
			API_ActorAddStatus(ActorID,45200,99999999)
			API_ActorAddStatus(ActorID,45300,99999999)
			API_ActorAddStatus(ActorID,45400,99999999)
			API_ActorAddStatus(ActorID,45500,99999999)
			API_ActorAddStatus(ActorID,45600,99999999)
		end

	elseif wthStatusSelect == 14 then
		local bianshenbuff = fhjhd_bianshentangguobufftable[math.random(table.getn(fhjhd_bianshentangguobufftable))]
		API_ActorAddStatus(ActorID,bianshenbuff,999999)
		
	elseif wthStatusSelect == 99 then
		API_ActorRemoveStatus(ActorID,38001) --�����ٶ�,����ͬʱ���߶���\����
		API_ActorRemoveStatus(ActorID,285020) --��
		API_ActorRemoveStatus(ActorID,301020) --����
		API_ActorRemoveStatus(ActorID,282020) --����ͼ�ڷ�Χ��Ѫ
		API_ActorRemoveStatus(ActorID,33008) --��ƽ����MP
		API_ActorRemoveStatus(ActorID,280020) --���з籩
		API_ActorRemoveStatus(ActorID,299020) --Ǳ��
		API_ActorRemoveStatus(ActorID,205001) --Ǳ��
		API_ActorRemoveStatus(ActorID,204001) --Ǳ��
		API_ActorRemoveStatus(ActorID,44001) --����
		API_ActorRemoveStatus(ActorID,32008) --����
		API_ActorRemoveStatus(ActorID,34005) --����
		API_ActorRemoveStatus(ActorID,316020) --����
		API_ActorRemoveStatus(ActorID,318020) --����
		API_ActorRemoveStatus(ActorID,319020) --����
		API_ActorRemoveStatus(ActorID,321020) --����
		API_ActorRemoveStatus(ActorID,323020) --����
		API_ActorRemoveStatus(ActorID,324020) --����
		API_ActorRemoveStatus(ActorID,326020) --����
		API_ActorRemoveStatus(ActorID,45100) --����
		API_ActorRemoveStatus(ActorID,45200) --����
		API_ActorRemoveStatus(ActorID,45300) --����
		API_ActorRemoveStatus(ActorID,45400) --����
		API_ActorRemoveStatus(ActorID,45500) --����
		API_ActorRemoveStatus(ActorID,45600) --����
		local wth_10000occ
		repeat				--�������Ь����
			wth_10000occ = API_ActorGetGoodsOfMorale(ActorID, 10000)   ---- �����������local�������Ƚϳ���ֻ�����һ��װ��
			if wth_10000occ >= 0 then
				API_ActorRemoveGoodsFromMorale(ActorID, wth_10000occ, "")
			end
		until wth_10000occ < 0 or wth_10000occ == nil
		for k,v in ipairs(fhjhd_bianshentangguobufftable) do
			API_ActorRemoveStatus(ActorID,v)
		end
		
	elseif wthStatusSelect == 100 then
		API_ResponseWrite('<name> ���μ�</name>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=1">����</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=2">��</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=3">����</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=4">��Ѫ</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=5">��ħ</a><br><br>')

		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=6">��ɱ</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=7">����</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=8">��Ь</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=9">����</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=11">�޵�</a><br><br>')

		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=12">��ɱ</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=14">����</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=13">������</a>')
		API_ResponseWrite('<br><br>')

		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=99">�������</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a>')	
	else
		API_ActorSendMsg(ActorID, 2, "ѡ������������")
	end
end

function WGQ_Heroisland_Getgoods()
	local wthStatusSelect = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	if wthStatusSelect == 1 then
		API_ResponseWrite('<name> ������Ʒ</name>')
		API_ResponseWrite('<text>������Ʒ��дID,����Ĭ��ʱΪ1.�����Լ���,������ˢ!</text><br>')
		API_ResponseWrite('<text>����������һ����Ʒ��IDΪ :</text><text color="0,255,255">'..API_ActorPackageGetLocGoodsID(ActorID, 0, 0)..'     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=1">���»�ȡID</a><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>��Ʒ���:</text><input type="number" name="8" size="10">')
		API_ResponseWrite('<text>      ��Ʒ����:</text><input type="number" name="9" size="9"><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland_Getgoods?1=2">���Ǵ���.</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland_Getgoods?1=4">�߼�����</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland_Getgoods?1=3">����ʯ���㼴�ͣ�����Ϊֹ..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
		API_ResponseFlush(ActorID)	
	elseif wthStatusSelect == 2 then
		local GoodsID= API_RequestGetNumber(8)
		if GoodsID == 0 and API_ActorPackageGetLocGoodsID(ActorID,0,0) ~= 0 then
			GoodsID = API_ActorPackageGetLocGoodsID(ActorID,0,0)
		end
		local GoodsNum = API_RequestGetNumber(9)
		local GoodsName = API_GetGoodsName(GoodsID)
		if GoodsNum == 0 then
			GoodsNum = 1
		end
	if GoodsNum <= 50 then
		if GoodsID == 0 then			
			API_ActorSendMsg(ActorID, 2, "�������û������Ҫ�Ķ���,��Ͷ̥������. >_<")

		elseif GoodsID == 80622 or GoodsID == 80623 then
		--if GoodsID == 80622 or GoodsID == 80623 then
			API_AddActorGoods(ActorID,GoodsID, GoodsNum,"��ʯ���")
			API_ActorSendMsg(ActorID, 2, "����ѻ��"..GoodsNum.."��"..GoodsName.."..")
			
		else
			local wth_canAddGoods = API_ActorCanAddGoods(ActorID, GoodsID, GoodsNum, 0, 0)
			if wth_canAddGoods > -1 then
				for i = 1,GoodsNum do
					API_AddActorGoods(ActorID, GoodsID, 1,"")
				end
				API_ActorSendMsg(ActorID, 2, "����ѻ��"..GoodsNum.."��"..GoodsName.."..")
			else
				API_ActorSendMsg(ActorID, 2, "�����㱳������?������һ������Ӱ�,")
			end
		end
	else
		local wth_canAddGoods = API_ActorCanAddGoods(ActorID, GoodsID, GoodsNum, 0, 0)
			if wth_canAddGoods > -1 then
				API_AddActorGoods(ActorID,GoodsID,GoodsNum,"��ʯһ�������")
				API_ActorSendMsg(ActorID, 2, "���Ѿ����"..GoodsNum.."��"..GoodsName.." ")
			else
				API_ActorSendMsg(ActorID, 2, "�����ռ䲻�����Ʒid����")
			end
	end


	elseif wthStatusSelect == 3 then
		local wth_canAddGoods = API_ActorCanAddGoods(ActorID, 80397, 999, 0, 0)
		if wth_canAddGoods > -1 then
			API_AddActorGoods(ActorID, 80397, 1000,"")
			API_ActorSendMsg(ActorID, 2, "����ѻ��1000������ʯ��������質�ɡ�")
		else
			API_ActorSendMsg(ActorID, 2, "�����㱳������?������һ������Ӱ�,")
		end
	
	elseif wthStatusSelect == 4 then 
		API_ResponseWrite('<name> ������Ʒ</name>')
		API_ResponseWrite('<text>����������һ����Ʒ��IDΪ :</text><text color="0,255,255">'..API_ActorPackageGetLocGoodsID(ActorID, 0, 0)..'     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=4">���»�ȡID</a><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>��ѡ����Ҫ�������ƷID������</text><br>')
		API_ResponseWrite('<text>��ʼID��</text><input type="number" name="12" size="10">')
		API_ResponseWrite('<text>����ID��</text><input type="number" name="13" size="10"><br>')
		API_ResponseWrite('<text>������  </text><input type="number" name="14" size="10"><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=67">��������</a>')	

	elseif wthStatusSelect == 67 then

		local BeginID = API_RequestGetNumber(12)
		local EndID = API_RequestGetNumber(13)
		local goumainum = API_RequestGetNumber(14)
		if goumainum == 0 then 
			goumainum = 1
		end 
		if not ( BeginID==0 and EndID == 0 ) then  
			if BeginID == 0 and EndID >0 then 
				BeginID = EndID
			elseif EndID == 0 and BeginID >0 then 
				EndID = BeginID
			end
			if BeginID > EndID then 
				BeginID,EndID=EndID,BeginID
			end

			for i = BeginID,EndID do
			local GoodName = API_GetGoodsName(i)
				local cannotbuy = API_ActorCanAddGoods(ActorID,i,goumainum,0,0)
				if cannotbuy > -1 then
					API_AddActorGoods(ActorID,i,goumainum,"")
					API_ActorSendMsg(ActorID,2,"�ɹ����"..GoodName..""..goumainum.."��")
				else
					API_ActorSendMsg(ActorID, 2, "�޷����򣬿����Ǳ����ռ䲻��")
				break
				end
			end
			else
			API_ActorSendMsg(ActorID,2,"����Ҫ��ʲô,����Ҫ��˵��,�㲻˵����ô֪������Ҫʲô.Ҳ��������˵��Ҫ��ƫƫ����...")
		end
	end
end


function WGQ_Heroisland_monster_recall()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name>ˢ��</name>')
		API_ResponseWrite('<text>����������ţ�</text><br>')
		API_ResponseWrite('<text>���� ��������Ѫ��(40��):4040  �۹�����Ѫ��(40��):5040 </text><br>')
		API_ResponseWrite('<input type="number" name="6" size="10"><br>')
		API_ResponseWrite('<text>�������������(������Ĭ��Ϊ1��)��</text><br>')
		API_ResponseWrite('<input type="number" name="7" size="2"><br><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_monster_recall?1=2">��ˢ</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
	elseif wthtranSelect == 2 then
		local MonsterCode = API_RequestGetNumber(6)
		local MonsterNum = API_RequestGetNumber(7)	
		local MapID = API_GetActorMapID(ActorID)
		local Actor_x , Actor_y = PublicFun_GetActorPosXY(ActorID)
		if MonsterNum == 0 then
			MonsterNum = 1
		end
		if MonsterCode == 0 then
			API_ActorSendMsg(ActorID, 2, "ID������,����ˢwhat?.")
		else
			--local wth_MonsterName = ''
			--wth_MonsterNmae = API_GetMonsterNameByID(MonsterCode)
			--if wth_MonsterNmae == '' then
			--	API_ResponseWrite('<name>�ɳܵ�ˢ��ʧ��</name>')
			--	API_ResponseWrite('<br><text>��ǳ��ɳܵ�ˢ��ʧ����</text><br>')
			--	API_ResponseWrite('<text>����������Ĺ������Ƿ���ȷ��</text><br><br>')
			--	API_ResponseWrite('<a href="WGQ_Heroisland_monster_recall?1=1">����</a><br>')
			--else	
				local monsterFastid = nil	
				for i = 1,MonsterNum do
					monsterFastid = API_CreateMonster(MapID, MonsterCode, Actor_x, Actor_y , 4 , 0 , -1)
					if monsterFastid < 0 then
						API_TraceError(API_GetActorName(ActorID).."�ɳܵ�ˢ��ʧ���ˡ�")
						API_ActorBroadcastMsg(-1,17,"˥��"..API_GetActorName(ActorID).."�ɳܵ�ˢ��ʧ�ܣ����Ⱥ��Ч��")
						break
					end
				end
			--end
		end
	end	
end


function WGQ_Heroisland_SetResource()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name>�޸���Դ</name>')
		API_ResponseWrite('<text color="232,164,23">�޸���Դ:</text><br>')
		API_ResponseWrite('<text>������Ҫ�ı����ֵ,,��Ҫ��ʲô���Ӧ��ѡ��..</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>������ֵ:</text><input type="number" name="7" size="10">')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=2">��Ǯ</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=3">ʿ��</a>')
		API_ResponseWrite('<text>    </text>')		
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=4">��ѫ</a>')
		API_ResponseWrite('<text>    </text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=7">���յ�����</a>')
		API_ResponseWrite('<text>    </text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=15">�����</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=5">��үǮ��..</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=6">�͵���һ��Ҫ�͵�..</a><br><br>')
		--if API_GetConsortiaId(ActorID) ~= 0 and nServerID == API_GetConServerID(API_GetConsortiaId(ActorID)) then
		if API_GetConsortiaId(ActorID) ~= 0  then
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=8">����Ӷ���Ź��׶�</a>')
			API_ResponseWrite('<text>    </text>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=9">�۳�Ӷ���Ź��׶�</a>')
			API_ResponseWrite('<text>    </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=16">����Ӷ���Ż�Ծֵ</a>')
			API_ResponseWrite('<text>    </text>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=17">����Ӷ���Ż�Ծֵ</a>')
			API_ResponseWrite('<text>    </text>')
		end
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=20">���ӳ��ﾭ��</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=10">ˮ����Ҳ��Ǯ��</a>')
		API_ResponseWrite('<text>    </text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=11">ˮ�����治ֵǮ</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=12">�������ݲ�ѯ</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=13">���������޸�</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">��������..</a><br>')
	elseif wthtranSelect == 2 then
		local AddMoney = API_RequestGetNumber(7)
		API_ActorAddMoneyUnStat(ActorID, AddMoney,0,"��ʯ�޸�")
		API_ActorSendMsg(ActorID, 2, "��������"..AddMoney.."��..")
	elseif wthtranSelect == 3 then
		local AddMorale = API_RequestGetNumber(7)
		API_ActorAddMorale(ActorID, AddMorale,0,"��ʯ�޸�")
		API_ActorSendMsg(ActorID, 2, "��������"..AddMorale.."ʿ��..")
	elseif wthtranSelect == 4 then
		local AddExp = API_RequestGetNumber(7)
		API_ActorAddExp(ActorID, AddExp,0,"��ʯ�޸�")
		API_ActorSendMsg(ActorID, 2, "��������"..AddExp.."��ѫ..")
	elseif wthtranSelect == 5 then
		local AddMoney = API_RequestGetNumber(7)
		API_ActorAddMoneyUnStat(ActorID, -AddMoney,0,"��ʯ�޸�")
		API_ActorSendMsg(ActorID, 2, "�������"..AddMoney.."��..")
	elseif wthtranSelect == 6 then
		local AddExp = API_RequestGetNumber(7)
		API_ActorAddExp(ActorID, -AddExp,0,"��ʯ�޸�")
		API_ActorSendMsg(ActorID, 2, "�������"..AddExp.."��ѫ..")
	elseif wthtranSelect == 7 then
		API_VarDataSetNumber(ActorID, 1, GLOBAL_FuKongDaoShengWang, API_RequestGetNumber(7))  --- 18267
		API_ActorSendMsg(ActorID, 2, "��ĸ��յ�����������Ϊ"..API_RequestGetNumber(7))
	elseif wthtranSelect == 10 then
		API_ActorShoppingM_Add(ActorID, API_RequestGetNumber(7), 0, "��ʯ�޸�")
		API_ActorSendMsg(ActorID, 2, "���ˮ����������"..API_RequestGetNumber(7))
	elseif wthtranSelect == 11 then
		API_ActorShoppingM_Reduce(ActorID, -API_RequestGetNumber(7), 0, "��ʯ�޸�")
		API_ActorSendMsg(ActorID, 2, "���ˮ���ұ�ϵͳ����"..API_RequestGetNumber(7))
	elseif wthtranSelect == 12 then
		local playerVar = API_VarDataGetNumber(ActorID, 1, API_RequestGetNumber(7))
		API_ActorSendMsg(ActorID, 2, "������ѯ�Ľ������� "..API_RequestGetNumber(7).." ��ֵΪ: "..playerVar)
	elseif wthtranSelect == 13 then
		API_ResponseWrite('<name>�޸Ľ�������</name>')
		local playerVar = API_RequestGetNumber(7)
		if playerVar > 1 then
			API_ResponseWrite('<text color="232,164,23">����:</text><br>')
			API_ResponseWrite('<text color="255,0,0">�޸������ý������ݽ����ܵ��·��������ر�������崻�. ��ȷ�����޸ĵ�������ȷ.</text><br><br>')
			API_ResponseWrite('<text color="255,0,0">����㲻�������ݾ��ύ,������ 0 �ύ,���൱��ɾ���ý�������!!!</text><br><br>')
			API_ResponseWrite('<text>�����������޸ĸý������ݵ�ֵ:</text><input type="number" name="8" size="15"><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=14&2='..playerVar..'">�޸�</a><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">��������..</a><br>')
		else
			API_ResponseWrite('<text>������Ľ�������Key�����ǺϷ��Ľ�������Keyֵ.</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=1">����..</a><br>')
		end

	elseif wthtranSelect == 14 then
		local playerVar = API_RequestGetNumber(2)
		API_VarDataSetNumber(ActorID, 1, playerVar, API_RequestGetNumber(8))
		API_ActorSendMsg(ActorID, 2, "��Ľ������� "..playerVar.." ���޸�Ϊ: "..API_RequestGetNumber(8))

	elseif wthtranSelect == 20 then
		local PetExp = API_RequestGetNumber(7)
		API_ActorAddPetExp(ActorID,PetExp,0,'��ʯ�Ӿ���')
		API_ActorSendMsg(ActorID,2,"��ĳ���������"..PetExp.."�㾭��")

	elseif wthtranSelect == 15 then
		local addlhl = API_RequestGetNumber(7)
		API_VarDataSetNumber(ActorID, 1, 7611, addlhl)
		API_ActorSendMsg(ActorID, 2, "�����������޸�Ϊ "..addlhl)

	elseif wthtranSelect == 8 then
		local AddYbt = API_RequestGetNumber(7)
		local currYbt = API_GetCorpsContribute(ActorID)
		if (currYbt + AddYbt) <= 65535 then
			API_AddAddCorpsContribute(ActorID, AddYbt)
			API_ActorSendMsg(ActorID, 2, "���Ӷ���Ź��׶�������"..AddYbt.."����ǰ���׶��ܼ�Ϊ "..API_GetCorpsContribute(ActorID))
		else
			AddYbt = 65535 - currYbt
			API_AddAddCorpsContribute(ActorID, AddYbt)
			API_ActorSendMsg(ActorID, 2, "�㵱ǰ��Ӷ���Ź��׶��Ѵﵽ����65535��")

		end
	elseif wthtranSelect == 9 then
		local AddYbt = API_RequestGetNumber(7)
		local currYbt = API_GetCorpsContribute(ActorID)
		if (currYbt - AddYbt) >= 0 then
			API_AddAddCorpsContribute(ActorID, -AddExp)
			API_ActorSendMsg(ActorID, 2, "���Ӷ���Ź��׶Ƚ�����"..AddYbt.."����ǰ���׶��ܼ�Ϊ "..API_GetCorpsContribute(ActorID))
		else
			API_AddAddCorpsContribute(ActorID, -currYbt)
			API_ActorSendMsg(ActorID, 2, "�㵱ǰ��Ӷ���Ź��׶�������Ϊ0")

		end	

	elseif wthtranSelect == 16 then
		local Addhyz = API_RequestGetNumber(7)
		local currhyz = API_GetCorpsActivity(ActorID)
		if (currhyz + Addhyz) <= 9999999 then
			API_AddCorpsActivity(ActorID, Addhyz)
			API_ActorSendMsg(ActorID, 2, "���Ӷ���Ż�Ծֵ������"..Addhyz)
		else 
			API_ActorSendMsg(ActorID, 2, "�������û�Ծֵ���ɲ�³")
		end	

	elseif wthtranSelect == 17 then
		local Addhyz = API_RequestGetNumber(7)
		local currhyz = API_GetCorpsActivity(ActorID)
		if (currhyz - Addhyz) >= 0 then
			API_AddCorpsActivity(ActorID, -Addhyz)
			API_ActorSendMsg(ActorID, 2, "���Ӷ���Ż�Ծֵ������"..Addhyz)
		else
			API_AddCorpsActivity(ActorID, -currYbt)
			API_ActorSendMsg(ActorID, 2, "�����Ǳ����������㣬�����������˱��ţ�")

		end	



	else
		API_ActorSendMsg(ActorID, 2, "ѡ������������")
	end
	
end



function WGQ_Heroisland_SetCon()
	local ActorID = API_RequestGetActorID()	
	local wthtranSelect = API_RequestGetNumber(1)
	local lConsortiaId = API_GetTopConsortiaId(ActorID)
	local wth_smallYbtId = API_GetConsortiaId(ActorID)  -- �����ֱ���ID
	local wth_YbtName,wth_YbtLevel,wth_YbtJTZname,wth_YbtMoney,wth_YbtExp,wth_YbtMemberNum,wth_YbtLeftMemberNum,wth_YbtLeftYbtNum,wth_YbtLeftVipMemberNum,wth_YbtLeftVipYbtNum,wth_YbtSkillLevel1,wth_YbtSkillLevel2,wth_YbtSkillLevel3
	local wth_sYbtName,wth_sYbtLevel,wth_sYbtJTZname,wth_sYbtMoney,wth_sYbtExp,wth_sYbtMemberNum,wth_sYbtLeftMemberNum,wth_sYbtLeftYbtNum,wth_sYbtLeftVipMemberNum,wth_sYbtLeftVipYbtNum,wth_sYbtSkillLevel1,wth_sYbtSkillLevel2,wth_sYbtSkillLevel3
	local wth_YbtGrade
	if lConsortiaId ~= 0 and nServerID == API_GetConServerID(lConsortiaId) then	
		wth_YbtName = API_ConGetStrInfo(lConsortiaId, 1)   --- Ӷ��������
		wth_YbtLevel = API_ConGetNumInfo(lConsortiaId, 7)  -- Ӷ���ŵȼ�
		wth_YbtJTZname = API_ConGetStrInfo(lConsortiaId, 2)  -- Ӷ�����ų�����
		wth_YbtMoney = API_ConGetNumInfo(lConsortiaId, 5)  -- Ӷ�����ʽ�
		wth_YbtExp = API_ConGetNumInfo(lConsortiaId, 6)  -- Ӷ���ž���
		wth_YbtMemberNum = API_ConGetNumInfo(lConsortiaId, 3)  -- Ӷ�����û���
		wth_YbtLeftMemberNum = API_ConGetNumInfo(lConsortiaId, 11)  -- Ӷ����ʣ��Ӷ����
		wth_YbtLeftYbtNum = API_ConGetNumInfo(lConsortiaId, 12)  -- Ӷ����ʣ��Ӷ������
		wth_YbtLeftVipMemberNum = API_ConGetNumInfo(lConsortiaId, 13)  -- Ӷ����ʣ����ֵӶ����
		wth_YbtLeftVipYbtNum = API_ConGetNumInfo(lConsortiaId, 14)  -- Ӷ����ʣ����ֵӶ������
		wth_YbtSkillLevel1 = API_ConGetNumInfo(lConsortiaId, 8)  -- Ӷ����ս�����ܵȼ�
		wth_YbtSkillLevel2 = API_ConGetNumInfo(lConsortiaId, 9)  -- Ӷ������ҵ���ܵȼ�
		wth_YbtSkillLevel3 = API_ConGetNumInfo(lConsortiaId, 10)  -- Ӷ�������⼼�ܵȼ�
		
		--if lConsortiaId ~= wth_smallYbtId then
			wth_sYbtName = API_ConGetStrInfo(wth_smallYbtId, 1)   --- Ӷ��������
			wth_sYbtLevel = API_ConGetNumInfo(wth_smallYbtId, 7)  -- Ӷ���ŵȼ�
			wth_sYbtJTZname = API_ConGetStrInfo(wth_smallYbtId, 2)  -- Ӷ�����ų�����
			wth_sYbtMoney = API_ConGetNumInfo(wth_smallYbtId, 5)  -- Ӷ�����ʽ�
			wth_sYbtExp = API_ConGetNumInfo(wth_smallYbtId, 6)  -- Ӷ���ž���
			wth_sYbtMemberNum = API_ConGetNumInfo(wth_smallYbtId, 3)  -- Ӷ�����û���
			wth_sYbtLeftMemberNum = API_ConGetNumInfo(wth_smallYbtId, 11)  -- Ӷ����ʣ��Ӷ����
			wth_sYbtLeftYbtNum = API_ConGetNumInfo(wth_smallYbtId, 12)  -- Ӷ����ʣ��Ӷ������
			wth_sYbtLeftVipMemberNum = API_ConGetNumInfo(wth_smallYbtId, 13)  -- Ӷ����ʣ����ֵӶ����
			wth_sYbtLeftVipYbtNum = API_ConGetNumInfo(wth_smallYbtId, 14)  -- Ӷ����ʣ����ֵӶ������
			wth_sYbtSkillLevel1 = API_ConGetNumInfo(wth_smallYbtId, 8)  -- Ӷ����ս�����ܵȼ�
			wth_sYbtSkillLevel2 = API_ConGetNumInfo(wth_smallYbtId, 9)  -- Ӷ������ҵ���ܵȼ�
			wth_sYbtSkillLevel3 = API_ConGetNumInfo(wth_smallYbtId, 10)  -- Ӷ�������⼼�ܵȼ�
		--end
		 wth_YbtGrade = API_ConGetNumInfo(wth_smallYbtId, 2)  -- �ֱ��ŵȼ�(���)
		
	end	
	
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> ��������</name>')
		API_ResponseWrite('<text color="232,164,23">��������:</text><br>')
		API_ResponseWrite('<text>������Ҫ���õ���ֵ,,��Ҫ��ʲô���Ӧ��ѡ��(ֱ������,���������Ӻͼ���)..</text><br>')
		API_ResponseWrite('<br>')
		if lConsortiaId == 0 then
			API_ResponseWrite('<text>�㻹δ�����κα���,����Ҫ����..</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=11">����Ӷ������������..</a><br>')
		else
			if nServerID == API_GetConServerID(lConsortiaId) then
				--local wth_YbtName = API_ConGetStrInfo(lConsortiaId, 1)
				--local wth_YbtLevel = API_ConGetNumInfo(lConsortiaId, 7)
				--API_ActorSendMsg(ActorID, 2, 'wth_YbtName'..wth_YbtName..'wth_YbtLevel'..wth_YbtLevel..'')    -- ���棬��һ�о�Ȼ���¿ͻ��˰ٷְٷǷ�
				--if type(wth_YbtName) == 'string' then
					API_ResponseWrite('<text>�����ڵ�Ӷ����Ϊ '..wth_YbtName..'; ��Ӷ���ŵ�ǰ�ȼ�Ϊ '..wth_YbtLevel..'</text><br>')
				--end
				--API_ResponseWrite('<text>��Ӷ���ŵ�ǰ�ȼ�Ϊ '..wth_YbtLevel..'</text><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=8">��ǰӶ������ϸ��Ϣ..</a><br><br>')
				API_ResponseWrite('<text>������ֵ:</text><input type="number" name="8" size="20">')
				API_ResponseWrite('<br><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=2">Ӷ���ž���(�ܱ���)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=3">Ӷ���ŵȼ�(�ܱ���)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=4">Ӷ���Ž�Ǯ(�ܱ���)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=5">Ӷ���ſƼ��ȼ�(�ܱ���)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=6">Ӷ����ʣ��Ӷ����(������С����)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=7">Ӷ������ֵʣ��Ӷ����(������С����)..</a><br>')
				if wth_YbtGrade < 3 then	
					API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=9">ʣ��Ӷ������(������С����)..</a><br>')
					API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=10">��ֵʣ��Ӷ������(������С����)..</a><br>')
				end
			else
				API_ResponseWrite('<text>��ǰ�����Ķ���Ӷ����ID  </text><text color="0,255,255">'..lConsortiaId..'</text><text>,�ֱ���ID </text><text color="0,255,255">'..wth_smallYbtId..' </text><br>')
				API_ResponseWrite('<text>��Ӷ���Ŵ�����  </text><text color="0,255,255"> '..API_GetConServerID(lConsortiaId)..'</text><text> �ŵ� </text><br>')	
				API_ResponseWrite('<text>���ڵ�ǰ���Ǹ�Ӷ���Ŵ������죬�������ڱ�����ѯ����Ӷ������Ϣ</text><text color="255,0,0">���ܲ�׼ȷ </text><br><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=7">�뻻����Ӧ�ĵ����ѯ���޸�</a><br><br>')
			end
		end
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')	
		API_ResponseFlush(ActorID)
	elseif wthtranSelect == 2 then
		local Number = API_RequestGetNumber(8)
		if Number > 210000000 then
			API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
		else 
			API_SetConLevelExp(lConsortiaId,wth_YbtLevel,Number)
			API_ActorSendMsg(ActorID, 2, "���Ӷ���ž����޸�Ϊ"..Number.."����..")
		end
	elseif wthtranSelect == 3 then
		local Number = API_RequestGetNumber(8)
		if Number > 25 then
			API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
		else 
			API_SetConLevelExp(lConsortiaId,Number,wth_YbtExp)
			API_ActorSendMsg(ActorID, 2, "���Ӷ���ŵȼ��޸�Ϊ"..Number.."��..")
		end
	elseif wthtranSelect == 4 then
		local Number = API_RequestGetNumber(8)
		if Number > 210000000 then
			API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
		else 
			local nowmoney = API_ConGetNumInfo(lConsortiaId,5)
			API_SetConMoney(lConsortiaId,(Number - nowmoney))
			API_ActorSendMsg(ActorID, 2, "���Ӷ�����ʽ��޸�Ϊ"..Number.."��..")
		end	
	elseif wthtranSelect == 5 then	
		local Number = API_RequestGetNumber(8)
		if Number > 255 then
			API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
		else 
			API_SetConBattle(lConsortiaId, 1, Number)
			API_SetConBattle(lConsortiaId, 2, Number)
			API_SetConBattle(lConsortiaId, 3, Number)
			API_ActorSendMsg(ActorID, 2, "���Ӷ���ŵ�ս������ҵ�����⼼�ܵȼ��޸�Ϊ"..Number.."��..")
		end
	elseif wthtranSelect == 6 then   --Ӷ����ʣ��Ӷ����
		local Number = API_RequestGetNumber(8)
		if ( Number + wth_sYbtMemberNum ) > 15 then
			API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
		else 
			local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 1, Number)
			if wth_xiugaiYbt then
				API_ActorSendMsg(ActorID, 2, "���Ӷ����ʣ��Ӷ�������޸�Ϊ"..Number.."..")
			else
				API_ActorSendMsg(ActorID, 2, "�޸Ŀɳܵ�ʧ����..")
			end
		end
	
	elseif wthtranSelect == 7 then  --Ӷ������ֵʣ��Ӷ����
		local Number = API_RequestGetNumber(8)
		if ( Number + wth_sYbtLeftVipMemberNum ) > 15 then
			API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
		else 
			local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 3, Number)
			if wth_xiugaiYbt then
				API_ActorSendMsg(ActorID, 2, "���Ӷ������ֵʣ��Ӷ�������޸�Ϊ"..Number.."..")
			else
				API_ActorSendMsg(ActorID, 2, "�޸Ŀɳܵ�ʧ����..")
			end
		end
	
	elseif wthtranSelect == 8 then

		API_ResponseWrite('<name> ������Ϣ</name>')
		if nServerID == API_GetConServerID(lConsortiaId) then
			API_ResponseWrite('<text>��ǰ�����Ķ���Ӷ����ID  </text><text color="0,255,255">'..lConsortiaId..'</text><text>,�ֱ���ID </text><text color="0,255,255">'..wth_smallYbtId..' </text><br>')
			API_ResponseWrite('<text>��Ӷ���Ŵ�����  </text><text color="0,255,255"> '..API_GetConServerID(lConsortiaId)..'</text><text> �ŵ� </text><br>')	
			API_ResponseWrite('<text>��ǰ�����Ķ���Ӷ����Ϊ  </text><text color="0,255,255">'..wth_YbtName..'</text><text>,�ȼ�Ϊ </text><text color="0,255,255">'..wth_YbtLevel..'</text><text> ,�ų�Ϊ </text><text color="0,255,255">'..wth_YbtJTZname..'</text><br>')	
			API_ResponseWrite('<text>��Ӷ����ӵ���ʽ�Ϊ </text><text color="0,255,255">'..wth_YbtMoney..'</text><text>,����Ϊ</text><text color="0,255,255">'..wth_YbtExp..'</text><text> ,���ų�Ա��Ϊ </text><text color="0,255,255">'..wth_YbtMemberNum..'</text><br>')	
			API_ResponseWrite('<text>Ӷ����ʣ��Ӷ����Ϊ  </text><text color="0,255,255">'..wth_YbtLeftMemberNum..'</text><text>,Ӷ����ʣ��Ӷ������Ϊ </text><text color="0,255,255">'..wth_YbtLeftYbtNum..'</text><br>')		
			API_ResponseWrite('<text>Ӷ������ֵʣ��Ӷ����  </text><text color="0,255,255">'..wth_YbtLeftVipMemberNum..'</text><text>,��ֵʣ��Ӷ������ </text><text color="0,255,255">'..wth_YbtLeftVipYbtNum..'</text><br>')		
			API_ResponseWrite('<text>ս�����ܵȼ�  </text><text color="0,255,255">'..wth_YbtSkillLevel1..'</text><text>��,��ҵ���ܵȼ�Ϊ </text><text color="0,255,255">'..wth_YbtSkillLevel2..'</text><text>��,���⼼�ܵȼ�Ϊ </text><text color="0,255,255">'..wth_YbtSkillLevel3..'</text><text> ��</text><br>')	
			if wth_smallYbtId ~= lConsortiaId then   --���ڷֱ���
				API_ResponseWrite('<br><text>����Ϊ�������ķֱ�����ϸ��Ϣ:    </text><br>')
				API_ResponseWrite('<text>�������ķֱ���Ϊ  </text><text color="0,255,255">'..wth_sYbtName..'</text><text> �˷ֱ����ų�Ϊ </text><text color="0,255,255">'..wth_sYbtJTZname..' </text><br>')	
				API_ResponseWrite('<text>��Ӷ����ӵ���ʽ�Ϊ </text><text color="0,255,255">'..wth_sYbtMoney..'</text><text>,����Ϊ</text><text color="0,255,255">'..wth_sYbtExp..'</text><text> ,���ų�Ա��Ϊ </text><text color="0,255,255">'..wth_sYbtMemberNum..'</text><br>')	
			API_ResponseWrite('<text>Ӷ����ʣ��Ӷ����Ϊ  </text><text color="0,255,255">'..wth_sYbtLeftMemberNum..'</text><text>,Ӷ����ʣ��Ӷ������Ϊ </text><text color="0,255,255">'..wth_sYbtLeftYbtNum..'</text><br>')		
			API_ResponseWrite('<text>Ӷ������ֵʣ��Ӷ����  </text><text color="0,255,255">'..wth_sYbtLeftVipMemberNum..'</text><text>,��ֵʣ��Ӷ������ </text><text color="0,255,255">'..wth_sYbtLeftVipYbtNum..'</text><br>')		
			API_ResponseWrite('<text>ս�����ܵȼ�  </text><text color="0,255,255">'..wth_sYbtSkillLevel1..'</text><text>��,��ҵ���ܵȼ�Ϊ </text><text color="0,255,255">'..wth_sYbtSkillLevel2..'</text><text>��,���⼼�ܵȼ�Ϊ </text><text color="0,255,255">'..wth_sYbtSkillLevel3..'</text><text> ��</text><br>')	
			else
				API_ResponseWrite('<text>�㲢δ����ֱ���.. </text><br>')	
			end
		else
			API_ResponseWrite('<text>��ǰ�����Ķ���Ӷ����ID  </text><text color="0,255,255">'..lConsortiaId..'</text><text>,�ֱ���ID </text><text color="0,255,255">'..wth_smallYbtId..' </text><br>')
			API_ResponseWrite('<text>��Ӷ���Ŵ�����  </text><text color="0,255,255"> '..API_GetConServerID(lConsortiaId)..'</text><text> �ŵ� </text><br>')	
			API_ResponseWrite('<text>���ڵ�ǰ���Ǹ�Ӷ���Ŵ������죬�������ڱ�����ѯ����Ӷ������Ϣ</text><text color="255,0,0">���ܲ�׼ȷ </text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=7">�뻻����Ӧ�ĵ����ѯ</a><br>')
		end
		API_ResponseWrite('<br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')	
		
	elseif wthtranSelect == 9 then  -- ʣ��Ӷ������
		local Number = API_RequestGetNumber(8)
		if wth_YbtGrade < 3	then	
			if ( Number + wth_sYbtLeftYbtNum ) > 6 then
				API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
			else 
				local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 2, Number)
				if wth_xiugaiYbt then
					API_ActorSendMsg(ActorID, 2, "���Ӷ����ʣ��Ӷ���������޸�Ϊ"..Number.."..")
				else
					API_ActorSendMsg(ActorID, 2, "�޸Ŀɳܵ�ʧ����..")
				end
			end
		else
			API_ActorSendMsg(ActorID, 2, "���Ӷ��������3���ֱ���,��������ļ�ֱ�����")
		end

	elseif wthtranSelect == 10 then   --��ֵʣ��Ӷ������
		local Number = API_RequestGetNumber(8)
		if wth_YbtGrade < 3	then	
			if ( Number + wth_sYbtLeftVipYbtNum ) > 6 then
				API_ActorSendMsg(ActorID, 2, "��ֵ̫��,����������..")
			else 
				local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 2, Number)
				if wth_xiugaiYbt then
					API_ActorSendMsg(ActorID, 2, "���Ӷ������ֵʣ��Ӷ���������޸�Ϊ"..Number.."..")
				else
					API_ActorSendMsg(ActorID, 2, "�޸Ŀɳܵ�ʧ����..")
				end
			end
		else
			API_ActorSendMsg(ActorID, 2, "���Ӷ��������3���ֱ���,��������ļ�ֱ�����")
		end
	elseif wthtranSelect == 11 then   --����Ӷ��������
		if lConsortiaId == 0 then
			API_VarDataSetNumber(ActorID,1,7545,2)
			API_ActorSendMsg(ActorID, 2, "��ϲ��������Ӷ���Ŵ������񣬲��ɹ���Լ5W��ҡ����ڿ���ֱ����Ӷ���Ź���Ա����Ӷ���š�")
		end
	else
		API_ActorSendMsg(ActorID, 2, "ѡ������������")
	end

end



function WGQ_Heroisland_SetVarData()
	local ActorID = API_RequestGetActorID()	
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name>�����޸�</name>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=2">�Կ�����</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=3">���ظ����ִ�</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=4">���������ִ�</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=6">������򴴽���¼</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=5">ȡ�����и�����ȴ����</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=50">ȡ�����и��������������</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
	
	elseif wthtranSelect == 2 then
		API_ResponseWrite('<name> �Կ���������</name>')
		API_ResponseWrite('<text color="232,164,23">�Կ�������������:</text><br>')
		API_ResponseWrite('<text>�������޸������Կ������ļ�¼���ݣ��뾡����Ҫ�ڸ�����;�޸�..</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>��������Ҫ��ս�ĶԿ������ȼ���ƽ��0���о���1�����У�2���Ӿ���3�����ӣ�4��������5���߲���6 ..</text><br>')
		API_ResponseWrite('<text>������ֵ:</text><input type="number" name="8" size="20">')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>������õȼ��Կ�������ͨ���Ĵ��� ..</text><br>')
		API_ResponseWrite('<text>������ֵ:</text><input type="number" name="9" size="20">')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetZDFB">��������..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')	
		
	elseif wthtranSelect == 3 then
		--local MapID = API_GetActorMapID(ActorID)
		local wth_StaticMapid = API_GetStaticMapID(API_GetActorMapID(ActorID))
		API_ResponseWrite('<name> ���ظ�������</name>')
		if wth_StaticMapid == 1803 or wth_StaticMapid == 1801 or wth_StaticMapid == 1808 or wth_StaticMapid == 1809 or wth_StaticMapid == 1820 or wth_StaticMapid == 1875 or ( wth_StaticMapid >= 1831 and wth_StaticMapid <= 1837 ) then
						
			API_ResponseWrite('<text>�������޸�����ظ����ĵ�ǰ�ִ�..</text><br><br>')
			API_ResponseWrite('<text>������������ת���ִ�..   </text>')
			API_ResponseWrite('<input type="number" name="111" size="5"><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=10">��������..</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
			
		
		else
			API_ResponseWrite('<br><text>�����ڲ�δ���ڷ��ظ��յ���,�����޸��������..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')	
		end
		
	elseif wthtranSelect == 4 then
	
		local wth_StaticMapid = API_GetStaticMapID(API_GetActorMapID(ActorID))
		API_ResponseWrite('<name> ������������</name>')
		if wth_StaticMapid == 1805 or  ( wth_StaticMapid >= 1822 and wth_StaticMapid <= 1830 ) then	
		
			API_ResponseWrite('<text>�������޸������������ĵ�ǰ�ִ�..</text><br><br>')
			API_ResponseWrite('<text>������������ת���ִ�..   </text>')
			API_ResponseWrite('<input type="number" name="111" size="5"><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=11">��������..</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
		else
			API_ResponseWrite('<br><text>�����ڲ�δ�����������յ���,�����޸��������..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')	
		end		
		
	elseif wthtranSelect == 5 then
		local NowTime = os.time() - 2000
		API_VarDataSetNumber(ActorID,1,GLOBAL_FangShouLengQue,NowTime)
		API_VarDataSetNumber(ActorID,1,GLOBAL_TaFangLengQue,NowTime)
		API_VarDataSetNumber(ActorID,1,GLOBAL_ZhengDuoLengQue,NowTime)
		API_VarDataSetNumber(ActorID,1,GLOBAL_XunLianYingLengQue,NowTime)
		API_VarDataSetNumber(ActorID,1,GLOBAL_JieJiLengQue,NowTime)
		API_VarDataSetNumber(ActorID,1,GLOBAL_LajuzhanLengQue,NowTime)
		API_VarDataSetNumber(ActorID,1,GLOBAL_LajuzhanLengQue2,NowTime)
		API_VarDataSetNumber(ActorID,1,GLOBAL_zhangeLengQue,NowTime)
		API_VarDataSetNumber(ActorID,1,7515,NowTime) -- ս��Ͽ��
		API_VarDataSetNumber(ActorID,1,18414,NowTime) -- ��һ����
		API_VarDataSetNumber(ActorID,1,12117,NowTime) -- ����֮��

		API_ActorSendMsg(ActorID, 2, "��ȴʱ���ѽ��...")

	elseif wthtranSelect == 6 then	
		for i = 18188,18205 do 
			API_VarDataSetNumber(ActorID,1,i,0)
		end
		API_ActorSendMsg(ActorID, 2, "���򴴽���¼�����...")
	-- �����Ǿ���ִ�д���			
	elseif wthtranSelect == 10 then
	

		local MapID = API_GetActorMapID(ActorID)
		local boci = API_RequestGetNumber(111)
		if boci == 0 or boci > 100 then
			API_ResponseWrite('<name> ���ظ�������</name>')
			API_ResponseWrite('<br><text>������Ϸ����ִ�����..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=1">����..</a><br>')	
		else
				
			local lunci = math.floor((boci-math.floor(boci/10)-1)/3) + 1
			API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.boci,boci)
			API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.lunci,lunci)
			if boci >= 50 then
				API_VarDataSetNumber(ActorID,1,18103,1)
				API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.Jixian,2)
				API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.lunciMax,30)
				API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.bociMax,100)
			end
			API_ActorSendMsg(ActorID, 2, "���Ѿ��ɹ������� "..boci.." ��")
		end

	elseif 	wthtranSelect == 50 then
		--����
		API_VarDataSetNumber(ActorID,1,18106,0)
		API_VarDataSetNumber(ActorID,1,18107,0)
		--����
		API_VarDataSetNumber(ActorID,1,18072,0)
		API_VarDataSetNumber(ActorID,1,18073,0)
		--����
		API_VarDataSetNumber(ActorID,1,18108,0)
		API_VarDataSetNumber(ActorID,1,18109,0)
		--ѵ��Ӫ
		API_VarDataSetNumber(ActorID,1,18132,0)
		API_VarDataSetNumber(ActorID,1,18133,0)
		--����
		API_VarDataSetNumber(ActorID,1,7514,0)
		API_VarDataSetNumber(ActorID,1,7515,0)
		--ǿ��֮·
		API_VarDataSetNumber(ActorID,1,18164,0)
		API_VarDataSetNumber(ActorID,1,18165,0)
		--�����ռ�
		API_VarDataSetNumber(ActorID,1,18413,0)
		API_ActorSendMsg(ActorID, 2, "���и�����������Ѿ�����")


	elseif wthtranSelect == 11 then
		
		local MapID = API_GetActorMapID(ActorID)
		local lunci = API_RequestGetNumber(111)
		if lunci == 0 or lunci > 100 then
			API_ResponseWrite('<name> ������������</name>')
			API_ResponseWrite('<br><text>������Ϸ����ִ�����..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=1">����..</a><br>')	
		else
				
			API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.lunci,lunci)
			API_ActorSendMsg(ActorID, 2, "���Ѿ��ɹ������� "..lunci.." ��")
		
		end
		
	end
			
		
end

function WGQ_Heroisland_SetZDFB()
	local ActorID = API_RequestGetActorID()	
	local Fblevel = API_RequestGetNumber(8)
	local Fbnum = API_RequestGetNumber(9)
 	if Fblevel > 6 or Fblevel < 0 then
		API_ActorSendMsg(ActorID, 2, "������0-6֮�����ֵ..")
	else
		if Fbnum < 0 or Fbnum > 9 then
			API_ActorSendMsg(ActorID, 2, "������0-9֮�����ֵ..")
		else
			API_VarDataSetNumber(ActorID,1,18031,Fblevel)
			API_VarDataSetNumber(ActorID,1,18032,Fbnum)
			API_ActorSendMsg(ActorID, 2, "��ĶԿ��������������óɹ�..")
		end
	end
end

function WGQ_Heroisland_clearall()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		--API_ResponseWrite('<text color="255,0,0">��ע�Ȿ����������㱳���ڳ���ʯ��������Ʒ��������</text><br>')
		API_ResponseWrite('<text>��ѡ����Ҫ����ķ�Χ</text><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_clearall?1=2">ȫ�����--Σ�գ�����</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_clearall?1=3">�����С������������ǰ�������ݱ�����</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')	
	elseif wthtranSelect == 2 then
		API_ActorClearPackage(ActorID)
		--API_AddActorGoods(ActorID, 90001, 1, "")
		API_ActorSendMsg(ActorID, 2, "�ų����أ�һ������")
	elseif wthtranSelect == 3 then
		-- add for test
		--[[
		local wth_bagHaveSize = API_ActorGetBagSize(ActorID, 0)
		local wth_onebagSize = API_ActorGetBagSize(ActorID, 1)
		local wth_allpackSize = API_ActorGetPackageSize(ActorID)
		API_ResponseWrite('<text>��ı����ռ���API_ActorGetBagSize'..wth_bagHaveSize..'</text><br>')
		API_ResponseWrite('<text>���1��С�����ռ���API_ActorGetBagSize'..wth_onebagSize..'</text><br>')
		API_ResponseWrite('<text>������������ռ���API_ActorGetPackageSize'..wth_allpackSize..'</text><br>') --]]--
		
		for i=1,4 do
			local wth_baghave = API_ActorIsHaveBag(ActorID, i)
			if wth_baghave then
				local wth_bagHaveSize = API_ActorGetBagSize(ActorID, i)
				for v=0, (wth_bagHaveSize-1) do
					local wth_bagGoodsID = API_ActorPackageGetLocGoodsID(ActorID, (i+2), v)
					if wth_bagGoodsID > 0 then
						local wth_bagGoodsNum = API_ActorPackageGetLocGoodsNum(ActorID, (i+2), v)
						--API_ActorRemoveGoods(ActorID, wth_bagGoodsID, wth_bagGoodsNum, "")
						API_ActorRemoveGoodsOfLoc(ActorID, wth_bagGoodsID, wth_bagGoodsNum, (i+2), v, "")
					end
				end
			end
		end  
		API_ActorSendMsg(ActorID, 2, "�ų����أ�һ������")
	end
end

local wth_wantExp
function WGQ_Heroisland_upgrade()
	local lActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	local wth_CurrLevel = API_GetActorExpLevel(lActorID)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> ��ѫ�ȼ�����</name>')
		API_ResponseWrite('<text>�������޸����ɫ�Ĺ�ѫ�ȼ�����Ҫ�Լ��ֶ������ɫ�����������ť��ֱ���������趨�ȼ���</text><br>')
		API_ResponseWrite('<text>Ŀǰ���ṩ��ɫ�������ܡ�</text><br>')
		API_ResponseWrite('<text> �㵱ǰ�Ĺ�ѫ�ȼ�Ϊ'..wth_CurrLevel..'</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>����������Ҫ�ľ�λ�ȼ���ֵ(1-85)</text><br>')
		API_ResponseWrite('<text>������ֵ:</text><input type="number" name="88" size="20">')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_upgrade?1=2">��������..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
	elseif wthtranSelect == 2 then
		wth_wantExp = API_RequestGetNumber(88)
		if wth_wantExp > 85 or wth_wantExp < 1 then
			API_ActorSendMsg(lActorID, 2, "������1-85֮�����ֵ..")
		else
			if wth_CurrLevel >= wth_wantExp then
				API_ActorSendMsg(lActorID, 2, "�ϴ��㵱ǰ�ĵȼ��Ѿ��߹�����Ҫ�ĵȼ��ˣ����ű��ݲ��ṩ��������")
			else
			--[[	if wth_wantExp >= 21 and wth_CurrLevel < 21 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80331, 2, '��ʯ���')
						API_AddActorGoods(lActorID, 80295, 3, '��ʯ���')
					else
						API_ActorSendMsg(lActorID, 1, "��ı����ռ䲻�㣬Ҫ�������߼��о������Ͼ�λ����ѫ�����������")
					end
				end   --]]--
				--[[if  wth_wantExp >= 26 and wth_CurrLevel < 26 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80335, 3, '��ʯ���')
						API_AddActorGoods(lActorID, 80297, 3, '��ʯ���')
					else
						API_ActorSendMsg(lActorID, 1, "��ı����ռ䲻�㣬Ҫ�������Ӿ������Ͼ�λ����ѫ�����������")
					end
				end
				if  wth_wantExp >= 36 and wth_CurrLevel < 36 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80339, 4, '��ʯ���')   -- �Ӿ���������ѫ��X4
						API_AddActorGoods(lActorID, 80304, 4, '��ʯ���')   --�Ӿ�ͭʮ��ʤ��ѫ��X4
					else
						API_ActorSendMsg(lActorID, 1, "��ı����ռ䲻�㣬Ҫ�������߼��Ӿ������Ͼ�λ����ѫ�����������")
					end
				end
				if  wth_wantExp >= 41 and wth_CurrLevel < 41 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80343, 5, '��ʯ���')   -- �߼��Ӿ���������ѫ��X5
						API_AddActorGoods(lActorID, 80304, 5, '��ʯ���')   --�Ӿ�ͭʮ��ʤ��ѫ��X5
					else
						API_ActorSendMsg(lActorID, 1, "��ı����ռ䲻�㣬Ҫ���������������Ͼ�λ����ѫ�����������")
					end
				end
				if  wth_wantExp >= 51 and wth_CurrLevel < 51 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80347, 6, '��ʯ���')   -- ������������ѫ��X6
						API_AddActorGoods(lActorID, 80312, 6, '��ʯ���')   --����ͭʮ��ʤ��ѫ��X5
					else
						API_ActorSendMsg(lActorID, 1, "��ı����ռ䲻�㣬Ҫ�������߼����������Ͼ�λ����ѫ�����������")
					end
				end]]
				API_CreateTimerTrigger(lActorID, 1, -1, -1, 'WGQ_Heroisland_updateact2')
			end
		end
	end
end

function WGQ_Heroisland_updateact2(lActorID, lTaskID)
	local wth_CurrLevel = API_GetActorExpLevel(lActorID)
	local wth_addexpTrigger = API_GetCurTriggerID()
		
	--if wth_CurrLevel == nil or wth_wantExp == nil then
	--	API_ActorSendMsg(lActorID, 2, "wth_CurrLevel �� wth_wantExp Ϊ nil")
	--else
		if wth_CurrLevel < wth_wantExp then
			local wth_NextExp = API_GetActorNextExp(lActorID)
			local wth_CurrExp = API_GetActorCurExp(lActorID)
			if wth_CurrExp < wth_NextExp then
				API_ActorAddExp(lActorID, wth_NextExp, 0, "��ʯ����")
			end
			API_ActorSendMsg(lActorID, 2, "�㵱ǰ�Ĺ�ѫ�Ѿ��������ˣ����ֶ����������ť����ǰ��ѫ�ȼ�Ϊ"..wth_CurrLevel)
		else
			API_DestroyTrigger(lActorID, -1, wth_addexpTrigger)
		end
		
	--end
end

function WGQ_Heroisland_equip()
	local ActorID = API_RequestGetActorID()	
	local wth_equipSelect = API_RequestGetNumber(1)
	if wth_equipSelect == 1 then
		local wth_addEquipID = API_RequestGetNumber(11)
		if wth_addEquipID > 10816 or wth_addEquipID < 10000 then
			API_ResponseWrite('<text>�������ʿ��װ��ID��������������..</text><br>')
			API_ResponseWrite('<br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=10">����</a><br>')
			--API_ActorSendMsg(ActorID, 2, "������10000-10638֮�����ֵ..")
		else
			local wth_emptyequip = API_ActorGetEmptyOfMorale(ActorID)
			if wth_emptyequip < 0 then
				API_ActorSendMsg(ActorID, 2, "ʿ��װ���������ˣ���ͱ�æ����")
			else
				API_ActorAddGoodsToMorale(ActorID, wth_addEquipID,"")
			end
		end
	elseif wth_equipSelect == 2 then
		local wth_emptyequip
		repeat
			wth_emptyequip = API_ActorGetEmptyOfMorale(ActorID)
			if wth_emptyequip >= 0 then
				API_ActorAddGoodsToMorale(ActorID, 10000,"")
			end
		until wth_emptyequip == nil or wth_emptyequip < 0
		for i=0,5 do
			API_ActorRemoveGoodsFromMorale(ActorID, i, "")
		end
		API_ActorSendMsg(ActorID, 2, "ʿ��װ���������")
			
	else
		API_ActorSendMsg(ActorID, 2, "ѡ������������")
	end
		
end

function wth_khbd()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then	
		API_ResponseWrite('<name>��������</name>')
		API_ResponseWrite('<br><br>')
		--API_ResponseWrite('<text>����:����Ӷ��������..</text><br>')
		--API_ResponseWrite('<a href="wth_khbd?1=2">��ȡ��Ϣ</a><br><br>')
	--	API_ResponseWrite('<a href="wth_khbd?1=6">ѧ������Ӣ��</a><br><br>')
		API_ResponseWrite('<a href="wth_khbd?1=3">��а����</a><br><br>')
		API_ResponseWrite('<a href="wth_khbd?1=5">���سɴ�</a><br><br>')
	--	API_ResponseWrite('<a href="wth_khbd?1=4">��������</a><br><br>')
		API_ResponseWrite('<a href="wth_temp_monster?1=1">���Թ���ͼ��</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
		API_ResponseFlush(ActorID) 
			
	elseif wthtranSelect == 2 then
		API_ActorStartSelect(ActorID,'wth_GetInfo',16) 
	elseif wthtranSelect == 3 then
		API_ActorStartSelect(ActorID,'wth_GodMode',16) 
	elseif wthtranSelect == 4 then	
		API_ActorSetNovice(ActorID, 1)
		API_ActorSetNovice(ActorID, 2)
		API_ActorSetNovice(ActorID, 3)
		API_ActorSetNovice(ActorID, 4)
		API_ActorSetNovice(ActorID, 5)
		API_ActorSetNovice(ActorID, 6)
		API_ActorSendMsg(ActorID, 2, "��ϲ��,��Խ�����־���...")
	elseif wthtranSelect == 5 then
		API_ActorStartSelect(ActorID,'wth_Sdcc',16) 
	elseif wthtranSelect == 6 then
		for i=1,18 do
			if not API_ActorIsLearnHero(ActorID, i) then
				API_ActorLearnHero(ActorID, i)
			end
		end
		API_ActorSendMsg(ActorID, 2, "��ϲ���Ѿ��񹦴�ɣ���ȥά�������ƽ��")

	end

end

function wth_GetInfo() 
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local shanchu = API_RequestGetNumber(6) 
	local Type = {[0]='����',[1]='����',[2]='���',}
	local TypeName = Type[SelectType] 
	if shanchu == 1 then
		API_ActorSendMsg(ActorID,1,''..API_GetMonsterName(SelectID)..'���Ѿ�ɾ��')
		API_ActorBroadcastMsg(-1,17,"����"..API_GetActorName(ActorID).."���÷Ƿ�;���ɵ���"..API_GetMonsterName(SelectID)..'')
		API_TraceError(API_GetActorName(ActorID).."���÷Ƿ�;���ɵ���"..API_GetMonsterName(SelectID))
		API_DestroyMonster(SelectID)
		return
	end
	API_ResponseWrite('<text>���Ŀ������Ϊ��'..TypeName..'</text><br>')
	if SelectType == 0 then
		API_ResponseWrite('<text>Ŀ�궯̬��ͼIDΪ��'..SelectID..';����̬��ͼIDΪ��'..API_GetStaticMapID(SelectID)..'����ͼ����IDΪ��'..API_GetMapConfigID(SelectID)..'</text><br>')
	elseif SelectType == 1 then
		local wth_wlatt = API_MonsterGetPropNum(SelectID,23)   --+API_MonsterGetPropNum(SelectID,47)) * (1+API_MonsterGetPropNum(SelectID,78))
		local wth_hyatt = API_MonsterGetPropNum(SelectID,24)   --+API_MonsterGetPropNum(SelectID,48)) * (1+API_MonsterGetPropNum(SelectID,79))
		local wth_mfatt = API_MonsterGetPropNum(SelectID,25)   --+API_MonsterGetPropNum(SelectID,49)) * (1+API_MonsterGetPropNum(SelectID,80))
		API_ResponseWrite('<text>Ŀ��FastIDΪ��'..SelectID..';MosterIDΪ��'..API_GetMonsterID(SelectID)..'</text><br>')
		API_ResponseWrite('<text>Ŀ��������Ϊ�� '..wth_wlatt..';  ��ҩ����Ϊ�� '..wth_hyatt..';  ħ������Ϊ��  '..wth_mfatt..'  </text><br>')
		--API_ResponseWrite('<a href="wth_GetInfo?1='..ActorID..'&3='..SelectID..'&6=1">�����ٻ�</a><br>')
	elseif SelectType == 2 then
		API_ResponseWrite('<text>Ŀ���ɫIDΪ'..SelectID..'</text><br>')
		API_ResponseWrite('<text>��� '..API_GetActorName(SelectID)..' ֮��ĺøж�Ϊ '..API_GetRelation(ActorID, SelectID, 2)..'</text><br><br>')
	end
	API_ResponseWrite('<text>Ŀ��λ��Ϊ'..SelectTileX..'��'..SelectTileY..'</text><br><br>')
	API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
	API_ResponseFlush(ActorID) 
	
	--[[
	API_ActorSendMsg(ActorID, 3, '���Ŀ������Ϊ��'..TypeName..'') 
	if SelectType == 0 then
		API_ActorSendMsg(ActorID, 3, 'Ŀ�궯̬��ͼIDΪ��'..SelectID..'����̬��ͼIDΪ��'..API_GetStaticMapID(SelectID)..'����ͼ����IDΪ��'..API_GetMapConfigID(SelectID)..'') 
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID, 3, 'Ŀ��FastIDΪ��'..SelectID..';MosterIDΪ��'..API_GetMonsterID(SelectID)..'') 
	elseif SelectType == 2 then
		API_ActorSendMsg(ActorID, 3, 'Ŀ���ɫIDΪ��'..SelectID..'') 
	end
	API_ActorSendMsg(ActorID, 3, 'Ŀ��λ��Ϊ'..SelectTileX..'��'..SelectTileY..'')  --]]--
end 


function wth_GodMode()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local wth_ActName = API_GetActorName(ActorID)
	
	--local Type = {[0]='����',[1]='����',[2]='���',}
	--local TypeName = Type[SelectType] 
	if SelectType == 1 then     --����  -- seleceID����1-20��
	
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=1">����</a>')  --����
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=2">����</a>')  --�����ָ�
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=3">��ӡ</a>')  -- ��ֹ����\�ƶ�\�չ�
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=4">ѣ��</a><br>')  --ѣ��

	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=5">����</a>')  --����
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=6">����</a>')  --��ɱ
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=8">����</a>')  --�۳�HP����10
		API_ResponseWrite('<text>     </text>')  
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=7">����</a><br><br>')  --ȥ������
		API_ResponseWrite('<text>     </text>')  
		
		--if wth_ActName == wth_SomeName then
			API_ResponseWrite('<text>����������Ҫ��ӵ�״̬ID:</text><br>')
			API_ResponseWrite('<text>������ֵ:</text><input type="number" name="96" size="10"><br>')
			API_ResponseWrite('<text>����������Ҫ������״̬ID:</text><br>')
			API_ResponseWrite('<text>������ֵ:</text><input type="number" name="97" size="10"><br>')
			API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=10">��������</a><br><br>')  --�Զ���
	--	end	
		
		API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
		API_ResponseFlush(ActorID) 

	elseif SelectType == 2 then  --���
		local wth_ObjectName = API_GetActorName(SelectID)


		API_ResponseWrite('<text>'..wth_ObjectName..'�ڴ�,�����:</text><br><br>')
			
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=21">��</a>')  --����\��Ѫ\����\����\
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=22">ħ��</a>')  --
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=23">����</a>')  --�¶�
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=24">����</a>')
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=25">����</a>')
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=31">��ɱ</a>')
		if API_GetRelation(ActorID, SelectID, 1) ~= 5 and API_GetActorSex(ActorID) ~= API_GetActorSex(SelectID) and API_GetActorCamp(ActorID) == API_GetActorCamp(SelectID) and API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(SelectID,0,8) == -1 then
			API_ResponseWrite('<text>     </text>')
	  		API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=26">��������</a><br><br>')
		elseif API_GetRelation(ActorID, SelectID, 1) == 5 then
			API_ResponseWrite('<text>     </text>')
	  		API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=27">���</a><br><br>')
		elseif ActorID == SelectID and API_GetRelation(ActorID,0,8) ~= -1 then
			local PeiouID = API_VarDataGetNumber(ActorID, 1, 19001)
			API_ResponseWrite('<text>     </text>')
	  		API_ResponseWrite('<a href="wth_Gmact?1='..PeiouID..'&2=27">���</a><br><br>')
		else
			API_ResponseWrite('<br><br>')
		end
		
	--	if wth_ActName == wth_SomeName then
			API_ResponseWrite('<text>����������Ҫ��ӵ�״̬ID:</text><br>')
			API_ResponseWrite('<text>������ֵ:</text><input type="number" name="96" size="10"><br>')
			API_ResponseWrite('<text>����������Ҫ������״̬ID:</text><br>')
			API_ResponseWrite('<text>������ֵ:</text><input type="number" name="97" size="10"><br>')
			API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=30">��������</a><br><br>')  --�Զ���
	--	end	

		API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
		API_ResponseFlush(ActorID) 
	end

end

function wth_Gmact()
	local ActorID = API_RequestGetActorID()
	local wth_GmSelect = API_RequestGetNumber(2) 
	local wth_ObjectID = API_RequestGetNumber(1) 

		
	if wth_GmSelect == 1 then
		API_MonsterAddStatus(wth_ObjectID, 38001, 99999999)  --�����ٶ�
		
	elseif wth_GmSelect == 2 then
		API_MonsterAddHP(wth_ObjectID, 999999)
		API_MonsterAddStatus(wth_ObjectID, 282020, 99999999)  --����ͼ��
		API_SetMonsterName(wth_ObjectID, '�������', 2)
	
	elseif wth_GmSelect == 3 then
		API_MonsterAddStatus(wth_ObjectID, 304020, 99999999)  --Ю��
	
	elseif wth_GmSelect == 4 then
	--	API_MonsterAddStatus(wth_ObjectID, 331020, 99999999)  --�ж�
		API_MonsterAddStatus(wth_ObjectID, 389020, 99999999)  --�����ѣ��
	
	elseif wth_GmSelect == 5 then
		API_MonsterAddStatus(wth_ObjectID, 303020, 99999999)  --����
	
	elseif wth_GmSelect == 6 then
		API_MonsterAddStatus(wth_ObjectID, 284001, 99999999)  --��ɱ
		
	elseif wth_GmSelect == 7 then
		API_MonsterRemoveStatus(wth_ObjectID, 38001)
		API_MonsterRemoveStatus(wth_ObjectID, 282020)
		API_MonsterRemoveStatus(wth_ObjectID, 304020)
		API_MonsterRemoveStatus(wth_ObjectID, 389020)
		API_MonsterRemoveStatus(wth_ObjectID, 303020)
	elseif wth_GmSelect == 8 then
		local wth_Ndist = wth_Public_juli(ActorID, wth_ObjectID)
		if wth_Ndist < 0 then
			return
		elseif wth_Ndist > 8 then
			API_ActorGoToMap(ActorID, API_GetActorMapID(ActorID), API_GetMonsterPosX(wth_ObjectID), API_GetMonsterPosY(wth_ObjectID))
		end
		--API_ActorSendMsg(ActorID, 1, '��ǰ��������Ϊ'..wth_Ndist)
		API_ActorAddMP(ActorID,999999)  -- ����������MP�����޷����ü���
		API_MonsterRemoveStatus(wth_ObjectID, 206001)  --- ȥ����������״̬
		--API_ActorUseSkill(ActorID, 49, 1, 0, 0, 0, wth_ObjectID)   --- �ȵ�����ʸ���ܹ���һ��Ŀ�꣬����һЩ���Ա�AI�Ĺ��ڼ�Ѫ����ɱ����������
		API_MonsterAddHP(wth_ObjectID, (10 - API_MonsterGetPropNum(wth_ObjectID,2)))  --��Ϊֻʣ10Ѫ


	--����Ϊ�����
	
	
	elseif wth_GmSelect == 21 then    --��
		API_ActorAddStatus(wth_ObjectID,38001,999999999999) --�����ٶ�,����ͬʱ���߶���\����
		API_ActorAddStatus(wth_ObjectID,312020,999999999999) --������̬
		API_ActorAddStatus(wth_ObjectID,321020,999999999999) --��Ȼ֮��
		API_ActorAddStatus(wth_ObjectID,33008,999999999999) --��ƽ����MP
		API_ActorAddStatus(wth_ObjectID,205001,999999999999) --���������˺�
		API_ActorAddStatus(wth_ObjectID,204001,999999999999) --��������״̬����
		API_ActorAddStatus(wth_ObjectID,316020,999999999999) --��ҫ
		API_ActorAddStatus(wth_ObjectID,33008,999999999999) --��ƽ����MP

		--API_ActorAddStatus(wth_ObjectID,299020,999999999999) --Ǳ��
			
	
	elseif wth_GmSelect == 22 then  --ħ��
		--API_ActorAddStatus(wth_ObjectID,280020,999999999999) --���з籩
		API_ActorAddStatus(wth_ObjectID,33008,999999999999) --��ƽ����MP
		API_ActorAddStatus(wth_ObjectID,319020,999999999999) --��ѹ�⻷
		API_ActorAddStatus(wth_ObjectID,301020,999999999999) --����
		API_ActorAddStatus(wth_ObjectID,306020,999999999999) --��ħ����--�Զ�����ΧĿ������˺�
		API_ActorAddStatus(wth_ObjectID,285020,999999999999) --��
		API_ActorAddStatus(wth_ObjectID,323020,999999999999) --����⻷
		API_ActorAddStatus(wth_ObjectID,38001,999999999999) --�����ٶ�,����ͬʱ���߶���\����
		API_ActorAddStatus(wth_ObjectID,289020,999999999999) --�����ٶ�
	
	
	
	elseif wth_GmSelect == 23 then
		local wth_ObjectName = API_GetActorName(wth_ObjectID)
		local wth_ActName = API_GetActorName(ActorID)
		if wth_ObjectName == wth_SomeName then
			if ActorID ~= wth_ObjectID then
				API_ActorSendMsg(wth_ObjectID, 3, '���'..wth_ActName..'��ͼ���㲻��,����ʳ���..')
			end
			wth_ObjectID = ActorID
		end
		
		API_ActorAddStatus(wth_ObjectID,331020,999999999999) --�ж�
		API_ActorAddStatus(wth_ObjectID,298020,999999999999) --��Ļ
	
	
	elseif wth_GmSelect == 24 then
		local wth_ObjectName = API_GetActorName(wth_ObjectID)
		local wth_ActName = API_GetActorName(ActorID)
		if wth_ObjectName == wth_SomeName then
			if ActorID ~= wth_ObjectID then
				API_ActorSendMsg(wth_ObjectID, 3, '���'..wth_ActName..'��ͼ���㲻��,����ʳ���..')
			end
			wth_ObjectID = ActorID
		end
		API_ActorRemoveStatus(wth_ObjectID,38001) --�����ٶ�,����ͬʱ���߶���\����
		API_ActorRemoveStatus(wth_ObjectID,285020) --��
		API_ActorRemoveStatus(wth_ObjectID,301020) --����
		API_ActorRemoveStatus(wth_ObjectID,321020) --��Ȼ֮��
		API_ActorRemoveStatus(wth_ObjectID,282020) --����ͼ�ڷ�Χ��Ѫ
		API_ActorRemoveStatus(wth_ObjectID,289020) --�����ٶ�
		API_ActorRemoveStatus(wth_ObjectID,33008) --��ƽ����MP
		API_ActorRemoveStatus(wth_ObjectID,280020) --���з籩
		API_ActorRemoveStatus(wth_ObjectID,299020) --Ǳ��
		API_ActorRemoveStatus(wth_ObjectID,319020) --��ѹ�⻷
		API_ActorRemoveStatus(wth_ObjectID,312020) --������̬
		API_ActorRemoveStatus(wth_ObjectID,306020) --��ħ����
		API_ActorRemoveStatus(wth_ObjectID,331020) --�ж�
		API_ActorRemoveStatus(wth_ObjectID,298020) --��Ļ
		API_ActorRemoveStatus(wth_ObjectID,205001) --��Ļ
		API_ActorRemoveStatus(wth_ObjectID,204001) --��Ļ
		
		API_ActorAddStatus(wth_ObjectID, 303020, 99999999)  --����
	
	elseif wth_GmSelect == 25 then
		API_ActorRemoveStatus(wth_ObjectID,38001) --�����ٶ�,����ͬʱ���߶���\����
		API_ActorRemoveStatus(wth_ObjectID,285020) --��
		API_ActorRemoveStatus(wth_ObjectID,301020) --����
		API_ActorRemoveStatus(wth_ObjectID,321020) --��Ȼ֮��
		API_ActorRemoveStatus(wth_ObjectID,282020) --����ͼ�ڷ�Χ��Ѫ
		API_ActorRemoveStatus(wth_ObjectID,289020) --�����ٶ�
		API_ActorRemoveStatus(wth_ObjectID,33008) --��ƽ����MP
		API_ActorRemoveStatus(wth_ObjectID,280020) --���з籩
		API_ActorRemoveStatus(wth_ObjectID,299020) --Ǳ��
		API_ActorRemoveStatus(wth_ObjectID,319020) --��ѹ�⻷
		API_ActorRemoveStatus(wth_ObjectID,312020) --������̬
		API_ActorRemoveStatus(wth_ObjectID,306020) --��ħ����
		API_ActorRemoveStatus(wth_ObjectID,331020) --�ж�
		API_ActorRemoveStatus(wth_ObjectID,298020) --��Ļ
		API_ActorRemoveStatus(wth_ObjectID,303020) --����
		API_ActorRemoveStatus(wth_ObjectID,205001) --�޵�
		API_ActorRemoveStatus(wth_ObjectID,204001) --���ܿ�
		API_ActorRemoveStatus(wth_ObjectID,323020) --����⻷
		API_ActorRemoveStatus(wth_ObjectID,316020) --��ҫ

	elseif wth_GmSelect == 26 then
		local wth_Relationtype = API_GetRelation(ActorID, wth_ObjectID, 1)
		local wth_RelationHGD = API_GetRelation(ActorID, wth_ObjectID, 2)
		local hlgoods = {827,830,831,832}
		if wth_Relationtype == -1 then
			API_AddRelation(ActorID, wth_ObjectID, 0, 0, 1)
			API_UpdateRelation(ActorID, wth_ObjectID, 2, 2000)
		elseif wth_Relationtype == 0 then
			API_UpdateRelation(ActorID, wth_ObjectID, 2, 2000)
		else
			API_DelRelation(ActorID, wth_ObjectID)
			API_AddRelation(ActorID, wth_ObjectID, 0, 0, 0)
			API_UpdateRelation(ActorID, wth_ObjectID, 2, 2000)

		end
		API_AddRelation(ActorID, wth_ObjectID, 5, 1, 2000)
		API_VarDataSetNumber(ActorID, 1, 19001, wth_ObjectID)
		API_VarDataSetNumber(wth_ObjectID, 1, 19001, ActorID)
		for i=19008,19011 do
			API_VarDataSetNumber(ActorID, 1, i, 10)
			API_VarDataSetNumber(wth_ObjectID, 1, i, 10)
		end
		for k in ipairs(hlgoods) do
			if API_ActorCanAddGoods(ActorID, hlgoods[k], 500, 0, 0) > -1 then
				API_AddActorGoods(ActorID, hlgoods[k], 500, '��������')
			end
			if API_ActorCanAddGoods(wth_ObjectID, hlgoods[k], 500, 0, 0) > -1 then
				API_AddActorGoods(wth_ObjectID, hlgoods[k], 500, '��������')
			end
		end

	elseif wth_GmSelect == 27 then
		API_DelRelation(ActorID, wth_ObjectID)
		for i=19001,19013 do
			API_VarDataSetNumber(ActorID, 1, i, 0)
			API_VarDataSetNumber(wth_ObjectID, 1, i, 0)
		end
		local sex = API_GetActorSex(ActorID)
		if sex == 1 then
			API_ActorBroadcastMsg(-1, 17, '�������Ե� '..API_GetActorName(ActorID)..' �������ӣ���Ѱ�»���ȥ��')
			API_SetActorNameEffect(ActorID, 1, 0, 0, 0, 600, '�������Ե�')
			API_SetActorNameEffect(ActorID, 2, 255, 100, 200, 600, '�������Ե�')
		else
			API_ActorBroadcastMsg(-1, 17, '�����į�� '..API_GetActorName(ActorID)..' ���ӳ�ǽ����Ѱ�»���ȥ��')
			API_SetActorNameEffect(ActorID, 1, 0, 0, 0, 600, '�����į��')
			API_SetActorNameEffect(ActorID, 2, 255, 100, 200, 600, '�����į��')
		end

	elseif wth_GmSelect == 31 then  --- ����������������Ч�� ����ʹ��
		local wth_ActName = API_GetActorName(ActorID)
		local wth_ObjectName = API_GetActorName(wth_ObjectID)


		--API_ActorAddStatus(wth_ObjectID,284001,99)
		--API_ActorSendMsg(wth_ObjectID,3,'���Ų��Բ����к��³���')
		--API_ActorSendMsg(ActorID, 3, '���'..wth_ObjectName..'�Ѿ���ko..')
		--API_ActorSendMsg(wth_ObjectID, 3, '........')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<text>�����������Ȩ����:</text><input type="number" name="10" size="10"><br>')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<a href="wth_Gmact?1='..wth_ObjectID..'&2=32">����</a><br>')
		--API_ResponseWrite('<a href="wth_Gmact?1='..wth_ObjectID..'&2=32>����Ҫ�ɵ�'..wth_ActName..'</a><br> ')


	elseif wth_GmSelect == 32 then  --- ����������������Ч�� ����ʹ��
		local wth_ObjectName = API_GetActorName(wth_ObjectID)
		local wth_ActName = API_GetActorName(ActorID)
		local putinpwd = API_RequestGetNumber(10)
		if putinpwd == 250 then 
			API_ActorSendMsg(wth_ObjectID,3,'���Ų��Բ����к��³���')
			API_ActorAddStatus(wth_ObjectID,284001,99)
			API_ActorSendMsg(ActorID, 3, '���'..wth_ObjectName..'�Ѿ���ko..')
		else 
			API_ActorAddStatus(ActorID,284001,99)
			API_ActorSendMsg(ActorID, 3, '��������Ա���������')
		end		

				
	elseif wth_GmSelect == 10 then
		local wth_Zidingyi_addStatus = API_RequestGetNumber(96) 
		local wth_Zidingyi_removeStatus = API_RequestGetNumber(97) 
		if wth_Zidingyi_addStatus ~= 0 or wth_Zidingyi_addStatus ~= nil then
			API_MonsterAddStatus(wth_ObjectID, wth_Zidingyi_addStatus, 99999999) 
		end
		if wth_Zidingyi_removeStatus ~= 0 or wth_Zidingyi_removeStatus ~= nil then
			API_MonsterRemoveStatus(wth_ObjectID, wth_Zidingyi_removeStatus)
		end
	
	elseif wth_GmSelect == 30 then
		local wth_Zidingyi_addStatus = API_RequestGetNumber(96) 
		local wth_Zidingyi_removeStatus = API_RequestGetNumber(97) 
		if wth_Zidingyi_addStatus ~= 0 or wth_Zidingyi_addStatus ~= nil then
			API_ActorAddStatus(wth_ObjectID, wth_Zidingyi_addStatus, 99999999) 
		end
			
		if wth_Zidingyi_removeStatus ~= 0 or wth_Zidingyi_removeStatus ~= nil then
			API_ActorRemoveStatus(wth_ObjectID, wth_Zidingyi_removeStatus)
		end				
	
	end
	
end

function wth_Sdcc() 
	local ActorID = API_RequestGetActorID()
	local ActorMapID = API_GetActorMapID(ActorID)
	
	local disActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 

	
	API_ActorGoToMap(ActorID, ActorMapID, SelectTileX, SelectTileY)
	API_ActorStartSelect(ActorID,'wth_Sdcc',16) 
end 

function WGQ_Heroisland_code()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	API_ResponseWrite('<name> ִ�д���</name>')
	if wthtranSelect == 1 then
		API_ResponseWrite('<text>��������ִ�еĴ��봮(���ܺ���&��)</text><br>')
		API_ResponseWrite('<input type="string" name="3" size="9999999" width="280"><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=2">ִ��</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland">����</a><br>')
		
	elseif wthtranSelect == 2 then
		local Code = API_RequestGetString(3)
		local wth_codelen = string.len(Code)
		if  type(Code) == 'string' and wth_codelen > 11 then	
			API_TraceError(''..API_GetActorName(ActorID)..'�ո�ִ���˴��롫')
			--Code = string.gsub(Code, "ActorID", ActorID)  --- �Զ��滻ActorID
			--API_TraceError(''..API_GetActorName(ActorID)..'�ո�ִ��de����='..Code..',�䳤��Ϊ'..wth_codelen..'')
			assert(loadstring(Code))()
		else
			API_ResponseWrite('<text>��������ȷ�Ĵ��봮</text><br>')
			API_ResponseWrite('<br><a href="WGQ_Heroisland">����</a><br>')
		end

	elseif wthtranSelect == 3 then   -- ���ӡ�����˵�����ݣ������ӡһЩ��ɫ��ص���Ϣ
		API_ResponseWrite('<text>���������ӡ��API��Ϣ(���ܺ���&��)</text><br>')
		API_ResponseWrite('<input type="string" name="4" size="9999999" width="280"><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=4">��ʾ</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland">����</a><br>')

	elseif wthtranSelect == 4 then
		local Code = API_RequestGetString(4)
		local wth_codelen = string.len(Code)
		if  type(Code) == 'string' and wth_codelen > 11 then	
			--API_TraceError(''..API_GetActorName(ActorID)..'�ո�ִ���˴��롫')
			Code = string.gsub(Code, "ActorID", ActorID)
			local k = string.find(Code,"API")
			--local m �� string.find(Code,"os\.")
			--local i,j = string.find(Code,"ActorID")
			if k ~= 1 then
				Code='API_ActorSendMsg('..ActorID..', 1, '..'"'..Code..'"'..')'
			else

				Code='API_ActorSendMsg('..ActorID..', 1, '..Code..')'
			end
			assert(loadstring(Code))()
		else
			API_ResponseWrite('<text>��������ȷ�Ĵ��봮</text><br>')
			API_ResponseWrite('<br><a href="WGQ_Heroisland">����</a><br>')
		end

	end
end

function WGQ_Heroisland_runfun()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	API_ResponseWrite('<name> ִ�к���</name>')
	if wthtranSelect == 1 then
		API_ResponseWrite('<text>��������ִ�еĺ�����</text><br>')
		API_ResponseWrite('<input type="string" name="3" size="9999999" width="280"><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_runfun?1=2">ִ��</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland">����</a><br>')
		
	elseif wthtranSelect == 2 then
		local String = API_RequestGetString(3)
		local wth_codelen = string.len(String)
		if  type(String) == 'string' and wth_codelen > 6 then	
			local Function = _G[String]
			if type(Function) == 'function' then
				API_TraceError(''..API_GetActorName(ActorID)..'�ո�ִ���˺�����������Ϊ'..String..'')
				Function()
			else
				API_ResponseWrite('<text>�Ҳ�����Ӧ�ĺ��� '..String..' </text><br>')
				API_ResponseWrite('<br><a href="WGQ_Heroisland">����</a><br>')
			end
		else
			API_ResponseWrite('<text>��������ȷ�ĺ�����</text><br>')
			API_ResponseWrite('<br><a href="WGQ_Heroisland">����</a><br>')
		end
	end
end

function wth_ChangeTime()
	local ActorID = API_RequestGetActorID()
	local wth_PlayerName = API_GetActorName(ActorID)
	local wthtranSelect = API_RequestGetNumber(1)
	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
	local wth_ChangTimePW = 748
	if wthtranSelect == 1 or  wthtranSelect == 0 then
		API_ResponseWrite('<name> �޸�ʱ��</name>')
		API_ResponseWrite('<text>��������ǰʱ��:</text><br>')
		API_ResponseWrite('<text>'..Year..'��'..Month..'��'..Day..'��'..Hour..'��'..Minute..'��'..Second..'��..</text><br>')
		API_ResponseWrite('<text>����������Ҫ�޸ĵ�ʱ��(���������������ȡ��ǰ��ֵ[������],����������д,��д��Ϊ�޸�Ϊ0):</text><br>')
		API_ResponseWrite('<text> 20</text><input type="number" name="11" size="2"><text>��</text><input type="number" name="12" size="2"><text>��</text><input type="number" name="13" size="2"><text>��</text><br>')
		API_ResponseWrite('<text>   </text><input type="number" name="14" size="2"><text>��</text><input type="number" name="15" size="2"><text>��</text><input type="number" name="16" size="2"><text>��</text><br>')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<text>�����������Ȩ����:</text><input type="number" name="17" size="10"><br>')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<a href="wth_ChangeTime?1=2">�������޸���</a><br><br>')
		API_ResponseWrite('<a href="wth_ChangeTime?1=3">����ʵʱ��ͬ��</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
	elseif wthtranSelect == 2 then	
		local wth_Year = API_RequestGetNumber(11)
		local wth_Month = API_RequestGetNumber(12)
		local wth_Day = API_RequestGetNumber(13)
		local wth_Hour = API_RequestGetNumber(14)
		local wth_Minute = API_RequestGetNumber(15)
		local wth_Second = API_RequestGetNumber(16)
		local wth_PWD = API_RequestGetNumber(17)
		
		if wth_PWD == wth_ChangTimePW then
		
			wth_Year = wth_Year + 2000
			if wth_Year < Year - 2 or wth_Year > Year + 2 then
				--API_ActorSendMsg(ActorID, 2, "������������,���ֻ�������� "..Year.." �ġ�2���ڵ�����")
				wth_Year = Year
			end
			if wth_Month > 12 then
				wth_Month = 12
			elseif wth_Month == 0 then
				wth_Month = Month
			end
			local rnian = 1
			if (math.mod(wth_Year, 4) == 0 and math.mod(wth_Year, 100) ~= 0) or math.mod(wth_Year, 400) == 0 then
				rnian = 0
			end
			local syue = math.mod(wth_Month, 2)
			if wth_Month < 8 then  -- �ϰ���
				if syue == 0 then
					if wth_Day == 0 then  --- �������if�ж�,ǰ��˳�򲻿ɱ�
						wth_Day = Day
					end			
					if wth_Day > 30 then
						wth_Day = 30
					end				
					if wth_Month == 2 and rnian == 0 and wth_Day > 29 then
						wth_Day = 29
					elseif wth_Month == 2 and rnian ~= 0 and wth_Day > 28 then
						wth_Day = 28
					end				
				else
					if wth_Day > 31 then
						wth_Day = 31
					elseif wth_Day == 0 then
						wth_Day = Day
					end
				end
			else
				if syue == 0 then
					if wth_Day > 31 then
						wth_Day = 31
					elseif wth_Day == 0 then
						wth_Day = Day
					end
				else
					if wth_Day > 30 then
						wth_Day = 30
					elseif wth_Day == 0 then
						wth_Day = Day
					end
				end
			end
			
			if wth_Hour > 23 then
				wth_Hour = 23
			end
			if wth_Minute > 59 then
				wth_Minute = 59
			end
			if wth_Second > 59 then
				wth_Second = 59
			end
			os.execute("d:\\ourpack\\changetime.bat "..wth_Year.."-"..wth_Month.."-"..wth_Day.." "..wth_Hour..":"..wth_Minute..":"..wth_Second.." "..wth_PlayerName)
			API_ActorSendMsg(ActorID, 2, "������ʱ���ѳɹ��޸� ")
			API_TraceError(''..wth_PlayerName..'�޸��˷�����ʱ��')
			API_ActorBroadcastMsg(-1, 17, ""..wth_PlayerName.."��������ʱ���Ϊ"..wth_Year.."-"..wth_Month.."-"..wth_Day.." "..wth_Hour..":"..wth_Minute..":"..wth_Second.." ")
		
		else
			API_ResponseWrite('<name> �޸�ʱ��</name>')
			API_ResponseWrite('<text>��Ȩ�����������</text><br>')
			API_ResponseWrite('<text>������ʱ��Ӱ���ڶ�,��Ǳ�Ҫ,���������޸�.</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
		end
		
	elseif wthtranSelect == 3 then	
		local wth_PWD = API_RequestGetNumber(17)
		if wth_PWD == wth_ChangTimePW then
			os.execute("d:\\ourpack\\changetime.bat ".."nowtime "..wth_PlayerName)
			API_ActorSendMsg(ActorID, 2, "������ʱ���ѳɹ��޸� ")
			API_TraceError(''..wth_PlayerName..'��������ʱ��ͬ��Ϊ��ʵʱ��')
			API_ActorBroadcastMsgEx(-1, -1, 0, 17, ""..wth_PlayerName.."��������ʱ��ͬ��Ϊ��ʵʱ��")
		else
			API_ResponseWrite('<name> �޸�ʱ��</name>')
			API_ResponseWrite('<text>��Ȩ�����������</text><br>')
			API_ResponseWrite('<text>������ʱ��Ӱ���ڶ�,��Ǳ�Ҫ,���������޸�.</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
		end			
		
	end
end

function wth_Public_juli(ActorID, SelectID)
	if API_GetActorMapID(ActorID) ~= API_GetMonsterMap(SelectID) then
		return -1
	end
	local wth_BianA = API_GetActorPosX(ActorID) - API_GetMonsterPosX(SelectID)
	local wth_BianB = API_GetActorPosY(ActorID) - API_GetMonsterPosY(SelectID)
	return math.ceil(math.sqrt( wth_BianA ^2 + wth_BianB ^2 ))
end


function wth_OnlineList()
	
	local ActorID = API_RequestGetActorID()

	API_ResponseWrite('<name> ���߲�ѯ </name>')
	API_ResponseWrite('<text>'..nServerID..'�ŵ���������б�:</text><br><br>')

	local wth_PlayerListLine = 0
	local wth_zenyin = {[0]="�۹�",[1]="����",}

	for wth_ActorID in pairs(wth_OLActorIDTab) do
		local wth_OlplayerName = API_GetActorName(wth_ActorID)
		if string.len(wth_OlplayerName) < 16 then
			for k = 1,16 - string.len(wth_OlplayerName) do
				wth_OlplayerName = wth_OlplayerName..' '
			end
		end

		local wth_playerDesc = "ID: "..wth_ActorID.."   �ȼ�: "..API_GetActorExpLevel(wth_ActorID).."    ��Ӫ: "..wth_zenyin[API_GetActorCamp(wth_ActorID)].."\n���ڵ�ͼ: "..API_GetMapName(API_GetActorMapID(wth_ActorID)).."    ��ͼID: "..API_GetActorMapID(wth_ActorID).."\n��λ:  "..wth_getActorLevel(wth_ActorID)
		API_ResponseWrite('<a href="wth_TakeThisOne?1=1&2='..wth_ActorID..'" tip="'..wth_playerDesc..'">'..wth_OlplayerName..'</a>')
		API_ResponseWrite('<text>����</text>')
		wth_PlayerListLine = wth_PlayerListLine + 1
		if math.mod(wth_PlayerListLine, 5) == 0 then
			API_ResponseWrite('<br>')
		end
	end

	API_ResponseWrite('<br><br>')
	if not API_IsEctypeServer() then
		API_ResponseWrite('<br><a href="WGQ_Heroisland_GotoMap?1=7">����������</a><br><br>')
	end
	API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
end 

function wth_TakeThisOne()
	local wthtranSelect = API_RequestGetNumber(1)
	local wth_ActorID = API_RequestGetNumber(2)
	local ActorID = API_RequestGetActorID()
	
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> ���߲�ѯ </name>')
		API_ResponseWrite('<text>'..API_GetActorName(wth_ActorID)..'�ڴ�,�����:</text><br><br>')
		API_ResponseWrite('<a href="wth_TakeThisOne?1=2&2='..wth_ActorID..'&3=1">�ɹ�ȥ</a>') 
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="wth_TakeThisOne?1=2&2='..wth_ActorID..'&3=2">ץ����</a>') 
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
		if not API_IsEctypeServer() then
			API_ResponseWrite('<br><a href="WGQ_Heroisland_GotoMap?1=7">����������</a><br>')
		end

	elseif wthtranSelect == 2 then
		local wth_ActMode = API_RequestGetNumber(3)
		if wth_ActMode == 1 then
			local wth_ObjectName = API_GetActorName(wth_ActorID)
			--local sky1, sky2 = string.find(string.upper(wth_ObjectName),skyfix,1)
			--if sky1 == 1 and sky2 == string.len(skyfix) then
			--	API_ResponseWrite('<br><text>������Ż��ҡ�лл������</text><br><br>')
			--	API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
			--else
				--API_ActorGoToMap(ActorID, API_GetActorMapID(wth_ActorID), API_GetActorPosX(wth_ActorID), API_GetActorPosY(wth_ActorID))
				API_GotoPlayer(ActorID,wth_ActorID)
			--end
		else
			local wth_ObjectName = API_GetActorName(wth_ActorID)
			--local sky1, sky2 = string.find(string.upper(wth_ObjectName),skyfix,1)
			--if sky1 == 1 and sky2 == string.len(skyfix) then
			--	API_ResponseWrite('<br><text>������Ż��ҡ�лл������</text><br><br>')
			--	API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
			--else
				--API_ActorGoToMap(wth_ActorID, API_GetActorMapID(ActorID), API_GetActorPosX(ActorID), API_GetActorPosY(ActorID))
				API_GotoPlayer(wth_ActorID,ActorID)
			--end
		end
	end
end	

function wth_getActorLevel(ActorID)
	
	local ActorExpLevel = API_GetActorExpLevel(ActorID)
	local ActorJueweiLevel = API_GetActorPeerageLevel(ActorID)
	local xueruo = {[1]=11,[2]=21,[3]=26,[4]=36,[5]=41,[6]=51,[7]=56,[8]=66,[9]=71,[10]=81,[11]=86,}
	local jueweiname = {[1]="����",[2]="�о�",[3]="�߼��о�",[4]="�Ӿ�",[5]="�߼��Ӿ�",[6]="����",[7]="�߼�����",[8]="���",[9]="�߼����",[10]="����",[11]="�߼�����",}
	if ActorExpLevel == -1 or ActorJueweiLevel == -1 or ActorExpLevel == nil or ActorJueweiLevel == nil then
		return "�����״̬����"
	else
		if xueruo[ActorJueweiLevel] == nil then
			return "�����˿϶����Լ��ȼ��ĵ�̫��̬��"
		else
			return (xueruo[ActorJueweiLevel] - ActorExpLevel).."��"..jueweiname[ActorJueweiLevel]
		end
	end
end


local wth_Tablist = {80421,1,715,1,727,3,765,10,770,1,766,1,767,1,782,1,770,1,770,1,782,1,901,1,902,1,903,1,904,1,905,1,}
local wth_Goods_Loc = nil
local wth_roandomMoney = nil

function wth_Choujiang()
	wth_Goods_Loc = math.random(16)
	local ActorID = API_RequestGetActorID()
	API_OpenIconTiger(ActorID, 1, wth_Goods_Loc, "�ϻ���", "wth_Choujiang", "wth_AddGoodsForTiger", 16, wth_Tablist)
end

function wth_ChoujiangDigt()
	wth_roandomMoney =  math.random(1000,8000)
	local ActorID = API_RequestGetActorID()
	API_OpenDigitalTiger(ActorID, 2, wth_roandomMoney, 1000, 8000, "�콵���", "��Ǯ+", "���ϵ�Ǯ��ѽ����", "�ݱ�̨����Ԥ�����������ڽ��ս��������", "wth_ChoujiangDigt","wth_AddGoodsForTiger")
end

function wth_AddGoodsForTiger()
	local ActorID = API_RequestGetActorID()
  	local lDishID = API_RequestGetNumber(1)
	if lDishID == 1 then
		local GoodsID = wth_Tablist[2 * wth_Goods_Loc - 1]
		local GoodsNum = wth_Tablist[2 * wth_Goods_Loc]
		local GoodsName = API_GetGoodsName(GoodsID)
		local wth_canAddGoods = API_ActorCanAddGoods(ActorID, GoodsID, GoodsNum, 0, 0)

		if wth_canAddGoods > -1 then
			for i = 1,GoodsNum do		
				API_AddActorGoods(ActorID, GoodsID, 1,"")
			end
			API_ActorSendMsg(ActorID, 1, "��ϲ���ڱ��γ齱�л��"..GoodsNum.."��"..GoodsName.."..")
		else
			API_ActorSendMsg(ActorID, 1, "˥��,�齱֮ǰҲ��������")
		end
	elseif lDishID == 2 then
		local wth_roandomMoneyTax = math.ceil(wth_roandomMoney * 0.9)
		API_ActorAddMoneyUnStat(ActorID, wth_roandomMoneyTax, 0, "ҡ������")
		API_ActorSendMsg(ActorID, 1, "��ϲ���ڱ���ҡ���л��"..wth_roandomMoney.."Ԫ�޿�,�۳���������˰������Ϊ"..wth_roandomMoneyTax)
	end
end

function wth_DelayTime(delaySeconds)
	local delaySeconds = delaySeconds or 1
	local wth_TimeB = os.time()
	local wth_TimeE = os.time()
	while wth_TimeE - wth_TimeB <= delaySeconds do
		wth_TimeE = os.time()
	end
	return wth_TimeE
end


function wth_SetZXTask()
	local wthStatusSelect = API_RequestGetNumber(1)
	local nActorID = API_RequestGetActorID()
	if wthStatusSelect == 1 then
		API_ResponseWrite('<name> �������</name>')
		API_ResponseWrite('<text>�����ܽ������ٲ�����������֮�ã�</text><br>')
		API_ResponseWrite('<br><a href="wth_SetZXTask?1=2">�����ٳ�.</a><br>')
		API_ResponseWrite('<br><a href="wth_SetZXTask?1=3">��������..</a><br>')
		API_ResponseWrite('<text>������ת,������Ҫ��ȡ������ID (301-350)��</text><input type="number" name="11" size="3">')
		API_ResponseWrite('<a href="wth_SetZXTask?1=4"> ����</a><br>')
		API_ResponseWrite('<br><a href="wth_SetZXTask?1=5">����ս��ѭ������</a><br>')

		API_ResponseWrite('<br><a href="WGQ_Heroisland">����..</a><br>')
	--	API_ResponseFlush(ActorID)	
	elseif wthStatusSelect == 2 then
		API_ActorSetNovice(nActorID, 1)
		API_ActorSetNovice(nActorID, 2)
		API_ActorSetNovice(nActorID, 3)
		API_ActorSetNovice(nActorID, 4)
		API_ActorSetNovice(nActorID, 5)
		API_ActorSetNovice(nActorID, 6)
	--XSC_YingXiongChuanCheng_DestroyTimerPer12(nActorID)
		API_ActorSendMsg(nActorID, 4, '')
		IClearAllTaskUnit_Exectute(nActorID)
		IAcceptTaskUnit_Exectute(nActorID,wParam)
		API_VarDataSetNumber(nActorID, 1, 7900, 0)
		API_VarDataSetNumber(nActorID, 1, GLOBAL_FoolNewActorTaskStep, 64)  ---18338��ɵ�����ֲ���
		WGQ_Heroisland_gotohome()

	elseif wthStatusSelect == 3 then
		IClearAllTaskUnit_Exectute(nActorID)
		API_VarDataSetNumber(nActorID, 1, GLOBAL_FoolNewActorTaskStep, 0) 
		API_VarDataSetNumber(nActorID, 1, 7751, 0) 
		API_VarDataSetNumber(nActorID, 1, 7900, 0) 
		WGQ_Heroisland_gotohome()
	--	IAcceptTaskUnit_Exectute(nActorID,wParam)
		--TrunkMain_BeginTask(ActorID)
		--for i = 301,323 do
		--	 Fun_ClsCompletedTask(ActorID,i)
		--end
		API_ActorSendMsg(nActorID, 2, "�������������ѳɹ���������¿�ʼ��������")

	elseif wthStatusSelect == 4 then
		local wParam = API_RequestGetNumber(11)
		if wParam < 301 or wParam > 380 then
			API_ActorSendMsg(nActorID, 1, "�����������ID�Ƿ�")
		else
			IClearAllTaskUnit_Exectute(nActorID)
			IAcceptTaskUnit_Exectute(nActorID,wParam)
		end

	elseif wthStatusSelect == 5 then
		API_VarDataSetNumber(nActorID,1,18255,0)
		API_VarDataSetNumber(nActorID,1,18256,0)
		API_VarDataSetNumber(nActorID,1,18257,0)
		API_VarDataSetNumber(nActorID,1,18258,0)
		API_VarDataSetNumber(nActorID,1,18259,0)
		API_VarDataSetNumber(nActorID,1,18260,0)
		for i = 705,709 do 
			local TaskID = i 
			API_ClearTaskPos(nActorID,TaskID) 
			API_VarDataSetNumber(nActorID,1,TaskID, 0) 
			API_VarDataSetNumber(nActorID,0,TaskID, 0) 
			API_TaskLogRemove(nActorID,TaskID)
		end 
		API_InitTaskSystem(nActorID)
		API_ActorSendMsg(nActorID,1,'ս��ѭ�������������')

	end

end

function wth_UnRegfukongdao(ActorID)
	local ActorID = ActorID or API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local PzMapID = API_GetMapConfigID(MapID)

	if MapID ~= API_GetStaticMapID(MapID) and (PzMapID ~= 26 and PzMapID ~= 27 and PzMapID ~= 28 and PzMapID ~= 1949 and PzMapID ~= 1974) then
		API_UnRegisterActor(MapID, ActorID)
	end
end

-- ����һ������������ߵ�һ��������
function IAcceptTaskUnit_Exectute(nActorID,wParam)
	if nil==wParam or  0==wParam then
		TrunkMain_BeginTask(nActorID)
	else
		local oTask = CTaskSystem.tTasks[wParam]
		if nil~=oTask then
			oTask:AcquireMe(nActorID)
		end
	end
end

-- ���������������
function IClearAllTaskUnit_Exectute(nActorID)
	for nTaskID, oTask in pairs(CTaskSystem.tTasks) do
		if nil~=oTask then
			oTask:ClsTaskData(nActorID)
		end
	end
end


function wth_zdml()
	local wthStatusSelect = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	if wthStatusSelect == 1 then
		API_ResponseWrite('<name> �ܶ�����</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">�鿴��ǰ����״̬</a><br><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">�鿴��ǰ������б�</a><br><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">���Լ�ִ������������ݲ���</a><br><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">���Լ�ִ������������ݲ���</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
		
	elseif wthStatusSelect == 2 then
		API_ResponseWrite('<name>�ܶ�����-����״̬</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">�鿴��ǰ����״̬</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">�鿴��ǰ������б�</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">���Լ�ִ������������ݲ���</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">���Լ�ִ������������ݲ���</a><br><br>')

		API_ResponseWrite('<text>��ǰ����������</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.TodayComGroNo)..'  </text>')
		API_ResponseWrite('<text>     ����һ�ֵڼ������</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComdNo)..'  </text>')
		API_ResponseWrite('<text>     �����ѽ����������</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.alreadyHaveComNum)..'  </text>')
		API_ResponseWrite('<br><text>��һ�νӵ���������ڣ�</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.LastComTime)..'  </text>')
			
		API_ResponseWrite('<text>     ��ǰ�ӵ��������ţ�</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowHaveCKN)..'  </text>')
		if API_VarDataGetNumber(ActorID, 1, GZS_JHData.CurComGiveTime) ~= 0 then
			API_ResponseWrite('<text>     �ϴνӵ�������ʱ�䣺</text><text color="255,0,255">   '..os.difftime(os.time(), API_VarDataGetNumber(ActorID, 1, GZS_JHData.CurComGiveTime))..'  </text>')
		end
		API_ResponseWrite('<br><text>��ǰ�ӵ����������ID��</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComJHObjeID)..'  </text>')
		if API_ActorIsOnline(API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComJHObjeID)) then
			API_ResponseWrite('<text>     ��ǰ�ӵ�������������У�</text><text color="255,0,255">   '..API_GetActorName(API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComJHObjeID))..'  </text><br>')
		end
		API_ResponseWrite('<text>��ǰ�����콱��־��</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.CFEAlreadyGeiLeJL)..'  </text>')
			
		API_ResponseWrite('<text>     ��ǰ��˭������Ŀ�����</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.WhoSComObj)..'  </text>')
		API_ResponseWrite('<text>     ��ǰ����״̬��</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.CurCreatComStatu)..'  </text><br>')
		if API_VarDataGetNumber(ActorID, 1, GZS_JHData.inSomeOneComObjTime) ~= 0 then	
			API_ResponseWrite('<text>�ϴγ�Ϊĳ����������ʱ���ʱ�䣺</text><text color="255,0,255">   '..os.difftime(os.time(), API_VarDataGetNumber(ActorID, 1, GZS_JHData.inSomeOneComObjTime))..'  </text><br>')
		end
		API_ResponseWrite('<text>�ϴγ�ΪĿ�����ʱ���ĸ�����ģ�</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.InWhichComdsObj)..'  </text>')
		API_ResponseWrite('<text>     �ϴ�Э�����ʱ�Ĺ�ѫ����������</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.ObjSaveTimePer)..'  </text>')
		API_ResponseWrite('<text>     ��ǰ�����ĸ�����Ķ�����У�</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowObjComNO)..'  </text>')
		API_ResponseWrite('<br><text>�ܶ��øжȣ�</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.ExaShootLove)..'  </text>')
		
	elseif wthStatusSelect == 3 then
		API_ResponseWrite('<name>�ܶ�����-�����</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">�鿴��ǰ����״̬</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">�鿴��ǰ������б�</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">���Լ�ִ������������ݲ���</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">���Լ�ִ������������ݲ���</a><br>')

		API_ResponseWrite('<br><text>��9764����ֵΪ: </text><text color="255,0,255"> '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend_SX)..'  </text>')
		for i = 1, 9 do
			API_ResponseWrite('<br><text>����� '..i..' �ŵ�ID��</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend[i])..'  </text>')
			if API_ActorIsOnline(API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend[i])) then
				API_ResponseWrite('<text>  ���ɫ��Ϊ��  </text><text color="255,0,255">   '..API_GetActorName(API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend[i]))..'  </text>')
			end
		end
	elseif wthStatusSelect == 4 then
		API_ResponseWrite('<name>�ܶ�����-������</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">�鿴��ǰ����״̬</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">�鿴��ǰ������б�</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">���Լ�ִ������������ݲ���</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">���Լ�ִ������������ݲ���</a><br><br>')

		GZS_CFE_UncompletComd (ActorID)
		API_ActorSendMsg(ActorID, 1, "������������ѳɹ������")
	elseif wthStatusSelect == 5 then
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.TodayComGroNo, 0)
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.NowComdNo, 0)
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.alreadyHaveComNum, 0)
		-- ʱ�佻�������޸�
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.LastComTime, 0)
		API_ActorSendMsg(ActorID, 1, "����������ݼ�¼�ѳɹ������")
	end
end


--- add for test

local my_test_monster={
	[1]=4001,
}
local wth_temp_monster_create = {}
function wth_temp_monster()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local Actor_x , Actor_y = PublicFun_GetActorPosXY(ActorID)

	local wthtranSelect = API_RequestGetNumber(1)

	if wthtranSelect == 1 then
		API_ResponseWrite('<name>ˢ��</name>')
		API_ResponseWrite('<text>һ��569������,ÿ��ˢ20��,��29��(���һ��9��)��</text><br>')
		API_ResponseWrite('<text>��������Ҫˢ������:</text><br>')
		API_ResponseWrite('<input type="number" name="6" size="2"><br>')
		API_ResponseWrite('<a href="wth_temp_monster?1=2">��ˢ</a><br><br>')
		API_ResponseWrite('<a href="wth_temp_monster?1=3">��ɨ����</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')

	elseif wthtranSelect == 2 then
		local wth_pcselect = API_RequestGetNumber(6)
		if wth_pcselect >= 29 then
			wth_pcselect = 29
		end
		local wth_startindex = (wth_pcselect - 1)*20 +1
		local wth_endindex = wth_startindex + 19
		if wth_endindex > 569 then
			wth_endindex = 569
		end
		local wth_count = 0
		
		
		if API_IsBlockTile(MapID, Actor_x, Actor_y + 3, 2) then
			API_ResponseWrite('<name>ˢ��</name>')
			API_ResponseWrite('<text>����Χ3��̬�������ϰ������,��Ѱһ�������ش�(�Ƽ�Ӣ�۹㳡)��ˢ��</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
		else	
			Actor_y = Actor_y + 5
			Actor_x = Actor_x -8
			local old_x = Actor_x
			for i=wth_startindex,wth_endindex do 
				wth_temp_monster_create[i] = API_CreateMonster(MapID, my_test_monster[i], Actor_x, Actor_y , 4 , 1158 , -1)
				Actor_x = Actor_x + 1
				wth_count = wth_count + 1
				if wth_count > 0 and math.mod(wth_count, 5) == 0 then
					Actor_y = Actor_y - 1
					--Actor_x = old_x
				end
			end
		end
	elseif wthtranSelect == 3 then
		for i,v in pairs(wth_temp_monster_create) do
			API_DestroyMonster(v)
			wth_temp_monster_create[i] = nil
		end
	end
end

function wth_itemtest()
	local wthStatusSelect = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	if wthStatusSelect == 1 then
		API_ResponseWrite('<name> ��Ʒ����</name>')
		API_ResponseWrite('<text>ִ�б����Խ�������ɫ������������Ʒ�������أ�</text><br>')
		API_ResponseWrite('<text>��������Ե���ƷID:</text><br>')
		API_ResponseWrite('<input type="number" name="6" size="6"><br>')
		API_ResponseWrite('<text>��������Ե���Ʒ����:</text><br>')
		API_ResponseWrite('<input type="number" name="7" size="4"><br><br>')
		API_ResponseWrite('<a href="wth_itemtest?1=2">��ʼ����</a><br><br>')
		--API_ResponseWrite('<a href="wth_temp_monster?1=3">��ɨ����</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����</a><br>')
	elseif wthStatusSelect == 2 then
		local goodsid = API_RequestGetNumber(6)
		local goodsnum = API_RequestGetNumber(7)
		if goodsid == 0 or API_GetGoodsName(goodsid) == '' then
			API_ResponseWrite('<name> ��Ʒ����</name>')
			API_ResponseWrite('<text>��������ȷ����ƷID</text><br>')
			API_ResponseWrite('<a href="wth_itemtest?1=1">��������</a><br>')
		else
			wth_WPtest(goodsid,goodsnum,needloc)
		end
	end
end


function wth_WPtest(goodsid,goodsnum,needloc)
	local ActorID = ActorID or API_RequestGetActorID()
	local needloc = needloc or 0
	local goodsnum = goodsnum or 100
	API_ActorClearPackage(ActorID)
	local Packsize = API_ActorGetPackageSize(ActorID)
	if needloc > Packsize then
		API_ResponseWrite('<name> ��Ʒ����</name>')
		API_ResponseWrite('<text>���õ���Ʒ������Ҫ�ռ���ڴ˽�ɫ��󱳰��ռ䣬���޸ġ�</text><br><br>')
		API_ResponseWrite('<a>�رմ���</a>')
		return
	end
	local Money = API_ActorGetPropNum(ActorID, 156)
	API_ActorAddMoneyUnStat(ActorID, -Money,0,"��ʯ�޸�")

	local Allmoney = 0
	local WPlist = {}

	for i=1,goodsnum do
		API_AddActorGoods(ActorID, goodsid, 1, 'test')
		--API_ActorUseOrEquipGoods(ActorID, goodsid)
		API_ActorUseGoods(ActorID, goodsid, -1, -1, -1)

		--wth_DelayTime(3)
		if API_ActorGetGoodsNum(ActorID, goodsid) ~= 0 then
			API_ResponseWrite('<name> ��Ʒ����</name>')
			API_ResponseWrite('<text>�ò�����Ʒʹ�ò����ģ����ܴ����������⣺</text><br><br>')
			API_ResponseWrite('<text>�١����������ƷID���󣬴���ƷΪ����ʹ����Ʒ��</text><br>')
			API_ResponseWrite('<text>�ڡ�����Ʒʹ�ô�������BUG��ʹ�ò����ġ�</text><br>')
			API_ResponseWrite('<text>�ۡ�ʹ�ô���Ʒ��Ҫ�������߻��ߴ���ʹ����ȴ���ƣ���ϵͳ�ݲ�֧�ִ�����Ʒ���ԡ�</text><br>')
			API_ResponseWrite('<text>��ʱ��Ʒ������ '..API_ActorGetGoodsNum(ActorID, goodsid)..'��Ʒ������ '..API_GetGoodsName(goodsid)..'  </text><br>')
			API_ResponseWrite('<br><a>�رմ���</a>')
			return
		else
			if  API_ActorGetPackageSize(ActorID) == Packsize then  --- ���ʹ�õ���δ����κ���Ʒ
				API_TraceError('�� '..i..' �ֲ�����ʹ����Ʒδ����κε���')
				if API_ActorGetPropNum(ActorID, 156) == 0 then   ---�����ǮҲû�õ�
					API_ResponseWrite('<name> ��Ʒ����</name>')
					API_ResponseWrite('<text>�ò�����Ʒʹ�ú��δ�����ƷҲδ��ý�Ǯ�������ܴ�������BUG����ȷ�ϡ�</text><br><br>')
					API_ResponseWrite('<a>�رմ���</a>')
					return
				else
					Allmoney = Allmoney + API_ActorGetPropNum(ActorID, 156)

				end
			else
				Allmoney = Allmoney + API_ActorGetPropNum(ActorID, 156)
				for k=0,4 do
					if k == 0 then
						for v=0, 19 do
							local wth_bagGoodsID = API_ActorPackageGetLocGoodsID(ActorID, 0, v)
							--API_TraceError('���ǵ� '..i..' �ֲ��ԣ��� '..k..' �������У��� '..v..' λ������ƷIDΪ '..wth_bagGoodsID)
							if wth_bagGoodsID > 0 then
								--API_TraceError('�ڵ� '..i..' �ֲ����з�����Ʒ��ã���ƷIDΪ '..wth_bagGoodsID)
								local wth_bagGoodsNum = API_ActorPackageGetLocGoodsNum(ActorID, 0, v)
								if not WPlist[wth_bagGoodsID] then
									WPlist[wth_bagGoodsID] = 0
								end
								WPlist[wth_bagGoodsID] = WPlist[wth_bagGoodsID] + wth_bagGoodsNum  -- ͳ������
							end
						end

					else

						local wth_baghave = API_ActorIsHaveBag(ActorID, k)
						if wth_baghave then
							local wth_bagHaveSize = API_ActorGetBagSize(ActorID, k)
							--API_TraceError('�� '..i..' �ֲ��ԣ��� '..k..' ��������СΪ'..wth_bagHaveSize)
							for v=0, (wth_bagHaveSize-1) do
								local wth_bagGoodsID = API_ActorPackageGetLocGoodsID(ActorID, (k+2), v)
								--API_TraceError('���ǵ� '..i..' �ֲ��ԣ��� '..k..' �������У��� '..v..' λ������ƷIDΪ '..wth_bagGoodsID)
								if wth_bagGoodsID > 0 then
								--	API_TraceError('�ڵ� '..i..' �ֲ����з�����Ʒ��ã���ƷIDΪ '..wth_bagGoodsID)
									local wth_bagGoodsNum = API_ActorPackageGetLocGoodsNum(ActorID, (k+2), v)
									if not WPlist[wth_bagGoodsID] then
										WPlist[wth_bagGoodsID] = 0
									end
									WPlist[wth_bagGoodsID] = WPlist[wth_bagGoodsID] + wth_bagGoodsNum  -- ͳ������
								end
							end
						end
					end
				end
			end
		end

		API_ActorClearPackage(ActorID)
		Money = API_ActorGetPropNum(ActorID, 156)						
		API_ActorAddMoneyUnStat(ActorID, -Money,0,"��ʯ�޸�")
	end
	API_ResponseWrite('<name> ��Ʒ����</name>')
	API_ResponseWrite('<text>���β��Թ�ʹ����Ʒ '..API_GetGoodsName(goodsid)..' '..goodsnum..' ��</text><br><br>')
	API_ResponseWrite('<text>���л�ý�Ǯ '..Allmoney..' </text><br>')
	API_ResponseWrite('<text>�����Ʒ���б����£� </text><br>')
	for k,v in pairs(WPlist) do
		API_ResponseWrite('<text>��Ʒ '..API_GetGoodsName(k)..' '..v..' ��</text><br>')
	end
	API_ResponseWrite('<br><a>�رմ���</a>')
end

local laju_pzmapid={
	[1]=1811,  -- ��������
	[2]=1804,  --�Ӿ�����
	[3]=1812, -- �о�����
	[4]=1813, --��������
	[5]=1845, --��������
	[6]=1846, --��������
	[7]=1847, --�߲�����
	[8]=1848, --�������
	[9]=1849, --�ߺ�����
	[10]=1850, --��������
	[11]=1851, --�߹�����
}

function wth_lajupinjiatest()
	local ActorID = API_RequestGetActorID()	
	local ActorCampID = API_GetActorCamp(ActorID)
--	local wthtranSelect = API_RequestGetNumber(1)
	local MapID = API_GetActorMapID(ActorID)
	local wth_pzMapid = API_GetMapConfigID(MapID)
	API_ResponseWrite('<name> �������ۺͽ�������</name>')
		local isLaju = 0
		for i, v in pairs(laju_pzmapid) do 
			if laju_pzmapid[i] == wth_pzMapid then
				isLaju = 1
				break
			end 
		end 
	if isLaju == 1 then


		local PeerageLevel = API_GetActorPeerageLevel(ActorID)
		local Peerage = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.Peerage)
		local MapNFLV = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.MapNFLV)

		local RedActorNum = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.RedActorNum)
		local BlueActorNum = API_GetMapVarData(MapID,GLOBAL_MAPVARDATA.BlueActorNum)
		local ActorKillCasteNum = API_VarDataGetNumber(ActorID,1,LaJuZhanFuBen_Kocaste)  --18035
		
		local ActorKillActorNum = API_BattleGetActorKillInfo(ActorID,0)
		local ActorKillConstructNum = API_BattleGetActorKillInfo(ActorID,1)
		local ActorKillMonsterNum = API_BattleGetActorKillInfo(ActorID,2)
		local ActorSIWANGCISHU = API_BattleGetActorKillInfo(ActorID,3)
		
		local DiduiCampID = 1
		local TeamActorNum = RedActorNum
		local DiduiTeamActorNum = BlueActorNum

		if ActorCampID == 1 then
			DiduiCampID = 0
			TeamActorNum = BlueActorNum
			DiduiTeamActorNum = RedActorNum
		end
		if TeamActorNum <= 0 then
			TeamActorNum = 1
		end


		if DiduiTeamActorNum <= 0 then
			DiduiTeamActorNum = 1
		end

	local CampKillActorNum = API_BattleGetCampActorKillInfo(MapID,ActorCampID,0)
	if CampKillActorNum <= 0 then
		CampKillActorNum = 1
	end
	local CampKillConstructNum = API_BattleGetCampActorKillInfo(MapID,ActorCampID,1)
	if CampKillConstructNum <= 0 then
		CampKillConstructNum = 1
	end
	local CampKillMonsterNum = API_BattleGetCampActorKillInfo(MapID,ActorCampID,2)
	if CampKillMonsterNum <= 0 then
		CampKillMonsterNum = 1
	end
	local CampSIWANGCISHU = API_BattleGetCampActorKillInfo(MapID,ActorCampID,3)
	if CampSIWANGCISHU <= 0 then
		CampSIWANGCISHU = 1
	end

	local DiduiCampKillActorNum = API_BattleGetCampActorKillInfo(MapID,DiduiCampID,0)
	if DiduiCampKillActorNum <= 0 then
		DiduiCampKillActorNum = 1
	end
	local DiduiCampKillConstructNum = API_BattleGetCampActorKillInfo(MapID,DiduiCampID,1)
	if DiduiCampKillConstructNum <= 0 then
		DiduiCampKillConstructNum = 1
	end
	local DiduiCampKillMonsterNum = API_BattleGetCampActorKillInfo(MapID,DiduiCampID,2)
	if DiduiCampKillMonsterNum <= 0 then
		DiduiCampKillMonsterNum = 1
	end
	local DiduiCampSIWANGCISHU = API_BattleGetCampActorKillInfo(MapID,DiduiCampID,3)
	if DiduiCampSIWANGCISHU <= 0 then
		DiduiCampSIWANGCISHU = 1
	end


		local renshupingjia = DiduiTeamActorNum/TeamActorNum
		if renshupingjia > 2 then
			renshupingjia = 2
		elseif renshupingjia < 0.8 then
			renshupingjia = 0.8
		end 
		local shaguaipingjia = DiduiCampKillMonsterNum/CampKillMonsterNum
		if shaguaipingjia > 2 then
			shaguaipingjia = 2
		elseif shaguaipingjia < 0.8 then
			shaguaipingjia = 0.8
		end 
		local sharenpingjia = DiduiCampKillActorNum/CampKillActorNum
		if sharenpingjia > 2 then
			sharenpingjia = 2
		elseif sharenpingjia < 0.8 then
			sharenpingjia = 0.8
		end 
		local shajianzupingjia = DiduiCampKillConstructNum/CampKillConstructNum 
		if shajianzupingjia > 2 then
			shajianzupingjia = 2
		elseif shajianzupingjia < 0.8 then
			shajianzupingjia = 0.8
		end 


		local Camppingjiaxiuzheng = renshupingjia * 0.2 + shaguaipingjia * 0.3 + sharenpingjia * 0.3 + shajianzupingjia * 0.2
		if Camppingjiaxiuzheng > 2 then
			Camppingjiaxiuzheng = 2
		elseif Camppingjiaxiuzheng < 0.8 then
			Camppingjiaxiuzheng = 0.8
		end
		local KillActorPinJun = CampKillActorNum/TeamActorNum
		if KillActorPinJun <= 0 then
			KillActorPinJun = 1
		end
		local KillConstructPinJun = CampKillConstructNum/TeamActorNum
		if KillConstructPinJun <= 0 then
			KillConstructPinJun = 1
		end
		local KillMonsterPinJun = CampKillMonsterNum/TeamActorNum
		if KillMonsterPinJun <= 0 then
			KillMonsterPinJun = 1
		end
	--	local SIWANGCISHUPinJun = CampSIWANGCISHU/TeamActorNum
	--	if SIWANGCISHUPinJun <= 0 then
	--		SIWANGCISHUPinJun = 1
	--	end



		local pingjiaxiuzheng = (ActorKillActorNum/KillActorPinJun * 0.5 + ActorKillConstructNum/KillConstructPinJun * 0.2 + ActorKillMonsterNum/KillMonsterPinJun * 0.3) * Camppingjiaxiuzheng
		if pingjiaxiuzheng < 0.1 then
			pingjiaxiuzheng = 0.1
		elseif pingjiaxiuzheng > 1.8 then
			pingjiaxiuzheng = 1.8
		end

		API_ResponseWrite('<text>�۹�����������'..RedActorNum..'    </text>')
		API_ResponseWrite('<text>�������������'..BlueActorNum..'</text><br>')
		API_ResponseWrite('<text>�Լ�ɱ�˴�����'..ActorKillActorNum..'    </text>')
		--API_ResponseWrite('<text>��Ӫɱ�˴�����'..ActorKillConstructNum..'</text><br>')
		API_ResponseWrite('<text>�Լ��ݻٽ�������'..ActorKillConstructNum..'</text><br>')
		API_ResponseWrite('<text>�Լ�ɱ��������'..ActorKillMonsterNum..'    </text>')
		API_ResponseWrite('<text>�Լ��ݻٳǱ�����'..ActorKillCasteNum..'</text><br>')
		API_ResponseWrite('<text>�Լ�����������'..ActorSIWANGCISHU..'    </text><br>')	
		API_ResponseWrite('<text>-------------------------------------------------------------------------------------------</text><br>')
		API_ResponseWrite('<text>����ս������Ŀǰ������Ϊ��  '..pingjiaxiuzheng..'    </text><br><br>')		
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')
		
	
	else
		API_ResponseWrite('<br><text>�����ڲ�δ�������⸡�յ���..</text><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">����..</a><br>')	
	end
end

function yx_ziliaopian()
	API_ResponseWrite('<name>����Ƭ��������޸�</name>')
	API_ResponseWrite('<text>�� ��ɶ..����������Ƭ�������ݵ��޸�....</text><br><br>')
	API_ResponseWrite('<text> ��1</text>')
	API_ResponseWrite('<a href="yx_Bus?1=1">�ؾ����</a>')
	API_ResponseWrite('<text>����</text>')
	API_ResponseWrite('<text> ��2</text>')
	API_ResponseWrite('<a href="yx_Bus?1=2">���ޤ��ٻ�</a>')
	API_ResponseWrite('<text>����</text>')
	API_ResponseWrite('<text> ��3</text>')
	API_ResponseWrite('<a href="yx_Bus?1=3">PKֵ��ѯ</a>')
	API_ResponseWrite('<text>����</text>')
	API_ResponseWrite('<text> ��4</text>')
	API_ResponseWrite('<a href="yx_Bus?1=4">����ϵͳ</a>')
end

function yx_Bus()
	local ActorID = ActorID or API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then 
		API_ResponseWrite('<name>�ؾ�</name>')
		API_ResponseWrite('<text>��δ����</text><br><br>')
		API_ResponseWrite('<text> ����</text>')
		API_ResponseWrite('<a href="yx_Bus?1=11">��ѯ</a>')
		--API_ResponseWrite('<text>����</text>')
		--API_ResponseWrite('<text> ����</text>')
		--API_ResponseWrite('<a href="yx_Bus?1=12">�޸�</a><br>')
		--API_ResponseWrite('<text>...</text>')
		--API_ResponseWrite('<text>...</text>')

	elseif  wthtranSelect == 11 then
		API_ResponseWrite('<name>�ؾ���ֵ��ѯ</name>')
		local ActorID = ActorID or API_RequestGetActorID()
			if API_IsVehicalConjuring (ActorID)== nil or  API_IsVehicalConjuring(ActorID)==0 then
				API_ResponseWrite('<text>�����嶼�ò�������˲��P��</tetx>')
			else
			local speed	= API_GetActorConjedVehicalPropNum(ActorID,29)
			local oil_now   = API_GetActorConjedVehicalPropNum(ActorID,13)
			local hard_now	 = math.ceil(API_GetActorConjedVehicalPropNum(ActorID,12)/128)
			local buslevel	 = API_GetActorConjedVehicalPropNum(ActorID,15)
			local busexp	 = API_GetActorConjedVehicalPropNum(ActorID,16)
			local buschange	 = API_GetActorConjedVehicalPropNum(ActorID,17)
			local hpmax	= API_GetActorConjedVehicalPropNum(ActorID,27)
			local deff	= API_GetActorConjedVehicalPropNum(ActorID,28)
			local oil_max	= API_GetActorConjedVehicalPropNum(ActorID,31)
			local hard_max	= math.ceil(API_GetActorConjedVehicalPropNum(ActorID,30)/128)
				API_ResponseWrite('<text>��ү���,����ؾ��������£�</text><br>')
				API_ResponseWrite('<text>���ؾߵ�ǰ�ȼ�Ϊ'..buslevel..'��������ֵΪ'..busexp..'�㣬������'..speed..'���ٶ�.</text><br>')
				API_ResponseWrite('<text>�Ѿ��������'..buschange..'��,Ŀǰ����Ϊ'..oil_now..'����������Ϊ'..oil_max..'</text><br>')
				API_ResponseWrite('<text>����������'..hpmax..'����������,����'..deff..'����. �;�Ϊ'..hard_now..'/'..hard_max..'</text><br>')
			end
	
	elseif wthtranSelect == 3 then
		local ActorID = API_RequestGetActorID()
		local num = API_GetPKCrimeValue(ActorID)
		API_ResponseWrite('<text>���PKֵ�ǣ�'..num..'��</text><br>')
		API_ResponseWrite('<text>������ֵ:</text><input type="number" name="17" size="10"><br><br>')
		API_ResponseWrite('<a href="yx_Bus?1=31">�������</a><br>')
		API_ResponseWrite('<text>	</text><br>')
		API_ResponseWrite('<a href="yx_Bus?1=34">�������</a>')
				
	elseif wthtranSelect == 31 then
		local ActorID = API_RequestGetActorID()
		local crime = API_RequestGetNumber(17)
		local xyz = API_GetPKCrimeValue(ActorID)
		if crime + xyz >= 200 then crime = 200 - xyz end
		API_AddPKCrimeValue(ActorID,crime)
		API_UpdateActorPkState(ActorID)
		API_ActorSendMsg(ActorID, 3, "���ȿ���Ӱ��,��о����ϵ���������"..crime.."��,�����ڵ����ֵ��"..API_GetPKCrimeValue(ActorID).."��")


	elseif wthtranSelect == 34 then
		local ActorID = API_RequestGetActorID()
		local crime = API_RequestGetNumber(17)
		local xyz = API_GetPKCrimeValue(ActorID)
		if crime>xyz then crime = xyz end
		API_CutPKCrimeValue(ActorID,crime)
		API_UpdateActorPkState(ActorID)
		API_ActorSendMsg(ActorID, 3, "����̫̫����".. math.random(10).."����·,��о����ϵ���������"..crime.."��,�����ڵ����ֵ��"..API_GetPKCrimeValue(ActorID).."��")

	--�ٻ���
	elseif wthtranSelect == 2 then
		API_ResponseWrite('<name>- -# </name>')
		API_ResponseWrite('<text>�����ռ��߿�����,�����ٻ�����</text><br><br>')
		API_ResponseWrite('<text> ��1</text>')
		API_ResponseWrite('<a href="yx_Bus?1=21">С����</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text> ��2</text>')
		API_ResponseWrite('<a href="yx_Bus?1=22">�����</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text> ��3</text>')
		API_ResponseWrite('<a href="yx_Bus?1=23">������</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text> ��4</text>')
		API_ResponseWrite('<a href="yx_Bus?1=24">ѩ����������˿</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text> ��5</text>')
		API_ResponseWrite('<a href="yx_Bus?1=25">�ٻ�����</a>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text> ��6</text>')
		API_ResponseWrite('<a href="yx_Bus?1=26">�������</a><br><br>')
		API_ResponseWrite('<text>����</text>')
		API_ResponseWrite('<text> ��7</text>')
		API_ResponseWrite('<a href="yx_Bus?1=27">����֮����������</a><br><br>')


	elseif 	wthtranSelect == 21 then
		--�������850020����������850023
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local BossID = 850020 
		local FastID = API_CreateMonster(PlayMapID, BossID, PlayX,PlayY, 4, 0, -1) 
		API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldBoss_DieFunc') 
		
		
	elseif 	wthtranSelect == 22 then
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local BossID = 850022 
		local FastID = API_CreateMonster(PlayMapID, BossID, PlayX,PlayY, 4, 0, -1) 
		API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldBoss_MeiLanDaDieFunc') 
		
		
	elseif 	wthtranSelect == 23 then
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local BossID = 850029 
		local FastID = API_CreateMonster(PlayMapID, BossID, PlayX,PlayY, 4, 0, -1) 
		API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldKingBoss_DieFunc')
		

	elseif 	wthtranSelect == 24 then
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local BossID = 850031 
		local FastID = API_CreateMonster(PlayMapID, BossID, PlayX,PlayY, 4, 0, -1) 
		API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldKingBoss_KaLuoSi_DieFunc') 
		

	elseif 	wthtranSelect == 25 then
		--�������850020����������850023
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local BossID = 850023 
		local FastID = API_CreateMonster(PlayMapID, BossID, PlayX,PlayY, 4, 0, -1) 
		API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldBoss_DieFunc') 
		

	elseif 	wthtranSelect == 26 then
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local PlayX,PlayY = PublicFun_GetActorPosXY(ActorID) 
		local BossID = 850021
		local FastID = API_CreateMonster(PlayMapID, BossID, PlayX,PlayY, 4, 0, -1) 
		API_CreateDieTriggerG(0, 0, 0, FastID, 'YXD_WorldBoss_DieFunc') 
		
	
	elseif wthtranSelect == 4 then
		API_ResponseWrite('<name>�����޸�</name>')
		API_ResponseWrite('<text>�����и��ң�һ����̫��ĵط�</text><br><br>')
		API_ResponseWrite('<text>������ֵ:</text><input type="number" name="41" size="10"><br><br>')
		API_ResponseWrite('<a href="yx_Bus?1=41">���ӽ��</a><br>')
		API_ResponseWrite('<text>	</text><br>')
		API_ResponseWrite('<a href="yx_Bus?1=42">���ݾ���</a>')

	elseif wthtranSelect == 41 then
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local HouseID = API_GetHouseSerialID(PlayMapID) 
		local fruitnum =  API_RequestGetNumber(41)
		if fruitnum >= 99999 then fruitnum = 99999 end
		API_SetVarNumber(HouseID, HouseFloor_GoldFruitNum,fruitnum,true)
		API_ActorSendMsg(ActorID, 3, "����32ע����Ʊ1�Ƚ���������"..fruitnum.."�����")

	elseif wthtranSelect == 42 then	
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local HouseID = API_GetHouseSerialID(PlayMapID) 
		local roomexp = API_RequestGetNumber(41)
		if roomexp >= 999999 then roomexp = 999999 end
		API_SetHouseCrtNumProperty(HouseID,PUB_HDN_CURRENTEXPVALUE,roomexp) 
		API_ActorSendMsg(ActorID, 3, "�����ɹ�����ķ��ݾ�������"..roomexp.."��")
	
	elseif wthtranSelect == 27 then
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 7, 0) 
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 8, 0) 
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 9, 0) 
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 10, 0) 

		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 11, 0) 
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 15, 0) 
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 24, 0) 
		API_VarDataSetNumber_Ex_Sync(1, 0, -2000, 1, 25, 0) 

	end
end


