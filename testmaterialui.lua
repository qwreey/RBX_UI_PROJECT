-- test code (Material UI Test)

local MaterialUI = {
    importElement = function(className)
        return function ()
            return {
                
                ClassName = className;
            };
        end;
    end;
};

function MaterialUI:render(obj)
    for 
end





local MaterialUI = require "MaterialUI";
local importElement = MaterialUI.import;
local Frame = importElement "Frame";
local TextButton = importElement "TextButton";

local e = TextButton {
    -- 이벤트 연결, 특수한 경우로 WhenCreated 가 있음
    -- 이건 e 만들고 마자가 아니라 아래에서 렌더 한 후에만 작동함
    WhenCreated = function(this)
        print(this);
    end;
    MouseButton1Click = function()
        print("Hello world");
    end;

    -- 프로퍼티는 이름 = 프로퍼티;
    Size = UDim2.new(1,0,1,0);

    -- 다른 개체는 그냥 이렇게 집어넣을 수 있음
    Frame {
        Size = UDim2.new(0,25,0,25);
    };
};

-- e : 테이블임, 그냥 ClassName 이라는게 있고 그게 임포팅 한 이름 그대로임
-- e 의 정의는 다 다른데 특수하게 설정도 가능
-- e 안엔 저렇게 여러가지가 들어 갈 수 있는데 이벤트명 = 함수 하면 이벤트를 가져올 수 있음
-- e 는 그냥 리엑트의 가상 dom 이랑 비슷

MaterialUI:Render(e);