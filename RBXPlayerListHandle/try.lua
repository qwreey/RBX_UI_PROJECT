return function (func,...)
    local pass,returns = pcall(func,...);

    local data = {};
    function data:err(func)
        if not pass then
            returns = func(returns) or returns;
        end

        return self;
    end

    function data:ok(func)
        if pass then
            returns = func(returns) or returns;
        end

        return self;
    end

    function data:getreturn()
        return returns;
    end

    return data;
end;