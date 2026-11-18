nicks := ["Denwer3","Ybrayym_01","king311","ItzAkadeMikk","begenc7","tkm_vem","king313","halki_men","Selim_1","Ejderkraly03","dante07","_K9NFETKA_01","_volcon0k_","Arzygul","Arslan012","rowsen_leve_","meko_kral","TKM_KOROL","evelynsi","Janibek1","Malib1_vern","pusho4ek","fliya08","okey_57_","ax_1804","agyyIIIA21","Medine_077","Soro_chik_","Aron_","kitty_gril","Ayka_lay","siaowoa","nurana_012","ULKER_MAFYA","tbou_lime","yagmurow1","Medet_karol","resuliki","skcbinw","Zarazox","Bosoglan","Polina12211","ItzAkadEMIk","Afra","womaniz","Ibrahim_1998","TKM_202","LastSoul","bega_2013"]

F1::
    Sleep, 2000
    for i, nick in nicks{
        SendInput, {Text}/ban %nick% 50000 4.1
        SendInput, {Enter}
    }
    ToolTip, done
return


F8::ExitApp


;get_nicks(str){
;    arr := []
;    parts := StrSplit(str, ",")
;    for i, v in parts {
;        v := Trim(v)
;        v := RegExReplace(v, "\s*\(.*?\)")
;        arr.Push(v)
;    }
;    return arr
;}