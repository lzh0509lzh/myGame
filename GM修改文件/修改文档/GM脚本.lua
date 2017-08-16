-- //////////////////////////////////
--文件名:      Scp\\LUA\\WGQ_Heroisland.lua
--版    权:	(C)  深圳网域计算机网络有限公司
--作    者:      伍高强
--/////////////////////////////////////
-- 版本号:   2007.10.10  
-- 功    能:   NPC对话形式测试工具框架构建
--********************************************
-- 版本号:   2007.10.12  
-- 功    能:   支持最新lua格式
--********************************************
-- 版本号:   2007.10.15
-- 功    能:   添加32个测试NPC,,支持NPC出售所有物品
--********************************************
-- 版本号:   2007.10.26
-- 功    能:   1、优化了部分代码,加入饥饿度恢复功能..
--                 2、修改原把技能ID当状态ID的bug
--                 3、新增几处传送
--********************************************
-- 版本号:   2007.11.19
-- 功    能:   1、增加佣兵团设置
--********************************************



local nServerID = API_GetServerID()
--[[if not wth_CurrentServer then
	os.execute("d:\\ourpack\\servername.bat "..nServerID)
	require 'd:\\ourpack\\wth_servertemp"..nServerID..".lua'
end
if wth_CurrentServer == nil or (wth_CurrentServer ~= "HEROTEST" and wth_CurrentServer ~= "herotest") then
	API_TraceError('本脚本为内部测试用脚本，仅供品质内部测试使用，脚本将自动中止。')
	return
end
--]]--

local wth_SomeName = 'soso'
--local skyfix = string.upper('SKY')
--local skya, skyb = nil, nil

local yxd_gmID = 16565  --游戏角色的ID
local yxd_gmName = "Seven丶"  --游戏角色的名字



wth_Globe_serverlist = {[2]=2, [3]=3, [4]=4,[5]=5,[10]=10}

-- 注册测试用函数
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




 -- 在线玩家列表

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

		API_CreateMonster(1, 200016, 213, 201, 4, 0, -1)		--品质帝国头盔商人
		API_CreateMonster(1, 200017, 213, 203, 4, 0, -1)		--品质帝国胸甲商人
		API_CreateMonster(1, 200018, 213, 205, 4, 0, -1)		--品质帝国披风商人
		API_CreateMonster(1, 200019, 213, 207, 4, 0, -1)		--品质帝国腰带商人
		API_CreateMonster(1, 200020, 213, 209, 4, 0, -1)		--品质帝国手套商人
		API_CreateMonster(1, 200021, 213, 211, 4, 0, -1)		--品质帝国护腿商人
		API_CreateMonster(1, 200022, 213, 213, 4, 0, -1)		--品质帝国靴子商人

		API_CreateMonster(1, 200027, 221, 201, 4, 0, -1)		--品质帝国走私商人
		API_CreateMonster(1, 200015, 221, 203, 4, 0, -1)		--品质帝国武器商人
		API_CreateMonster(1, 200023, 221, 205, 4, 0, -1)		--品质帝国饰品商人
		API_CreateMonster(1, 200024, 221, 207, 4, 0, -1)		--品质帝国材料商人
		API_CreateMonster(1, 200025, 221, 209, 4, 0, -1)		--品质帝国配方商人
		API_CreateMonster(1, 200026, 221, 211, 4, 0, -1)		--品质帝国宝石商人
		API_CreateMonster(1, 200028, 221, 213, 4, 0, -1)		--品质帝国药品商人

		API_CreateMonster(2, 200002, 236, 162, 4, 0, -1)		--品质联邦胸甲商人
		API_CreateMonster(2, 200003, 236, 164, 4, 0, -1)		--品质联邦护腿商人
		API_CreateMonster(2, 200004, 236, 166, 4, 0, -1)		--品质联邦手套商人
		API_CreateMonster(2, 200005, 236, 168, 4, 0, -1)		--品质联邦靴子商人
		API_CreateMonster(2, 200006, 236, 170, 4, 0, -1)		--品质联邦腰带商人
		API_CreateMonster(2, 200007, 236, 172, 4, 0, -1)		--品质联邦披风商人
		API_CreateMonster(2, 200008, 236, 174, 4, 0, -1)		--品质联邦披风商人

		API_CreateMonster(2, 200013, 246, 161, 4, 0, -1)		--品质联邦走私商人
		API_CreateMonster(2, 200001, 246, 163, 4, 0, -1)		--品质联邦武器商人
		API_CreateMonster(2, 200009, 246, 165, 4, 0, -1)		--品质联邦饰品商人
		API_CreateMonster(2, 200010, 246, 167, 4, 0, -1)		--品质联邦其他商人
		API_CreateMonster(2, 200011, 246, 169, 4, 0, -1)		--品质联邦配方商人
		API_CreateMonster(2, 200012, 246, 171, 4, 0, -1)		--品质联邦宝石商人
		API_CreateMonster(2, 200014, 246, 173, 4, 0, -1)		--品质联邦宝石商人
	end
end


function WGQ_Heroisland(ActorID)	
	local ActorID = ActorID or API_RequestGetActorID()
	local ActorName = API_GetActorName(ActorID)


	local SelectItem = API_RequestGetNumber(1)
	if SelectItem == 326 and API_ActorIsOnline(ActorID) and API_ActorIsDying(ActorID) then
		API_ActorRelive(ActorID, API_GetActorMapID(ActorID), API_GetActorPosX(ActorID), API_GetActorPosY(ActorID), -1, -1)
		API_ActorSendMsg(ActorID, 1, "你触动了神秘的番茄，番茄大神赐予了你新的生命!")
	end


	local Year,Month,Day,Hour,Minute,Second,Week = PublicFun_time()
		API_ResponseWrite('<name>神　　石</name>')
		---------返回界面----------
		API_ResponseWrite('<text>May i help you SIR？</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text> 　①</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">免费回城</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>②</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_renascence">全面恢复</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>③</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=1">购买物品</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>④</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_monster_recall?1=1">召唤怪物</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>⑤</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=1">修改资源</a><br>')
		API_ResponseWrite('<text> 　⑥</text>')
		API_ResponseWrite('<a href="wth_khbd?1=3">避邪剑法</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>⑦</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=1">地表传送</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>⑧</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=1">地宫传送</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>⑨</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=100">形态变换</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>⑩</text>')			
		API_ResponseWrite('<a href="WGQ_Heroisland_GetTile">GetTile.</a><br>')
		API_ResponseWrite('<text>   ⑾</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=1">设置兵团</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>⑿</text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=1">副本修改</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>⒀</text>')
		API_ResponseWrite('<a href="wth_khbd?1=5">缩地成寸</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>★</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_clearall?1=1">清空背包</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>◆</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_upgrade?1=1">天天向上</a><br>')
		API_ResponseWrite('<text>   ■</text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=10">士气装备</a>')
		API_ResponseWrite('<text>　　</text>')
--		API_ResponseWrite('<text>▲</text>')
--		API_ResponseWrite('<a href="wth_khbd?1=1">挥刀自宫</a>')
--		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>※</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=1">执行代码</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>※</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_runfun?1=1">执行函数</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>●</text>')
		--API_ResponseWrite('<a href="WGQ_Heroisland_about">关于神石</a>')
		API_ResponseWrite('<a href="wth_ChangeTime?1=1">修改时间</a>')
		API_ResponseWrite('<text>    §</text>')	
		API_ResponseWrite('<a href="wth_OnlineList">查看在线</a><br>')
--		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>   □</text>')
		API_ResponseWrite('<a href="wth_khbd?1=2">获取信息</a>')
		API_ResponseWrite('<text>　　</text>')
--		API_ResponseWrite('<text>□</text>')
--		API_ResponseWrite('<text>        </text>')
	--	API_ResponseWrite('<a href="wth_SetZXTask?1=1">主线任务</a>')
		--API_ResponseWrite('<text>※</text>')
	--	if API_GetActorName(ActorID) == 'soso' then
			--	API_ResponseWrite('<a href="wth_OnlineList">查看在线</a>')
	--			API_ResponseWrite('<text> SelectItem的值为  '..SelectItem ..'</text>')
	--	end
	--	API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>□</text>')
		API_ResponseWrite('<a href="wth_zdml?1=1">总督密令</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text>□</text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=3">苏三说</a>')
--		API_ResponseWrite('<text>   §</text>')	
--		API_ResponseWrite('<a href="wth_itemtest?1=1">物品测试</a>')
		API_ResponseWrite('<text>　　  </text>')
		API_ResponseWrite('<text>★</text>')	
		API_ResponseWrite('<a href="wth_lajupinjiatest">拉锯评价</a>')
		API_ResponseWrite('<text>　　※</text>')
		API_ResponseWrite('<a href="yx_ziliaopian">资料片相关</a>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<text>服务器当前时间</text>')

		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>'..Year..'年'..Month..'月'..Day..'日'..Hour..'点'..Minute..'分'..Second..'秒..</text><br>')
		local wth_weeklist = {[1]="一",[2]="二",[3]="三",[4]="四",[5]="五",[6]="六",[7]="日",}
		if wth_weeklist[Week] ~= nil then
			API_ResponseWrite('<text>星期'..wth_weeklist[Week]..'</text>')
		end
		API_ResponseWrite('<br><br>')
--		API_ResponseWrite('<a http="http://172.16.0.236:8080/">广告位招租</a><br>')
		--API_ResponseWrite('<br>')
		--API_ResponseWrite('<img src="LuaUse\\Hero\\月女.bmp">')
		--API_ResponseWrite('<img src="TradeWnd\\下拉-d.bmp" href="WGQ_Heroisland_checksex">')
		--API_ResponseWrite('<img src="TradeWnd\\下拉-d.bmp" close="1">')		
		--API_ResponseWrite('<img src="TradeWnd\\下拉-d.bmp" http="http://172.16.0.236:8080/">')		
		--API_ResponseWrite('<img srcgd="1000" href="WGQ_Heroisland_checksex"><br>')
		API_ResponseFlush(ActorID)
end
function WGQ_Heroisland_gotohome()
	local ActorID = API_RequestGetActorID()
	local ActorCamp = API_GetActorCamp(ActorID)
	--0，红色玩家阵营：帝国
	--1，蓝色玩家阵营：联邦
	--2，系统阵营
	--3，邪恶势力
	--4，自然生物
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
	API_ActorSendMsg(ActorID, 1, "生命魔法饥饿全满!")
end

function WGQ_Heroisland_GetTile()
	local ActorID = API_RequestGetActorID()
	local MapID = API_GetActorMapID(ActorID)
	local Actor_x , Actor_y = PublicFun_GetActorPosXY(ActorID)
	local wth_StaticMapid = API_GetStaticMapID(MapID)
		API_ResponseWrite('<name>GetTile.</name>')
		API_ResponseWrite('<text>获取角色当前所在的Tile:</text><br>')
		API_ResponseWrite('<br><br>')
		if MapID == -1 or (Actor_x == 0 and Actor_y == 0) then
			API_ResponseWrite('<br><text>获取数据错误..</text><br>')
			API_ResponseWrite('<br><a>我知道了..</a><br>')
		else
			API_ResponseWrite('<br><text color="0,255,255">你所在的服务器ID为:'..nServerID..'..地图名称为: '..API_GetMapNameFromConfigID(wth_StaticMapid)..' </text>')
			API_ResponseWrite('<br><text color="0,255,255">你所在的地图ID为: '..MapID..'..其静态ID为: '..wth_StaticMapid.. ' ..配置ID为: '..API_GetMapConfigID(MapID)..' </text>')
			API_ResponseWrite('<br><text color="0,255,255">你当前的Tile为:('..Actor_x..','..Actor_y..'),,,</text><br>')
			local subisland = '并没有'
			if API_IsBranchServer() then
				subisland = '正'
			end				
			API_ResponseWrite('<br><text color="0,255,255">你当前 '..subisland..' 处于 子岛 当中</text><br>')
			API_ResponseWrite('<br><a>我知道了..</a><br>')
		end
end

