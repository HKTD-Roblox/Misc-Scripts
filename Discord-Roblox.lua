local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

local CHANNEL_ID = "1234567890123456789"
local POLL_INTERVAL = 2

local lastMsgId = nil

local function notify(text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Script Notification!",
            Text = tostring(text),
            Duration = 5
        })
    end)
end

task.spawn(function()
    local request = (syn and syn.request) or (http and http.request) or http_request or request
    if not request then return end

    local url = string.format("https://discord.com/api/v10/channels/%s", CHANNEL_ID)

    while task.wait(POLL_INTERVAL) do
        local success, response = pcall(function()
            return request({
                Url = url,
                Method = "GET",
                Headers = {
                    ["Content-Type"] = "application/json"
                }
            })
        end)

        if success and response and response.Body then
            local decodeSuccess, data = pcall(function()
                return HttpService:JSONDecode(response.Body)
            end)

            if decodeSuccess and data and data.last_message_id then
                local currentMsgId = data.last_message_id
                
                if not lastMsgId then
                    lastMsgId = currentMsgId
                elseif currentMsgId ~= lastMsgId then
                    lastMsgId = currentMsgId
                    
                    local msgSuccess, msgResponse = pcall(function()
                        return request({
                            Url = string.format("https://discord.com/api/v10/channels/%s/messages/%s", CHANNEL_ID, currentMsgId),
                            Method = "GET"
                        })
                    end)
                    
                    if msgSuccess and msgResponse and msgResponse.Body then
                        local msgDecode, msgData = pcall(function()
                            return HttpService:JSONDecode(msgResponse.Body)
                        end)
                        
                        if msgDecode and msgData and msgData.content and msgData.content ~= "" then
                            notify(msgData.content)
                        end
                    end
                end
            end
        end
    end
end)
