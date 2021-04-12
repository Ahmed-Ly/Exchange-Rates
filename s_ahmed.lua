time_interval = 1200000

function started(wedf)
   apiKey = 'Token'
    baseCurrency = 'USD'
    link[8] = 'https://currencyapi.net/api/v1/rates?key='..apiKey..'&base='..baseCurrency..''
	print(link[8])
    fetchRemote (link[8], dataa, "", false,wedf)
end



function dataa( responseData, error,wedf)
    if error == 0 then
		 local open = fileOpen('data.json')
         local Write = fileWrite(open,responseData)
         fileFlush(open)
         fileClose(open)
	      end
end
 
function getUSD ()
    started("started")
    local open = fileOpen('data.json')
    local size = fileGetSize(open)
    local read = fileRead(open,size)
    fileFlush(open)
    fileClose(open)
    local data = fromJSON(read)
    return data['rates']['LYD'],data['rates']['SAR'],data['rates']['EGP'],data['rates']['MAD'],data['rates']['AED'],data['rates']['BHD']
end 

function sendinfo ()
local LYD,SAR,EGP,MAD,AED,BHD=  getUSD ()
print("===========================اسعار عملات مقابل الدولار============================================")
print('LYD='..LYD..'','SAR='..SAR..'',"EGP="..EGP.."","MAD="..MAD.."","AED="..AED.."","BHD="..BHD.."")
print("===========================اسعار عملات مقابل الدولار============================================")
end 
setTimer(sendinfo,time_interval,0)