function WGQ_Heroisland_GotoMap()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)

	if wthtranSelect == 1 then
		API_ResponseWrite('<name> 地表传送</name>')
		API_ResponseWrite('<text>你当前处于 '..nServerID..' 号岛服务器</text><br>')
		if not API_IsEctypeServer() or API_IsBranchServer() then
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=7">跨岛传送</a><br>')
			API_ResponseWrite('<br><text> 帝国势力范围…</text>')
			API_ResponseWrite('<text>　　       </text>')
			API_ResponseWrite('<text> 联邦势力范围…</text>')
			API_ResponseWrite('<text>　　       </text>')
			API_ResponseWrite('<text> 大众版本新地图</text>')
			API_ResponseWrite('<text>　　       </text>')
			API_ResponseWrite('<text> 维用大厦三楼</text><br>')
			--API_ResponseWrite('<text>　　       </text>')
			--API_ResponseWrite('<text> 三不管地带……</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=2">前往:帝国主城</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=3">前往:联邦主城</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=4">前往:落日农庄</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=14">前往:双子岛 </a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=5">前往:暗礁海  </a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=9">前往:麦穗平原</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=41">前往:征战平原</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=16">前往:恶鬼地穴一层</a><br>')
			-------------------------------------------------------------------------
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=8">前往:阳光雨林</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=6">前往:珊瑚之岛</a>')			
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=42">前往:娜纱湿地</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=54">前往:恶鬼地穴二层</a><br>') -- 维用大厦
			-----------------------------------------------------------------------------
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=10">前往:钢铁隧道</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<text>　　          </text>')
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=11">前往:时空走廊</a>')
			API_ResponseWrite('<text>　　        </text>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=43">前往:月幕草场</a>')
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=15">前往:镜月地下城一层</a><br>') -- 维用大厦
			--------------------------------------------------------------------------
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=12">前往:火山冰原</a>')
			API_ResponseWrite('<text>　　        </text>')
			API_ResponseWrite('<text>　　          </text>')
		--	API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=13">前往:火山冰原</a>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<text>　　          </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=44">前往:沙暴绿洲</a>')
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=55">前往:镜月地下城二层</a><br>') -- 维用大厦
			------------------------------------------------------------------------------
			API_ResponseWrite('<text>　　          </text>') --帝国
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<text>　　          </text>') -- 联邦
			API_ResponseWrite('<text>　　        </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=45">前往:叹息平原</a>') -- 大众版
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=56">前往:镜月地下城三层</a><br>')	 -- 维用大厦
			-----------------------------------------------------------------
			API_ResponseWrite('<text>　　          </text>') --帝国
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<text>　　          </text>') -- 联邦
			API_ResponseWrite('<text>　　        </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=46">前往:众神领域</a>') -- 大众版
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=49">前往:梦幻城一层(藏宝)</a><br>') -- 维用大厦
			-----------------------------------------------------------------
			API_ResponseWrite('<text>　　          </text>') --帝国
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<text>　　          </text>') -- 联邦
			API_ResponseWrite('<text>　　        </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=47">前往:鸣沙沙漠</a>') -- 大众版
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=50">前往:梦幻城二层(死魂)</a><br>') -- 维用大厦
			-------------------------------------------------------------------
			API_ResponseWrite('<text>　　          </text>') --帝国
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<text>　　          </text>') -- 联邦
			API_ResponseWrite('<text>　　        </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=48">前往:光明遗迹</a>') -- 大众版
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=51">前往:梦幻城三层(神龙)</a><br>') -- 维用大厦			
			-----------------------------------------------------------------------
			API_ResponseWrite('<text>　　          </text>') --帝国
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<text>　　          </text>') -- 联邦
			API_ResponseWrite('<text>　　        </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=53">前往:夜莺山谷</a>') -- 大众版
			API_ResponseWrite('<text>　　          </text>') -- 空白分隔带
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=52">前往:梦幻城四层(炼狱)</a><br>')  -- 维用大厦
		else
			API_ResponseWrite('<text> 你当前位于专用副本服务器中，暂不提供此功能，请先回城再做尝试…</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">免费回城</a><br>')
		end
		API_ResponseWrite('<br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
	elseif wthtranSelect == 2 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 1, 219, 209)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国主城")
	elseif wthtranSelect == 3 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 2, 250, 151)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦主城")	
	elseif wthtranSelect == 4 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 99, 263, 492)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:落日农庄")
	elseif wthtranSelect == 5 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 9, 151, 386)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:暗礁海")
	elseif wthtranSelect == 6 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 10, 131, 308)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦珊瑚群岛")
	elseif wthtranSelect == 7 then
		API_ResponseWrite('<name> 岛间传送</name>')
		if API_IsBranchServer() then 
			for k, v in pairs(wth_Globe_serverlist) do
				if API_ServerIsOpen(v) then
					--local indexw = k + 20
					if v == nServerID then
						API_ResponseWrite('<text>前往:'..v..'号岛 [ 当前所在岛屿，无须传送 ]</text><br>')
					else
						API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=20&2='..v..'">前往:'..v..'号岛</a><br>')
					end
				end
			end
		else 
			API_ResponseWrite('<text>去子岛换去，这里换岛客户端要挂掉。</text>')
		end

		API_ResponseWrite('<br><a href="WGQ_Heroisland">返回..</a>')
	elseif wthtranSelect == 8 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 23, 118, 337)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:阳光雨林[帝国]")	
	elseif wthtranSelect == 9 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 25, 131, 319)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:麦穗平原[联邦]")	
	elseif wthtranSelect == 10 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 70, 101, 230)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:钢铁隧道")	
	elseif wthtranSelect == 11 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 71, 155, 19)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:时空走廊")	
	elseif wthtranSelect == 12 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 8, 428, 778)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:火山冰原")	
	elseif wthtranSelect == 13 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 8, 391, 459)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:火山冰原")
	elseif wthtranSelect == 41 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 100, 526, 447)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:征战平原")
	elseif wthtranSelect == 42 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 98, 367, 368)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:娜纱湿地")
	elseif wthtranSelect == 43 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 101, 286, 373)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:月幕草场")
	elseif wthtranSelect == 44 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 102, 430, 700)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:沙暴绿洲")
	elseif wthtranSelect == 45 then
		wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 113, 96, 404)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:叹息平原")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 46 then
		wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 120, 250, 236)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:众神领域")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 47 then
		wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 112, 256, 269)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:鸣沙沙漠")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 48 then
		wth_UnRegfukongdao(ActorID)
		local playercamp = API_GetActorCamp(ActorID)
		if playercamp == 1 then		
			API_ActorGoToMap(ActorID, 111, 359, 190)
			API_ActorSendMsg(ActorID, 2, "欢迎来到：光明遗迹－魔幻镇")
		elseif playercamp == 0 then
			API_ActorGoToMap(ActorID, 111, 216, 522)
			API_ActorSendMsg(ActorID, 2, "欢迎来到：光明遗迹－幻影镇")
		else
			API_ActorSendMsg(ActorID, 2, "这里不欢迎其他星系的来访者")
		end
	elseif wthtranSelect == 49 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 114, 216, 203)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:梦幻城一层(藏宝)")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 50 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 115, 231, 396)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:梦幻城二层(死魂)")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 51 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 116, 187, 78)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:梦幻城三层(神龙)")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 52 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 117, 99, 214)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:梦幻城四层(炼狱)")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 53 then
		--wth_UnRegfukongdao(ActorID)
		--API_ActorGoToMap(ActorID, 110, 194, 487)
		--API_ActorSendMsg(ActorID, 2, "欢迎来到:夜莺山谷")
		API_ActorSendMsg(ActorID, 2, "该地图暂时停止传送")
	elseif wthtranSelect == 14 then
		wth_UnRegfukongdao(ActorID)
		local playercamp = API_GetActorCamp(ActorID)
		if playercamp == 1 then		
		API_ActorGoToMap(ActorID, 104, 442, 290)
		API_ActorSendMsg(ActorID, 2, "这里可是双子岛哦")
		elseif playercamp == 0 then
		API_ActorGoToMap(ActorID, 104, 437, 581)
		API_ActorSendMsg(ActorID, 2, "帝国角色都是坏人")
		else
		API_ActorSendMsg(ActorID, 2, "这里不欢迎其他星系的来访者")
		end
	elseif wthtranSelect == 15 then
		wth_UnRegfukongdao(ActorID)
		local playerCamp = API_GetActorCamp(ActorID)
		if playerCamp == 1 then
			API_ActorGoToMap(ActorID,105,222,210)
		else
			API_ActorGoToMap(ActorID,105,418,391)
		end
		API_ActorSendMsg(ActorID,2, "镜月城一层，小心易碎")
	elseif wthtranSelect == 16 then
		wth_UnRegfukongdao(ActorID)
		local playerCamp = API_GetActorCamp(ActorID)
		if playerCamp == 1 then
			API_ActorGoToMap(ActorID,108,145,250)
		else
			API_ActorGoToMap(ActorID,108,430,407)
		end
		API_ActorSendMsg(ActorID,2, "恶鬼地穴一层~")
	elseif wthtranSelect == 54 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID,109,240,264)
		API_ActorSendMsg(ActorID,2, "恶鬼地穴二层~")
	elseif wthtranSelect == 55 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID,106,426,253)
		API_ActorSendMsg(ActorID,2, "镜月地下城二层~")
	elseif wthtranSelect == 56 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID,107,152,225)
		API_ActorSendMsg(ActorID,2, "镜月地下城三层~")

	elseif wthtranSelect == 20 then
		local wth_island = API_RequestGetNumber(2)
		local wthMapid = API_GetActorMapID(ActorID)
		local wthMapX = API_GetActorPosX(ActorID)
		local wthMapY = API_GetActorPosY(ActorID)
		local wthPZid = API_GetMapConfigID(wthMapid)
		if wthMapid ~= API_GetStaticMapID(wthMapid) then
			API_ActorSendMsg(ActorID, 2, "你当前所处地图位于副本，请选择回城后再尝试跨岛传送")
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">免费回城</a><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">还是不传了..</a><br>')
		elseif wthMapid <= 0 or wthMapid == nil	then
			API_ActorSendMsg(ActorID, 2, "获取地图ID信息出错，请尝试回城后再传送")
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">免费回城</a><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">还是不传了..</a><br>')
		else
			if nServerID == wth_island then
				API_ActorSendMsg(ActorID, 2, "你就在这个岛呀")
			else
				--local realmapid = wthPZid + 150*(wth_island-1)
				API_ActorGoToMapEx(ActorID, wth_island, wthPZid, wthMapX, wthMapY)
				API_ActorSendMsg(ActorID, 2, "欢迎来到"..wth_island.."号岛的世界～")
			end
		end

	
	else
		API_ActorSendMsg(ActorID, 2, "选择有误，请重试")
	end
end


function WGQ_Heroisland_GOTODungeon()
	local ActorID = API_RequestGetActorID()
	local ActorCamp = API_GetActorCamp(ActorID)
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> 地宫传送</name>')
		API_ResponseWrite('<text> 大侠想去什么地图?我送你去吧……</text><br>')
		if not API_IsEctypeServer() or API_IsBranchServer() then
			API_ResponseWrite('<br><text> 帝国势力范围…</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=11">公民空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=12">男爵空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=13">高级男爵空间传送塔</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=14">子爵空间传送塔</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=15">高级子爵空间传送塔</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=16">伯爵空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=17">高级伯爵空间传送塔</a><br>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=18">侯爵空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=19">高级侯爵空间传送塔</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=20">公爵空间传送塔</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=21">高级公爵空间传送塔</a><br>')
			if ActorCamp == 0 then
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=22">国有资源采集区</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=23">1档资源采集区</a>')
				API_ResponseWrite('<text>         </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=24">1档资源采集区B</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=25">2档资源采集区</a>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=26">2档资源采集区</a>')	
				API_ResponseWrite('<text>       </text>')		
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=27">3档资源采集区</a><br>')
--				API_ResponseWrite('<text>       </text>')
			end
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=28">帝国英雄广场</a><br>')	
			
			API_ResponseWrite('<br><text> 联邦势力范围……</text><br>')
			--API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=7">前往:空间传送塔</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=101">公民空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=102">男爵空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=103">高级男爵空间传送塔</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=104">子爵空间传送塔</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=105">高级子爵空间传送塔</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=106">伯爵空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=107">高级伯爵空间传送塔</a><br>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=108">侯爵空间传送塔</a>')
			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=109">高级侯爵空间传送塔</a>')
--			API_ResponseWrite('<text>       </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=110">公爵空间传送塔</a><br>')
--			API_ResponseWrite('<text>       </text>')
--			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=111">高级公爵空间传送塔</a><br>')
			if ActorCamp == 1 then
--				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=112">国有资源采集区</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=113">1档资源采集区</a>')
				API_ResponseWrite('<text>         </text>')
--				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=114">1档资源采集区B</a>')
--				API_ResponseWrite('<text>       </text>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=115">2档资源采集区</a>')
				
--				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=116">2档资源采集区B</a>')	
				API_ResponseWrite('<text>       </text>')		
				API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=117">3档资源采集区</a><br>')	
--				API_ResponseWrite('<text>       </text>')
			end
			API_ResponseWrite('<a href="WGQ_Heroisland_GOTODungeon?1=118">联邦英雄广场</a><br>')	
		else
			API_ResponseWrite('<text> 你当前位于专用副本服务器中，暂不提供此功能，请先回城再做尝试…</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_gotohome">免费回城</a><br>')
		end		
		API_ResponseWrite('<text> …………………………</text><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')

		
	-- 以下为帝国空间塔传送范围	
		
	elseif wthtranSelect == 11 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 33, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国公民空间传送塔")	
	elseif wthtranSelect == 12 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 42, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国男爵空间传送塔")		
	elseif wthtranSelect == 13 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 43, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国高级男爵空间传送塔")		
	elseif wthtranSelect == 14 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 44, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国子爵空间传送塔")		
		
	elseif wthtranSelect == 15 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 45, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国高级子爵空间传送塔")		
	
	elseif wthtranSelect == 16 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 46, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国伯爵空间传送塔")		
	
	elseif wthtranSelect == 17 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 47, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国高级伯爵空间传送塔")			
	
	elseif wthtranSelect == 18 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 48, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国侯爵空间传送塔")	
		
	elseif wthtranSelect == 19 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 49, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国高级侯爵空间传送塔")		
		
	elseif wthtranSelect == 20 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 50, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国公爵空间传送塔")		
		
	elseif wthtranSelect == 21 then	
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 51, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国高级公爵空间传送塔")		
		
	elseif wthtranSelect == 22 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 18, 185, 191)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:国有资源采集区")

	elseif wthtranSelect == 23 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 11, 188, 194)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:1档资源采集区")	
	elseif wthtranSelect == 24 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 12, 187, 192)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:1档资源采集区B")
	elseif wthtranSelect == 25 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 17, 185, 190)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:2档资源采集区")
	elseif wthtranSelect == 26 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 84, 185, 190)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:2档资源采集区B")	
	elseif wthtranSelect == 27 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 86, 185, 190)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:3档资源采集区A")	
	elseif wthtranSelect == 28 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 92, 127, 78)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:帝国英雄广场")	

	-- 以下为联邦空间传送塔范围
		
	elseif wthtranSelect == 101 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 32, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦公民空间传送塔")	
		
	elseif wthtranSelect == 102 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 52, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦男爵空间传送塔")	
	elseif wthtranSelect == 103 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 53, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦高级男爵空间传送塔")	
		
	elseif wthtranSelect == 104 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 54, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦子爵空间传送塔")			
		
	elseif wthtranSelect == 105 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 55, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦高级子爵空间传送塔")	
	elseif wthtranSelect == 106 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 56, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦伯爵空间传送塔")	
	elseif wthtranSelect == 107 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 57, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦高级伯爵空间传送塔")			
	elseif wthtranSelect == 108 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 58, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦侯爵空间传送塔")	
	elseif wthtranSelect == 109 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 59, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦高级侯爵空间传送塔")	
	elseif wthtranSelect == 110 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 60, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦公爵空间传送塔")	
	elseif wthtranSelect == 111 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 61, 131, 90)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦高级公爵空间传送塔")	
	elseif wthtranSelect == 112 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 20, 185, 191)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:国有资源采集区")
	elseif wthtranSelect == 113 then
		wth_UnRegfukongdao(ActorID)	
		API_ActorGoToMap(ActorID, 13, 188, 194)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:1档资源采集区")	
	elseif wthtranSelect == 114 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 14, 187, 192)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:1档资源采集区B")
	elseif wthtranSelect == 115 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 19, 185, 190)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:2档资源采集区")
	elseif wthtranSelect == 116 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 83, 185, 190)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:2档资源采集区B")		
	elseif wthtranSelect == 117 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 85, 185, 190)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:3档资源采集区")	
	elseif wthtranSelect == 118 then
		wth_UnRegfukongdao(ActorID)
		API_ActorGoToMap(ActorID, 91, 127, 78)
		API_ActorSendMsg(ActorID, 2, "欢迎来到:联邦英雄广场")	
		
	else
		API_ActorSendMsg(ActorID, 2, "选择有误，请重试")
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
  			API_ActorSendMsg(ActorID, 2, "你的士气装备栏已满，添加失败")
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
		API_ResponseWrite('<name> 添加士气装备 </name>')
		--API_ResponseWrite('<text color="232,164,23">对抗副本数据设置:</text><br>')
		API_ResponseWrite('<text>请输入你想要在士气装备栏添加的士气装备ID..</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>输入ID:</text><input type="number" name="11" size="20">')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_equip?1=1">就这样了..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_equip?1=2">清除全部士气装备..</a><br>')

	elseif wthStatusSelect == 11 then
		API_ActorAddStatus(ActorID,205001,999999999999) --免疫所有伤害
		API_ActorAddStatus(ActorID,204001,999999999999) --免疫所有状态控制

	elseif wthStatusSelect == 12 then   --他杀
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
		--加速
		API_ActorAddStatus(ActorID,38001,99999999)
		--持续加血
		API_ActorAddStatus(ActorID,32008,99999999)
		--持续加蓝
		API_ActorAddStatus(ActorID,33008,99999999)
		--持续加饥饿
		API_ActorAddStatus(ActorID,34005,99999999)
		--辉耀
		API_ActorAddStatus(ActorID,316020,99999999)
		--伤害吸收
		API_ActorAddStatus(ActorID,318020,99999999)
		--重压光环
		API_ActorAddStatus(ActorID,319020,99999999)
		--自然之助
		API_ActorAddStatus(ActorID,321020,99999999)
		--隐身光环
		API_ActorAddStatus(ActorID,323020,99999999)
		--隐身
		API_ActorAddStatus(ActorID,324020,99999999)
		--自动之火
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
		API_ActorRemoveStatus(ActorID,38001) --狗的速度,加速同时免疫定身\减速
		API_ActorRemoveStatus(ActorID,285020) --狂暴
		API_ActorRemoveStatus(ActorID,301020) --真龙
		API_ActorRemoveStatus(ActorID,282020) --生命图腾范围加血
		API_ActorRemoveStatus(ActorID,33008) --和平增加MP
		API_ActorRemoveStatus(ActorID,280020) --舞刃风暴
		API_ActorRemoveStatus(ActorID,299020) --潜行
		API_ActorRemoveStatus(ActorID,205001) --潜行
		API_ActorRemoveStatus(ActorID,204001) --潜行
		API_ActorRemoveStatus(ActorID,44001) --加速
		API_ActorRemoveStatus(ActorID,32008) --加速
		API_ActorRemoveStatus(ActorID,34005) --加速
		API_ActorRemoveStatus(ActorID,316020) --加速
		API_ActorRemoveStatus(ActorID,318020) --加速
		API_ActorRemoveStatus(ActorID,319020) --加速
		API_ActorRemoveStatus(ActorID,321020) --加速
		API_ActorRemoveStatus(ActorID,323020) --加速
		API_ActorRemoveStatus(ActorID,324020) --加速
		API_ActorRemoveStatus(ActorID,326020) --加速
		API_ActorRemoveStatus(ActorID,45100) --加速
		API_ActorRemoveStatus(ActorID,45200) --加速
		API_ActorRemoveStatus(ActorID,45300) --加速
		API_ActorRemoveStatus(ActorID,45400) --加速
		API_ActorRemoveStatus(ActorID,45500) --加速
		API_ActorRemoveStatus(ActorID,45600) --加速
		local wth_10000occ
		repeat				--清除飞行鞋道具
			wth_10000occ = API_ActorGetGoodsOfMorale(ActorID, 10000)   ---- 这个变量不能local，否则会比较出错，只能清除一个装备
			if wth_10000occ >= 0 then
				API_ActorRemoveGoodsFromMorale(ActorID, wth_10000occ, "")
			end
		until wth_10000occ < 0 or wth_10000occ == nil
		for k,v in ipairs(fhjhd_bianshentangguobufftable) do
			API_ActorRemoveStatus(ActorID,v)
		end
		
	elseif wthStatusSelect == 100 then
		API_ResponseWrite('<name> 变形记</name>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=1">加速</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=2">狂暴</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=3">真龙</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=4">回血</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=5">回魔</a><br><br>')

		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=6">自杀</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=7">舞刃</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=8">买鞋</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=9">隐身</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=11">无敌</a><br><br>')

		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=12">他杀</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=14">变形</a>')
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=13">赛亚人</a>')
		API_ResponseWrite('<br><br>')

		API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=99">清除所有</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a>')	
	else
		API_ActorSendMsg(ActorID, 2, "选择有误，请重试")
	end
