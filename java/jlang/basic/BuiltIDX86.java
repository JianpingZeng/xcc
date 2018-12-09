package jlang.basic;
/*
 * Extremely C language Compiler
 * Copyright (c) 2015-2018, Jianping Zeng.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied.  See the License for the specific language governing
 * permissions and limitations under the License.
 */

/**
 * @author Jianping Zeng
 * @version 0.4
 */
public interface BuiltIDX86 {
  int BI__builtin_ia32_emms = BuiltID.FirstTSBuiltin;
  int BI__builtin_ia32_comieq = BI__builtin_ia32_emms + 1;
  int BI__builtin_ia32_comilt = BI__builtin_ia32_comieq + 1;
  int BI__builtin_ia32_comile = BI__builtin_ia32_comilt + 1;
  int BI__builtin_ia32_comigt = BI__builtin_ia32_comile + 1;
  int BI__builtin_ia32_comige = BI__builtin_ia32_comigt + 1;
  int BI__builtin_ia32_comineq = BI__builtin_ia32_comige + 1;
  int BI__builtin_ia32_ucomieq = BI__builtin_ia32_comineq + 1;
  int BI__builtin_ia32_ucomilt = BI__builtin_ia32_ucomieq + 1;
  int BI__builtin_ia32_ucomile = BI__builtin_ia32_ucomilt + 1;
  int BI__builtin_ia32_ucomigt = BI__builtin_ia32_ucomile + 1;
  int BI__builtin_ia32_ucomige = BI__builtin_ia32_ucomigt + 1;
  int BI__builtin_ia32_ucomineq = BI__builtin_ia32_ucomige + 1;
  int BI__builtin_ia32_comisdeq = BI__builtin_ia32_ucomineq + 1;
  int BI__builtin_ia32_comisdlt = BI__builtin_ia32_comisdeq + 1;
  int BI__builtin_ia32_comisdle = BI__builtin_ia32_comisdlt + 1;
  int BI__builtin_ia32_comisdgt = BI__builtin_ia32_comisdle + 1;
  int BI__builtin_ia32_comisdge = BI__builtin_ia32_comisdgt + 1;
  int BI__builtin_ia32_comisdneq = BI__builtin_ia32_comisdge + 1;
  int BI__builtin_ia32_ucomisdeq = BI__builtin_ia32_comisdneq + 1;
  int BI__builtin_ia32_ucomisdlt = BI__builtin_ia32_ucomisdeq + 1;
  int BI__builtin_ia32_ucomisdle = BI__builtin_ia32_ucomisdlt + 1;
  int BI__builtin_ia32_ucomisdgt = BI__builtin_ia32_ucomisdle + 1;
  int BI__builtin_ia32_ucomisdge = BI__builtin_ia32_ucomisdgt + 1;
  int BI__builtin_ia32_ucomisdneq = BI__builtin_ia32_ucomisdge + 1;
  int BI__builtin_ia32_cmpps = BI__builtin_ia32_ucomisdneq + 1;
  int BI__builtin_ia32_cmpss = BI__builtin_ia32_cmpps + 1;
  int BI__builtin_ia32_minps = BI__builtin_ia32_cmpss + 1;
  int BI__builtin_ia32_maxps = BI__builtin_ia32_minps + 1;
  int BI__builtin_ia32_minss = BI__builtin_ia32_maxps + 1;
  int BI__builtin_ia32_maxss = BI__builtin_ia32_minss + 1;
  int BI__builtin_ia32_paddsb = BI__builtin_ia32_maxss + 1;
  int BI__builtin_ia32_paddsw = BI__builtin_ia32_paddsb + 1;
  int BI__builtin_ia32_psubsb = BI__builtin_ia32_paddsw + 1;
  int BI__builtin_ia32_psubsw = BI__builtin_ia32_psubsb + 1;
  int BI__builtin_ia32_paddusb = BI__builtin_ia32_psubsw + 1;
  int BI__builtin_ia32_paddusw = BI__builtin_ia32_paddusb + 1;
  int BI__builtin_ia32_psubusb = BI__builtin_ia32_paddusw + 1;
  int BI__builtin_ia32_psubusw = BI__builtin_ia32_psubusb + 1;
  int BI__builtin_ia32_pmulhw = BI__builtin_ia32_psubusw + 1;
  int BI__builtin_ia32_pmulhuw = BI__builtin_ia32_pmulhw + 1;
  int BI__builtin_ia32_pavgb = BI__builtin_ia32_pmulhuw + 1;
  int BI__builtin_ia32_pavgw = BI__builtin_ia32_pavgb + 1;
  int BI__builtin_ia32_pcmpeqb = BI__builtin_ia32_pavgw + 1;
  int BI__builtin_ia32_pcmpeqw = BI__builtin_ia32_pcmpeqb + 1;
  int BI__builtin_ia32_pcmpeqd = BI__builtin_ia32_pcmpeqw + 1;
  int BI__builtin_ia32_pcmpgtb = BI__builtin_ia32_pcmpeqd + 1;
  int BI__builtin_ia32_pcmpgtw = BI__builtin_ia32_pcmpgtb + 1;
  int BI__builtin_ia32_pcmpgtd = BI__builtin_ia32_pcmpgtw + 1;
  int BI__builtin_ia32_pmaxub = BI__builtin_ia32_pcmpgtd + 1;
  int BI__builtin_ia32_pmaxsw = BI__builtin_ia32_pmaxub + 1;
  int BI__builtin_ia32_pminub = BI__builtin_ia32_pmaxsw + 1;
  int BI__builtin_ia32_pminsw = BI__builtin_ia32_pminub + 1;
  int BI__builtin_ia32_punpckhbw = BI__builtin_ia32_pminsw + 1;
  int BI__builtin_ia32_punpckhwd = BI__builtin_ia32_punpckhbw + 1;
  int BI__builtin_ia32_punpckhdq = BI__builtin_ia32_punpckhwd + 1;
  int BI__builtin_ia32_punpcklbw = BI__builtin_ia32_punpckhdq + 1;
  int BI__builtin_ia32_punpcklwd = BI__builtin_ia32_punpcklbw + 1;
  int BI__builtin_ia32_punpckldq = BI__builtin_ia32_punpcklwd + 1;
  int BI__builtin_ia32_cmppd = BI__builtin_ia32_punpckldq + 1;
  int BI__builtin_ia32_cmpsd = BI__builtin_ia32_cmppd + 1;
  int BI__builtin_ia32_minpd = BI__builtin_ia32_cmpsd + 1;
  int BI__builtin_ia32_maxpd = BI__builtin_ia32_minpd + 1;
  int BI__builtin_ia32_minsd = BI__builtin_ia32_maxpd + 1;
  int BI__builtin_ia32_maxsd = BI__builtin_ia32_minsd + 1;
  int BI__builtin_ia32_paddsb128 = BI__builtin_ia32_maxsd + 1;
  int BI__builtin_ia32_paddsw128 = BI__builtin_ia32_paddsb128 + 1;
  int BI__builtin_ia32_psubsb128 = BI__builtin_ia32_paddsw128 + 1;
  int BI__builtin_ia32_psubsw128 = BI__builtin_ia32_psubsb128 + 1;
  int BI__builtin_ia32_paddusb128 = BI__builtin_ia32_psubsw128 + 1;
  int BI__builtin_ia32_paddusw128 = BI__builtin_ia32_paddusb128 + 1;
  int BI__builtin_ia32_psubusb128 = BI__builtin_ia32_paddusw128 + 1;
  int BI__builtin_ia32_psubusw128 = BI__builtin_ia32_psubusb128 + 1;
  int BI__builtin_ia32_pmullw128 = BI__builtin_ia32_psubusw128 + 1;
  int BI__builtin_ia32_pmulhw128 = BI__builtin_ia32_pmullw128 + 1;
  int BI__builtin_ia32_pavgb128 = BI__builtin_ia32_pmulhw128 + 1;
  int BI__builtin_ia32_pavgw128 = BI__builtin_ia32_pavgb128 + 1;
  int BI__builtin_ia32_pcmpeqb128 = BI__builtin_ia32_pavgw128 + 1;
  int BI__builtin_ia32_pcmpeqw128 = BI__builtin_ia32_pcmpeqb128 + 1;
  int BI__builtin_ia32_pcmpeqd128 = BI__builtin_ia32_pcmpeqw128 + 1;
  int BI__builtin_ia32_pcmpgtb128 = BI__builtin_ia32_pcmpeqd128 + 1;
  int BI__builtin_ia32_pcmpgtw128 = BI__builtin_ia32_pcmpgtb128 + 1;
  int BI__builtin_ia32_pcmpgtd128 = BI__builtin_ia32_pcmpgtw128 + 1;
  int BI__builtin_ia32_pmaxub128 = BI__builtin_ia32_pcmpgtd128 + 1;
  int BI__builtin_ia32_pmaxsw128 = BI__builtin_ia32_pmaxub128 + 1;
  int BI__builtin_ia32_pminub128 = BI__builtin_ia32_pmaxsw128 + 1;
  int BI__builtin_ia32_pminsw128 = BI__builtin_ia32_pminub128 + 1;
  int BI__builtin_ia32_packsswb128 = BI__builtin_ia32_pminsw128 + 1;
  int BI__builtin_ia32_packssdw128 = BI__builtin_ia32_packsswb128 + 1;
  int BI__builtin_ia32_packuswb128 = BI__builtin_ia32_packssdw128 + 1;
  int BI__builtin_ia32_pmulhuw128 = BI__builtin_ia32_packuswb128 + 1;
  int BI__builtin_ia32_addsubps = BI__builtin_ia32_pmulhuw128 + 1;
  int BI__builtin_ia32_addsubpd = BI__builtin_ia32_addsubps + 1;
  int BI__builtin_ia32_haddps = BI__builtin_ia32_addsubpd + 1;
  int BI__builtin_ia32_haddpd = BI__builtin_ia32_haddps + 1;
  int BI__builtin_ia32_hsubps = BI__builtin_ia32_haddpd + 1;
  int BI__builtin_ia32_hsubpd = BI__builtin_ia32_hsubps + 1;
  int BI__builtin_ia32_phaddw128 = BI__builtin_ia32_hsubpd + 1;
  int BI__builtin_ia32_phaddw = BI__builtin_ia32_phaddw128 + 1;
  int BI__builtin_ia32_phaddd128 = BI__builtin_ia32_phaddw + 1;
  int BI__builtin_ia32_phaddd = BI__builtin_ia32_phaddd128 + 1;
  int BI__builtin_ia32_phaddsw128 = BI__builtin_ia32_phaddd + 1;
  int BI__builtin_ia32_phaddsw = BI__builtin_ia32_phaddsw128 + 1;
  int BI__builtin_ia32_phsubw128 = BI__builtin_ia32_phaddsw + 1;
  int BI__builtin_ia32_phsubw = BI__builtin_ia32_phsubw128 + 1;
  int BI__builtin_ia32_phsubd128 = BI__builtin_ia32_phsubw + 1;
  int BI__builtin_ia32_phsubd = BI__builtin_ia32_phsubd128 + 1;
  int BI__builtin_ia32_phsubsw128 = BI__builtin_ia32_phsubd + 1;
  int BI__builtin_ia32_phsubsw = BI__builtin_ia32_phsubsw128 + 1;
  int BI__builtin_ia32_pmaddubsw128 = BI__builtin_ia32_phsubsw + 1;
  int BI__builtin_ia32_pmaddubsw = BI__builtin_ia32_pmaddubsw128 + 1;
  int BI__builtin_ia32_pmulhrsw128 = BI__builtin_ia32_pmaddubsw + 1;
  int BI__builtin_ia32_pmulhrsw = BI__builtin_ia32_pmulhrsw128 + 1;
  int BI__builtin_ia32_pshufb128 = BI__builtin_ia32_pmulhrsw + 1;
  int BI__builtin_ia32_pshufb = BI__builtin_ia32_pshufb128 + 1;
  int BI__builtin_ia32_psignb128 = BI__builtin_ia32_pshufb + 1;
  int BI__builtin_ia32_psignb = BI__builtin_ia32_psignb128 + 1;
  int BI__builtin_ia32_psignw128 = BI__builtin_ia32_psignb + 1;
  int BI__builtin_ia32_psignw = BI__builtin_ia32_psignw128 + 1;
  int BI__builtin_ia32_psignd128 = BI__builtin_ia32_psignw + 1;
  int BI__builtin_ia32_psignd = BI__builtin_ia32_psignd128 + 1;
  int BI__builtin_ia32_pabsb128 = BI__builtin_ia32_psignd + 1;
  int BI__builtin_ia32_pabsb = BI__builtin_ia32_pabsb128 + 1;
  int BI__builtin_ia32_pabsw128 = BI__builtin_ia32_pabsb + 1;
  int BI__builtin_ia32_pabsw = BI__builtin_ia32_pabsw128 + 1;
  int BI__builtin_ia32_pabsd128 = BI__builtin_ia32_pabsw + 1;
  int BI__builtin_ia32_pabsd = BI__builtin_ia32_pabsd128 + 1;
  int BI__builtin_ia32_psllw = BI__builtin_ia32_pabsd + 1;
  int BI__builtin_ia32_pslld = BI__builtin_ia32_psllw + 1;
  int BI__builtin_ia32_psllq = BI__builtin_ia32_pslld + 1;
  int BI__builtin_ia32_psrlw = BI__builtin_ia32_psllq + 1;
  int BI__builtin_ia32_psrld = BI__builtin_ia32_psrlw + 1;
  int BI__builtin_ia32_psrlq = BI__builtin_ia32_psrld + 1;
  int BI__builtin_ia32_psraw = BI__builtin_ia32_psrlq + 1;
  int BI__builtin_ia32_psrad = BI__builtin_ia32_psraw + 1;
  int BI__builtin_ia32_pmaddwd = BI__builtin_ia32_psrad + 1;
  int BI__builtin_ia32_packsswb = BI__builtin_ia32_pmaddwd + 1;
  int BI__builtin_ia32_packssdw = BI__builtin_ia32_packsswb + 1;
  int BI__builtin_ia32_packuswb = BI__builtin_ia32_packssdw + 1;
  int BI__builtin_ia32_ldmxcsr = BI__builtin_ia32_packuswb + 1;
  int BI__builtin_ia32_stmxcsr = BI__builtin_ia32_ldmxcsr + 1;
  int BI__builtin_ia32_cvtpi2ps = BI__builtin_ia32_stmxcsr + 1;
  int BI__builtin_ia32_cvtps2pi = BI__builtin_ia32_cvtpi2ps + 1;
  int BI__builtin_ia32_cvtss2si = BI__builtin_ia32_cvtps2pi + 1;
  int BI__builtin_ia32_cvtss2si64 = BI__builtin_ia32_cvtss2si + 1;
  int BI__builtin_ia32_cvttps2pi = BI__builtin_ia32_cvtss2si64 + 1;
  int BI__builtin_ia32_maskmovq = BI__builtin_ia32_cvttps2pi + 1;
  int BI__builtin_ia32_loadups = BI__builtin_ia32_maskmovq + 1;
  int BI__builtin_ia32_storeups = BI__builtin_ia32_loadups + 1;
  int BI__builtin_ia32_storehps = BI__builtin_ia32_storeups + 1;
  int BI__builtin_ia32_storelps = BI__builtin_ia32_storehps + 1;
  int BI__builtin_ia32_movmskps = BI__builtin_ia32_storelps + 1;
  int BI__builtin_ia32_pmovmskb = BI__builtin_ia32_movmskps + 1;
  int BI__builtin_ia32_movntps = BI__builtin_ia32_pmovmskb + 1;
  int BI__builtin_ia32_movntq = BI__builtin_ia32_movntps + 1;
  int BI__builtin_ia32_sfence = BI__builtin_ia32_movntq + 1;
  int BI__builtin_ia32_psadbw = BI__builtin_ia32_sfence + 1;
  int BI__builtin_ia32_rcpps = BI__builtin_ia32_psadbw + 1;
  int BI__builtin_ia32_rcpss = BI__builtin_ia32_rcpps + 1;
  int BI__builtin_ia32_rsqrtps = BI__builtin_ia32_rcpss + 1;
  int BI__builtin_ia32_rsqrtss = BI__builtin_ia32_rsqrtps + 1;
  int BI__builtin_ia32_sqrtps = BI__builtin_ia32_rsqrtss + 1;
  int BI__builtin_ia32_sqrtss = BI__builtin_ia32_sqrtps + 1;
  int BI__builtin_ia32_maskmovdqu = BI__builtin_ia32_sqrtss + 1;
  int BI__builtin_ia32_loadupd = BI__builtin_ia32_maskmovdqu + 1;
  int BI__builtin_ia32_storeupd = BI__builtin_ia32_loadupd + 1;
  int BI__builtin_ia32_movmskpd = BI__builtin_ia32_storeupd + 1;
  int BI__builtin_ia32_pmovmskb128 = BI__builtin_ia32_movmskpd + 1;
  int BI__builtin_ia32_movnti = BI__builtin_ia32_pmovmskb128 + 1;
  int BI__builtin_ia32_movntpd = BI__builtin_ia32_movnti + 1;
  int BI__builtin_ia32_movntdq = BI__builtin_ia32_movntpd + 1;
  int BI__builtin_ia32_psadbw128 = BI__builtin_ia32_movntdq + 1;
  int BI__builtin_ia32_sqrtpd = BI__builtin_ia32_psadbw128 + 1;
  int BI__builtin_ia32_sqrtsd = BI__builtin_ia32_sqrtpd + 1;
  int BI__builtin_ia32_cvtdq2pd = BI__builtin_ia32_sqrtsd + 1;
  int BI__builtin_ia32_cvtdq2ps = BI__builtin_ia32_cvtdq2pd + 1;
  int BI__builtin_ia32_cvtpd2dq = BI__builtin_ia32_cvtdq2ps + 1;
  int BI__builtin_ia32_cvtpd2pi = BI__builtin_ia32_cvtpd2dq + 1;
  int BI__builtin_ia32_cvtpd2ps = BI__builtin_ia32_cvtpd2pi + 1;
  int BI__builtin_ia32_cvttpd2dq = BI__builtin_ia32_cvtpd2ps + 1;
  int BI__builtin_ia32_cvttpd2pi = BI__builtin_ia32_cvttpd2dq + 1;
  int BI__builtin_ia32_cvtpi2pd = BI__builtin_ia32_cvttpd2pi + 1;
  int BI__builtin_ia32_cvtsd2si = BI__builtin_ia32_cvtpi2pd + 1;
  int BI__builtin_ia32_cvtsd2si64 = BI__builtin_ia32_cvtsd2si + 1;
  int BI__builtin_ia32_cvtps2dq = BI__builtin_ia32_cvtsd2si64 + 1;
  int BI__builtin_ia32_cvtps2pd = BI__builtin_ia32_cvtps2dq + 1;
  int BI__builtin_ia32_cvttps2dq = BI__builtin_ia32_cvtps2pd + 1;
  int BI__builtin_ia32_clflush = BI__builtin_ia32_cvttps2dq + 1;
  int BI__builtin_ia32_lfence = BI__builtin_ia32_clflush + 1;
  int BI__builtin_ia32_mfence = BI__builtin_ia32_lfence + 1;
  int BI__builtin_ia32_loaddqu = BI__builtin_ia32_mfence + 1;
  int BI__builtin_ia32_storedqu = BI__builtin_ia32_loaddqu + 1;
  int BI__builtin_ia32_psllwi = BI__builtin_ia32_storedqu + 1;
  int BI__builtin_ia32_pslldi = BI__builtin_ia32_psllwi + 1;
  int BI__builtin_ia32_psllqi = BI__builtin_ia32_pslldi + 1;
  int BI__builtin_ia32_psrawi = BI__builtin_ia32_psllqi + 1;
  int BI__builtin_ia32_psradi = BI__builtin_ia32_psrawi + 1;
  int BI__builtin_ia32_psrlwi = BI__builtin_ia32_psradi + 1;
  int BI__builtin_ia32_psrldi = BI__builtin_ia32_psrlwi + 1;
  int BI__builtin_ia32_psrlqi = BI__builtin_ia32_psrldi + 1;
  int BI__builtin_ia32_pmuludq = BI__builtin_ia32_psrlqi + 1;
  int BI__builtin_ia32_pmuludq128 = BI__builtin_ia32_pmuludq + 1;
  int BI__builtin_ia32_psraw128 = BI__builtin_ia32_pmuludq128 + 1;
  int BI__builtin_ia32_psrad128 = BI__builtin_ia32_psraw128 + 1;
  int BI__builtin_ia32_psrlw128 = BI__builtin_ia32_psrad128 + 1;
  int BI__builtin_ia32_psrld128 = BI__builtin_ia32_psrlw128 + 1;
  int BI__builtin_ia32_pslldqi128 = BI__builtin_ia32_psrld128 + 1;
  int BI__builtin_ia32_psrldqi128 = BI__builtin_ia32_pslldqi128 + 1;
  int BI__builtin_ia32_psrlq128 = BI__builtin_ia32_psrldqi128 + 1;
  int BI__builtin_ia32_psllw128 = BI__builtin_ia32_psrlq128 + 1;
  int BI__builtin_ia32_pslld128 = BI__builtin_ia32_psllw128 + 1;
  int BI__builtin_ia32_psllq128 = BI__builtin_ia32_pslld128 + 1;
  int BI__builtin_ia32_psllwi128 = BI__builtin_ia32_psllq128 + 1;
  int BI__builtin_ia32_pslldi128 = BI__builtin_ia32_psllwi128 + 1;
  int BI__builtin_ia32_psllqi128 = BI__builtin_ia32_pslldi128 + 1;
  int BI__builtin_ia32_psrlwi128 = BI__builtin_ia32_psllqi128 + 1;
  int BI__builtin_ia32_psrldi128 = BI__builtin_ia32_psrlwi128 + 1;
  int BI__builtin_ia32_psrlqi128 = BI__builtin_ia32_psrldi128 + 1;
  int BI__builtin_ia32_psrawi128 = BI__builtin_ia32_psrlqi128 + 1;
  int BI__builtin_ia32_psradi128 = BI__builtin_ia32_psrawi128 + 1;
  int BI__builtin_ia32_pmaddwd128 = BI__builtin_ia32_psradi128 + 1;
  int BI__builtin_ia32_monitor = BI__builtin_ia32_pmaddwd128 + 1;
  int BI__builtin_ia32_mwait = BI__builtin_ia32_monitor + 1;
  int BI__builtin_ia32_lddqu = BI__builtin_ia32_mwait + 1;
  int BI__builtin_ia32_palignr128 = BI__builtin_ia32_lddqu + 1;
  int BI__builtin_ia32_palignr = BI__builtin_ia32_palignr128 + 1;
  int BI__builtin_ia32_insertps128 = BI__builtin_ia32_palignr + 1;
  int BI__builtin_ia32_storelv4si = BI__builtin_ia32_insertps128 + 1;
  int BI__builtin_ia32_pblendvb128 = BI__builtin_ia32_storelv4si + 1;
  int BI__builtin_ia32_pblendw128 = BI__builtin_ia32_pblendvb128 + 1;
  int BI__builtin_ia32_blendpd = BI__builtin_ia32_pblendw128 + 1;
  int BI__builtin_ia32_blendps = BI__builtin_ia32_blendpd + 1;
  int BI__builtin_ia32_blendvpd = BI__builtin_ia32_blendps + 1;
  int BI__builtin_ia32_blendvps = BI__builtin_ia32_blendvpd + 1;
  int BI__builtin_ia32_packusdw128 = BI__builtin_ia32_blendvps + 1;
  int BI__builtin_ia32_pmaxsb128 = BI__builtin_ia32_packusdw128 + 1;
  int BI__builtin_ia32_pmaxsd128 = BI__builtin_ia32_pmaxsb128 + 1;
  int BI__builtin_ia32_pmaxud128 = BI__builtin_ia32_pmaxsd128 + 1;
  int BI__builtin_ia32_pmaxuw128 = BI__builtin_ia32_pmaxud128 + 1;
  int BI__builtin_ia32_pminsb128 = BI__builtin_ia32_pmaxuw128 + 1;
  int BI__builtin_ia32_pminsd128 = BI__builtin_ia32_pminsb128 + 1;
  int BI__builtin_ia32_pminud128 = BI__builtin_ia32_pminsd128 + 1;
  int BI__builtin_ia32_pminuw128 = BI__builtin_ia32_pminud128 + 1;
  int BI__builtin_ia32_pmovsxbd128 = BI__builtin_ia32_pminuw128 + 1;
  int BI__builtin_ia32_pmovsxbq128 = BI__builtin_ia32_pmovsxbd128 + 1;
  int BI__builtin_ia32_pmovsxbw128 = BI__builtin_ia32_pmovsxbq128 + 1;
  int BI__builtin_ia32_pmovsxdq128 = BI__builtin_ia32_pmovsxbw128 + 1;
  int BI__builtin_ia32_pmovsxwd128 = BI__builtin_ia32_pmovsxdq128 + 1;
  int BI__builtin_ia32_pmovsxwq128 = BI__builtin_ia32_pmovsxwd128 + 1;
  int BI__builtin_ia32_pmovzxbd128 = BI__builtin_ia32_pmovsxwq128 + 1;
  int BI__builtin_ia32_pmovzxbq128 = BI__builtin_ia32_pmovzxbd128 + 1;
  int BI__builtin_ia32_pmovzxbw128 = BI__builtin_ia32_pmovzxbq128 + 1;
  int BI__builtin_ia32_pmovzxdq128 = BI__builtin_ia32_pmovzxbw128 + 1;
  int BI__builtin_ia32_pmovzxwd128 = BI__builtin_ia32_pmovzxdq128 + 1;
  int BI__builtin_ia32_pmovzxwq128 = BI__builtin_ia32_pmovzxwd128 + 1;
  int BI__builtin_ia32_pmuldq128 = BI__builtin_ia32_pmovzxwq128 + 1;
  int BI__builtin_ia32_pmulld128 = BI__builtin_ia32_pmuldq128 + 1;
  int BI__builtin_ia32_roundps = BI__builtin_ia32_pmulld128 + 1;
  int BI__builtin_ia32_roundss = BI__builtin_ia32_roundps + 1;
  int BI__builtin_ia32_roundsd = BI__builtin_ia32_roundss + 1;
  int BI__builtin_ia32_roundpd = BI__builtin_ia32_roundsd + 1;
}
