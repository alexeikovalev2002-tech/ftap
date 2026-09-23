if game.CoreGui:FindFirstChild("TrueAmAm") then game.CoreGui.TrueAmAm:Destroy() end

local P=game:GetService("Players") local U=game:GetService("UserInputService")
local T=game:GetService("TweenService") local R=game:GetService("RunService")
local LP=P.LocalPlayer local Cam=workspace.CurrentCamera local OrigFOV=Cam.FieldOfView

local C={Bg=Color3.fromRGB(20,20,25),P=Color3.fromRGB(28,28,35),S=Color3.fromRGB(15,15,20),
A=Color3.fromRGB(0,170,255),Tx=Color3.fromRGB(240,240,245),Su=Color3.fromRGB(150,150,160),
Off=Color3.fromRGB(50,50,60),H=Color3.fromRGB(40,40,50),St=Color3.fromRGB(45,45,55)}

local G=Instance.new("ScreenGui")
G.Name="TrueAmAm" G.ResetOnSpawn=false G.IgnoreGuiInset=true G.Parent=game.CoreGui

local M=Instance.new("Frame")
M.Size=UDim2.new(0,560,0,380) M.Position=UDim2.new(.5,-280,.5,-190)
M.BackgroundColor3=C.Bg M.BorderSizePixel=0 M.Active=true M.Draggable=true M.Parent=G
local mc=Instance.new("UICorner") mc.CornerRadius=UDim.new(0,12) mc.Parent=M
local ms=Instance.new("UIStroke") ms.Color=C.St ms.Parent=M

local top=Instance.new("Frame")
top.Size=UDim2.new(1,0,0,2) top.BackgroundColor3=C.A top.BorderSizePixel=0 top.Parent=M
local tc=Instance.new("UICorner") tc.CornerRadius=UDim.new(0,12) tc.Parent=top

local sb=Instance.new("Frame")
sb.Size=UDim2.new(0,150,1,-2) sb.Position=UDim2.new(0,0,0,2)
sb.BackgroundColor3=C.S sb.BorderSizePixel=0 sb.Parent=M
local sc=Instance.new("UICorner") sc.CornerRadius=UDim.new(0,12) sc.Parent=sb

local lg=Instance.new("TextLabel")
lg.Size=UDim2.new(1,0,0,60) lg.BackgroundTransparency=1 lg.Text="true am am"
lg.Font=Enum.Font.GothamBold lg.TextSize=18 lg.TextColor3=C.A lg.Parent=sb
local ls=Instance.new("TextLabel")
ls.Size=UDim2.new(1,0,0,14) ls.Position=UDim2.new(0,0,0,32) ls.BackgroundTransparency=1
ls.Text="v1.0 - FTAP" ls.Font=Enum.Font.Gotham ls.TextSize=10 ls.TextColor3=C.Su ls.Parent=sb

local th=Instance.new("Frame")
th.Size=UDim2.new(1,-16,1,-80) th.Position=UDim2.new(0,8,0,70)
th.BackgroundTransparency=1 th.Parent=sb
local tl=Instance.new("UIListLayout") tl.Padding=UDim.new(0,4) tl.Parent=th

local Ct=Instance.new("Frame")
Ct.Size=UDim2.new(1,-160,1,-20) Ct.Position=UDim2.new(0,158,0,10)
Ct.BackgroundTransparency=1 Ct.Parent=M

local __o=0
local function NO() __o=__o+1 return __o end