end

function WGQ_Heroisland_Getgoods()
	local wthStatusSelect = API_RequestGetNumber(1)
	local ActorID = API_RequestGetActorID()
	if wthStatusSelect == 1 then
		API_ResponseWrite('<name> 购买物品</name>')
		API_ResponseWrite('<text>购买物品填写ID,数量默认时为1.建设节约社会,请勿乱刷!</text><br>')
		API_ResponseWrite('<text>你主背包第一格物品的ID为 :</text><text color="0,255,255">'..API_ActorPackageGetLocGoodsID(ActorID, 0, 0)..'     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=1">重新获取ID</a><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>物品编号:</text><input type="number" name="8" size="10">')
		API_ResponseWrite('<text>      物品数量:</text><input type="number" name="9" size="9"><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland_Getgoods?1=2">正是此物.</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland_Getgoods?1=4">高级购买</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland_Getgoods?1=3">聊天石即点即送，送完为止..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
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
			API_ActorSendMsg(ActorID, 2, "这个世界没有你想要的东西,请投胎后再试. >_<")

		elseif GoodsID == 80622 or GoodsID == 80623 then
		--if GoodsID == 80622 or GoodsID == 80623 then
			API_AddActorGoods(ActorID,GoodsID, GoodsNum,"神石添加")
			API_ActorSendMsg(ActorID, 2, "你免费获得"..GoodsNum.."个"..GoodsName.."..")
			
		else
			local wth_canAddGoods = API_ActorCanAddGoods(ActorID, GoodsID, GoodsNum, 0, 0)
			if wth_canAddGoods > -1 then
				for i = 1,GoodsNum do
					API_AddActorGoods(ActorID, GoodsID, 1,"")
				end
				API_ActorSendMsg(ActorID, 2, "你免费获得"..GoodsNum.."个"..GoodsName.."..")
			else
				API_ActorSendMsg(ActorID, 2, "好像你背包满了?请整理一下再添加吧,")
			end
		end
	else
		local wth_canAddGoods = API_ActorCanAddGoods(ActorID, GoodsID, GoodsNum, 0, 0)
			if wth_canAddGoods > -1 then
				API_AddActorGoods(ActorID,GoodsID,GoodsNum,"神石一次性添加")
				API_ActorSendMsg(ActorID, 2, "你已经获得"..GoodsNum.."个"..GoodsName.." ")
			else
				API_ActorSendMsg(ActorID, 2, "背包空间不足或物品id错误")
			end
	end


	elseif wthStatusSelect == 3 then
		local wth_canAddGoods = API_ActorCanAddGoods(ActorID, 80397, 999, 0, 0)
		if wth_canAddGoods > -1 then
			API_AddActorGoods(ActorID, 80397, 1000,"")
			API_ActorSendMsg(ActorID, 2, "你免费获得1000个聊天石，请放声歌唱吧～")
		else
			API_ActorSendMsg(ActorID, 2, "好像你背包满了?请整理一下再添加吧,")
		end
	
	elseif wthStatusSelect == 4 then 
		API_ResponseWrite('<name> 购买物品</name>')
		API_ResponseWrite('<text>你主背包第一格物品的ID为 :</text><text color="0,255,255">'..API_ActorPackageGetLocGoodsID(ActorID, 0, 0)..'     </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=4">重新获取ID</a><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>请选择你要购买的物品ID及数量</text><br>')
		API_ResponseWrite('<text>开始ID：</text><input type="number" name="12" size="10">')
		API_ResponseWrite('<text>结束ID：</text><input type="number" name="13" size="10"><br>')
		API_ResponseWrite('<text>数量：  </text><input type="number" name="14" size="10"><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_Getgoods?1=67">就这样了</a>')	

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
					API_ActorSendMsg(ActorID,2,"成功添加"..GoodName..""..goumainum.."个")
				else
					API_ActorSendMsg(ActorID, 2, "无法购买，可能是背包空间不足")
				break
				end
			end
			else
			API_ActorSendMsg(ActorID,2,"你想要买什么,你想要就说啊,你不说我怎么知道你想要什么.也不可能你说不要我偏偏给你...")
		end
	end
end


function WGQ_Heroisland_monster_recall()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name>刷怪</name>')
		API_ResponseWrite('<text>请输入怪物编号：</text><br>')
		API_ResponseWrite('<text>例如 联邦物理血兵(40级):4040  帝国物理血兵(40级):5040 </text><br>')
		API_ResponseWrite('<input type="number" name="6" size="10"><br>')
		API_ResponseWrite('<text>请输入怪物数量(不输则默认为1个)：</text><br>')
		API_ResponseWrite('<input type="number" name="7" size="2"><br><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_monster_recall?1=2">开刷</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">走人</a><br>')
	elseif wthtranSelect == 2 then
		local MonsterCode = API_RequestGetNumber(6)
		local MonsterNum = API_RequestGetNumber(7)	
		local MapID = API_GetActorMapID(ActorID)
		local Actor_x , Actor_y = PublicFun_GetActorPosXY(ActorID)
		if MonsterNum == 0 then
			MonsterNum = 1
		end
		if MonsterCode == 0 then
			API_ActorSendMsg(ActorID, 2, "ID都不填,你想刷what?.")
		else
			--local wth_MonsterName = ''
			--wth_MonsterNmae = API_GetMonsterNameByID(MonsterCode)
			--if wth_MonsterNmae == '' then
			--	API_ResponseWrite('<name>可耻滴刷怪失败</name>')
			--	API_ResponseWrite('<br><text>你非常可耻滴刷怪失败鸟～</text><br>')
			--	API_ResponseWrite('<text>请检查你输入的怪物编号是否正确。</text><br><br>')
			--	API_ResponseWrite('<a href="WGQ_Heroisland_monster_recall?1=1">重试</a><br>')
			--else	
				local monsterFastid = nil	
				for i = 1,MonsterNum do
					monsterFastid = API_CreateMonster(MapID, MonsterCode, Actor_x, Actor_y , 4 , 0 , -1)
					if monsterFastid < 0 then
						API_TraceError(API_GetActorName(ActorID).."可耻的刷怪失败了。")
						API_ActorBroadcastMsg(-1,17,"衰人"..API_GetActorName(ActorID).."可耻的刷怪失败，获得群嘲效果")
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
		API_ResponseWrite('<name>修改资源</name>')
		API_ResponseWrite('<text color="232,164,23">修改资源:</text><br>')
		API_ResponseWrite('<text>填入想要改变的数值,,需要做什么点对应的选项..</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>输入数值:</text><input type="number" name="7" size="10">')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=2">金钱</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=3">士气</a>')
		API_ResponseWrite('<text>    </text>')		
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=4">功勋</a>')
		API_ResponseWrite('<text>    </text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=7">浮空岛声望</a>')
		API_ResponseWrite('<text>    </text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=15">灵魂力</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=5">大爷钱多..</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=6">低调，一定要低调..</a><br><br>')
		--if API_GetConsortiaId(ActorID) ~= 0 and nServerID == API_GetConServerID(API_GetConsortiaId(ActorID)) then
		if API_GetConsortiaId(ActorID) ~= 0  then
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=8">增加佣兵团贡献度</a>')
			API_ResponseWrite('<text>    </text>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=9">扣除佣兵团贡献度</a>')
			API_ResponseWrite('<text>    </text>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=16">增加佣兵团活跃值</a>')
			API_ResponseWrite('<text>    </text>')	
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=17">减少佣兵团活跃值</a>')
			API_ResponseWrite('<text>    </text>')
		end
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=20">增加宠物经验</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=10">水晶币也是钱啊</a>')
		API_ResponseWrite('<text>    </text>')	
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=11">水晶币真不值钱</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=12">交互数据查询</a>')
		API_ResponseWrite('<text>    </text>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=13">交互数据修改</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">我再想想..</a><br>')
	elseif wthtranSelect == 2 then
		local AddMoney = API_RequestGetNumber(7)
		API_ActorAddMoneyUnStat(ActorID, AddMoney,0,"神石修改")
		API_ActorSendMsg(ActorID, 2, "你增加了"..AddMoney.."金..")
	elseif wthtranSelect == 3 then
		local AddMorale = API_RequestGetNumber(7)
		API_ActorAddMorale(ActorID, AddMorale,0,"神石修改")
		API_ActorSendMsg(ActorID, 2, "你增加了"..AddMorale.."士气..")
	elseif wthtranSelect == 4 then
		local AddExp = API_RequestGetNumber(7)
		API_ActorAddExp(ActorID, AddExp,0,"神石修改")
		API_ActorSendMsg(ActorID, 2, "你增加了"..AddExp.."功勋..")
	elseif wthtranSelect == 5 then
		local AddMoney = API_RequestGetNumber(7)
		API_ActorAddMoneyUnStat(ActorID, -AddMoney,0,"神石修改")
		API_ActorSendMsg(ActorID, 2, "你减少了"..AddMoney.."金..")
	elseif wthtranSelect == 6 then
		local AddExp = API_RequestGetNumber(7)
		API_ActorAddExp(ActorID, -AddExp,0,"神石修改")
		API_ActorSendMsg(ActorID, 2, "你减少了"..AddExp.."功勋..")
	elseif wthtranSelect == 7 then
		API_VarDataSetNumber(ActorID, 1, GLOBAL_FuKongDaoShengWang, API_RequestGetNumber(7))  --- 18267
		API_ActorSendMsg(ActorID, 2, "你的浮空岛声望已设置为"..API_RequestGetNumber(7))
	elseif wthtranSelect == 10 then
		API_ActorShoppingM_Add(ActorID, API_RequestGetNumber(7), 0, "神石修改")
		API_ActorSendMsg(ActorID, 2, "你的水晶币增加了"..API_RequestGetNumber(7))
	elseif wthtranSelect == 11 then
		API_ActorShoppingM_Reduce(ActorID, -API_RequestGetNumber(7), 0, "神石修改")
		API_ActorSendMsg(ActorID, 2, "你的水晶币被系统吞了"..API_RequestGetNumber(7))
	elseif wthtranSelect == 12 then
		local playerVar = API_VarDataGetNumber(ActorID, 1, API_RequestGetNumber(7))
		API_ActorSendMsg(ActorID, 2, "你所查询的交互数据 "..API_RequestGetNumber(7).." 的值为: "..playerVar)
	elseif wthtranSelect == 13 then
		API_ResponseWrite('<name>修改交互数据</name>')
		local playerVar = API_RequestGetNumber(7)
		if playerVar > 1 then
			API_ResponseWrite('<text color="232,164,23">警告:</text><br>')
			API_ResponseWrite('<text color="255,0,0">修复的设置交互数据将可能导致服务器严重报错甚至宕机. 请确认你修改的数据正确.</text><br><br>')
			API_ResponseWrite('<text color="255,0,0">如果你不输入数据就提交,或输入 0 提交,则相当于删除该交互数据!!!</text><br><br>')
			API_ResponseWrite('<text>请输入你想修改该交互数据的值:</text><input type="number" name="8" size="15"><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=14&2='..playerVar..'">修改</a><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">我再想想..</a><br>')
		else
			API_ResponseWrite('<text>你输入的交互数据Key并不是合法的交互数据Key值.</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetResource?1=1">返回..</a><br>')
		end

	elseif wthtranSelect == 14 then
		local playerVar = API_RequestGetNumber(2)
		API_VarDataSetNumber(ActorID, 1, playerVar, API_RequestGetNumber(8))
		API_ActorSendMsg(ActorID, 2, "你的交互数据 "..playerVar.." 已修改为: "..API_RequestGetNumber(8))

	elseif wthtranSelect == 20 then
		local PetExp = API_RequestGetNumber(7)
		API_ActorAddPetExp(ActorID,PetExp,0,'神石加经验')
		API_ActorSendMsg(ActorID,2,"你的宠物增加了"..PetExp.."点经验")

	elseif wthtranSelect == 15 then
		local addlhl = API_RequestGetNumber(7)
		API_VarDataSetNumber(ActorID, 1, 7611, addlhl)
		API_ActorSendMsg(ActorID, 2, "你的灵魂力已修改为 "..addlhl)

	elseif wthtranSelect == 8 then
		local AddYbt = API_RequestGetNumber(7)
		local currYbt = API_GetCorpsContribute(ActorID)
		if (currYbt + AddYbt) <= 65535 then
			API_AddAddCorpsContribute(ActorID, AddYbt)
			API_ActorSendMsg(ActorID, 2, "你的佣兵团贡献度增加了"..AddYbt.."。当前贡献度总计为 "..API_GetCorpsContribute(ActorID))
		else
			AddYbt = 65535 - currYbt
			API_AddAddCorpsContribute(ActorID, AddYbt)
			API_ActorSendMsg(ActorID, 2, "你当前的佣兵团贡献度已达到上限65535点")

		end
	elseif wthtranSelect == 9 then
		local AddYbt = API_RequestGetNumber(7)
		local currYbt = API_GetCorpsContribute(ActorID)
		if (currYbt - AddYbt) >= 0 then
			API_AddAddCorpsContribute(ActorID, -AddExp)
			API_ActorSendMsg(ActorID, 2, "你的佣兵团贡献度降低了"..AddYbt.."。当前贡献度总计为 "..API_GetCorpsContribute(ActorID))
		else
			API_AddAddCorpsContribute(ActorID, -currYbt)
			API_ActorSendMsg(ActorID, 2, "你当前的佣兵团贡献度已设置为0")

		end	

	elseif wthtranSelect == 16 then
		local Addhyz = API_RequestGetNumber(7)
		local currhyz = API_GetCorpsActivity(ActorID)
		if (currhyz + Addhyz) <= 9999999 then
			API_AddCorpsActivity(ActorID, Addhyz)
			API_ActorSendMsg(ActorID, 2, "你的佣兵团活跃值增加了"..Addhyz)
		else 
			API_ActorSendMsg(ActorID, 2, "胡乱设置活跃值会变成布鲁")
		end	

	elseif wthtranSelect == 17 then
		local Addhyz = API_RequestGetNumber(7)
		local currhyz = API_GetCorpsActivity(ActorID)
		if (currhyz - Addhyz) >= 0 then
			API_AddCorpsActivity(ActorID, -Addhyz)
			API_ActorSendMsg(ActorID, 2, "你的佣兵团活跃值降低了"..Addhyz)
		else
			API_AddCorpsActivity(ActorID, -currYbt)
			API_ActorSendMsg(ActorID, 2, "到底是兵团抛弃了你，还是你抛弃了兵团？")

		end	



	else
		API_ActorSendMsg(ActorID, 2, "选择有误，请重试")
	end
	
end



function WGQ_Heroisland_SetCon()
	local ActorID = API_RequestGetActorID()	
	local wthtranSelect = API_RequestGetNumber(1)
	local lConsortiaId = API_GetTopConsortiaId(ActorID)
	local wth_smallYbtId = API_GetConsortiaId(ActorID)  -- 所属分兵团ID
	local wth_YbtName,wth_YbtLevel,wth_YbtJTZname,wth_YbtMoney,wth_YbtExp,wth_YbtMemberNum,wth_YbtLeftMemberNum,wth_YbtLeftYbtNum,wth_YbtLeftVipMemberNum,wth_YbtLeftVipYbtNum,wth_YbtSkillLevel1,wth_YbtSkillLevel2,wth_YbtSkillLevel3
	local wth_sYbtName,wth_sYbtLevel,wth_sYbtJTZname,wth_sYbtMoney,wth_sYbtExp,wth_sYbtMemberNum,wth_sYbtLeftMemberNum,wth_sYbtLeftYbtNum,wth_sYbtLeftVipMemberNum,wth_sYbtLeftVipYbtNum,wth_sYbtSkillLevel1,wth_sYbtSkillLevel2,wth_sYbtSkillLevel3
	local wth_YbtGrade
	if lConsortiaId ~= 0 and nServerID == API_GetConServerID(lConsortiaId) then	
		wth_YbtName = API_ConGetStrInfo(lConsortiaId, 1)   --- 佣兵团名字
		wth_YbtLevel = API_ConGetNumInfo(lConsortiaId, 7)  -- 佣兵团等级
		wth_YbtJTZname = API_ConGetStrInfo(lConsortiaId, 2)  -- 佣兵团团长名字
		wth_YbtMoney = API_ConGetNumInfo(lConsortiaId, 5)  -- 佣兵团资金
		wth_YbtExp = API_ConGetNumInfo(lConsortiaId, 6)  -- 佣兵团经验
		wth_YbtMemberNum = API_ConGetNumInfo(lConsortiaId, 3)  -- 佣兵团用户数
		wth_YbtLeftMemberNum = API_ConGetNumInfo(lConsortiaId, 11)  -- 佣兵团剩余佣兵数
		wth_YbtLeftYbtNum = API_ConGetNumInfo(lConsortiaId, 12)  -- 佣兵团剩余佣兵团数
		wth_YbtLeftVipMemberNum = API_ConGetNumInfo(lConsortiaId, 13)  -- 佣兵团剩余增值佣兵数
		wth_YbtLeftVipYbtNum = API_ConGetNumInfo(lConsortiaId, 14)  -- 佣兵团剩余增值佣兵团数
		wth_YbtSkillLevel1 = API_ConGetNumInfo(lConsortiaId, 8)  -- 佣兵团战争技能等级
		wth_YbtSkillLevel2 = API_ConGetNumInfo(lConsortiaId, 9)  -- 佣兵团商业技能等级
		wth_YbtSkillLevel3 = API_ConGetNumInfo(lConsortiaId, 10)  -- 佣兵团特殊技能等级
		
		--if lConsortiaId ~= wth_smallYbtId then
			wth_sYbtName = API_ConGetStrInfo(wth_smallYbtId, 1)   --- 佣兵团名字
			wth_sYbtLevel = API_ConGetNumInfo(wth_smallYbtId, 7)  -- 佣兵团等级
			wth_sYbtJTZname = API_ConGetStrInfo(wth_smallYbtId, 2)  -- 佣兵团团长名字
			wth_sYbtMoney = API_ConGetNumInfo(wth_smallYbtId, 5)  -- 佣兵团资金
			wth_sYbtExp = API_ConGetNumInfo(wth_smallYbtId, 6)  -- 佣兵团经验
			wth_sYbtMemberNum = API_ConGetNumInfo(wth_smallYbtId, 3)  -- 佣兵团用户数
			wth_sYbtLeftMemberNum = API_ConGetNumInfo(wth_smallYbtId, 11)  -- 佣兵团剩余佣兵数
			wth_sYbtLeftYbtNum = API_ConGetNumInfo(wth_smallYbtId, 12)  -- 佣兵团剩余佣兵团数
			wth_sYbtLeftVipMemberNum = API_ConGetNumInfo(wth_smallYbtId, 13)  -- 佣兵团剩余增值佣兵数
			wth_sYbtLeftVipYbtNum = API_ConGetNumInfo(wth_smallYbtId, 14)  -- 佣兵团剩余增值佣兵团数
			wth_sYbtSkillLevel1 = API_ConGetNumInfo(wth_smallYbtId, 8)  -- 佣兵团战争技能等级
			wth_sYbtSkillLevel2 = API_ConGetNumInfo(wth_smallYbtId, 9)  -- 佣兵团商业技能等级
			wth_sYbtSkillLevel3 = API_ConGetNumInfo(wth_smallYbtId, 10)  -- 佣兵团特殊技能等级
		--end
		 wth_YbtGrade = API_ConGetNumInfo(wth_smallYbtId, 2)  -- 分兵团等级(层次)
		
	end	
	
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> 兵团设置</name>')
		API_ResponseWrite('<text color="232,164,23">兵团设置:</text><br>')
		API_ResponseWrite('<text>填入想要设置的数值,,需要做什么点对应的选项(直接设置,不开放增加和减少)..</text><br>')
		API_ResponseWrite('<br>')
		if lConsortiaId == 0 then
			API_ResponseWrite('<text>你还未加入任何兵团,不需要设置..</text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=11">跳过佣兵团任务限制..</a><br>')
		else
			if nServerID == API_GetConServerID(lConsortiaId) then
				--local wth_YbtName = API_ConGetStrInfo(lConsortiaId, 1)
				--local wth_YbtLevel = API_ConGetNumInfo(lConsortiaId, 7)
				--API_ActorSendMsg(ActorID, 2, 'wth_YbtName'..wth_YbtName..'wth_YbtLevel'..wth_YbtLevel..'')    -- 神奇，这一行居然导致客户端百分百非法
				--if type(wth_YbtName) == 'string' then
					API_ResponseWrite('<text>你所在的佣兵团为 '..wth_YbtName..'; 该佣兵团当前等级为 '..wth_YbtLevel..'</text><br>')
				--end
				--API_ResponseWrite('<text>该佣兵团当前等级为 '..wth_YbtLevel..'</text><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=8">当前佣兵团详细信息..</a><br><br>')
				API_ResponseWrite('<text>输入数值:</text><input type="number" name="8" size="20">')
				API_ResponseWrite('<br><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=2">佣兵团经验(总兵团)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=3">佣兵团等级(总兵团)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=4">佣兵团金钱(总兵团)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=5">佣兵团科技等级(总兵团)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=6">佣兵团剩余佣兵数(所属最小兵团)..</a><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=7">佣兵团增值剩余佣兵数(所属最小兵团)..</a><br>')
				if wth_YbtGrade < 3 then	
					API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=9">剩余佣兵团数(所属最小兵团)..</a><br>')
					API_ResponseWrite('<a href="WGQ_Heroisland_SetCon?1=10">增值剩余佣兵团数(所属最小兵团)..</a><br>')
				end
			else
				API_ResponseWrite('<text>当前所属的顶级佣兵团ID  </text><text color="0,255,255">'..lConsortiaId..'</text><text>,分兵团ID </text><text color="0,255,255">'..wth_smallYbtId..' </text><br>')
				API_ResponseWrite('<text>该佣兵团创建于  </text><text color="0,255,255"> '..API_GetConServerID(lConsortiaId)..'</text><text> 号岛 </text><br>')	
				API_ResponseWrite('<text>由于当前并非该佣兵团创建岛屿，所以你在本岛查询到的佣兵团信息</text><text color="255,0,0">可能不准确 </text><br><br>')
				API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=7">请换到相应的岛屿查询和修改</a><br><br>')
			end
		end
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')	
		API_ResponseFlush(ActorID)
	elseif wthtranSelect == 2 then
		local Number = API_RequestGetNumber(8)
		if Number > 210000000 then
			API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
		else 
			API_SetConLevelExp(lConsortiaId,wth_YbtLevel,Number)
			API_ActorSendMsg(ActorID, 2, "你的佣兵团经验修改为"..Number.."经验..")
		end
	elseif wthtranSelect == 3 then
		local Number = API_RequestGetNumber(8)
		if Number > 25 then
			API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
		else 
			API_SetConLevelExp(lConsortiaId,Number,wth_YbtExp)
			API_ActorSendMsg(ActorID, 2, "你的佣兵团等级修改为"..Number.."级..")
		end
	elseif wthtranSelect == 4 then
		local Number = API_RequestGetNumber(8)
		if Number > 210000000 then
			API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
		else 
			local nowmoney = API_ConGetNumInfo(lConsortiaId,5)
			API_SetConMoney(lConsortiaId,(Number - nowmoney))
			API_ActorSendMsg(ActorID, 2, "你的佣兵团资金修改为"..Number.."金..")
		end	
	elseif wthtranSelect == 5 then	
		local Number = API_RequestGetNumber(8)
		if Number > 255 then
			API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
		else 
			API_SetConBattle(lConsortiaId, 1, Number)
			API_SetConBattle(lConsortiaId, 2, Number)
			API_SetConBattle(lConsortiaId, 3, Number)
			API_ActorSendMsg(ActorID, 2, "你的佣兵团的战争、商业、特殊技能等级修改为"..Number.."级..")
		end
	elseif wthtranSelect == 6 then   --佣兵团剩余佣兵数
		local Number = API_RequestGetNumber(8)
		if ( Number + wth_sYbtMemberNum ) > 15 then
			API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
		else 
			local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 1, Number)
			if wth_xiugaiYbt then
				API_ActorSendMsg(ActorID, 2, "你的佣兵团剩余佣兵数已修改为"..Number.."..")
			else
				API_ActorSendMsg(ActorID, 2, "修改可耻滴失败了..")
			end
		end
	
	elseif wthtranSelect == 7 then  --佣兵团增值剩余佣兵数
		local Number = API_RequestGetNumber(8)
		if ( Number + wth_sYbtLeftVipMemberNum ) > 15 then
			API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
		else 
			local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 3, Number)
			if wth_xiugaiYbt then
				API_ActorSendMsg(ActorID, 2, "你的佣兵团增值剩余佣兵数已修改为"..Number.."..")
			else
				API_ActorSendMsg(ActorID, 2, "修改可耻滴失败了..")
			end
		end
	
	elseif wthtranSelect == 8 then

		API_ResponseWrite('<name> 兵团信息</name>')
		if nServerID == API_GetConServerID(lConsortiaId) then
			API_ResponseWrite('<text>当前所属的顶级佣兵团ID  </text><text color="0,255,255">'..lConsortiaId..'</text><text>,分兵团ID </text><text color="0,255,255">'..wth_smallYbtId..' </text><br>')
			API_ResponseWrite('<text>该佣兵团创建于  </text><text color="0,255,255"> '..API_GetConServerID(lConsortiaId)..'</text><text> 号岛 </text><br>')	
			API_ResponseWrite('<text>当前所属的顶级佣兵团为  </text><text color="0,255,255">'..wth_YbtName..'</text><text>,等级为 </text><text color="0,255,255">'..wth_YbtLevel..'</text><text> ,团长为 </text><text color="0,255,255">'..wth_YbtJTZname..'</text><br>')	
			API_ResponseWrite('<text>此佣兵团拥有资金为 </text><text color="0,255,255">'..wth_YbtMoney..'</text><text>,经验为</text><text color="0,255,255">'..wth_YbtExp..'</text><text> ,兵团成员数为 </text><text color="0,255,255">'..wth_YbtMemberNum..'</text><br>')	
			API_ResponseWrite('<text>佣兵团剩余佣兵数为  </text><text color="0,255,255">'..wth_YbtLeftMemberNum..'</text><text>,佣兵团剩余佣兵团数为 </text><text color="0,255,255">'..wth_YbtLeftYbtNum..'</text><br>')		
			API_ResponseWrite('<text>佣兵团增值剩余佣兵数  </text><text color="0,255,255">'..wth_YbtLeftVipMemberNum..'</text><text>,增值剩余佣兵团数 </text><text color="0,255,255">'..wth_YbtLeftVipYbtNum..'</text><br>')		
			API_ResponseWrite('<text>战争技能等级  </text><text color="0,255,255">'..wth_YbtSkillLevel1..'</text><text>级,商业技能等级为 </text><text color="0,255,255">'..wth_YbtSkillLevel2..'</text><text>级,特殊技能等级为 </text><text color="0,255,255">'..wth_YbtSkillLevel3..'</text><text> 级</text><br>')	
			if wth_smallYbtId ~= lConsortiaId then   --属于分兵团
				API_ResponseWrite('<br><text>以下为你所属的分兵团详细信息:    </text><br>')
				API_ResponseWrite('<text>你所属的分兵团为  </text><text color="0,255,255">'..wth_sYbtName..'</text><text> 此分兵团团长为 </text><text color="0,255,255">'..wth_sYbtJTZname..' </text><br>')	
				API_ResponseWrite('<text>此佣兵团拥有资金为 </text><text color="0,255,255">'..wth_sYbtMoney..'</text><text>,经验为</text><text color="0,255,255">'..wth_sYbtExp..'</text><text> ,兵团成员数为 </text><text color="0,255,255">'..wth_sYbtMemberNum..'</text><br>')	
			API_ResponseWrite('<text>佣兵团剩余佣兵数为  </text><text color="0,255,255">'..wth_sYbtLeftMemberNum..'</text><text>,佣兵团剩余佣兵团数为 </text><text color="0,255,255">'..wth_sYbtLeftYbtNum..'</text><br>')		
			API_ResponseWrite('<text>佣兵团增值剩余佣兵数  </text><text color="0,255,255">'..wth_sYbtLeftVipMemberNum..'</text><text>,增值剩余佣兵团数 </text><text color="0,255,255">'..wth_sYbtLeftVipYbtNum..'</text><br>')		
			API_ResponseWrite('<text>战争技能等级  </text><text color="0,255,255">'..wth_sYbtSkillLevel1..'</text><text>级,商业技能等级为 </text><text color="0,255,255">'..wth_sYbtSkillLevel2..'</text><text>级,特殊技能等级为 </text><text color="0,255,255">'..wth_sYbtSkillLevel3..'</text><text> 级</text><br>')	
			else
				API_ResponseWrite('<text>你并未加入分兵团.. </text><br>')	
			end
		else
			API_ResponseWrite('<text>当前所属的顶级佣兵团ID  </text><text color="0,255,255">'..lConsortiaId..'</text><text>,分兵团ID </text><text color="0,255,255">'..wth_smallYbtId..' </text><br>')
			API_ResponseWrite('<text>该佣兵团创建于  </text><text color="0,255,255"> '..API_GetConServerID(lConsortiaId)..'</text><text> 号岛 </text><br>')	
			API_ResponseWrite('<text>由于当前并非该佣兵团创建岛屿，所以你在本岛查询到的佣兵团信息</text><text color="255,0,0">可能不准确 </text><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_GotoMap?1=7">请换到相应的岛屿查询</a><br>')
		end
		API_ResponseWrite('<br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')	
		
	elseif wthtranSelect == 9 then  -- 剩余佣兵团数
		local Number = API_RequestGetNumber(8)
		if wth_YbtGrade < 3	then	
			if ( Number + wth_sYbtLeftYbtNum ) > 6 then
				API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
			else 
				local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 2, Number)
				if wth_xiugaiYbt then
					API_ActorSendMsg(ActorID, 2, "你的佣兵团剩余佣兵团数已修改为"..Number.."..")
				else
					API_ActorSendMsg(ActorID, 2, "修改可耻滴失败了..")
				end
			end
		else
			API_ActorSendMsg(ActorID, 2, "你的佣兵团属于3级分兵团,不能再招募分兵团了")
		end

	elseif wthtranSelect == 10 then   --增值剩余佣兵团数
		local Number = API_RequestGetNumber(8)
		if wth_YbtGrade < 3	then	
			if ( Number + wth_sYbtLeftVipYbtNum ) > 6 then
				API_ActorSendMsg(ActorID, 2, "数值太大,请重新输入..")
			else 
				local wth_xiugaiYbt = API_AddConOrCorpsNum(ActorID, wth_smallYbtId, 2, Number)
				if wth_xiugaiYbt then
					API_ActorSendMsg(ActorID, 2, "你的佣兵团增值剩余佣兵团数已修改为"..Number.."..")
				else
					API_ActorSendMsg(ActorID, 2, "修改可耻滴失败了..")
				end
			end
		else
			API_ActorSendMsg(ActorID, 2, "你的佣兵团属于3级分兵团,不能再招募分兵团了")
		end
	elseif wthtranSelect == 11 then   --跳过佣兵团任务
		if lConsortiaId == 0 then
			API_VarDataSetNumber(ActorID,1,7545,2)
			API_ActorSendMsg(ActorID, 2, "恭喜你跳过了佣兵团创建任务，并成功节约5W金币。现在可以直接向佣兵团管理员创建佣兵团。")
		end
	else
		API_ActorSendMsg(ActorID, 2, "选择有误，请重试")
	end

