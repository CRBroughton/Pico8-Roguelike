function update_game()
  if talkwind then
    if getbutt()==5 then
      talkwind.dur=0
      talkwind=nil
    end
  else
    dobuttbuff()
    dobutt(buttbuff)
    buttbuff=-1
  end
end

function update_pturn()
  dobuttbuff()
  p_t=min(p_t+0.125,1)

  p_mob:mov()

  if p_t==1 then
    _upd=update_game
    if checkend() then
      doai()
    end
  end
end
  
function update_aiturn()
  dobuttbuff()
  p_t=min(p_t+0.125,1)

  for m in all(mob) do
    if m !=p_mob and m.mov then
        m:mov()
      end
  end

  if p_t==1 then
    _upd=update_game
    checkend()
  end
end

function update_gover()
  if btnp(5) then
    fadeout()
    startgame()
  end
end

function dobuttbuff()
  if buttbuff==-1 then
    buttbuff=getbutt()
  end
end

function getbutt()
  for i=0,5 do
    if btnp(i) then
      return i
    end
  end
  return -1
end

function dobutt(butt)
  if butt<0 then 
    return
  end
  if butt<4 then
    moveplayer(dirx[butt+1],diry[butt+1])
  end
    -- menu button
end