local pages={}
local function Tab(name)
  local b=Instance.new("TextButton") b.Size=UDim2.new(1,0,0,34)
  b.BackgroundColor3=C.S b.BorderSizePixel=0 b.Text="" b.AutoButtonColor=false b.Parent=th
  local bc=Instance.new("UICorner") bc.CornerRadius=UDim.new(0,8) bc.Parent=b
  local l=Instance.new("TextLabel") l.Size=UDim2.new(1,-20,1,0) l.Position=UDim2.new(0,12,0,0)
  l.BackgroundTransparency=1 l.Text=name l.Font=Enum.Font.GothamMedium l.TextSize=13
  l.TextColor3=C.Su l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=b
  local ind=Instance.new("Frame") ind.Size=UDim2.new(0,3,0,18) ind.Position=UDim2.new(0,0,.5,-9)
  ind.BackgroundColor3=C.A ind.BorderSizePixel=0 ind.Visible=false ind.Parent=b
  local ic=Instance.new("UICorner") ic.CornerRadius=UDim.new(1,0) ic.Parent=ind
  local pg=Instance.new("ScrollingFrame") pg.Size=UDim2.new(1,0,1,0) pg.BackgroundTransparency=1
  pg.BorderSizePixel=0 pg.ScrollBarThickness=3 pg.ScrollBarImageColor3=C.A
  pg.CanvasSize=UDim2.new(0,0,0,0) pg.AutomaticCanvasSize=Enum.AutomaticSize.Y
  pg.Visible=false pg.Parent=Ct
  local ly=Instance.new("UIListLayout") ly.Padding=UDim.new(0,6)
  ly.SortOrder=Enum.SortOrder.LayoutOrder ly.Parent=pg
  local pd=Instance.new("UIPadding") pd.PaddingTop=UDim.new(0,4) pd.PaddingRight=UDim.new(0,6) pd.Parent=pg
  b.MouseButton1Click:Connect(function()
    for _,p in pairs(pages) do p.pg.Visible=false p.b.BackgroundColor3=C.S p.l.TextColor3=C.Su p.i.Visible=false end
    pg.Visible=true b.BackgroundColor3=C.P l.TextColor3=C.Tx ind.Visible=true
  end)
  b.MouseEnter:Connect(function() if not pg.Visible then b.BackgroundColor3=C.H end end)
  b.MouseLeave:Connect(function() if not pg.Visible then b.BackgroundColor3=C.S end end)
  table.insert(pages,{pg=pg,b=b,l=l,i=ind})
  if #pages==1 then pg.Visible=true b.BackgroundColor3=C.P l.TextColor3=C.Tx ind.Visible=true end
  return pg
end

local function Sec(p,t)
  local s=Instance.new("TextLabel") s.Size=UDim2.new(1,0,0,22) s.BackgroundTransparency=1
  s.Text=string.upper(t) s.Font=Enum.Font.GothamBold s.TextSize=11 s.TextColor3=C.A
  s.TextXAlignment=Enum.TextXAlignment.Left s.Parent=p
  s.LayoutOrder=NO()
  return s
end

local function Tog(p,name,dflt,cb)
  local b=Instance.new("TextButton") b.Size=UDim2.new(1,0,0,38) b.BackgroundColor3=C.P
  b.BorderSizePixel=0 b.Text="" b.AutoButtonColor=false b.Parent=p
  b.LayoutOrder=NO()
  local bc=Instance.new("UICorner") bc.CornerRadius=UDim.new(0,8) bc.Parent=b
  local l=Instance.new("TextLabel") l.Size=UDim2.new(1,-70,1,0) l.Position=UDim2.new(0,14,0,0)
  l.BackgroundTransparency=1 l.Text=name l.Font=Enum.Font.GothamMedium l.TextSize=13
  l.TextColor3=C.Tx l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=b
  local tr=Instance.new("Frame") tr.Size=UDim2.new(0,38,0,20) tr.Position=UDim2.new(1,-52,.5,-10)
  tr.BackgroundColor3=dflt and C.A or C.Off tr.BorderSizePixel=0 tr.Parent=b
  local trc=Instance.new("UICorner") trc.CornerRadius=UDim.new(1,0) trc.Parent=tr
  local kn=Instance.new("Frame") kn.Size=UDim2.new(0,14,0,14)
  kn.Position=dflt and UDim2.new(1,-17,.5,-7) or UDim2.new(0,3,.5,-7)
  kn.BackgroundColor3=C.Tx kn.BorderSizePixel=0 kn.Parent=tr
  local kc=Instance.new("UICorner") kc.CornerRadius=UDim.new(1,0) kc.Parent=kn
  local st=dflt
  b.MouseButton1Click:Connect(function()
    st=not st
    T:Create(tr,TweenInfo.new(.18),{BackgroundColor3=st and C.A or C.Off}):Play()
    T:Create(kn,TweenInfo.new(.18),{Position=st and UDim2.new(1,-17,.5,-7) or UDim2.new(0,3,.5,-7)}):Play()
    if cb then cb(st) end
  end)
  b.MouseEnter:Connect(function() b.BackgroundColor3=C.H end)
  b.MouseLeave:Connect(function() b.BackgroundColor3=C.P end)