end



function WGQ_Heroisland_SetVarData()
	local ActorID = API_RequestGetActorID()	
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name>副本修改</name>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=2">对抗副本</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=3">防守副本轮次</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=4">塔防副本轮次</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=6">清除领域创建记录</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=5">取消所有副本冷却限制</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=50">取消所有副本进入次数限制</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
	
	elseif wthtranSelect == 2 then
		API_ResponseWrite('<name> 对抗副本设置</name>')
		API_ResponseWrite('<text color="232,164,23">对抗副本数据设置:</text><br>')
		API_ResponseWrite('<text>本功能修改你参与对抗副本的记录数据，请尽量不要在副本中途修改..</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>请输入想要挑战的对抗副本等级（平民＝0，男爵＝1，高男＝2，子爵＝3，高子＝4，伯爵＝5，高伯＝6 ..</text><br>')
		API_ResponseWrite('<text>输入数值:</text><input type="number" name="8" size="20">')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>请输入该等级对抗副本已通过的次数 ..</text><br>')
		API_ResponseWrite('<text>输入数值:</text><input type="number" name="9" size="20">')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_SetZDFB">就这样了..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')	
		
	elseif wthtranSelect == 3 then
		--local MapID = API_GetActorMapID(ActorID)
		local wth_StaticMapid = API_GetStaticMapID(API_GetActorMapID(ActorID))
		API_ResponseWrite('<name> 防守副本设置</name>')
		if wth_StaticMapid == 1803 or wth_StaticMapid == 1801 or wth_StaticMapid == 1808 or wth_StaticMapid == 1809 or wth_StaticMapid == 1820 or wth_StaticMapid == 1875 or ( wth_StaticMapid >= 1831 and wth_StaticMapid <= 1837 ) then
						
			API_ResponseWrite('<text>本功能修改你防守副本的当前轮次..</text><br><br>')
			API_ResponseWrite('<text>请输入你想跳转的轮次..   </text>')
			API_ResponseWrite('<input type="number" name="111" size="5"><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=10">就这样了..</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
			
		
		else
			API_ResponseWrite('<br><text>你现在并未处于防守浮空岛中,不能修改这个数据..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')	
		end
		
	elseif wthtranSelect == 4 then
	
		local wth_StaticMapid = API_GetStaticMapID(API_GetActorMapID(ActorID))
		API_ResponseWrite('<name> 塔防副本设置</name>')
		if wth_StaticMapid == 1805 or  ( wth_StaticMapid >= 1822 and wth_StaticMapid <= 1830 ) then	
		
			API_ResponseWrite('<text>本功能修改你塔防副本的当前轮次..</text><br><br>')
			API_ResponseWrite('<text>请输入你想跳转的轮次..   </text>')
			API_ResponseWrite('<input type="number" name="111" size="5"><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=11">就这样了..</a><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
		else
			API_ResponseWrite('<br><text>你现在并未处于塔防浮空岛中,不能修改这个数据..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')	
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
		API_VarDataSetNumber(ActorID,1,7515,NowTime) -- 战歌峡谷
		API_VarDataSetNumber(ActorID,1,18414,NowTime) -- 真一副本
		API_VarDataSetNumber(ActorID,1,12117,NowTime) -- 命运之地

		API_ActorSendMsg(ActorID, 2, "冷却时间已解除...")

	elseif wthtranSelect == 6 then	
		for i = 18188,18205 do 
			API_VarDataSetNumber(ActorID,1,i,0)
		end
		API_ActorSendMsg(ActorID, 2, "领域创建记录已清除...")
	-- 下面是具体执行代码			
	elseif wthtranSelect == 10 then
	

		local MapID = API_GetActorMapID(ActorID)
		local boci = API_RequestGetNumber(111)
		if boci == 0 or boci > 100 then
			API_ResponseWrite('<name> 防守副本设置</name>')
			API_ResponseWrite('<br><text>请输入合法的轮次数据..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=1">返回..</a><br>')	
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
			API_ActorSendMsg(ActorID, 2, "你已经成功跳到第 "..boci.." 关")
		end

	elseif 	wthtranSelect == 50 then
		--防守
		API_VarDataSetNumber(ActorID,1,18106,0)
		API_VarDataSetNumber(ActorID,1,18107,0)
		--拉锯
		API_VarDataSetNumber(ActorID,1,18072,0)
		API_VarDataSetNumber(ActorID,1,18073,0)
		--塔防
		API_VarDataSetNumber(ActorID,1,18108,0)
		API_VarDataSetNumber(ActorID,1,18109,0)
		--训练营
		API_VarDataSetNumber(ActorID,1,18132,0)
		API_VarDataSetNumber(ActorID,1,18133,0)
		--夺旗
		API_VarDataSetNumber(ActorID,1,7514,0)
		API_VarDataSetNumber(ActorID,1,7515,0)
		--强者之路
		API_VarDataSetNumber(ActorID,1,18164,0)
		API_VarDataSetNumber(ActorID,1,18165,0)
		--试炼空间
		API_VarDataSetNumber(ActorID,1,18413,0)
		API_ActorSendMsg(ActorID, 2, "所有副本进入次数已经清零")


	elseif wthtranSelect == 11 then
		
		local MapID = API_GetActorMapID(ActorID)
		local lunci = API_RequestGetNumber(111)
		if lunci == 0 or lunci > 100 then
			API_ResponseWrite('<name> 塔防副本设置</name>')
			API_ResponseWrite('<br><text>请输入合法的轮次数据..</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_SetVarData?1=1">返回..</a><br>')	
		else
				
			API_SetMapVarData(MapID,GLOBAL_MAPVARDATA.lunci,lunci)
			API_ActorSendMsg(ActorID, 2, "你已经成功跳到第 "..lunci.." 关")
		
		end
		
	end
			
		
end

function WGQ_Heroisland_SetZDFB()
	local ActorID = API_RequestGetActorID()	
	local Fblevel = API_RequestGetNumber(8)
	local Fbnum = API_RequestGetNumber(9)
 	if Fblevel > 6 or Fblevel < 0 then
		API_ActorSendMsg(ActorID, 2, "请输入0-6之间的数值..")
	else
		if Fbnum < 0 or Fbnum > 9 then
			API_ActorSendMsg(ActorID, 2, "请输入0-9之间的数值..")
		else
			API_VarDataSetNumber(ActorID,1,18031,Fblevel)
			API_VarDataSetNumber(ActorID,1,18032,Fbnum)
			API_ActorSendMsg(ActorID, 2, "你的对抗副本数据已设置成功..")
		end
	end
end

function WGQ_Heroisland_clearall()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then
		--API_ResponseWrite('<text color="255,0,0">请注意本操作将清空你背包内除神石外所有物品！！！！</text><br>')
		API_ResponseWrite('<text>请选择你要清除的范围</text><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_clearall?1=2">全部清空--危险，慎重</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_clearall?1=3">仅清空小背包（即背包前两排内容保留）</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')	
	elseif wthtranSelect == 2 then
		API_ActorClearPackage(ActorID)
		--API_AddActorGoods(ActorID, 90001, 1, "")
		API_ActorSendMsg(ActorID, 2, "排出毒素，一身轻松")
	elseif wthtranSelect == 3 then
		-- add for test
		--[[
		local wth_bagHaveSize = API_ActorGetBagSize(ActorID, 0)
		local wth_onebagSize = API_ActorGetBagSize(ActorID, 1)
		local wth_allpackSize = API_ActorGetPackageSize(ActorID)
		API_ResponseWrite('<text>你的背包空间是API_ActorGetBagSize'..wth_bagHaveSize..'</text><br>')
		API_ResponseWrite('<text>你的1号小背包空间是API_ActorGetBagSize'..wth_onebagSize..'</text><br>')
		API_ResponseWrite('<text>你的整个背包空间是API_ActorGetPackageSize'..wth_allpackSize..'</text><br>') --]]--
		
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
		API_ActorSendMsg(ActorID, 2, "排出毒素，一身轻松")
	end
end

local wth_wantExp
function WGQ_Heroisland_upgrade()
	local lActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	local wth_CurrLevel = API_GetActorExpLevel(lActorID)
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> 功勋等级设置</name>')
		API_ResponseWrite('<text>本功能修改你角色的功勋等级，需要自己手动点击角色界面的升级按钮，直到升级到设定等级。</text><br>')
		API_ResponseWrite('<text>目前不提供角色降级功能。</text><br>')
		API_ResponseWrite('<text> 你当前的功勋等级为'..wth_CurrLevel..'</text><br>')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<text>请输入你需要的爵位等级数值(1-85)</text><br>')
		API_ResponseWrite('<text>输入数值:</text><input type="number" name="88" size="20">')
		API_ResponseWrite('<br>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_upgrade?1=2">就这样了..</a><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
	elseif wthtranSelect == 2 then
		wth_wantExp = API_RequestGetNumber(88)
		if wth_wantExp > 85 or wth_wantExp < 1 then
			API_ActorSendMsg(lActorID, 2, "请输入1-85之间的数值..")
		else
			if wth_CurrLevel >= wth_wantExp then
				API_ActorSendMsg(lActorID, 2, "老大，你当前的等级已经高过你想要的等级了，本脚本暂不提供降级功能")
			else
			--[[	if wth_wantExp >= 21 and wth_CurrLevel < 21 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80331, 2, '神石添加')
						API_AddActorGoods(lActorID, 80295, 3, '神石添加')
					else
						API_ActorSendMsg(lActorID, 1, "你的背包空间不足，要升级到高级男爵及以上爵位所需勋章请自行添加")
					end
				end   --]]--
				--[[if  wth_wantExp >= 26 and wth_CurrLevel < 26 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80335, 3, '神石添加')
						API_AddActorGoods(lActorID, 80297, 3, '神石添加')
					else
						API_ActorSendMsg(lActorID, 1, "你的背包空间不足，要升级到子爵及以上爵位所需勋章请自行添加")
					end
				end
				if  wth_wantExp >= 36 and wth_CurrLevel < 36 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80339, 4, '神石添加')   -- 子爵铁盾勇气勋章X4
						API_AddActorGoods(lActorID, 80304, 4, '神石添加')   --子爵铜十字胜利勋章X4
					else
						API_ActorSendMsg(lActorID, 1, "你的背包空间不足，要升级到高级子爵及以上爵位所需勋章请自行添加")
					end
				end
				if  wth_wantExp >= 41 and wth_CurrLevel < 41 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80343, 5, '神石添加')   -- 高级子爵铁盾勇气勋章X5
						API_AddActorGoods(lActorID, 80304, 5, '神石添加')   --子爵铜十字胜利勋章X5
					else
						API_ActorSendMsg(lActorID, 1, "你的背包空间不足，要升级到伯爵及以上爵位所需勋章请自行添加")
					end
				end
				if  wth_wantExp >= 51 and wth_CurrLevel < 51 then
					if API_ActorGetPackageSize(lActorID) >= 2 then
						API_AddActorGoods(lActorID, 80347, 6, '神石添加')   -- 伯爵铁盾勇气勋章X6
						API_AddActorGoods(lActorID, 80312, 6, '神石添加')   --伯爵铜十字胜利勋章X5
					else
						API_ActorSendMsg(lActorID, 1, "你的背包空间不足，要升级到高级伯爵及以上爵位所需勋章请自行添加")
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
	--	API_ActorSendMsg(lActorID, 2, "wth_CurrLevel 或 wth_wantExp 为 nil")
	--else
		if wth_CurrLevel < wth_wantExp then
			local wth_NextExp = API_GetActorNextExp(lActorID)
			local wth_CurrExp = API_GetActorCurExp(lActorID)
			if wth_CurrExp < wth_NextExp then
				API_ActorAddExp(lActorID, wth_NextExp, 0, "神石调整")
			end
			API_ActorSendMsg(lActorID, 2, "你当前的功勋已经够升级了，请手动点击升级按钮。当前功勋等级为"..wth_CurrLevel)
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
			API_ResponseWrite('<text>你输入的士气装备ID有误，请重新输入..</text><br>')
			API_ResponseWrite('<br>')
			API_ResponseWrite('<a href="WGQ_Heroisland_Dragon?1=10">重试</a><br>')
			--API_ActorSendMsg(ActorID, 2, "请输入10000-10638之间的数值..")
		else
			local wth_emptyequip = API_ActorGetEmptyOfMorale(ActorID)
			if wth_emptyequip < 0 then
				API_ActorSendMsg(ActorID, 2, "士气装备栏都满了，你就别忙乎了")
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
		API_ActorSendMsg(ActorID, 2, "士气装备清理完毕")
			
	else
		API_ActorSendMsg(ActorID, 2, "选择有误，请重试")
	end
		
end

function wth_khbd()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then	
		API_ResponseWrite('<name>葵花宝典</name>')
		API_ResponseWrite('<br><br>')
		--API_ResponseWrite('<text>功能:增加佣兵团设置..</text><br>')
		--API_ResponseWrite('<a href="wth_khbd?1=2">获取信息</a><br><br>')
	--	API_ResponseWrite('<a href="wth_khbd?1=6">学会所有英雄</a><br><br>')
		API_ResponseWrite('<a href="wth_khbd?1=3">辟邪剑法</a><br><br>')
		API_ResponseWrite('<a href="wth_khbd?1=5">缩地成寸</a><br><br>')
	--	API_ResponseWrite('<a href="wth_khbd?1=4">逃离新手</a><br><br>')
		API_ResponseWrite('<a href="wth_temp_monster?1=1">测试怪物图包</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
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
		API_ActorSendMsg(ActorID, 2, "恭喜您,超越了新手境界...")
	elseif wthtranSelect == 5 then
		API_ActorStartSelect(ActorID,'wth_Sdcc',16) 
	elseif wthtranSelect == 6 then
		for i=1,18 do
			if not API_ActorIsLearnHero(ActorID, i) then
				API_ActorLearnHero(ActorID, i)
			end
		end
		API_ActorSendMsg(ActorID, 2, "恭喜你已经神功大成，快去维护世界和平吧")

	end

end

function wth_GetInfo() 
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local shanchu = API_RequestGetNumber(6) 
	local Type = {[0]='地面',[1]='生物',[2]='玩家',}
	local TypeName = Type[SelectType] 
	if shanchu == 1 then
		API_ActorSendMsg(ActorID,1,''..API_GetMonsterName(SelectID)..'，已经删除')
		API_ActorBroadcastMsg(-1,17,"坏蛋"..API_GetActorName(ActorID).."利用非法途径干掉了"..API_GetMonsterName(SelectID)..'')
		API_TraceError(API_GetActorName(ActorID).."利用非法途径干掉了"..API_GetMonsterName(SelectID))
		API_DestroyMonster(SelectID)
		return
	end
	API_ResponseWrite('<text>点击目标类型为：'..TypeName..'</text><br>')
	if SelectType == 0 then
		API_ResponseWrite('<text>目标动态地图ID为：'..SelectID..';；静态地图ID为：'..API_GetStaticMapID(SelectID)..'；地图配置ID为：'..API_GetMapConfigID(SelectID)..'</text><br>')
	elseif SelectType == 1 then
		local wth_wlatt = API_MonsterGetPropNum(SelectID,23)   --+API_MonsterGetPropNum(SelectID,47)) * (1+API_MonsterGetPropNum(SelectID,78))
		local wth_hyatt = API_MonsterGetPropNum(SelectID,24)   --+API_MonsterGetPropNum(SelectID,48)) * (1+API_MonsterGetPropNum(SelectID,79))
		local wth_mfatt = API_MonsterGetPropNum(SelectID,25)   --+API_MonsterGetPropNum(SelectID,49)) * (1+API_MonsterGetPropNum(SelectID,80))
		API_ResponseWrite('<text>目标FastID为：'..SelectID..';MosterID为：'..API_GetMonsterID(SelectID)..'</text><br>')
		API_ResponseWrite('<text>目标物理攻击为： '..wth_wlatt..';  火药攻击为： '..wth_hyatt..';  魔法攻击为：  '..wth_mfatt..'  </text><br>')
		--API_ResponseWrite('<a href="wth_GetInfo?1='..ActorID..'&3='..SelectID..'&6=1">死神召唤</a><br>')
	elseif SelectType == 2 then
		API_ResponseWrite('<text>目标角色ID为'..SelectID..'</text><br>')
		API_ResponseWrite('<text>你和 '..API_GetActorName(SelectID)..' 之间的好感度为 '..API_GetRelation(ActorID, SelectID, 2)..'</text><br><br>')
	end
	API_ResponseWrite('<text>目标位置为'..SelectTileX..'，'..SelectTileY..'</text><br><br>')
	API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
	API_ResponseFlush(ActorID) 
	
	--[[
	API_ActorSendMsg(ActorID, 3, '点击目标类型为：'..TypeName..'') 
	if SelectType == 0 then
		API_ActorSendMsg(ActorID, 3, '目标动态地图ID为：'..SelectID..'；静态地图ID为：'..API_GetStaticMapID(SelectID)..'；地图配置ID为：'..API_GetMapConfigID(SelectID)..'') 
	elseif SelectType == 1 then
		API_ActorSendMsg(ActorID, 3, '目标FastID为：'..SelectID..';MosterID为：'..API_GetMonsterID(SelectID)..'') 
	elseif SelectType == 2 then
		API_ActorSendMsg(ActorID, 3, '目标角色ID为：'..SelectID..'') 
	end
	API_ActorSendMsg(ActorID, 3, '目标位置为'..SelectTileX..'，'..SelectTileY..'')  --]]--
