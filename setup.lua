-- file: setup.lua
local module = {}

local function wifi_wait_ip()  
  if wifi.sta.getip()== nil then
    print("aguardando IP...")
  else
    tmr.stop(1)
    print("\n====================================")
    print("ESP8266 modo: " .. wifi.getmode())
    print("MAC: " .. wifi.ap.getmac())
    print("IP: "..wifi.sta.getip())
    print("====================================")
    
    print("Iniciando aplicacao...")
    app.start()
  end
end

local function wifi_start()  
    wifi.setmode(wifi.STATION);
    wifi.sta.config(config.REDE,config.SENHA)
    wifi.sta.connect()
    print("Conectando em " .. config.REDE .. " ...")
    tmr.alarm(1, 2500, 1, wifi_wait_ip)
end

function module.start()  
  print("MAC: " .. wifi.ap.getmac())
  print("Configurando Wifi ...")
  wifi.setmode(wifi.STATION);
  wifi.sta.getap(wifi_start)
end

return module  