end

local function Slider(p,name,mn,mx,dflt,sfx,cb)
  local f=Instance.new("Frame") f.Size=UDim2.new(1,0,0,54) f.BackgroundColor3=C.P
  f.BorderSizePixel=0 f.Parent=p
  f.LayoutOrder=NO()
  local fc=Instance.new("UICorner") fc.CornerRadius=UDim.new(0,8) fc.Parent=f
  local l=Instance.new("TextLabel") l.Size=UDim2.new(1,-20,0,20) l.Position=UDim2.new(0,12,0,6)
  l.BackgroundTransparency=1 l.Text=name.."  —  "..dflt..(sfx or "")
  l.Font=Enum.Font.GothamMedium l.TextSize=13 l.TextColor3=C.Tx
  l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
  local bar=Instance.new("Frame") bar.Size=UDim2.new(1,-24,0,6) bar.Position=UDim2.new(0,12,0,36)
  bar.BackgroundColor3=C.Off bar.BorderSizePixel=0 bar.Parent=f
  local bc=Instance.new("UICorner") bc.CornerRadius=UDim.new(1,0) bc.Parent=bar
  local fl=Instance.new("Frame") fl.Size=UDim2.new((dflt-mn)/(mx-mn),0,1,0)
  fl.BackgroundColor3=C.A fl.BorderSizePixel=0 fl.Parent=bar
  local flc=Instance.new("UICorner") flc.CornerRadius=UDim.new(1,0) flc.Parent=fl
  local drag=false
  local function setFromX(x)
    local rel=math.clamp((x-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
    local val=math.floor(mn+(mx-mn)*rel+0.5)
    fl.Size=UDim2.new(rel,0,1,0)
    l.Text=name.."  —  "..val..(sfx or "")
    if cb then cb(val) end
  end
  bar.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
      drag=true setFromX(i.Position.X)
    end
  end)
  U.InputChanged:Connect(function(i)
    if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
      setFromX(i.Position.X)
    end
  end)
  U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
      drag=false
    end
  end)
end

local MT=Tab("Главное") local VT=Tab("Визуалы") local Mt=Tab("Разное") local St=Tab("Настройки")

-- ===== ГЛАВНОЕ =====
Sec(MT, "Движение")

local infJumpOn = false
Tog(MT, "Infinite Jump", false, function(v)
    infJumpOn = v
    print("[true am am] Infinite Jump " .. (v and "ВКЛ" or "ВЫКЛ"))
end)

