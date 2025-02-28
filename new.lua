---Notifications can be used to display notifications on the screen. You can reference this file in your resource manifest to ensure the Notifications API resource is started before your own resource.
---Notifications is a singleton class that should be accessed using the global variable Notifications.
---You can reference this in your fxmanifest.lua using the following code: client_script '@vorp-core/client/ref/vorp_notifications.lua'

---@class Notifications
---@field public NotifyLeft fun(title: string, subtitle: string, dict: string, icon: string, duration?: number, color?: string): nil
---@field public NotifyTip fun(tipMessage: string, duration?: number): nil
---@field public NotifyTop fun(message: string, location: string, duration?: number): nil
---@field public NotifyRightTip fun(tipMessage: string, duration?: number): nil
---@field public NotifyObjective fun(message: string, duration?: number): nil
---@field public NotifySimpleTop fun(tittle: string, duration?: number): nil
---@field public NotifyAvanced fun(text: string, dict: string, icon: string, text_color: string, duration?: number, quality?: number, showquality?: boolean): nil
---@field public NotifyBasicTop fun(text: string, duration?: number): nil
---@field public NotifyCenter fun(text: string, duration?: number, text_color?: string): nil
---@field public NotifyBottomRight fun(text: string, duration?: number): nil
---@field public NotifyFail fun(title: string, subtitle: string, duration?: number): nil
---@field public NotifyDead fun(title: string, audioRef: string, audioName: string, duration?: number): nil
---@field public NotifyUpdate fun(title: string, message: string, duration?: number): nil
---@field public NotifyWarning fun(title: string, message: string, audioRef: string, audioName: string, duration?: number): nil
---@field public NotifyLeftRank fun(title: string, subtitle: string, dict: string, texture: string, duration?: number, color?: string): nil


Notification = setmetatable({}, Notification)
Notification.__index = Notification
Notification.__call = function()
  return 'Notifications'
end

---NotifyLeft
---@param title string
---@param subtitle string
---@param dict string
---@param icon string
---@param duration? number -- default 3000
---@param color? string -- default COLOR_WHITE
function Notification:NotifyLeft(title, subtitle, dict, icon, duration, color)
  loadTexture(dict)

  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))
  local structData = DataView.ArrayBuffer(8 * 8)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", title)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", subtitle)))
  structData:SetInt32(8 * 3, 0)
  structData:SetInt64(8 * 4, bigInt(GetHashKey(dict)))
  structData:SetInt64(8 * 5, bigInt(GetHashKey(icon)))
  structData:SetInt64(8 * 6, bigInt(GetHashKey(color or "COLOR_WHITE")))

  Citizen.InvokeNative(0x26E87218390E6729, structConfig:Buffer(), structData:Buffer(), 1, 1)
  -- SET_STREAMED_TEXTURE_DICT_AS_NO_LONGER_NEEDED
  Citizen.InvokeNative(0x4ACA10A91F66F1E2, dict)
end

---NotifyTip
---@param tipMessage string
---@param duration? number -- default 3000
function Notification:NotifyTip(tipMessage, duration)
  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))
  structConfig:SetInt32(8 * 1, 0)
  structConfig:SetInt32(8 * 2, 0)
  structConfig:SetInt32(8 * 3, 0)

  local structData = DataView.ArrayBuffer(8 * 3)
  structData:SetUint64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", tipMessage)))

  Citizen.InvokeNative(0x049D5C615BD38BAD, structConfig:Buffer(), structData:Buffer(), 1)
end

---NotifyTop
---@param message string
---@param location string
---@param duration? number -- default 3000
function Notification:NotifyTop(message, location, duration)
  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))

  local structData = DataView.ArrayBuffer(8 * 5)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", location)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", message)))

  Citizen.InvokeNative(0xD05590C1AB38F068, structConfig:Buffer(), structData:Buffer(), 0, 1)
end

---NotifyRightTip
---@param tipMessage string
---@param duration? number -- default 3000
function Notification:NotifyRightTip(tipMessage, duration)
  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))

  local structData = DataView.ArrayBuffer(8 * 3)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", tipMessage)))

  Citizen.InvokeNative(0xB2920B9760F0F36B, structConfig:Buffer(), structData:Buffer(), 1)