end 


function wth_GodMode()
	local ActorID = API_RequestGetNumber(1) 
	local SelectType = API_RequestGetNumber(2) 
	local SelectID = API_RequestGetNumber(3) 
	local SelectTileX = API_RequestGetNumber(4) 
	local SelectTileY = API_RequestGetNumber(5) 
	local wth_ActName = API_GetActorName(ActorID)
	
	--local Type = {[0]='地面',[1]='生物',[2]='玩家',}
	--local TypeName = Type[SelectType] 
	if SelectType == 1 then     --生物  -- seleceID段在1-20间
	
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=1">驱赶</a>')  --加速
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=2">救赎</a>')  --生命恢复
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=3">封印</a>')  -- 禁止技能\移动\普攻
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=4">眩晕</a><br>')  --眩晕

	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=5">变身</a>')  --变身
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=6">超度</a>')  --自杀
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=8">重伤</a>')  --扣除HP仅余10
		API_ResponseWrite('<text>     </text>')  
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=7">净化</a><br><br>')  --去除不良
		API_ResponseWrite('<text>     </text>')  
		
		--if wth_ActName == wth_SomeName then
			API_ResponseWrite('<text>请输入你需要添加的状态ID:</text><br>')
			API_ResponseWrite('<text>输入数值:</text><input type="number" name="96" size="10"><br>')
			API_ResponseWrite('<text>请输入你需要驱除的状态ID:</text><br>')
			API_ResponseWrite('<text>输入数值:</text><input type="number" name="97" size="10"><br>')
			API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=10">就这样了</a><br><br>')  --自定义
	--	end	
		
		API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
		API_ResponseFlush(ActorID) 

	elseif SelectType == 2 then  --玩家
		local wth_ObjectName = API_GetActorName(SelectID)


		API_ResponseWrite('<text>'..wth_ObjectName..'在此,请调教:</text><br><br>')
			
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=21">神降</a>')  --加速\加血\家兰\免疫\
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=22">魔附</a>')  --
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=23">蛊随</a>')  --下毒
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=24">变身</a>')
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=25">净化</a>')
		API_ResponseWrite('<text>     </text>')
	  	API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=31">轰杀</a>')
		if API_GetRelation(ActorID, SelectID, 1) ~= 5 and API_GetActorSex(ActorID) ~= API_GetActorSex(SelectID) and API_GetActorCamp(ActorID) == API_GetActorCamp(SelectID) and API_GetRelation(ActorID,0,8) == -1 and API_GetRelation(SelectID,0,8) == -1 then
			API_ResponseWrite('<text>     </text>')
	  		API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=26">革命婚礼</a><br><br>')
		elseif API_GetRelation(ActorID, SelectID, 1) == 5 then
			API_ResponseWrite('<text>     </text>')
	  		API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=27">离婚</a><br><br>')
		elseif ActorID == SelectID and API_GetRelation(ActorID,0,8) ~= -1 then
			local PeiouID = API_VarDataGetNumber(ActorID, 1, 19001)
			API_ResponseWrite('<text>     </text>')
	  		API_ResponseWrite('<a href="wth_Gmact?1='..PeiouID..'&2=27">离婚</a><br><br>')
		else
			API_ResponseWrite('<br><br>')
		end
		
	--	if wth_ActName == wth_SomeName then
			API_ResponseWrite('<text>请输入你需要添加的状态ID:</text><br>')
			API_ResponseWrite('<text>输入数值:</text><input type="number" name="96" size="10"><br>')
			API_ResponseWrite('<text>请输入你需要驱除的状态ID:</text><br>')
			API_ResponseWrite('<text>输入数值:</text><input type="number" name="97" size="10"><br>')
			API_ResponseWrite('<a href="wth_Gmact?1='..SelectID..'&2=30">就这样了</a><br><br>')  --自定义
	--	end	

		API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
		API_ResponseFlush(ActorID) 
	end

