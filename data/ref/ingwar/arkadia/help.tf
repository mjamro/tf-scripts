; Automagicly added line: tf_ver=1.0.0
;------------------------------------------------------------------------------
;|                           Pomoc dla Arkadii                                |
;------------------------------------------------------------------------------


/def ? = /pomoc %{*}
/def pomoc = \
    /if ({*}=~NULL | {*}=~"ogolne") \
      /?ogolne %;\
    /elseif ($(/list -s ?%{*})!~NULL) \
      /?%{*} %;\
    /else \
      /echo -p -aCgreen Nie ma @{BCwhite}Pomocy @{nCgreen}na ten temat! %;\
    /endif

/def ?ogolne = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Informacje ogolne!@{nCgreen}                                                          | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /pomoc ogolne               - To co czytasz :)                              | %; \
/echo -p -aCgreen |        komendy              - Spis komend, aliasow, defow                   | %; \
/echo -p -aCgreen |        trigi                - Cos na temat trigerow                         | %; \
/echo -p -aCgreen |        druzyna              - Wszystko o druzynie                           | %; \
/echo -p -aCgreen |        opcje                - Ustawianie opcji                              | %; \
/echo -p -aCgreen |        bindy                - Ustawione bindy itd. itp.                     | %; \
/echo -p -aCgreen |        inne                 - Wszystko inne                                 | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+

/def ?komendy = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Spis podstawowych komend!@{nCgreen}                                                   | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /nb (np. /nb topora)        - Definiowanie broni                            | %; \
/echo -p -aCgreen | /nbt (np. /nbt topor)       - Definiowanie broni do pochwy                  | %; \
/echo -p -aCgreen | /nt (np. /nt pochwy)        - Definiowanie pochwy                           | %; \
/echo -p -aCgreen | /db                         - Dobywanie zdefiniowanej broni                 | %; \
/echo -p -aCgreen | /uu                         - Ubieranie sie                                 | %; \
/echo -p -aCgreen | /yy                         - Rozbieranie sie                               | %; \
/echo -p -aCgreen | /v                          - Wsiadanie na statek                           | %; \
/echo -p -aCgreen | /ta                         - Czytanie tablic, tabliczek                    | %; \
/echo -p -aCgreen | /nl                         - Napelnianie lampy                             | %; \
/echo -p -aCgreen | /zl                         - Zapalanie lampy                               | %; \
/echo -p -aCgreen | /zgl                        - Gaszenie lampy                                | %; \
/echo -p -aCgreen | /zp                         - Zapalanie pochodni                            | %; \
/echo -p -aCgreen | /zg                         - Gaszenie pochodni                             | %; \
/echo -p -aCgreen | /naprawa                    - Naprawia wszystko po kolei                    | %; \
/echo -p -aCgreen | /pij                        - Picie do pelna                                | %; \
/echo -p -aCgreen | /jedz                       - Jedzenie prawie wszedzie                      | %; \
/echo -p -aCgreen | /poczta [czysc]             - Sprawdzanie listow                            | %; \
/echo -p -aCgreen | /bilans [czysc|wyswietl]    - Przychody i wychody                           | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+

/def ?trigi = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Wszystko co zabronione!@{nCgreen}                                                     | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /bierz [co]                 - Automatycznie zbieranie                       | %; \
/echo -p -aCgreen | /niebierz                   - Koniec zbierania                              | %; \
/echo -p -aCgreen | /zloto                      - Zbieranie kasy                                | %; \
/echo -p -aCgreen | /dylizans                   - Wsiadanie do najblizszego                     | %; \
/echo -p -aCgreen |                               dylizansu                                     | %; \
/echo -p -aCgreen | /statek                     - Wsiadanie na nastapny statek                  | %; \
/echo -p -aCgreen | /statek-                    - Jakby nam sie znudzilo czekac                 | %; \
/echo -p -aCgreen | /niezsiadaj                 - Jak chcesz plywac bez konca                   | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen | Wiekszosc trigow dziala bez potrzeby wlaczania :)                           | %; \
/echo -p -aCgreen +-===========================================================================-+