end

---DisplayObjective
---@param message string
---@param duration? number -- default 3000
function Notification:NotifyObjective(message, duration)
  Citizen.InvokeNative("0xDD1232B332CBB9E7", 3, 1, 0)

  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))

  local structData = DataView.ArrayBuffer(8 * 3)
  local strMessage = VarString(10, "LITERAL_STRING", message)
  structData:SetInt64(8 * 1, bigInt(strMessage))

  Citizen.InvokeNative(0xCEDBF17EFCC0E4A4, structConfig:Buffer(), structData:Buffer(), 1)
end

---NotifySimpleTop
---@param title string
---@param subtitle string
---@param duration? number -- default 3000
function Notification:NotifySimpleTop(title, subtitle, duration)
  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))

  local structData = DataView.ArrayBuffer(8 * 7)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", title)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", subtitle)))

  Citizen.InvokeNative(0xA6F4216AB10EB08E, structConfig:Buffer(), structData:Buffer(), 1, 1)
end

---NotifyAvanced
---@param text string
---@param dict string
---@param icon string
---@param text_color string
---@param duration? number -- default 3000
---@param quality? number -- default 1
---@param showquality? boolean -- default false
function Notification:NotifyAvanced(text, dict, icon, text_color, duration, quality, showquality)
  loadTexture(dict)

  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))
  structConfig:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", "Transaction_Feed_Sounds")))
  structConfig:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", "Transaction_Positive")))

  local structData = DataView.ArrayBuffer(8 * 10)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", text)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", dict)))
  structData:SetInt64(8 * 3, bigInt(GetHashKey(icon)))
  structData:SetInt64(8 * 5, bigInt(GetHashKey(text_color or "COLOR_WHITE")))
  if showquality then
    structData:SetInt32(8 * 6, quality or 1)
  end

  Citizen.InvokeNative(0xB249EBCB30DD88E0, structConfig:Buffer(), structData:Buffer(), 1)
  -- SET_STREAMED_TEXTURE_DICT_AS_NO_LONGER_NEEDED
  Citizen.InvokeNative(0x4ACA10A91F66F1E2, dict)
end

---NotifyBasicTop
---@param text string
---@param duration? number -- default 3000
function Notification:NotifyBasicTop(text, duration)
  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))

  local structData = DataView.ArrayBuffer(8 * 7)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", text)))

  Citizen.InvokeNative(0x7AE0589093A2E088, structConfig:Buffer(), structData:Buffer(), 1)
end

---NotifyCenter
---@param text string
---@param duration? number -- default 3000
---@param text_color? string -- default COLOR_PURE_WHITE
function Notification:NotifyCenter(text, duration, text_color)
  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))

  local structData = DataView.ArrayBuffer(8 * 4)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", text)))
  structData:SetInt64(8 * 2, bigInt(GetHashKey(text_color or "COLOR_PURE_WHITE")))

  Citizen.InvokeNative(0x893128CDB4B81FBB, structConfig:Buffer(), structData:Buffer(), 1)
end

---NotifyBottomRight
---@param text string
---@param duration? number -- default 3000
function Notification:NotifyBottomRight(text, duration)
  local structConfig = DataView.ArrayBuffer(8 * 7)
  structConfig:SetInt32(8 * 0, tonumber(duration or 3000))

  local structData = DataView.ArrayBuffer(8 * 5)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", text)))

  Citizen.InvokeNative(0x2024F4F333095FB1, structConfig:Buffer(), structData:Buffer(), 1)
end

---NotifyFail
---@param title string
---@param subtitle string
---@param duration? number -- default 3000
function Notification:NotifyFail(title, subtitle, duration)
  local structConfig = DataView.ArrayBuffer(8 * 5)

  local structData = DataView.ArrayBuffer(8 * 9)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", title)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", subtitle)))

  local result = Citizen.InvokeNative(0x9F2CC2439A04E7BA, structConfig:Buffer(), structData:Buffer(), 1)
  Wait(duration or 3000)
  Citizen.InvokeNative(0x00A15B94CBA4F76F, result)
end

