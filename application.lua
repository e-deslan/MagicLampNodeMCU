-- file : application.lua
local module = {}
m = nil



-- Sends my id to the broker for registration
local function register_myself()  
    m:subscribe(config.ENDPOINT,0,function(conn)
        print("inscrito no topico: " .. config.ENDPOINT)
    end)
end

local function mqtt_start()  
    m = mqtt.Client(config.ID, 120)
    -- register message callback beforehand
    m:on("message", function(conn, topic, data) 
      if data ~= nil then
        print(topic .. ": " .. data)
        if data == "ligar" then
            gpio.write(0, gpio.LOW)
        else
            gpio.write(0, gpio.HIGH)
        end
      end
    end)
    -- Connect to broker
    m:connect(config.HOST, config.PORT, 0, 1, function(con) 
        register_myself()
        -- And then pings each 1000 milliseconds
        --tmr.stop(6)
        --tmr.alarm(6, 60000, 1, send_ping)
    end) 

end

function module.start()  

  mqtt_start()
end





return module 