/def ?druzyna = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Obsluga druzyny!@{nCgreen}                                                            | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /druzyna                    - Sprawdzanie druzyny                           | %; \
/echo -p -aCgreen |                               (dziala automatycznie)                        | %; \
/echo -p -aCgreen | /wsparcie                   - Wspieranie calej druzyny                      | %; \
/echo -p -aCgreen | /wspieranie [on|off]        - To samo tylko inaczej                         | %; \
/echo -p -aCgreen | /follow [on|off]            - Auto chodzenie za szefem                      | %; \
/echo -p -aCgreen | /kolorki [on|off|all]       - Kolorowanie walki druzyny                     | %; \
/echo -p -aCgreen | /status [on|off]            - Wyswietla status druzyny                      | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+

/def ?opcje = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Opcje arkadii!@{nCgreen}                                                              | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /nig                        - Ucieczka nigdy                                | %; \
/echo -p -aCgreen | /led                        - Ucieczka ledwo zywy                           | %; \
/echo -p -aCgreen | /cie                        - Ucieczka ciezko ranny                         | %; \
/echo -p -aCgreen | /zla                        - Ucieczka zla kondycja                         | %; \
/echo -p -aCgreen | /ran                        - Ucieczka ranny                                | %; \
/echo -p -aCgreen | /lek                        - Ucieczka lekko ranny                          | %; \
/echo -p -aCgreen | /dob                        - Ucieczka dobry stan                           | %; \
/echo -p -aCgreen | /swi                        - Ucieczka swietna kondycja                     | %; \
/echo -p -aCgreen | /kro                        - Opcje krotkie wlaczone                        | %; \
/echo -p -aCgreen | /dlu                        - Opcje krotkie wylaczone                       | %; \
/echo -p -aCgreen | /twal                       - Walki innych wlaczone                         | %; \
/echo -p -aCgreen | /nwal                       - Walki innych wylaczone                        | %; \
/echo -p -aCgreen | /szer <10-200>              - Ustawienie szerokosci ekranu                  | %; \
/echo -p -aCgreen | /wys  <1-100>               - Ustawienie wysokosci ekranu                   | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+

/def ?bindy = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Bindy!@{nCgreen}                                                                      | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /k                          - Wlaczenie kierunkow                           | %; \
/echo -p -aCgreen |                               (cyferki dzialaja)                            | %; \
/echo -p -aCgreen | /kier                       - Wlaczenie kierunkow                           | %; \
/echo -p -aCgreen |                               (cyferki nie dzialaja)                        | %; \
/echo -p -aCgreen | /nk                         - Wylaczenie kierunkow                          | %; \
/echo -p -aCgreen | /pmon                       - Przemykanie wlaczone                          | %; \
/echo -p -aCgreen | /pmoff                      - Przemykanie wylaczone                         | %; \
/echo -p -aCgreen | /bindy                      - Wyswietla bindy F1-F12                        |  %; \
/echo -p -aCgreen | /kiershow (on|off)          - Zmienia pokazywanie gdzie idziemy             |  %; \
/echo -p -aCgreen | @{BCwhite}Dostepne bindy :@{nCgreen}                                                            | %; \
/echo -p -aCgreen | [                           - Kondycja wszystkich                           | %; \
/echo -p -aCgreen | ]                           - Stan                                          | %; \
/echo -p -aCgreen | Ctr+R                       - Reconnect                                     | %; \
/echo -p -aCgreen | PageUp                      - Scroll Up                                     | %; \
/echo -p -aCgreen | PageDown                    - Scroll Down                                   | %; \
/echo -p -aCgreen | F1-F12                      - Ustawienia zmienne w czasie                   | %; \
/echo -p -aCgreen |                               ustawiane komendami /F1-/F12                  | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+

/def ?inne = \
/echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
/echo -p -aCgreen | @{BCyellow}Wszystko inne!@{nCgreen}                                                              | %; \
/echo -p -aCgreen | @{BCwhite}Dostepne komendy :@{nCgreen}                                                          | %; \
/echo -p -aCgreen | /zabici                     - Spis dzisiejszych zabitych                    | %; \
/echo -p -aCgreen | /zabici2                    - Spis calkowicie zabitych                      | %; \
/echo -p -aCgreen | /wykres                     - Wkres zabitych od czasu                       | %; \
/echo -p -aCgreen | /apropos <string>           - Poszukuje stringa w makrach                   | %; \
/echo -p -aCgreen | /reload                     - Przeladowuje wszystkie makra                  | %; \
/echo -p -aCgreen | /rec [-i] <string>          - Podaje ostatnich [i] lini                     | %; \
/echo -p -aCgreen |                               w ktorych wystepuje string                    | %; \
/echo -p -aCgreen |                                                                             | %; \
/echo -p -aCgreen +-===========================================================================-+