---NotifyDead
---@param title string
---@param audioRef string
---@param audioName string
---@param duration? number -- default 3000
function Notification:NotifyDead(title, audioRef, audioName, duration)
  local structConfig = DataView.ArrayBuffer(8 * 5)

  local structData = DataView.ArrayBuffer(8 * 9)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", title)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", audioRef)))
  structData:SetInt64(8 * 3, bigInt(VarString(10, "LITERAL_STRING", audioName)))

  local result = Citizen.InvokeNative(0x815C4065AE6E6071, structConfig:Buffer(), structData:Buffer(), 1)
  Wait(duration or 3000)
  Citizen.InvokeNative(0x00A15B94CBA4F76F, result)
end

---NotifyUpdate
---@param title string
---@param message string
---@param duration? number -- default 3000
function Notification:NotifyUpdate(title, message, duration)
  local structConfig = DataView.ArrayBuffer(8 * 5)

  local structData = DataView.ArrayBuffer(8 * 9)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", title)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", message)))

  local result = Citizen.InvokeNative(0x339E16B41780FC35, structConfig:Buffer(), structData:Buffer(), 1)
  Wait(duration or 3000)
  Citizen.InvokeNative(0x00A15B94CBA4F76F, result)
end

---NotifyWarning
---@param title string
---@param message string
---@param audioRef string
---@param audioName string
---@param duration? number -- default 3000
function Notification:NotifyWarning(title, message, audioRef, audioName, duration)
  local structConfig = DataView.ArrayBuffer(8 * 5)

  local structData = DataView.ArrayBuffer(8 * 9)
  structData:SetInt64(8 * 1, bigInt(VarString(10, "LITERAL_STRING", title)))
  structData:SetInt64(8 * 2, bigInt(VarString(10, "LITERAL_STRING", message)))
  structData:SetInt64(8 * 3, bigInt(VarString(10, "LITERAL_STRING", audioRef)))
  structData:SetInt64(8 * 4, bigInt(VarString(10, "LITERAL_STRING", audioName)))

  local result = Citizen.InvokeNative(0x339E16B41780FC35, structConfig:Buffer(), structData:Buffer(), 1)
  Wait(duration or 3000)
  Citizen.InvokeNative(0x00A15B94CBA4F76F, result)
end

---NotifyLeftRank
---@param title string title of the notification
---@param subtitle string subtitle of the notification
---@param dict1 string dictionary of the texture
---@param texture string texture (icon) of the notification
---@param duration number duration of the notification
---@param color string color of the notification
function Notification:NotifyLeftRank(title, subtitle, dict1, texture, duration, color)
  loadTexture(dict1)
  duration = duration or 5000
  local dict = GetHashKey(dict1 or "TOASTS_MP_GENERIC")
  local texture = GetHashKey(texture or "toast_mp_standalone_sp")
  local string1 = VarString(10, "LITERAL_STRING", title)
  local string2 = VarString(10, "LITERAL_STRING", subtitle)

  local struct1 = DataView.ArrayBuffer(8 * 8)
  local struct2 = DataView.ArrayBuffer(8 * 10)

  struct1:SetInt32(8 * 0, duration)

  struct2:SetInt64(8 * 1, bigInt(string1))
  struct2:SetInt64(8 * 2, bigInt(string2))
  struct2:SetInt64(8 * 4, bigInt(dict))
  struct2:SetInt64(8 * 5, bigInt(texture))
  struct2:SetInt64(8 * 6, bigInt(GetHashKey(color or "COLOR_WHITE")))
  struct2:SetInt32(8 * 7, 1)
  Citizen.InvokeNative(0x3F9FDDBA79117C69, struct1:Buffer(), struct2:Buffer(), 1, 1)
  -- SET_STREAMED_TEXTURE_DICT_AS_NO_LONGER_NEEDED
  Citizen.InvokeNative(0x4ACA10A91F66F1E2, dict1)
end

function loadTexture(hash)
  if not HasStreamedTextureDictLoaded(hash) then
      RequestStreamedTextureDict(hash, true)
      repeat Wait(0) until HasStreamedTextureDictLoaded(hash)
      return true
  end
  return true
end

function bigInt(text)
  local string1 = DataView.ArrayBuffer(16)
  string1:SetInt64(0, text)
  return string1:GetInt64(0)
end