VERSION = "1.0.0"

local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")

function init()
    config.MakeCommand("selto", selto, NoComplete)
    config.AddRuntimeFile("selto", config.RTHelp, "help/selto.md")
end

function selto(bp, args)
    if #args < 1 then return end
    
    local buf = bp.Buf
    local bufLines = buf:LinesNum()
    local cursor = buf:GetActiveCursor()
    local currentLine = cursor.Loc.Y
    local targetLine = tonumber(args[1])

    if targetLine == 0 then return end
    
    if targetLine < 0 then
        -- adding 1 to make it behave like goto, -1 takes you to the last line
        targetLine = buf:LinesNum() + targetLine + 1
    end

    if targetLine < currentLine then
        targetLine = targetLine - 1
        currentLine = currentLine + 1
    end
    
    local selStart = buffer.Loc(0, currentLine)
    local selEnd = buffer.Loc(0, targetLine)
        
    cursor:SetSelectionStart(selStart)
    cursor:SetSelectionEnd(selEnd)
end
