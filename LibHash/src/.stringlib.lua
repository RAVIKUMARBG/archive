function string.levenshtein(a,b)local c=string.len(a)local d=string.len(b)local e={}local f=0;if c==0 then return d elseif d==0 then return c elseif a==b then return 0 end;for g=0,c,1 do e[g]={}e[g][0]=g end;for h=0,d,1 do e[0][h]=h end;for g=1,c,1 do for h=1,d,1 do if a:byte(g)==b:byte(h)then f=0 else f=1 end;e[g][h]=math.min(e[g-1][h]+1,e[g][h-1]+1,e[g-1][h-1]+f)end end;return e[c][d]end