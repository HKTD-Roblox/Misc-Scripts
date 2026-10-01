-- Yazhen / Sedse partial deobfuscation (structure analysis)
-- NOT a full source recovery. Bytecode blob remains encrypted.

-- === WATERMARK ===
-- key: SEDSE-F064V0EF
-- hwid: e29d6a324cae52a13637e0b080b6ba557c6a9cdab068579dd87873250a44c328
-- time: 1789280249158
-- protector: Yazhen / Sedse

-- === VM MODEL ===
-- vm = { s = stack, p = stack_top, c = program_counter, a = operand, l = upvalues, v = vararg }
-- Instruction word: fetch_instruction(vm) -> opcode = word % 256, operand = floor(word / 256)
-- Dispatch: OPCODES[opcode](vm)

local OPCODES = {}

-- opcode 1: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[1] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 2: NEWTABLE
OPCODES[2] = function(vm)
  -- local nf=lIlIIIlIIlIIll(vm.a,255);local nr=lIlIIlIIIlIIlllI(vm.a,8);local ex=vm.s[vm.p];vm.p=vm.p-1;local tot=nf+ex;local ag={};for i=tot,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 3: BINOP
OPCODES[3] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llllIIIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 4: UNKNOWN
OPCODES[4] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=false
end

-- opcode 5: LOAD_CONST
OPCODES[5] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 6: UNARY_OP
OPCODES[6] = function(vm)
  -- local lllIllIlIlllIIl=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lllIllIlIlllIIl,lllIllIlIlllIIl)
end

-- opcode 7: UNKNOWN
OPCODES[7] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lllIIllllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 8: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[8] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 10: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[10] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 11: VARARG
OPCODES[11] = function(vm)
  -- vm.p=vm.p+1;if vm.v then vm.s[vm.p]=vm.v[1];else vm.s[vm.p]=nil
end

-- opcode 13: UNKNOWN
OPCODES[13] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 14: NEWTABLE
OPCODES[14] = function(vm)
  -- local nf=lIlIIIlIIlIIll(vm.a,255);local nr=lIlIIlIIIlIIlllI(vm.a,8);local ex=vm.s[vm.p];vm.p=vm.p-1;local tot=nf+ex;local ag={};for i=tot,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 15: LOAD_CONST
OPCODES[15] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 16: UNKNOWN
OPCODES[16] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 17: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[17] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 18: UNKNOWN
OPCODES[18] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 19: UNKNOWN
OPCODES[19] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 20: UPVALUE_GET
OPCODES[20] = function(vm)
  -- local llIlllIlIlII=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(llIlllIlIlII and llIlllIlIlII[1]) or nil
end

-- opcode 21: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[21] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 22: NEWTABLE
OPCODES[22] = function(vm)
  -- local nf=lIlIIIlIIlIIll(vm.a,255);local nr=lIlIIlIIIlIIlllI(vm.a,8);local ex=vm.s[vm.p];vm.p=vm.p-1;local tot=nf+ex;local ag={};for i=tot,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 24: SETTABLE, NEWTABLE
OPCODES[24] = function(vm)
  -- local c=vm.a;local lIlllIIIlIlI={};for i=1,c do local vl=vm.s[vm.p];vm.p=vm.p-1;local ky=vm.s[vm.p];vm.p=vm.p-1;lIlllIIIlIlI[ky]=vl
end

