
function packet_gh0st (dpiMessage, packet)
    require 'LOG'
     -- rule content
       -- only look at classified packets
       if GetFlowClassified(dpiMessage) then
        --EZWARNING("not gh0st hunting")
        return false
       end
       local port_dst = GetInt(dpiMessage, 'internal', 'destport')
       if port_dst == 8080 then
         EZWARNING("looking for gh0sts..")
         local payload = GetPacketString(packet)
         EZWARNING(payload)
         if string.match(payload, 'XYTvns') ~= nil then
           EZWARNING("gh0st found!")
          end
        end
      return true
    end
