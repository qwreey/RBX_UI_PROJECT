-- 더럽게 무겁고 더럽게 느려터진 markdown 렌더러

local module = {}

-- TODO
	-- tab 서포트
	-- | Tab1 | Tab2 |
	-- | : 1
	-- |
	-- | tab 1 items
	-- |
	-- | : 2
	-- | 
	-- | tab 2 items
	-- |

local StrFind = string.find
local StrSub = string.sub
local StrGsub = string.gsub

-- 
-- Remove the <!-- --> tags
-- 실제 문서에는 표시되지 않도록 해야되는 코맨트를 지웁니다
-- /* */ 태그도 서브로 지워줌
-- 
local CommentPatternXML = "<!%-%-.-%-%->"
local CommentPatternC = "/%*.-%*/"
function module:RmComment(text,Pointer)
	return StrGsub(StrGsub(text,CommentPatternXML,""),CommentPatternC,"")
end
--test
print(module:RmComment("<!-- 여기껀 실제로 안보임 -->근데 이건 또 실제로 보임<!-- 그리고 이건 여러개 쓸 수 있음 -->"))

-- 
-- --- 위에 라인에 있는 줄을
-- 타이틀로 인식되도록 # 내용 으로 변환합니다
-- 
-- ? : 있거나 없거나, 1개 또는 0개 있는 글자다 라는 의미
-- %s: 공백문자, 그냥 띄어쓰기
-- \n: 줄바꿈 문자
-- 
-- TODO : 의도된 첫 시작 띄어쓰기 인식 문제 해결
local HeadLinePattern = "#?%s?.-\n%-%-%-"
local HeadLinePattern2 = "#?%s?.-\n%=%=%="
function module:LineToHead(text)
	StrGsub(text,)
end




local CommentPatternLua = "%-%-.-\n"
local CommentPatternLuaExt = "%-%-%[%[.-%]%]"

local StrGsub = string.gsub
function RmLuaComment(Text)
	return StrGsub(StrGsub(Text,CommentPatternLua,""),CommentPatternLuaExt,"")
end

local LuaText = [[
--sdfsdf
-- dsfs sdf 
function a()
   asdf()
end
]]
print(RmLuaComment(LuaText))



-- 
-- Markdown text styler tags to RBX rich text
-- ~~이런거~~ 를 <s>이렇게</s> 바꿔서 로블이 알아먹도록 만듬
-- 
local StartTag = "<%s>"
local EndTag = "</%s>"
local TextTags = {
	-- 취소선 효과
	["s"] = {"~~"}
	
}
function module:Textmark(text)
	
end



local CodeBlockStart = "[^```^~~~]"
local CodeBlockEnd = "```"
function module:FindCodeBlock(text)
	
end


function module:Build(markdown)
	
end

return module