end

function wth_Gmact()
	local ActorID = API_RequestGetActorID()
	local wth_GmSelect = API_RequestGetNumber(2) 
	local wth_ObjectID = API_RequestGetNumber(1) 

		
	if wth_GmSelect == 1 then
		API_MonsterAddStatus(wth_ObjectID, 38001, 99999999)  --狗的速度
		
	elseif wth_GmSelect == 2 then
		API_MonsterAddHP(wth_ObjectID, 999999)
		API_MonsterAddStatus(wth_ObjectID, 282020, 99999999)  --生命图腾
		API_SetMonsterName(wth_ObjectID, '被救赎的', 2)
	
	elseif wth_GmSelect == 3 then
		API_MonsterAddStatus(wth_ObjectID, 304020, 99999999)  --挟持
	
	elseif wth_GmSelect == 4 then
	--	API_MonsterAddStatus(wth_ObjectID, 331020, 99999999)  --中毒
		API_MonsterAddStatus(wth_ObjectID, 389020, 99999999)  --轰击锤眩晕
	
	elseif wth_GmSelect == 5 then
		API_MonsterAddStatus(wth_ObjectID, 303020, 99999999)  --变身
	
	elseif wth_GmSelect == 6 then
		API_MonsterAddStatus(wth_ObjectID, 284001, 99999999)  --自杀
		
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
		--API_ActorSendMsg(ActorID, 1, '当前与怪物距离为'..wth_Ndist)
		API_ActorAddMP(ActorID,999999)  -- 补兰，避免MP不足无法调用技能
		API_MonsterRemoveStatus(wth_ObjectID, 206001)  --- 去除建筑保护状态
		--API_ActorUseSkill(ActorID, 49, 1, 0, 0, 0, wth_ObjectID)   --- 先调用流矢技能攻击一下目标，避免一些有自爆AI的怪在减血后自杀不计算收益
		API_MonsterAddHP(wth_ObjectID, (10 - API_MonsterGetPropNum(wth_ObjectID,2)))  --扣为只剩10血


	--以下为玩家项
	
	
	elseif wth_GmSelect == 21 then    --神降
		API_ActorAddStatus(wth_ObjectID,38001,999999999999) --狗的速度,加速同时免疫定身\减速
		API_ActorAddStatus(wth_ObjectID,312020,999999999999) --巨熊形态
		API_ActorAddStatus(wth_ObjectID,321020,999999999999) --自然之助
		API_ActorAddStatus(wth_ObjectID,33008,999999999999) --和平增加MP
		API_ActorAddStatus(wth_ObjectID,205001,999999999999) --免疫所有伤害
		API_ActorAddStatus(wth_ObjectID,204001,999999999999) --免疫所有状态控制
		API_ActorAddStatus(wth_ObjectID,316020,999999999999) --辉耀
		API_ActorAddStatus(wth_ObjectID,33008,999999999999) --和平增加MP

		--API_ActorAddStatus(wth_ObjectID,299020,999999999999) --潜行
			
	
	elseif wth_GmSelect == 22 then  --魔附
		--API_ActorAddStatus(wth_ObjectID,280020,999999999999) --舞刃风暴
		API_ActorAddStatus(wth_ObjectID,33008,999999999999) --和平增加MP
		API_ActorAddStatus(wth_ObjectID,319020,999999999999) --重压光环
		API_ActorAddStatus(wth_ObjectID,301020,999999999999) --真龙
		API_ActorAddStatus(wth_ObjectID,306020,999999999999) --恶魔赦令--自动对周围目标造成伤害
		API_ActorAddStatus(wth_ObjectID,285020,999999999999) --狂暴
		API_ActorAddStatus(wth_ObjectID,323020,999999999999) --隐身光环
		API_ActorAddStatus(wth_ObjectID,38001,999999999999) --狗的速度,加速同时免疫定身\减速
		API_ActorAddStatus(wth_ObjectID,289020,999999999999) --极限速度
	
	
	
	elseif wth_GmSelect == 23 then
		local wth_ObjectName = API_GetActorName(wth_ObjectID)
		local wth_ActName = API_GetActorName(ActorID)
		if wth_ObjectName == wth_SomeName then
			if ActorID ~= wth_ObjectID then
				API_ActorSendMsg(wth_ObjectID, 3, '玩家'..wth_ActName..'试图对你不轨,已自食其果..')
			end
			wth_ObjectID = ActorID
		end
		
		API_ActorAddStatus(wth_ObjectID,331020,999999999999) --中毒
		API_ActorAddStatus(wth_ObjectID,298020,999999999999) --烟幕
	
	
	elseif wth_GmSelect == 24 then
		local wth_ObjectName = API_GetActorName(wth_ObjectID)
		local wth_ActName = API_GetActorName(ActorID)
		if wth_ObjectName == wth_SomeName then
			if ActorID ~= wth_ObjectID then
				API_ActorSendMsg(wth_ObjectID, 3, '玩家'..wth_ActName..'试图对你不轨,已自食其果..')
			end
			wth_ObjectID = ActorID
		end
		API_ActorRemoveStatus(wth_ObjectID,38001) --狗的速度,加速同时免疫定身\减速
		API_ActorRemoveStatus(wth_ObjectID,285020) --狂暴
		API_ActorRemoveStatus(wth_ObjectID,301020) --真龙
		API_ActorRemoveStatus(wth_ObjectID,321020) --自然之助
		API_ActorRemoveStatus(wth_ObjectID,282020) --生命图腾范围加血
		API_ActorRemoveStatus(wth_ObjectID,289020) --极限速度
		API_ActorRemoveStatus(wth_ObjectID,33008) --和平增加MP
		API_ActorRemoveStatus(wth_ObjectID,280020) --舞刃风暴
		API_ActorRemoveStatus(wth_ObjectID,299020) --潜行
		API_ActorRemoveStatus(wth_ObjectID,319020) --重压光环
		API_ActorRemoveStatus(wth_ObjectID,312020) --巨熊形态
		API_ActorRemoveStatus(wth_ObjectID,306020) --恶魔赦令
		API_ActorRemoveStatus(wth_ObjectID,331020) --中毒
		API_ActorRemoveStatus(wth_ObjectID,298020) --烟幕
		API_ActorRemoveStatus(wth_ObjectID,205001) --烟幕
		API_ActorRemoveStatus(wth_ObjectID,204001) --烟幕
		
		API_ActorAddStatus(wth_ObjectID, 303020, 99999999)  --变身
	
	elseif wth_GmSelect == 25 then
		API_ActorRemoveStatus(wth_ObjectID,38001) --狗的速度,加速同时免疫定身\减速
		API_ActorRemoveStatus(wth_ObjectID,285020) --狂暴
		API_ActorRemoveStatus(wth_ObjectID,301020) --真龙
		API_ActorRemoveStatus(wth_ObjectID,321020) --自然之助
		API_ActorRemoveStatus(wth_ObjectID,282020) --生命图腾范围加血
		API_ActorRemoveStatus(wth_ObjectID,289020) --极限速度
		API_ActorRemoveStatus(wth_ObjectID,33008) --和平增加MP
		API_ActorRemoveStatus(wth_ObjectID,280020) --舞刃风暴
		API_ActorRemoveStatus(wth_ObjectID,299020) --潜行
		API_ActorRemoveStatus(wth_ObjectID,319020) --重压光环
		API_ActorRemoveStatus(wth_ObjectID,312020) --巨熊形态
		API_ActorRemoveStatus(wth_ObjectID,306020) --恶魔赦令
		API_ActorRemoveStatus(wth_ObjectID,331020) --中毒
		API_ActorRemoveStatus(wth_ObjectID,298020) --烟幕
		API_ActorRemoveStatus(wth_ObjectID,303020) --变身
		API_ActorRemoveStatus(wth_ObjectID,205001) --无敌
		API_ActorRemoveStatus(wth_ObjectID,204001) --不受控
		API_ActorRemoveStatus(wth_ObjectID,323020) --隐身光环
		API_ActorRemoveStatus(wth_ObjectID,316020) --辉耀

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
				API_AddActorGoods(ActorID, hlgoods[k], 500, '革命婚礼')
			end
			if API_ActorCanAddGoods(wth_ObjectID, hlgoods[k], 500, 0, 0) > -1 then
				API_AddActorGoods(wth_ObjectID, hlgoods[k], 500, '革命婚礼')
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
			API_ActorBroadcastMsg(-1, 17, '风流成性的 '..API_GetActorName(ActorID)..' 抛妻弃子，另寻新欢而去。')
			API_SetActorNameEffect(ActorID, 1, 0, 0, 0, 600, '风流成性的')
			API_SetActorNameEffect(ActorID, 2, 255, 100, 200, 600, '风流成性的')
		else
			API_ActorBroadcastMsg(-1, 17, '春闺寂寞的 '..API_GetActorName(ActorID)..' 红杏出墙，另寻新欢而去。')
			API_SetActorNameEffect(ActorID, 1, 0, 0, 0, 600, '春闺寂寞的')
			API_SetActorNameEffect(ActorID, 2, 255, 100, 200, 600, '春闺寂寞的')
		end

	elseif wth_GmSelect == 31 then  --- 让他人立即死亡的效果 谨慎使用
		local wth_ActName = API_GetActorName(ActorID)
		local wth_ObjectName = API_GetActorName(wth_ObjectID)


		--API_ActorAddStatus(wth_ObjectID,284001,99)
		--API_ActorSendMsg(wth_ObjectID,3,'干扰测试不会有好下场的')
		--API_ActorSendMsg(ActorID, 3, '玩家'..wth_ObjectName..'已经被ko..')
		--API_ActorSendMsg(wth_ObjectID, 3, '........')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<text>请输入你的授权密码:</text><input type="number" name="10" size="10"><br>')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<a href="wth_Gmact?1='..wth_ObjectID..'&2=32">测试</a><br>')
		--API_ResponseWrite('<a href="wth_Gmact?1='..wth_ObjectID..'&2=32>就是要干掉'..wth_ActName..'</a><br> ')


	elseif wth_GmSelect == 32 then  --- 让他人立即死亡的效果 谨慎使用
		local wth_ObjectName = API_GetActorName(wth_ObjectID)
		local wth_ActName = API_GetActorName(ActorID)
		local putinpwd = API_RequestGetNumber(10)
		if putinpwd == 250 then 
			API_ActorSendMsg(wth_ObjectID,3,'干扰测试不会有好下场的')
			API_ActorAddStatus(wth_ObjectID,284001,99)
			API_ActorSendMsg(ActorID, 3, '玩家'..wth_ObjectName..'已经被ko..')
		else 
			API_ActorAddStatus(ActorID,284001,99)
			API_ActorSendMsg(ActorID, 3, '密码错误，自爆程序启动')
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
	API_ResponseWrite('<name> 执行代码</name>')
	if wthtranSelect == 1 then
		API_ResponseWrite('<text>输入你想执行的代码串(不能含有&号)</text><br>')
		API_ResponseWrite('<input type="string" name="3" size="9999999" width="280"><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=2">执行</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland">返回</a><br>')
		
	elseif wthtranSelect == 2 then
		local Code = API_RequestGetString(3)
		local wth_codelen = string.len(Code)
		if  type(Code) == 'string' and wth_codelen > 11 then	
			API_TraceError(''..API_GetActorName(ActorID)..'刚刚执行了代码～')
			--Code = string.gsub(Code, "ActorID", ActorID)  --- 自动替换ActorID
			--API_TraceError(''..API_GetActorName(ActorID)..'刚刚执行de代码='..Code..',其长度为'..wth_codelen..'')
			assert(loadstring(Code))()
		else
			API_ResponseWrite('<text>请输入正确的代码串</text><br>')
			API_ResponseWrite('<br><a href="WGQ_Heroisland">返回</a><br>')
		end

	elseif wthtranSelect == 3 then   -- 增加“苏三说”内容，方便打印一些角色相关的信息
		API_ResponseWrite('<text>输入你想打印的API信息(不能含有&号)</text><br>')
		API_ResponseWrite('<input type="string" name="4" size="9999999" width="280"><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_code?1=4">显示</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland">返回</a><br>')

	elseif wthtranSelect == 4 then
		local Code = API_RequestGetString(4)
		local wth_codelen = string.len(Code)
		if  type(Code) == 'string' and wth_codelen > 11 then	
			--API_TraceError(''..API_GetActorName(ActorID)..'刚刚执行了代码～')
			Code = string.gsub(Code, "ActorID", ActorID)
			local k = string.find(Code,"API")
			--local m ＝ string.find(Code,"os\.")
			--local i,j = string.find(Code,"ActorID")
			if k ~= 1 then
				Code='API_ActorSendMsg('..ActorID..', 1, '..'"'..Code..'"'..')'
			else

				Code='API_ActorSendMsg('..ActorID..', 1, '..Code..')'
			end
			assert(loadstring(Code))()
		else
			API_ResponseWrite('<text>请输入正确的代码串</text><br>')
			API_ResponseWrite('<br><a href="WGQ_Heroisland">返回</a><br>')
		end

	end
