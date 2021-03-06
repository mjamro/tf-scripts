/def _team_is_member = \
    /let search=$[tolower({1})]%;\
    /return $[strstr({_team_members_list_separated}, strcat("|",{search},"|")) != -1]

/def _team_members_purge = \
    /purge _team_members_trigger*%;\
    /purge _team_member_color_*%;\
    /set _team_leader=

/def _team_members_set = \
    /set _team_members_list_separated=$[tolower(strcat("|", replace(" ", "|", replace(", ", "|", replace(" i ", ", ", replace("ty, ", "", %{*})))), "|"))]%;\
    /_team_members_purge%;\
    /_team_members_generate_goodies

/def _team_set_fast_bind = \
    /let label=$[strcat(decode_attr(" -- -- DRUZYNA -- -- ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "/druzyna", 1)

/def ask_druzyna = \
    /if ({*}=~NULL) \
        /send druzyna%;\
    /endif

/def druzyna = \
    /def -t'Nie jestes czlonkiem zadnej druzyny.' _team_members_trigger_no_team = /_team_members_purge%;/unset _team_members_list_separated%;/quote -S /unset `/listvar -s \_team\_member\_*%;\
    /def -t'Nie jestes w zadnej druzynie.' _team_members_trigger_no_team_2 = /_team_members_purge%;/unset _team_members_list_separated%;/quote -S /unset `/listvar -s \_team\_member\_*%;\
    /def -mregexp -p5 -t'^Druzyne prowadzi (.*)( i|, w ktorej) oprocz ciebie (jest|sa) w niej jeszcze(|:) (.*)\.\$' _team_members_trigger_team_1 = /test _team_members_set("%%{P1}", "%%{P5}")%%;/set _team_leader %%{P1}%;\
    /def -mregexp -p5 -t'^Druzyne prowadzi (.*)\, zas ty jestes jej jedynym czlonkiem\.\$' _team_members_trigger_team_2 = /test _team_members_set("%%{P1}")%%;/set _team_leader %%{P1}%;\
    /def -mregexp -p5 -t'^Przewodzisz druzynie, w ktorej oprocz ciebie (jest jeszcze|sa(| w niej) jeszcze:) (.*)\.\$' _team_members_trigger_team_3 = /test _team_members_set("%%{P3}")%%;/set _team_leader=-%;\
    /ask_druzyna %{*}

/def -mregexp -p20 -t'Od teraz jej sklad stanowicie (.*)\.' _team_changed_trigger_1 = /_team_set_fast_bind
/def -mregexp -p20 -t'Porzucasz (swoja |)druzyne' _team_changed_trigger_2 = /_team_set_fast_bind
/def  -p20 -t'* rozwiazuje druzyne.' _team_changed_trigger_3 = /_team_set_fast_bind
/def  -p20 -t'Przekazujesz prowadzenie druzyny *' _team_changed_trigger_4 = /_team_set_fast_bind
/def  -p20 -t'* przekazuje ci prowadzenie druzyny.' _team_changed_trigger_5 = /_team_set_fast_bind
/def  -p20 -t'* przekazuje prowadzenie druzyny *' _team_changed_trigger_6 = /_team_set_fast_bind

/def -mregexp -p20 -t' zaprasza cie do swojej druzyny\.$$' _team_changed_trigger_7 = \
    /def -mregexp -p9999 -n1 -t'Od teraz jej sklad stanowicie (.*)\.' _team_changed_trigger_1_kill%;\
    /let who=$(/odmien_M_D %{PL})%;\
    /let label=$[strcat(decode_attr(" -- --  DOLACZ -- -- ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "porzuc druzyne%%;dolacz do %{who}%%;/repeat -1 1 /druzyna", 1)

/def -p20 -t'Zmuszasz * do opuszczenia druzyny.' _team_changed_trigger_8 = /_team_set_fast_bind


/def _team_members_generate_goodies = \
    /quote -S /unset `/listvar -s \_team\_member\_*%;\
    /purge _team_member_color_*%;\
    \
    /let _team_members_list=$[substr({_team_members_list_separated}, 1)]%;\
    /let _team_members_list_pointer=$[strstr({_team_members_list},"|")] %;\
    /let _team_members_list_i=0%;\
    \
    /while ({_team_members_list_pointer}!=-1) \
        /let _team_members_list_i=$[%{_team_members_list_i}+1]%;\
        /let _team_members_list_item=$[substr({_team_members_list},0,{_team_members_list_pointer})]%;\
        /let _team_members_list=$[substr({_team_members_list},{_team_members_list_pointer}+1)]%;\
        /let _team_members_list_pointer=$[strstr({_team_members_list}, "|")]%;\
        \
        /set _team_member_name_%{_team_members_list_i}=%{_team_members_list_item}%;\
        /set _team_member_number_%{_team_members_list_item}=%{_team_members_list_i}%;\
;        /set _team_member_name_%{_team_members_list_i}_number=%{_team_members_list_i}%;\
        \
        /_team_color_write_from_team_members %{_team_members_list_item} %{_team_members_list_i}%;\
        \
     /done%;\
     /purge z[0-9]+%; /purge zr[0-9]+%; /purge zg[0-9]+

/def _team_get_number_by_name = \
    /let search=$[tolower({1})]%;\
    /eval /echo %%_team_member_number_%{search}

/def _team_get_number_by_number = \
    /eval /echo %%_team_member_name_%{1}

/def _team_color_write_from_team_members = \
    /let member_M=$[tolower({1})]%;/let member_B=$(/odmien_M_B %{1})%;/let member_N=$(/odmien_M_N %{1})%;/let member_D=$(/odmien_M_D %{1})%;\
    /def -FPCrgb035 -mregexp -t'(%{member_B}|%{member_N}|%{member_D})|%{member_M}' _team_member_color_%{2}

/def _team_get_name_color = \
    /if (_team_is_member({*})) \
        /let color=Crgb140%;\
    /else \
        /let color=Crgb530%;\
    /endif%;\
    /echo %{color}

/def _team_get_member_label_B = \
    /let return=%{*}%;\
    /if (_team_is_member({*})) \
        /let number=$(/_team_get_number_by_name %{*})%;\
        /let return=$(/odmien_M_B %{*})%;\
        /let return=$[decode_attr($(/ucfirstname %{return}), $(/_team_get_name_color %{*}))]%;\
        /let return=%{return} [%{number}]%;\
    /endif%;\
    /echo %{return}