U.JumpRequest:Connect(function()
    if not infJumpOn then return end
    local char = LP.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ===== ПАЛЕТ =====
local CH=Color3.fromRGB(255,220,60) local palG=false local pnt={} local lastCh=0
local MY=LP.Name.."SpawnedInToys"

local function isMine(o)
  return o and o.Name=="PalletLightBrown" and o:IsA("Model") and o.Parent and o.Parent.Name==MY
end

local function setColor(c)
  CH=c
  for d,_ in pairs(pnt) do
    if d and d.Parent then
      local h=d:FindFirstChild("TrueAmAmHL")
      if h then h.FillColor=c end
    end
  end
  for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="TrueAmAmTrail" and o:IsA("Trail") then o.Color=ColorSequence.new(c) end
  end
end

-- ===== ВИЗУАЛЫ =====
Sec(VT,"Визуалы")

local zoomFixOn = false
local zoomMax = 128
local savedCam = nil

Tog(VT, "Fix Zoom", false, function(v)
    zoomFixOn = v
    if v then
        savedCam = {Mode=LP.CameraMode,Max=LP.CameraMaxZoomDistance,Min=LP.CameraMinZoomDistance}
        LP.CameraMode = Enum.CameraMode.Classic
        LP.CameraMaxZoomDistance = zoomMax
        LP.CameraMinZoomDistance = 0.5
    else
        if savedCam then
            LP.CameraMode = savedCam.Mode
            LP.CameraMaxZoomDistance = savedCam.Max
            LP.CameraMinZoomDistance = savedCam.Min
            savedCam = nil
        end
    end
end)

Slider(VT, "Дистанция зума", 20, 500, 128, "", function(v)
    zoomMax = v
    if zoomFixOn then LP.CameraMaxZoomDistance = v end
end)

R.RenderStepped:Connect(function()
    if not zoomFixOn then return end
    if LP.CameraMode ~= Enum.CameraMode.Classic then LP.CameraMode = Enum.CameraMode.Classic end
    if LP.CameraMaxZoomDistance ~= zoomMax then LP.CameraMaxZoomDistance = zoomMax end
    if LP.CameraMinZoomDistance ~= 0.5 then LP.CameraMinZoomDistance = 0.5 end
end)

Sec(VT,"Цвет палета и следа")
local PF=Instance.new("Frame") PF.Size=UDim2.new(1,0,0,40) PF.BackgroundColor3=C.P
PF.BorderSizePixel=0 PF.Parent=VT
PF.LayoutOrder=NO()
local pfc=Instance.new("UICorner") pfc.CornerRadius=UDim.new(0,8) pfc.Parent=PF
local pl=Instance.new("UIListLayout") pl.FillDirection=Enum.FillDirection.Horizontal pl.Padding=UDim.new(0,4)
pl.HorizontalAlignment=Enum.HorizontalAlignment.Center pl.VerticalAlignment=Enum.VerticalAlignment.Center pl.Parent=PF

for _,col in ipairs({Color3.fromRGB(255,220,60),Color3.fromRGB(255,80,80),Color3.fromRGB(80,255,80),
Color3.fromRGB(0,170,255),Color3.fromRGB(200,80,255),Color3.fromRGB(255,130,0),
Color3.fromRGB(255,105,180),Color3.fromRGB(0,255,200),Color3.fromRGB(255,255,255),
Color3.fromRGB(150,150,150),Color3.fromRGB(100,60,20),Color3.fromRGB(0,0,0)}) do
  local s=Instance.new("TextButton") s.Size=UDim2.new(0,24,0,24) s.BackgroundColor3=col
  s.BorderSizePixel=0 s.Text="" s.AutoButtonColor=false s.Parent=PF
  local sc2=Instance.new("UICorner") sc2.CornerRadius=UDim.new(1,0) sc2.Parent=s
  s.MouseButton1Click:Connect(function() setColor(col) end)
end

Tog(VT,"FOV 120",false,function(v) Cam.FieldOfView=v and 120 or OrigFOV end)

local esp={}
Tog(VT,"ESP (белая обводка)",false,function(v)
  if v then
    for _,p in ipairs(P:GetPlayers()) do
      if p~=LP and p.Character then
        local h=Instance.new("Highlight") h.FillTransparency=1 h.OutlineColor=Color3.new(1,1,1)
        h.OutlineTransparency=0 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop h.Parent=p.Character
        esp[p]=h
      end
    end
  else
    for _,h in pairs(esp) do if h then h:Destroy() end end
    esp={}
  end
end)

P.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function(ch)
  if next(esp) then task.wait(.1)
    local h=Instance.new("Highlight") h.FillTransparency=1 h.OutlineColor=Color3.new(1,1,1)
    h.OutlineTransparency=0 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop h.Parent=ch esp[p]=h
  end
end) end)