end

function WGQ_Heroisland_runfun()
	local ActorID = API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	API_ResponseWrite('<name> 执行函数</name>')
	if wthtranSelect == 1 then
		API_ResponseWrite('<text>输入你想执行的函数名</text><br>')
		API_ResponseWrite('<input type="string" name="3" size="9999999" width="280"><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland_runfun?1=2">执行</a><br>')
		API_ResponseWrite('<br><a href="WGQ_Heroisland">返回</a><br>')
		
	elseif wthtranSelect == 2 then
		local String = API_RequestGetString(3)
		local wth_codelen = string.len(String)
		if  type(String) == 'string' and wth_codelen > 6 then	
			local Function = _G[String]
			if type(Function) == 'function' then
				API_TraceError(''..API_GetActorName(ActorID)..'刚刚执行了函数，函数名为'..String..'')
				Function()
			else
				API_ResponseWrite('<text>找不到对应的函数 '..String..' </text><br>')
				API_ResponseWrite('<br><a href="WGQ_Heroisland">返回</a><br>')
			end
		else
			API_ResponseWrite('<text>请输入正确的函数名</text><br>')
			API_ResponseWrite('<br><a href="WGQ_Heroisland">返回</a><br>')
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
		API_ResponseWrite('<name> 修改时间</name>')
		API_ResponseWrite('<text>服务器当前时间:</text><br>')
		API_ResponseWrite('<text>'..Year..'年'..Month..'月'..Day..'日'..Hour..'点'..Minute..'分'..Second..'秒..</text><br>')
		API_ResponseWrite('<text>请输入你需要修改的时间(年月日留空则代表取当前数值[若合理],点分秒必须填写,不写视为修改为0):</text><br>')
		API_ResponseWrite('<text> 20</text><input type="number" name="11" size="2"><text>年</text><input type="number" name="12" size="2"><text>月</text><input type="number" name="13" size="2"><text>日</text><br>')
		API_ResponseWrite('<text>   </text><input type="number" name="14" size="2"><text>点</text><input type="number" name="15" size="2"><text>分</text><input type="number" name="16" size="2"><text>秒</text><br>')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<text>请输入你的授权密码:</text><input type="number" name="17" size="10"><br>')
		API_ResponseWrite('<text>------------------------------</text><br>')
		API_ResponseWrite('<a href="wth_ChangeTime?1=2">就这样修改了</a><br><br>')
		API_ResponseWrite('<a href="wth_ChangeTime?1=3">与现实时间同步</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
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
				--API_ActorSendMsg(ActorID, 2, "年数设置有误,最高只允许设置 "..Year.." 的±2年内的数据")
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
			if wth_Month < 8 then  -- 上半年
				if syue == 0 then
					if wth_Day == 0 then  --- 和下面的if判断,前后顺序不可变
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
			API_ActorSendMsg(ActorID, 2, "服务器时间已成功修改 ")
			API_TraceError(''..wth_PlayerName..'修改了服务器时间')
			API_ActorBroadcastMsg(-1, 17, ""..wth_PlayerName.."将服务器时间改为"..wth_Year.."-"..wth_Month.."-"..wth_Day.." "..wth_Hour..":"..wth_Minute..":"..wth_Second.." ")
		
		else
			API_ResponseWrite('<name> 修改时间</name>')
			API_ResponseWrite('<text>授权密码输入错误</text><br>')
			API_ResponseWrite('<text>服务器时间影响众多,如非必要,请勿随意修改.</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
		end
		
	elseif wthtranSelect == 3 then	
		local wth_PWD = API_RequestGetNumber(17)
		if wth_PWD == wth_ChangTimePW then
			os.execute("d:\\ourpack\\changetime.bat ".."nowtime "..wth_PlayerName)
			API_ActorSendMsg(ActorID, 2, "服务器时间已成功修改 ")
			API_TraceError(''..wth_PlayerName..'将服务器时间同步为现实时间')
			API_ActorBroadcastMsgEx(-1, -1, 0, 17, ""..wth_PlayerName.."将服务器时间同步为现实时间")
		else
			API_ResponseWrite('<name> 修改时间</name>')
			API_ResponseWrite('<text>授权密码输入错误</text><br>')
			API_ResponseWrite('<text>服务器时间影响众多,如非必要,请勿随意修改.</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
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

	API_ResponseWrite('<name> 在线查询 </name>')
	API_ResponseWrite('<text>'..nServerID..'号岛在线玩家列表:</text><br><br>')

	local wth_PlayerListLine = 0
	local wth_zenyin = {[0]="帝国",[1]="联邦",}

	for wth_ActorID in pairs(wth_OLActorIDTab) do
		local wth_OlplayerName = API_GetActorName(wth_ActorID)
		if string.len(wth_OlplayerName) < 16 then
			for k = 1,16 - string.len(wth_OlplayerName) do
				wth_OlplayerName = wth_OlplayerName..' '
			end
		end

		local wth_playerDesc = "ID: "..wth_ActorID.."   等级: "..API_GetActorExpLevel(wth_ActorID).."    阵营: "..wth_zenyin[API_GetActorCamp(wth_ActorID)].."\n所在地图: "..API_GetMapName(API_GetActorMapID(wth_ActorID)).."    地图ID: "..API_GetActorMapID(wth_ActorID).."\n爵位:  "..wth_getActorLevel(wth_ActorID)
		API_ResponseWrite('<a href="wth_TakeThisOne?1=1&2='..wth_ActorID..'" tip="'..wth_playerDesc..'">'..wth_OlplayerName..'</a>')
		API_ResponseWrite('<text>　　</text>')
		wth_PlayerListLine = wth_PlayerListLine + 1
		if math.mod(wth_PlayerListLine, 5) == 0 then
			API_ResponseWrite('<br>')
		end
	end

	API_ResponseWrite('<br><br>')
	if not API_IsEctypeServer() then
		API_ResponseWrite('<br><a href="WGQ_Heroisland_GotoMap?1=7">换个岛看看</a><br><br>')
	end
	API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
end 

function wth_TakeThisOne()
	local wthtranSelect = API_RequestGetNumber(1)
	local wth_ActorID = API_RequestGetNumber(2)
	local ActorID = API_RequestGetActorID()
	
	if wthtranSelect == 1 then
		API_ResponseWrite('<name> 在线查询 </name>')
		API_ResponseWrite('<text>'..API_GetActorName(wth_ActorID)..'在此,请调教:</text><br><br>')
		API_ResponseWrite('<a href="wth_TakeThisOne?1=2&2='..wth_ActorID..'&3=1">飞过去</a>') 
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<a href="wth_TakeThisOne?1=2&2='..wth_ActorID..'&3=2">抓过来</a>') 
		API_ResponseWrite('<text>     </text>')
		API_ResponseWrite('<br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
		if not API_IsEctypeServer() then
			API_ResponseWrite('<br><a href="WGQ_Heroisland_GotoMap?1=7">换个岛看看</a><br>')
		end

	elseif wthtranSelect == 2 then
		local wth_ActMode = API_RequestGetNumber(3)
		if wth_ActMode == 1 then
			local wth_ObjectName = API_GetActorName(wth_ActorID)
			--local sky1, sky2 = string.find(string.upper(wth_ObjectName),skyfix,1)
			--if sky1 == 1 and sky2 == string.len(skyfix) then
			--	API_ResponseWrite('<br><text>请勿干扰活动玩家。谢谢合作。</text><br><br>')
			--	API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
			--else
				--API_ActorGoToMap(ActorID, API_GetActorMapID(wth_ActorID), API_GetActorPosX(wth_ActorID), API_GetActorPosY(wth_ActorID))
				API_GotoPlayer(ActorID,wth_ActorID)
			--end
		else
			local wth_ObjectName = API_GetActorName(wth_ActorID)
			--local sky1, sky2 = string.find(string.upper(wth_ObjectName),skyfix,1)
			--if sky1 == 1 and sky2 == string.len(skyfix) then
			--	API_ResponseWrite('<br><text>请勿干扰活动玩家。谢谢合作。</text><br><br>')
			--	API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
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
	local jueweiname = {[1]="公民",[2]="男爵",[3]="高级男爵",[4]="子爵",[5]="高级子爵",[6]="伯爵",[7]="高级伯爵",[8]="侯爵",[9]="高级侯爵",[10]="公爵",[11]="高级公爵",}
	if ActorExpLevel == -1 or ActorJueweiLevel == -1 or ActorExpLevel == nil or ActorJueweiLevel == nil then
		return "该玩家状态不明"
	else
		if xueruo[ActorJueweiLevel] == nil then
			return "这烂人肯定把自己等级改的太变态了"
		else
			return (xueruo[ActorJueweiLevel] - ActorExpLevel).."等"..jueweiname[ActorJueweiLevel]
		end
	end
end


local wth_Tablist = {80421,1,715,1,727,3,765,10,770,1,766,1,767,1,782,1,770,1,770,1,782,1,901,1,902,1,903,1,904,1,905,1,}
local wth_Goods_Loc = nil
local wth_roandomMoney = nil

function wth_Choujiang()
	wth_Goods_Loc = math.random(16)
	local ActorID = API_RequestGetActorID()
	API_OpenIconTiger(ActorID, 1, wth_Goods_Loc, "老虎机", "wth_Choujiang", "wth_AddGoodsForTiger", 16, wth_Tablist)
end

function wth_ChoujiangDigt()
	wth_roandomMoney =  math.random(1000,8000)
	local ActorID = API_RequestGetActorID()
	API_OpenDigitalTiger(ActorID, 2, wth_roandomMoney, 1000, 8000, "天降横财", "金钱+", "天上掉钱了呀……", "据本台天气预报：今日深圳将普降人民币雨", "wth_ChoujiangDigt","wth_AddGoodsForTiger")
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
			API_ActorSendMsg(ActorID, 1, "恭喜你在本次抽奖中获得"..GoodsNum.."个"..GoodsName.."..")
		else
			API_ActorSendMsg(ActorID, 1, "衰人,抽奖之前也不整理背包")
		end
	elseif lDishID == 2 then
		local wth_roandomMoneyTax = math.ceil(wth_roandomMoney * 0.9)
		API_ActorAddMoneyUnStat(ActorID, wth_roandomMoneyTax, 0, "摇奖测试")
		API_ActorSendMsg(ActorID, 1, "恭喜你在本次摇奖中获得"..wth_roandomMoney.."元巨款,扣除个人所得税后收入为"..wth_roandomMoneyTax)
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
		API_ResponseWrite('<name> 任务测试</name>')
		API_ResponseWrite('<text>本功能仅供快速测试主线任务之用：</text><br>')
		API_ResponseWrite('<br><a href="wth_SetZXTask?1=2">新手速成.</a><br>')
		API_ResponseWrite('<br><a href="wth_SetZXTask?1=3">重新做人..</a><br>')
		API_ResponseWrite('<text>任务跳转,请输入要领取的任务ID (301-350)：</text><input type="number" name="11" size="3">')
		API_ResponseWrite('<a href="wth_SetZXTask?1=4"> 起跳</a><br>')
		API_ResponseWrite('<br><a href="wth_SetZXTask?1=5">重置战斗循环任务</a><br>')

		API_ResponseWrite('<br><a href="WGQ_Heroisland">返回..</a><br>')
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
		API_VarDataSetNumber(nActorID, 1, GLOBAL_FoolNewActorTaskStep, 64)  ---18338，傻瓜新手步骤
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
		API_ActorSendMsg(nActorID, 2, "所有任务数据已成功清除并重新开始主线任务")

	elseif wthStatusSelect == 4 then
		local wParam = API_RequestGetNumber(11)
		if wParam < 301 or wParam > 380 then
			API_ActorSendMsg(nActorID, 1, "你输入的任务ID非法")
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
		API_ActorSendMsg(nActorID,1,'战斗循环任务重置完毕')

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

-- 接受一个任务或是主线第一主线任务
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

-- 清除所有任务数据
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
		API_ResponseWrite('<name> 总督密令</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">查看当前密令状态</a><br><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">查看当前老相好列表</a><br><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">给自己执行清除任务数据操作</a><br><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">给自己执行清除密令数据操作</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
		
	elseif wthStatusSelect == 2 then
		API_ResponseWrite('<name>总督密令-密令状态</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">查看当前密令状态</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">查看当前老相好列表</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">给自己执行清除任务数据操作</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">给自己执行清除密令数据操作</a><br><br>')

		API_ResponseWrite('<text>当前密令轮数：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.TodayComGroNo)..'  </text>')
		API_ResponseWrite('<text>     是这一轮第几个密令：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComdNo)..'  </text>')
		API_ResponseWrite('<text>     今天已接密令次数：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.alreadyHaveComNum)..'  </text>')
		API_ResponseWrite('<br><text>上一次接到任务的日期：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.LastComTime)..'  </text>')
			
		API_ResponseWrite('<text>     当前接到的密令编号：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowHaveCKN)..'  </text>')
		if API_VarDataGetNumber(ActorID, 1, GZS_JHData.CurComGiveTime) ~= 0 then
			API_ResponseWrite('<text>     上次接到密令距今时间：</text><text color="255,0,255">   '..os.difftime(os.time(), API_VarDataGetNumber(ActorID, 1, GZS_JHData.CurComGiveTime))..'  </text>')
		end
		API_ResponseWrite('<br><text>当前接到的密令对象ID：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComJHObjeID)..'  </text>')
		if API_ActorIsOnline(API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComJHObjeID)) then
			API_ResponseWrite('<text>     当前接到的密令对象名叫：</text><text color="255,0,255">   '..API_GetActorName(API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowComJHObjeID))..'  </text><br>')
		end
		API_ResponseWrite('<text>当前密令领奖标志：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.CFEAlreadyGeiLeJL)..'  </text>')
			
		API_ResponseWrite('<text>     当前是谁的密令目标对象：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.WhoSComObj)..'  </text>')
		API_ResponseWrite('<text>     当前密令状态：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.CurCreatComStatu)..'  </text><br>')
		if API_VarDataGetNumber(ActorID, 1, GZS_JHData.inSomeOneComObjTime) ~= 0 then	
			API_ResponseWrite('<text>上次成为某玩家任务对象时距今时间：</text><text color="255,0,255">   '..os.difftime(os.time(), API_VarDataGetNumber(ActorID, 1, GZS_JHData.inSomeOneComObjTime))..'  </text><br>')
		end
		API_ResponseWrite('<text>上次成为目标对象时是哪个任务的：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.InWhichComdsObj)..'  </text>')
		API_ResponseWrite('<text>     上次协助完成时的功勋奖励数量：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.ObjSaveTimePer)..'  </text>')
		API_ResponseWrite('<text>     当前处于哪个密令的对象表中：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.NowObjComNO)..'  </text>')
		API_ResponseWrite('<br><text>总督好感度：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.ExaShootLove)..'  </text>')
		
	elseif wthStatusSelect == 3 then
		API_ResponseWrite('<name>总督密令-老相好</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">查看当前密令状态</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">查看当前老相好列表</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">给自己执行清除任务数据操作</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">给自己执行清除密令数据操作</a><br>')

		API_ResponseWrite('<br><text>其9764数据值为: </text><text color="255,0,255"> '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend_SX)..'  </text>')
		for i = 1, 9 do
			API_ResponseWrite('<br><text>老相好 '..i..' 号的ID：</text><text color="255,0,255">   '..API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend[i])..'  </text>')
			if API_ActorIsOnline(API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend[i])) then
				API_ResponseWrite('<text>  其角色名为：  </text><text color="255,0,255">   '..API_GetActorName(API_VarDataGetNumber(ActorID, 1, GZS_JHData.OldFriend[i]))..'  </text>')
			end
		end
	elseif wthStatusSelect == 4 then
		API_ResponseWrite('<name>总督密令-清数据</name>')
		API_ResponseWrite('<a href="wth_zdml?1=2">查看当前密令状态</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=3">查看当前老相好列表</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=4">给自己执行清除任务数据操作</a><br>')
		API_ResponseWrite('<a href="wth_zdml?1=5">给自己执行清除密令数据操作</a><br><br>')

		GZS_CFE_UncompletComd (ActorID)
		API_ActorSendMsg(ActorID, 1, "你的密令任务已成功清除！")
	elseif wthStatusSelect == 5 then
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.TodayComGroNo, 0)
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.NowComdNo, 0)
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.alreadyHaveComNum, 0)
		-- 时间交互数据修改
		API_VarDataSetNumber(ActorID, 1, GZS_JHData.LastComTime, 0)
		API_ActorSendMsg(ActorID, 1, "你的密令数据记录已成功清除！")
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
		API_ResponseWrite('<name>刷怪</name>')
		API_ResponseWrite('<text>一共569个怪物,每批刷20个,共29批(最后一批9个)：</text><br>')
		API_ResponseWrite('<text>请输入你要刷的批次:</text><br>')
		API_ResponseWrite('<input type="number" name="6" size="2"><br>')
		API_ResponseWrite('<a href="wth_temp_monster?1=2">开刷</a><br><br>')
		API_ResponseWrite('<a href="wth_temp_monster?1=3">打扫卫生</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">走人</a><br>')

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
			API_ResponseWrite('<name>刷怪</name>')
			API_ResponseWrite('<text>你周围3个态以内有障碍块存在,请寻一个开阔地带(推荐英雄广场)来刷怪</text><br><br>')
			API_ResponseWrite('<a href="WGQ_Heroisland">返回</a><br>')
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
		API_ResponseWrite('<name> 物品测试</name>')
		API_ResponseWrite('<text>执行本测试将清空你角色背包的所有物品，请慎重：</text><br>')
		API_ResponseWrite('<text>请输入测试的物品ID:</text><br>')
		API_ResponseWrite('<input type="number" name="6" size="6"><br>')
		API_ResponseWrite('<text>请输入测试的物品数量:</text><br>')
		API_ResponseWrite('<input type="number" name="7" size="4"><br><br>')
		API_ResponseWrite('<a href="wth_itemtest?1=2">开始测试</a><br><br>')
		--API_ResponseWrite('<a href="wth_temp_monster?1=3">打扫卫生</a><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">走人</a><br>')
	elseif wthStatusSelect == 2 then
		local goodsid = API_RequestGetNumber(6)
		local goodsnum = API_RequestGetNumber(7)
		if goodsid == 0 or API_GetGoodsName(goodsid) == '' then
			API_ResponseWrite('<name> 物品测试</name>')
			API_ResponseWrite('<text>请输入正确的物品ID</text><br>')
			API_ResponseWrite('<a href="wth_itemtest?1=1">重新输入</a><br>')
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
		API_ResponseWrite('<name> 物品测试</name>')
		API_ResponseWrite('<text>设置的物品开启需要空间大于此角色最大背包空间，请修改。</text><br><br>')
		API_ResponseWrite('<a>关闭窗口</a>')
		return
	end
	local Money = API_ActorGetPropNum(ActorID, 156)
	API_ActorAddMoneyUnStat(ActorID, -Money,0,"神石修改")

	local Allmoney = 0
	local WPlist = {}

	for i=1,goodsnum do
		API_AddActorGoods(ActorID, goodsid, 1, 'test')
		--API_ActorUseOrEquipGoods(ActorID, goodsid)
		API_ActorUseGoods(ActorID, goodsid, -1, -1, -1)

		--wth_DelayTime(3)
		if API_ActorGetGoodsNum(ActorID, goodsid) ~= 0 then
			API_ResponseWrite('<name> 物品测试</name>')
			API_ResponseWrite('<text>该测试物品使用不消耗，可能存在以下问题：</text><br><br>')
			API_ResponseWrite('<text>①、你输入的物品ID有误，此物品为不可使用物品。</text><br>')
			API_ResponseWrite('<text>②、此物品使用存在严重BUG，使用不消耗。</text><br>')
			API_ResponseWrite('<text>③、使用此物品需要其他道具或者存在使用冷却限制，本系统暂不支持此类物品测试。</text><br>')
			API_ResponseWrite('<text>此时物品数量是 '..API_ActorGetGoodsNum(ActorID, goodsid)..'物品名称是 '..API_GetGoodsName(goodsid)..'  </text><br>')
			API_ResponseWrite('<br><a>关闭窗口</a>')
			return
		else
			if  API_ActorGetPackageSize(ActorID) == Packsize then  --- 如果使用道具未获得任何物品
				API_TraceError('第 '..i..' 轮测试中使用物品未获得任何道具')
				if API_ActorGetPropNum(ActorID, 156) == 0 then   ---如果连钱也没得到
					API_ResponseWrite('<name> 物品测试</name>')
					API_ResponseWrite('<text>该测试物品使用后既未获得物品也未获得金钱，极可能存在严重BUG，请确认。</text><br><br>')
					API_ResponseWrite('<a>关闭窗口</a>')
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
							--API_TraceError('这是第 '..i..' 轮测试，第 '..k..' 个背包中，第 '..v..' 位置上物品ID为 '..wth_bagGoodsID)
							if wth_bagGoodsID > 0 then
								--API_TraceError('在第 '..i..' 轮测试中发现物品获得，物品ID为 '..wth_bagGoodsID)
								local wth_bagGoodsNum = API_ActorPackageGetLocGoodsNum(ActorID, 0, v)
								if not WPlist[wth_bagGoodsID] then
									WPlist[wth_bagGoodsID] = 0
								end
								WPlist[wth_bagGoodsID] = WPlist[wth_bagGoodsID] + wth_bagGoodsNum  -- 统计数量
							end
						end

					else

						local wth_baghave = API_ActorIsHaveBag(ActorID, k)
						if wth_baghave then
							local wth_bagHaveSize = API_ActorGetBagSize(ActorID, k)
							--API_TraceError('第 '..i..' 轮测试，第 '..k..' 个背包大小为'..wth_bagHaveSize)
							for v=0, (wth_bagHaveSize-1) do
								local wth_bagGoodsID = API_ActorPackageGetLocGoodsID(ActorID, (k+2), v)
								--API_TraceError('这是第 '..i..' 轮测试，第 '..k..' 个背包中，第 '..v..' 位置上物品ID为 '..wth_bagGoodsID)
								if wth_bagGoodsID > 0 then
								--	API_TraceError('在第 '..i..' 轮测试中发现物品获得，物品ID为 '..wth_bagGoodsID)
									local wth_bagGoodsNum = API_ActorPackageGetLocGoodsNum(ActorID, (k+2), v)
									if not WPlist[wth_bagGoodsID] then
										WPlist[wth_bagGoodsID] = 0
									end
									WPlist[wth_bagGoodsID] = WPlist[wth_bagGoodsID] + wth_bagGoodsNum  -- 统计数量
								end
							end
						end
					end
				end
			end
		end

		API_ActorClearPackage(ActorID)
		Money = API_ActorGetPropNum(ActorID, 156)						
		API_ActorAddMoneyUnStat(ActorID, -Money,0,"神石修改")
	end
	API_ResponseWrite('<name> 物品测试</name>')
	API_ResponseWrite('<text>本次测试共使用物品 '..API_GetGoodsName(goodsid)..' '..goodsnum..' 个</text><br><br>')
	API_ResponseWrite('<text>其中获得金钱 '..Allmoney..' </text><br>')
	API_ResponseWrite('<text>获得物品总列表如下： </text><br>')
	for k,v in pairs(WPlist) do
		API_ResponseWrite('<text>物品 '..API_GetGoodsName(k)..' '..v..' 个</text><br>')
	end
	API_ResponseWrite('<br><a>关闭窗口</a>')
end

local laju_pzmapid={
	[1]=1811,  -- 公民拉锯
	[2]=1804,  --子爵拉锯
	[3]=1812, -- 男爵拉锯
	[4]=1813, --高男拉锯
	[5]=1845, --高男拉锯
	[6]=1846, --伯爵拉锯
	[7]=1847, --高伯拉锯
	[8]=1848, --侯爵拉锯
	[9]=1849, --高候拉锯
	[10]=1850, --公爵拉锯
	[11]=1851, --高公拉锯
}

function wth_lajupinjiatest()
	local ActorID = API_RequestGetActorID()	
	local ActorCampID = API_GetActorCamp(ActorID)
--	local wthtranSelect = API_RequestGetNumber(1)
	local MapID = API_GetActorMapID(ActorID)
	local wth_pzMapid = API_GetMapConfigID(MapID)
	API_ResponseWrite('<name> 拉锯评价和奖励测试</name>')
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

		API_ResponseWrite('<text>帝国参与人数：'..RedActorNum..'    </text>')
		API_ResponseWrite('<text>联邦参与人数：'..BlueActorNum..'</text><br>')
		API_ResponseWrite('<text>自己杀人次数：'..ActorKillActorNum..'    </text>')
		--API_ResponseWrite('<text>阵营杀人次数：'..ActorKillConstructNum..'</text><br>')
		API_ResponseWrite('<text>自己摧毁建筑数：'..ActorKillConstructNum..'</text><br>')
		API_ResponseWrite('<text>自己杀怪数量：'..ActorKillMonsterNum..'    </text>')
		API_ResponseWrite('<text>自己摧毁城堡数：'..ActorKillCasteNum..'</text><br>')
		API_ResponseWrite('<text>自己死亡次数：'..ActorSIWANGCISHU..'    </text><br>')	
		API_ResponseWrite('<text>-------------------------------------------------------------------------------------------</text><br>')
		API_ResponseWrite('<text>本次战斗中你目前的评价为：  '..pingjiaxiuzheng..'    </text><br><br>')		
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')
		
	
	else
		API_ResponseWrite('<br><text>你现在并未处于拉锯浮空岛中..</text><br><br>')
		API_ResponseWrite('<a href="WGQ_Heroisland">返回..</a><br>')	
	end
end

function yx_ziliaopian()
	API_ResponseWrite('<name>资料片相关内容修改</name>')
	API_ResponseWrite('<text>嗯 那啥..以下是资料片部分内容的修改....</text><br><br>')
	API_ResponseWrite('<text> 　1</text>')
	API_ResponseWrite('<a href="yx_Bus?1=1">载具相关</a>')
	API_ResponseWrite('<text>　　</text>')
	API_ResponseWrite('<text> 　2</text>')
	API_ResponseWrite('<a href="yx_Bus?1=2">神兽の召唤</a>')
	API_ResponseWrite('<text>　　</text>')
	API_ResponseWrite('<text> 　3</text>')
	API_ResponseWrite('<a href="yx_Bus?1=3">PK值查询</a>')
	API_ResponseWrite('<text>　　</text>')
	API_ResponseWrite('<text> 　4</text>')
	API_ResponseWrite('<a href="yx_Bus?1=4">房屋系统</a>')
end

function yx_Bus()
	local ActorID = ActorID or API_RequestGetActorID()
	local wthtranSelect = API_RequestGetNumber(1)
	if wthtranSelect == 1 then 
		API_ResponseWrite('<name>载具</name>')
		API_ResponseWrite('<text>暂未开放</text><br><br>')
		API_ResponseWrite('<text> 　①</text>')
		API_ResponseWrite('<a href="yx_Bus?1=11">查询</a>')
		--API_ResponseWrite('<text>　　</text>')
		--API_ResponseWrite('<text> 　②</text>')
		--API_ResponseWrite('<a href="yx_Bus?1=12">修改</a><br>')
		--API_ResponseWrite('<text>...</text>')
		--API_ResponseWrite('<text>...</text>')

	elseif  wthtranSelect == 11 then
		API_ResponseWrite('<name>载具数值查询</name>')
		local ActorID = ActorID or API_RequestGetActorID()
			if API_IsVehicalConjuring (ActorID)== nil or  API_IsVehicalConjuring(ActorID)==0 then
				API_ResponseWrite('<text>连滑板都用不起的穷人查个P啊</tetx>')
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
				API_ResponseWrite('<text>大爷你好,你的载具数据如下：</text><br>')
				API_ResponseWrite('<text>该载具当前等级为'..buslevel..'级，经验值为'..busexp..'点，可提升'..speed..'的速度.</text><br>')
				API_ResponseWrite('<text>已经被改造过'..buschange..'次,目前油量为'..oil_now..'，油量上限为'..oil_max..'</text><br>')
				API_ResponseWrite('<text>可提升主人'..hpmax..'点生命上限,增加'..deff..'防御. 耐久为'..hard_now..'/'..hard_max..'</text><br>')
			end
	
	elseif wthtranSelect == 3 then
		local ActorID = API_RequestGetActorID()
		local num = API_GetPKCrimeValue(ActorID)
		API_ResponseWrite('<text>你的PK值是：'..num..'点</text><br>')
		API_ResponseWrite('<text>输入数值:</text><input type="number" name="17" size="10"><br><br>')
		API_ResponseWrite('<a href="yx_Bus?1=31">增加罪恶</a><br>')
		API_ResponseWrite('<text>	</text><br>')
		API_ResponseWrite('<a href="yx_Bus?1=34">忏悔赎罪</a>')
				
	elseif wthtranSelect == 31 then
		local ActorID = API_RequestGetActorID()
		local crime = API_RequestGetNumber(17)
		local xyz = API_GetPKCrimeValue(ActorID)
		if crime + xyz >= 200 then crime = 200 - xyz end
		API_AddPKCrimeValue(ActorID,crime)
		API_UpdateActorPkState(ActorID)
		API_ActorSendMsg(ActorID, 3, "受热空气影响,你感觉身上的罪恶加深了"..crime.."点,你现在的罪恶值是"..API_GetPKCrimeValue(ActorID).."点")


	elseif wthtranSelect == 34 then
		local ActorID = API_RequestGetActorID()
		local crime = API_RequestGetNumber(17)
		local xyz = API_GetPKCrimeValue(ActorID)
		if crime>xyz then crime = xyz end
		API_CutPKCrimeValue(ActorID,crime)
		API_UpdateActorPkState(ActorID)
		API_ActorSendMsg(ActorID, 3, "扶老太太过了".. math.random(10).."次马路,你感觉身上的罪恶减少了"..crime.."点,你现在的罪恶值是"..API_GetPKCrimeValue(ActorID).."点")

	--召唤怪
	elseif wthtranSelect == 2 then
		API_ResponseWrite('<name>- -# </name>')
		API_ResponseWrite('<text>传闻收集七颗龙珠,可以召唤神龙</text><br><br>')
		API_ResponseWrite('<text> 　1</text>')
		API_ResponseWrite('<a href="yx_Bus?1=21">小妹妹</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text> 　2</text>')
		API_ResponseWrite('<a href="yx_Bus?1=22">美年达</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text> 　3</text>')
		API_ResponseWrite('<a href="yx_Bus?1=23">慢得啦</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text> 　4</text>')
		API_ResponseWrite('<a href="yx_Bus?1=24">雪怪领主吃螺丝</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text> 　5</text>')
		API_ResponseWrite('<a href="yx_Bus?1=25">召唤神龙</a>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text> 　6</text>')
		API_ResponseWrite('<a href="yx_Bus?1=26">诅咒巨人</a><br><br>')
		API_ResponseWrite('<text>　　</text>')
		API_ResponseWrite('<text> 　7</text>')
		API_ResponseWrite('<a href="yx_Bus?1=27">神秘之地重置数据</a><br><br>')


	elseif 	wthtranSelect == 21 then
		--咀咒巨人850020、神龙安卡850023
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
		--咀咒巨人850020、神龙安卡850023
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
		API_ResponseWrite('<name>房屋修改</name>')
		API_ResponseWrite('<text>我想有个家，一个不太大的地方</text><br><br>')
		API_ResponseWrite('<text>输入数值:</text><input type="number" name="41" size="10"><br><br>')
		API_ResponseWrite('<a href="yx_Bus?1=41">增加金果</a><br>')
		API_ResponseWrite('<text>	</text><br>')
		API_ResponseWrite('<a href="yx_Bus?1=42">房屋经验</a>')

	elseif wthtranSelect == 41 then
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local HouseID = API_GetHouseSerialID(PlayMapID) 
		local fruitnum =  API_RequestGetNumber(41)
		if fruitnum >= 99999 then fruitnum = 99999 end
		API_SetVarNumber(HouseID, HouseFloor_GoldFruitNum,fruitnum,true)
		API_ActorSendMsg(ActorID, 3, "中了32注福彩票1等奖，你增加"..fruitnum.."个金果")

	elseif wthtranSelect == 42 then	
		local ActorID = API_RequestGetActorID() 
		local PlayMapID = API_GetActorMapID(ActorID) 
		local HouseID = API_GetHouseSerialID(PlayMapID) 
		local roomexp = API_RequestGetNumber(41)
		if roomexp >= 999999 then roomexp = 999999 end
		API_SetHouseCrtNumProperty(HouseID,PUB_HDN_CURRENTEXPVALUE,roomexp) 
		API_ActorSendMsg(ActorID, 3, "炒房成功，你的房屋经验变成了"..roomexp.."点")
	
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