-- opcode 25: UNKNOWN
OPCODES[25] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIllIlIllII(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 26: VARARG
OPCODES[26] = function(vm)
  -- if vm.v then for i=1,vm.v.n do vm.p=vm.p+1;vm.s[vm.p]=vm.v[i]
end

-- opcode 27: LOAD_CONST, LOAD_GLOBAL
OPCODES[27] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 29: NEWTABLE
OPCODES[29] = function(vm)
  -- local llIlIlllIlll={};for zz=1,vm.a do llIlIlllIlll[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 31: BINOP
OPCODES[31] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llllIlIlIIIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 32: UNKNOWN
OPCODES[32] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lllllIllIIIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 34: UNKNOWN
OPCODES[34] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=nil
end

-- opcode 35: NEWTABLE
OPCODES[35] = function(vm)
  -- local lIllIIIIlll={};for zz=1,vm.a do lIllIIIIlll[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 36: NEWTABLE
OPCODES[36] = function(vm)
  -- local tgt=vm.a;local isva=fetch_instruction(vm);local ca=fetch_instruction(vm);local ids={};for i=1,ca do ids[i]=fetch_instruction(vm)+1
end

-- opcode 37: NEWTABLE
OPCODES[37] = function(vm)
  -- local llllllIlllIll={};for zz=1,vm.a do llllllIlllIll[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 38: LOAD_CONST, LOAD_GLOBAL
OPCODES[38] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 39: LOAD_CONST, LOAD_GLOBAL
OPCODES[39] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 40: UNKNOWN
OPCODES[40] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 41: UNKNOWN
OPCODES[41] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIIllIIlllIllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 43: UNKNOWN
OPCODES[43] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 44: BINOP
OPCODES[44] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llIIlllIllIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 45: UNARY_OP
OPCODES[45] = function(vm)
  -- local lIIIIIIllIlIIIl=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lIIIIIIllIlIIIl,lIIIIIIllIlIIIl)
end

-- opcode 46: BINOP
OPCODES[46] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llllIIIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 48: JUMP_IF_FALSY
OPCODES[48] = function(vm)
  -- local c=vm.s[vm.p];vm.p=vm.p-1;if not c then vm.c=vm.a
end

-- opcode 49: UNARY_OP
OPCODES[49] = function(vm)
  -- local llIllIlIll=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(llIllIlIll,llIllIlIll)
end

-- opcode 51: UNARY_OP
OPCODES[51] = function(vm)
  -- local lIlIllIlIlll=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lIlIllIlIlll,lIlIllIlIlll)
end

-- opcode 52: VARARG
OPCODES[52] = function(vm)
  -- vm.p=vm.p+1;if vm.v then vm.s[vm.p]=vm.v[1];else vm.s[vm.p]=nil
end

-- opcode 53: UNKNOWN
OPCODES[53] = function(vm)
  -- local n=vm.a;if n==0 then return llllIllllIIlIIlI end;return pack_args(unpack_args(vm.s,vm.p-n+1,vm.p))
end

-- opcode 54: GETTABLE, SETTABLE
OPCODES[54] = function(vm)
  -- local lllIIllIlIIllII=vm.s[vm.p];vm.p=vm.p-1;local llIllIIlIIlIl=vm.s[vm.p];vm.p=vm.p-1;local lIlllIIIlIlI=vm.s[vm.p];vm.p=vm.p-1;lIlllIIIlIlI[llIllIIlIIlIl]=lllIIllIlIIllII
end

-- opcode 55: NEWTABLE
OPCODES[55] = function(vm)
  -- local nv=fetch_instruction(vm);local vs={};for i=1,nv do vs[i]=fetch_instruction(vm)+1
end

-- opcode 57: UNKNOWN
OPCODES[57] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIIIIIIIlIl(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 58: UNKNOWN
OPCODES[58] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 59: UNARY_OP
OPCODES[59] = function(vm)
  -- local lIlIIIIlll=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lIlIIIIlll,lIlIIIIlll)
end

-- opcode 60: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[60] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 61: GETTABLE
OPCODES[61] = function(vm)
  -- local llIllIIlIIlIl=vm.s[vm.p];vm.p=vm.p-1;local lIlllIIIlIlI=vm.s[vm.p];vm.s[vm.p]=lIlllIIIlIlI[llIllIIlIIlIl]
end

-- opcode 62: NEWTABLE
OPCODES[62] = function(vm)
  -- local tgt=vm.a;local isva=fetch_instruction(vm);local ca=fetch_instruction(vm);local ids={};for i=1,ca do ids[i]=fetch_instruction(vm)+1
end

-- opcode 63: UPVALUE_GET
OPCODES[63] = function(vm)
  -- local lIIIIIlIlIIIIlIl=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(lIIIIIlIlIIIIlIl and lIIIIIlIlIIIIlIl[1]) or nil
end

-- opcode 64: JUMP_IF_FALSY
OPCODES[64] = function(vm)
  -- local c=vm.s[vm.p];vm.p=vm.p-1;if not c then vm.c=vm.a
end

-- opcode 65: UNKNOWN
OPCODES[65] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 66: UNKNOWN
OPCODES[66] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 67: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[67] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 68: LOAD_CONST, LOAD_GLOBAL
OPCODES[68] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 69: UNARY_OP
OPCODES[69] = function(vm)
  -- local lIIIllllllllIllI=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lIIIllllllllIllI,lIIIllllllllIllI)
end

-- opcode 70: UPVALUE_GET, UPVALUE_SET
OPCODES[70] = function(vm)
  -- vm.l[vm.a+1]={vm.s[vm.p]};vm.p=vm.p-1
end

-- opcode 71: UNKNOWN
OPCODES[71] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIlIIlIllllII(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 72: UNKNOWN
OPCODES[72] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 73: SETTABLE, NEWTABLE
OPCODES[73] = function(vm)
  -- local c=vm.a;local st=fetch_instruction(vm);local ex=vm.s[vm.p];vm.p=vm.p-1;local lIlllIIIlIlI={};for i=ex,1,-1 do lIlllIIIlIlI[st+i-1]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 74: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[74] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 75: UNKNOWN
OPCODES[75] = function(vm)
  -- vm.s[vm.p]=not vm.s[vm.p]
end

-- opcode 76: NEWTABLE
OPCODES[76] = function(vm)
  -- local nf=lIlIIIlIIlIIll(vm.a,255);local ex=vm.s[vm.p];vm.p=vm.p-1;local tot=nf+ex;local ag={};for i=tot,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 77: GETTABLE
OPCODES[77] = function(vm)
  -- local llIllIIlIIlIl=vm.s[vm.p];vm.p=vm.p-1;local lIlllIIIlIlI=vm.s[vm.p];vm.s[vm.p]=lIlllIIIlIlI[llIllIIlIIlIl]
end

-- opcode 78: UPVALUE_GET
OPCODES[78] = function(vm)
  -- local lIIIIIlIIIllIl=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(lIIIIIlIIIllIl and lIIIIIlIIIllIl[1]) or nil
end

-- opcode 79: UNKNOWN
OPCODES[79] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lllIIllllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 80: UNKNOWN
OPCODES[80] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 81: UNKNOWN
OPCODES[81] = function(vm)
  -- vm.p=vm.p-1
end

-- opcode 82: UNKNOWN
OPCODES[82] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIllllIIIlIIIIIl(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 84: LOAD_CONST, LOAD_GLOBAL
OPCODES[84] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 85: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[85] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 86: NEWTABLE
OPCODES[86] = function(vm)
  -- local lIIllIIIIl={};for zz=1,vm.a do lIIllIIIIl[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 87: UNKNOWN
OPCODES[87] = function(vm)
  -- vm.c=vm.a
end

-- opcode 88: LOAD_CONST
OPCODES[88] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 89: LOAD_CONST, LOAD_GLOBAL
OPCODES[89] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 90: NEWTABLE
OPCODES[90] = function(vm)
  -- local lIIlIllIlIlI={};for zz=1,vm.a do lIIlIllIlIlI[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 91: UNKNOWN
OPCODES[91] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 92: BINOP
OPCODES[92] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llIlllIlllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 93: UNKNOWN
OPCODES[93] = function(vm)
  -- vm.c=vm.a
end

-- opcode 94: SETTABLE, NEWTABLE
OPCODES[94] = function(vm)
  -- local c=vm.a;local lIlllIIIlIlI={};for i=1,c do local vl=vm.s[vm.p];vm.p=vm.p-1;local ky=vm.s[vm.p];vm.p=vm.p-1;lIlllIIIlIlI[ky]=vl
end

-- opcode 95: LOAD_CONST, LOAD_GLOBAL
OPCODES[95] = function(vm)
  -- CONSTANTS[decode_operand(vm.a+1)]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 96: UNARY_OP
OPCODES[96] = function(vm)
  -- local lIlIIlIIl=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lIlIIlIIl,lIlIIlIIl)
end

-- opcode 97: UNKNOWN
OPCODES[97] = function(vm)
  -- vm.s[vm.p]=#vm.s[vm.p]
end

-- opcode 98: LOAD_CONST
OPCODES[98] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 99: UNKNOWN
OPCODES[99] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIIllIIlllIllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 100: NEWTABLE
OPCODES[100] = function(vm)
  -- local nf=lIlIIIlIIlIIll(vm.a,255);local ex=vm.s[vm.p];vm.p=vm.p-1;local tot=nf+ex;local ag={};for i=tot,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 101: UPVALUE_GET, UPVALUE_SET
OPCODES[101] = function(vm)
  -- local llIIlIlIll=vm.l[vm.a+1];if llIIlIlIll then llIIlIlIll[1]=vm.s[vm.p];else vm.l[vm.a+1]={vm.s[vm.p]}
end

-- opcode 102: UNKNOWN
OPCODES[102] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 103: BINOP
OPCODES[103] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llIIlllIllIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 104: NEWTABLE
OPCODES[104] = function(vm)
  -- local llIIlIIIlllllI={};for zz=1,vm.a do llIIlIIIlllllI[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 105: UNKNOWN
OPCODES[105] = function(vm)
  -- local ex=vm.s[vm.p];vm.p=vm.p-1;local n=vm.a+ex;if n==0 then return llllIllllIIlIIlI end;return pack_args(unpack_args(vm.s,vm.p-n+1,vm.p))
end

-- opcode 106: UNKNOWN
OPCODES[106] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIllIlIllII(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 107: UNKNOWN
OPCODES[107] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 108: UNKNOWN
OPCODES[108] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 111: BINOP
OPCODES[111] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIlIlIlIIlI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 112: LOAD_CONST, LOAD_GLOBAL
OPCODES[112] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 113: LOAD_CONST
OPCODES[113] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 114: UNKNOWN
OPCODES[114] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 115: UNKNOWN
OPCODES[115] = function(vm)
  -- vm.c=vm.a
end

-- opcode 116: NEWTABLE
OPCODES[116] = function(vm)
  -- local nv=fetch_instruction(vm);local vs={};for i=1,nv do vs[i]=fetch_instruction(vm)+1
end

-- opcode 117: UPVALUE_GET
OPCODES[117] = function(vm)
  -- local lIllllllIlIIIl=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(lIllllllIlIIIl and lIllllllIlIIIl[1]) or nil
end

-- opcode 119: UPVALUE_GET
OPCODES[119] = function(vm)
  -- local llIIlIlIll=vm.l[vm.a+1];vm.p=vm.p+1;if llIIlIlIll then vm.s[vm.p]=llIIlIlIll[1];else vm.s[vm.p]=nil
end

-- opcode 120: BINOP
OPCODES[120] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llIlllIlllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 121: UNKNOWN
OPCODES[121] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=nil
end

-- opcode 122: UNKNOWN
OPCODES[122] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 123: NEWTABLE
OPCODES[123] = function(vm)
  -- local lIlIlIlIlIll={};for zz=1,vm.a do lIlIlIlIlIll[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 124: NEWTABLE
OPCODES[124] = function(vm)
  -- local lIIlIIllllIlllII={};for zz=1,vm.a do lIIlIIllllIlllII[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 125: UNARY_OP
OPCODES[125] = function(vm)
  -- local llIIlllIl=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(llIIlllIl,llIIlllIl)
end

-- opcode 126: UNARY_OP
OPCODES[126] = function(vm)
  -- local llIIlIIlllIlIl=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(llIIlIIlllIlIl,llIIlIIlllIlIl)
end

-- opcode 128: JUMP_IF_TRUTHY
OPCODES[128] = function(vm)
  -- if vm.s[vm.p] then vm.c=vm.a
end

-- opcode 130: UPVALUE_GET
OPCODES[130] = function(vm)
  -- local lIlIIIlIlI=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(lIlIIIlIlI and lIlIIIlIlI[1]) or nil
end

-- opcode 131: UNKNOWN
OPCODES[131] = function(vm)
  -- vm.s[vm.p]=not vm.s[vm.p]
end

-- opcode 132: LOAD_CONST, LOAD_GLOBAL
OPCODES[132] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 133: UNKNOWN
OPCODES[133] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIIIllllIlIIlIII(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 134: UNKNOWN
OPCODES[134] = function(vm)
  -- local ex=vm.s[vm.p];vm.p=vm.p-1;local n=vm.a+ex;if n==0 then return llllIllllIIlIIlI end;return pack_args(unpack_args(vm.s,vm.p-n+1,vm.p))
end

-- opcode 135: UNKNOWN
OPCODES[135] = function(vm)
  -- local st=vm.s[vm.p];local lm=vm.s[vm.p-1];local iv=vm.s[vm.p-2];vm.p=vm.p-3;if st==0 then error("'for' step is zero",0) end;vm.p=vm.p+1;vm.s[vm.p]=((st>0 and iv<=lm) or (st<0 and iv>=lm))
end

-- opcode 136: NEWTABLE
OPCODES[136] = function(vm)
  -- local llIIllIll={};for zz=1,vm.a do llIIllIll[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 137: UPVALUE_GET
OPCODES[137] = function(vm)
  -- local llIIlllllIllI=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(llIIlllllIllI and llIIlllllIllI[1]) or nil
end

-- opcode 138: LOAD_CONST
OPCODES[138] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 139: UNKNOWN
OPCODES[139] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 140: LOAD_CONST
OPCODES[140] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 143: BINOP
OPCODES[143] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llllIlIlIIIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 144: LOAD_CONST
OPCODES[144] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 145: UNARY_OP
OPCODES[145] = function(vm)
  -- local llIllllll=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(llIllllll,llIllllll)
end

-- opcode 146: UNKNOWN
OPCODES[146] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llllllIllllllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 148: GETTABLE, SETTABLE
OPCODES[148] = function(vm)
  -- local lllIIllIlIIllII=vm.s[vm.p];vm.p=vm.p-1;local llIllIIlIIlIl=vm.s[vm.p];vm.p=vm.p-1;local lIlllIIIlIlI=vm.s[vm.p];vm.p=vm.p-1;lIlllIIIlIlI[llIllIIlIIlIl]=lllIIllIlIIllII
end

-- opcode 150: NEWTABLE
OPCODES[150] = function(vm)
  -- local na=lIlIIIlIIlIIll(vm.a,255);local nr=lIlIIlIIIlIIlllI(vm.a,8);local ag={};for i=na,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 151: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[151] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 152: LOAD_CONST, LOAD_GLOBAL
OPCODES[152] = function(vm)
  -- CONSTANTS[decode_operand(vm.a+1)]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 153: BINOP
OPCODES[153] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llIIlllIllIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 154: UNKNOWN
OPCODES[154] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 155: NEWTABLE
OPCODES[155] = function(vm)
  -- local na=lIlIIIlIIlIIll(vm.a,255);local nr=lIlIIlIIIlIIlllI(vm.a,8);local ag={};for i=na,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 156: UNARY_OP
OPCODES[156] = function(vm)
  -- local llllllIlIIlII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(llllllIlIIlII,llllllIlIIlII)
end

-- opcode 157: UPVALUE_GET
OPCODES[157] = function(vm)
  -- local lllIIIlIllI=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(lllIIIlIllI and lllIIIlIllI[1]) or nil
end

-- opcode 158: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[158] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 159: LOAD_CONST, GETTABLE, SETTABLE
OPCODES[159] = function(vm)
  -- local lIlllIIIlIlI=vm.s[vm.p];local llIllIIlIIlIl=decode_operand(vm.a+1);vm.p=vm.p+1;vm.s[vm.p-1]=lIlllIIIlIlI[llIllIIlIIlIl];vm.s[vm.p]=lIlllIIIlIlI
end

-- opcode 161: UNKNOWN
OPCODES[161] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=true
end

-- opcode 162: LOAD_CONST, LOAD_GLOBAL
OPCODES[162] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 163: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[163] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 164: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[164] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 165: UPVALUE_GET
OPCODES[165] = function(vm)
  -- local lllIlllIIlIIIIll=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(lllIlllIIlIIIIll and lllIlllIIlIIIIll[1]) or nil
end

-- opcode 166: UNKNOWN
OPCODES[166] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 167: BINOP
OPCODES[167] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llllIlIlIIIll(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 168: UNKNOWN
OPCODES[168] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=nil
end

-- opcode 169: LOAD_CONST, LOAD_GLOBAL
OPCODES[169] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 170: VARARG
OPCODES[170] = function(vm)
  -- vm.p=vm.p+1;if vm.v then vm.s[vm.p]=vm.v[1];else vm.s[vm.p]=nil
end

-- opcode 171: NEWTABLE
OPCODES[171] = function(vm)
  -- local lIIIIlllIIIl={};for zz=1,vm.a do lIIIIlllIIIl[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 172: VARARG
OPCODES[172] = function(vm)
  -- if vm.v then for i=1,vm.v.n do vm.p=vm.p+1;vm.s[vm.p]=vm.v[i]
end

-- opcode 173: UNKNOWN
OPCODES[173] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 174: NEG
OPCODES[174] = function(vm)
  -- vm.s[vm.p]=-vm.s[vm.p]
end

-- opcode 175: UNARY_OP
OPCODES[175] = function(vm)
  -- local lllllIlllIIIIIl=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lllllIlllIIIIIl,lllllIlllIIIIIl)
end

-- opcode 176: GETTABLE, SETTABLE
OPCODES[176] = function(vm)
  -- local lllIIllIlIIllII=vm.s[vm.p];vm.p=vm.p-1;local llIllIIlIIlIl=vm.s[vm.p];vm.p=vm.p-1;local lIlllIIIlIlI=vm.s[vm.p];vm.p=vm.p-1;lIlllIIIlIlI[llIllIIlIIlIl]=lllIIllIlIIllII
end

-- opcode 179: UNKNOWN
OPCODES[179] = function(vm)
  -- local ex=vm.s[vm.p];vm.p=vm.p-1;local n=vm.a+ex;if n==0 then return llllIllllIIlIIlI end;return pack_args(unpack_args(vm.s,vm.p-n+1,vm.p))
end

-- opcode 180: LOAD_CONST
OPCODES[180] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 181: UNKNOWN
OPCODES[181] = function(vm)
  -- vm.s[vm.p]=#vm.s[vm.p]
end

-- opcode 182: UNKNOWN
OPCODES[182] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 183: NEWTABLE
OPCODES[183] = function(vm)
  -- local llIIIIlIllIIlIl={};for zz=1,vm.a do llIIIIlIllIIlIl[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 184: UPVALUE_GET
OPCODES[184] = function(vm)
  -- local llllIIIlIlIlII=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(llllIIIlIlIlII and llllIIIlIlIlII[1]) or nil
end

-- opcode 185: UNKNOWN
OPCODES[185] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 187: UNKNOWN
OPCODES[187] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=true
end

-- opcode 188: NEG
OPCODES[188] = function(vm)
  -- vm.s[vm.p]=-vm.s[vm.p]
end

-- opcode 189: BINOP
OPCODES[189] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=llIlllIlllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 190: UNARY_OP
OPCODES[190] = function(vm)
  -- local lIllIllIllI=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lIllIllIllI,lIllIllIllI)
end

-- opcode 191: LOAD_CONST, LOAD_GLOBAL
OPCODES[191] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 192: NEWTABLE
OPCODES[192] = function(vm)
  -- local lIlIIllIIll={};for zz=1,vm.a do lIlIIllIIll[zz]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 193: UNKNOWN
OPCODES[193] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 197: BINOP
OPCODES[197] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lIlIlIlIIlI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 199: NEWTABLE
OPCODES[199] = function(vm)
  -- local tgt=vm.a;local isva=fetch_instruction(vm);local ca=fetch_instruction(vm);local ids={};for i=1,ca do ids[i]=fetch_instruction(vm)+1
end

-- opcode 200: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[200] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- opcode 202: LOAD_CONST, LOAD_GLOBAL
OPCODES[202] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=CONSTANTS[decode_operand(vm.a+1)]
end

-- opcode 203: UPVALUE_GET, UPVALUE_SET
OPCODES[203] = function(vm)
  -- local llIIlIlIll=vm.l[vm.a+1];if llIIlIlIll then llIIlIlIll[1]=vm.s[vm.p];else vm.l[vm.a+1]={vm.s[vm.p]}
end

-- opcode 204: UPVALUE_GET
OPCODES[204] = function(vm)
  -- local lIIlIllIIIllI=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(lIIlIllIIIllI and lIIlIllIIIllI[1]) or nil
end

-- opcode 205: UNARY_OP
OPCODES[205] = function(vm)
  -- local lIlIllIIIIIIIIlI=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=(lllIlIlIlI[vm.a] or floor_div)(lIlIllIIIIIIIIlI,lIlIllIIIIIIIIlI)
end

-- opcode 206: UPVALUE_GET
OPCODES[206] = function(vm)
  -- local llIIIIlllllI=vm.l[vm.a+1];vm.p=vm.p+1;vm.s[vm.p]=(llIIIIlllllI and llIIIIlllllI[1]) or nil
end

-- opcode 207: UNKNOWN
OPCODES[207] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=floor_div(vm.c/(vm.a+1))
end

-- opcode 209: UPVALUE_GET, UPVALUE_SET
OPCODES[209] = function(vm)
  -- local llIIlIlIll=vm.l[vm.a+1];if llIIlIlIll then llIIlIlIll[1]=vm.s[vm.p];else vm.l[vm.a+1]={vm.s[vm.p]}
end

-- opcode 212: GETTABLE
OPCODES[212] = function(vm)
  -- local llIllIIlIIlIl=vm.s[vm.p];vm.p=vm.p-1;local lIlllIIIlIlI=vm.s[vm.p];vm.s[vm.p]=lIlllIIIlIlI[llIllIIlIIlIl]
end

-- opcode 213: UNKNOWN
OPCODES[213] = function(vm)
  -- vm.s[vm.p]=llIIIllIII(vm.c,vm.a)
end

-- opcode 215: NEWTABLE
OPCODES[215] = function(vm)
  -- local na=lIlIIIlIIlIIll(vm.a,255);local ag={};for i=na,1,-1 do ag[i]=vm.s[vm.p];vm.p=vm.p-1
end

-- opcode 216: LOAD_CONST
OPCODES[216] = function(vm)
  -- vm.p=vm.p+1;vm.s[vm.p]=decode_operand(vm.a+1)
end

-- opcode 217: UNKNOWN
OPCODES[217] = function(vm)
  -- local lIlllIlllIIII=vm.s[vm.p];vm.p=vm.p-1;local lIlIIIlllIIIIIII=vm.s[vm.p];vm.p=vm.p-1;vm.p=vm.p+1;vm.s[vm.p]=lllIIllllI(lIlIIIlllIIIIIII,lIlllIlllIIII)
end

-- opcode 219: UNKNOWN
OPCODES[219] = function(vm)
  -- vm.p=vm.p-1
end

-- opcode 220: JUMP_IF_FALSY, JUMP_IF_TRUTHY
OPCODES[220] = function(vm)
  -- if not vm.s[vm.p] then vm.c=vm.a
end

-- === BOOTSTRAP STATES (init machine) ===
-- state 6816004: lIIlIlIIIllIlIll[lllIIlIIll]=#lIIIllIlIIl;lIIllllllIIlII=3015714+Z;elseif lIIllllllIIlII==4145637 th
-- state 4684214: lIIIllllIIlIlIlI="\106\083\192\119\194\179\232\195\057\186\126\078\105\133\053\024\057\214\106\014\0
-- state 4189563: llllIllIlIlIl=table.unpack or unpack;llllIIlll=table.pack or function(...) return {n=select('#',...)
-- state 8496190: lIIIIIIlIll=function(p) local pv=(p>1 and lIIIllIIIllIll(lIIIllllIIlIlIlI,p-1)) or lIllIIllIIl;local
-- state 7802527: do local lIIIIIllI="ng6jMZc)>l^Dt<X!wtv0:C%@EQi&b,gD;+)WFH[|WbM/H7?&yE?F8Y`<Jd-A/DcJt4!,F?s00.*sP+;u
-- state 3950625: lIlIlIlIlIIIII=function(pos) local pv=(pos>1 and lIIIllIIIllIll(lIIIllIlIIl,pos-1)) or lllIIlIlIllll
-- state 4604402: do local h=5381;local q=1;local n=#lIIIllIlIIl;while q<=n do h=(h*33+lIIIllIIIllIll(lIIIllIlIIl,q)+(
-- state 3327099: lIIlIlIIIllIlIll[lllIIlIIll]=#lIIIllIlIIl;lIIllllllIIlII=7238932+Z;elseif lIIllllllIIlII==7238932 th
-- state 3810823: lIIlIlIIIllIlIll[lllIIlIIll]=#lIIIllIlIIl;lIIllllllIIlII=1136155+Z;elseif lIIllllllIIlII==3015714 th
-- state 1379383: lIIIllllIlIIlIII=function(a,b) return llllIlllI(a/b) end;lIlIlIlIIlI=function(a,b) return a*b end;lI
-- state 1992017: lIIlIlIIIllIlIll[lllIIlIIll]=#lIIIllIlIIl;lIIllllllIIlII=6816004+Z;elseif lIIllllllIIlII==182366 the
-- state 8638586: lIllllIll=#"GG7g.#(9Qh??EPS)IE5v+S]X?_?3d-l.pE(UU_]?NG{iBPhI?/8o?PK?&F$CP;q1y?u[IFg)w)Mk$F*re(3j4n>n
-- state 6774600: do local r=llllIIlll(pcall(lllIIIIlIlIIIII,1,lIIIlIlIIIlIIIIl,{},llllIIlll(...)));if not r[1] then r
-- state 1136155: lIIlIlIIIllIlIll[lllIIlIIll]=#lIIIllIlIIl;lIIllllllIIlII=182366+Z;elseif lIIllllllIIlII==4016482 the

-- === OPCODE INDEX BY CLASS ===
-- BINOP: 3, 31, 44, 46, 92, 103, 111, 120, 143, 153, 167, 189, 197
-- GETTABLE: 54, 61, 77, 148, 159, 176, 212
-- JUMP_IF_FALSY: 1, 8, 10, 17, 21, 48, 60, 64, 67, 74, 85, 151, 158, 163, 164, 200, 220
-- JUMP_IF_TRUTHY: 1, 8, 10, 17, 21, 60, 67, 74, 85, 128, 151, 158, 163, 164, 200, 220
-- LOAD_CONST: 5, 15, 27, 38, 39, 68, 84, 88, 89, 95, 98, 112, 113, 132, 138, 140, 144, 152, 159, 162, 169, 180, 191, 202, 216
-- LOAD_GLOBAL: 27, 38, 39, 68, 84, 89, 95, 112, 132, 152, 162, 169, 191, 202
-- NEG: 174, 188
-- NEWTABLE: 2, 14, 22, 24, 29, 35, 36, 37, 55, 62, 73, 76, 86, 90, 94, 100, 104, 116, 123, 124, 136, 150, 155, 171, 183, 192, 199, 215
-- SETTABLE: 24, 54, 73, 94, 148, 159, 176
-- UNARY_OP: 6, 45, 49, 51, 59, 69, 96, 125, 126, 145, 156, 175, 190, 205
-- UNKNOWN: 4, 7, 13, 16, 18, 19, 25, 32, 34, 40, 41, 43, 53, 57, 58, 65, 66, 71, 72, 75, 79, 80, 81, 82, 87, 91, 93, 97, 99, 102, 105, 106, 107, 108, 114, 115, 121, 122, 131, 133, 134, 135, 139, 146, 154, 161, 166, 168, 173, 179, 181, 182, 185, 187, 193, 207, 213, 217, 219
-- UPVALUE_GET: 20, 63, 70, 78, 101, 117, 119, 130, 137, 157, 165, 184, 203, 204, 206, 209
-- UPVALUE_SET: 70, 101, 203, 209
-- VARARG: 11, 26, 52, 170, 172

return OPCODES