local function paintPart(d)
  d.Color=CH d.Material=Enum.Material.SmoothPlastic
  for _,c in ipairs(d:GetDescendants()) do
    if c:IsA("SurfaceAppearance") then c:Destroy()
    elseif c:IsA("Decal") or c:IsA("Texture") then
      if c.Name~="TrueAmAmImage" then c.Transparency=1 end
    elseif c:IsA("SurfaceGui") or c:IsA("BillboardGui") then
      if c.Name~="TrueAmAmSG" then c.Enabled=false end
    end
  end
  local h=d:FindFirstChild("TrueAmAmHL")
  if not h then
    h=Instance.new("Highlight") h.Name="TrueAmAmHL" h.FillTransparency=0
    h.OutlineTransparency=1 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
    h.Adornee=d h.Parent=d
  end
  h.FillColor=CH pnt[d]=true
end

local function paintAll()
  local n=0
  for _,o in ipairs(workspace:GetDescendants()) do
    if isMine(o) then for _,d in ipairs(o:GetDescendants()) do
      if d:IsA("BasePart") then paintPart(d) n=n+1 end
    end end
  end
  return n
end

local function unpaint()
  for d,_ in pairs(pnt) do
    if d and d.Parent then
      local h=d:FindFirstChild("TrueAmAmHL")
      if h then h:Destroy() end
      for _,c in ipairs(d:GetDescendants()) do
        if c:IsA("Decal") or c:IsA("Texture") then
          if c.Name~="TrueAmAmImage" then c.Transparency=0 end
        elseif c:IsA("SurfaceGui") or c:IsA("BillboardGui") then
          if c.Name~="TrueAmAmSG" then c.Enabled=true end
        end
      end
    end
  end
  pnt={}
end

Tog(VT,"Покраска палета (только мой)",false,function(v)
  palG=v
  if v then paintAll() else unpaint() end
end)

local trOn=false
local function attachTr(d)
  if not d:IsA("BasePart") or d:FindFirstChild("TrueAmAmTrail") then return end
  local a0=Instance.new("Attachment") a0.Name="TrueAmAmTrailA0" a0.Position=Vector3.new(-.35,0,0) a0.Parent=d
  local a1=Instance.new("Attachment") a1.Name="TrueAmAmTrailA1" a1.Position=Vector3.new(.35,0,0) a1.Parent=d
  local tr=Instance.new("Trail") tr.Name="TrueAmAmTrail" tr.Attachment0=a0 tr.Attachment1=a1
  tr.Lifetime=1.2 tr.MinLength=.1
  tr.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0,.7),NumberSequenceKeypoint.new(1,0)})
  tr.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,.15),NumberSequenceKeypoint.new(1,1)})
  tr.Color=ColorSequence.new(CH) tr.LightEmission=1 tr.FaceCamera=true tr.Parent=d
end

local function addTrAll()
  for _,o in ipairs(workspace:GetDescendants()) do
    if isMine(o) then for _,d in ipairs(o:GetDescendants()) do
      if d:IsA("BasePart") then attachTr(d) end
    end end
  end
end

local function rmTrAll()
  for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="TrueAmAmTrail" or o.Name=="TrueAmAmTrailA0" or o.Name=="TrueAmAmTrailA1" then
      o:Destroy()
    end
  end
end

Tog(VT,"След за палетом (только мой)",false,function(v)
  trOn=v
  if v then addTrAll() else rmTrAll() end
end)

local TID="rbxassetid://16354043139" local trlOn=false
local function addTroll(d)
  if not d:IsA("BasePart") or d.Name~="SoundPart" or d:FindFirstChild("TrueAmAmSG") then return end
  local s=Instance.new("SurfaceGui") s.Name="TrueAmAmSG" s.Face=Enum.NormalId.Top
  s.AlwaysOnTop=true s.LightInfluence=0 s.Parent=d
  local i=Instance.new("ImageLabel") i.Size=UDim2.new(1,0,1,0) i.BackgroundTransparency=1
  i.Image=TID i.ScaleType=Enum.ScaleType.Fit i.Parent=s
