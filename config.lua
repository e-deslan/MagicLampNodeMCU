-- file : config.lua
local module = {}

module.REDE = "rede"  -- nome da rede wifi
module.SENHA = "senha"  -- senha da rede wifi

module.HOST = "192.168.1.57"  -- host do broker
module.PORT = 5007  -- porta do broker
module.ID = "nodeMCU"  -- nome desejado para o cliente MQTT

module.ENDPOINT = "led"  -- topico raiz

return module 
