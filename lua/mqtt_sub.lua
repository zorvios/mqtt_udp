#!/usr/bin/lua

--local defs  = require "mqtt_udp_defs"
local mq = require "mqtt_udp_lib"

listener = function(ptype, topic, value, ip, port )
    --print("Topic: '"..topic.."'")
    --print("Value: '"..val.."'")
    --print("From: ", ip, port )

    print("'"..topic.."' = '"..val.."'".."	from: ", ip, port)
end

udp = mq.make_listen_socket()
mq.listen( udp, listener )

--[[
while true do
    data, ip, port = udp:receivefrom()
    if data then
        --print("Received: ", data, ip, port, type(data))
        print("Received from: ", ip, port )
	topic,val = mq.parse_packet(data)
	print("Topic: '"..topic.."'")
	print("Value: '"..val.."'")
    end
    socket.sleep(0.01)
end
]]