end

Tog(VT,"Тролль на палет (только мой)",false,function(v)
  trlOn=v
  if v then
    for _,o in ipairs(workspace:GetDescendants()) do
      if isMine(o) then for _,d in ipairs(o:GetDescendants()) do
        if d:IsA("BasePart") and d.Name=="SoundPart" then addTroll(d) end
      end end
    end
  else
    for _,o in ipairs(workspace:GetDescendants()) do
      if o.Name=="TrueAmAmSG" then o:Destroy() end
    end
  end
end)

workspace.DescendantAdded:Connect(function(o)
  if isMine(o) then
    task.wait(.15)
    for _,d in ipairs(o:GetDescendants()) do
      if d:IsA("BasePart") then
        if palG then paintPart(d) end
        if trOn then attachTr(d) end
        if trlOn and d.Name=="SoundPart" then addTroll(d) end
      end
    end
  elseif o:IsA("BasePart") then
    local a=o.Parent
    while a and a~=workspace do
      if isMine(a) then
        if palG then paintPart(o) end
        if trOn then attachTr(o) end
        if trlOn and o.Name=="SoundPart" then addTroll(o) end
        return
      end
      a=a.Parent
    end
  end
end)

R.Heartbeat:Connect(function()
  if not palG then return end
  local now=os.clock()
  if now-lastCh<.3 then return end
  lastCh=now paintAll()
end)

Sec(Mt,"Пока пусто") Sec(St,"true am am v1.0")

U.InputBegan:Connect(function(i,gp)
  if gp then return end
  if i.KeyCode==Enum.KeyCode.RightShift then M.Visible=not M.Visible end
end)

local MinB=Instance.new("TextButton") MinB.Size=UDim2.new(0,26,0,26) MinB.Position=UDim2.new(1,-34,0,8)
MinB.BackgroundColor3=C.P MinB.BorderSizePixel=0 MinB.Text="-" MinB.Font=Enum.Font.GothamBold
MinB.TextSize=18 MinB.TextColor3=C.Su MinB.AutoButtonColor=false MinB.ZIndex=5 MinB.Parent=M
local mcc=Instance.new("UICorner") mcc.CornerRadius=UDim.new(0,6) mcc.Parent=MinB

local ClB=Instance.new("TextButton") ClB.Size=UDim2.new(0,26,0,26) ClB.Position=UDim2.new(1,-64,0,8)
ClB.BackgroundColor3=C.P ClB.BorderSizePixel=0 ClB.Text="X" ClB.Font=Enum.Font.GothamBold
ClB.TextSize=14 ClB.TextColor3=C.Su ClB.AutoButtonColor=false ClB.ZIndex=5 ClB.Parent=M
local ccc=Instance.new("UICorner") ccc.CornerRadius=UDim.new(0,6) ccc.Parent=ClB

local FB=Instance.new("TextButton") FB.Size=UDim2.new(0,52,0,52) FB.Position=UDim2.new(1,-72,0,20)
FB.BackgroundColor3=C.P FB.BorderSizePixel=0 FB.Text="true" FB.Font=Enum.Font.GothamBold
FB.TextSize=11 FB.TextColor3=C.A FB.AutoButtonColor=false FB.Visible=false FB.Active=true
FB.Draggable=true FB.Parent=G
local fbc=Instance.new("UICorner") fbc.CornerRadius=UDim.new(1,0) fbc.Parent=FB
local fbs=Instance.new("UIStroke") fbs.Color=C.A fbs.Parent=FB

MinB.MouseButton1Click:Connect(function() M.Visible=false FB.Visible=true end)
FB.MouseButton1Click:Connect(function() M.Visible=true FB.Visible=false end)
ClB.MouseButton1Click:Connect(function()
  M:Destroy() FB:Destroy()
end)

print("[true am am] Скрипт загружен.")
