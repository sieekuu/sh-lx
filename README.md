# Skrypty administracyjne Linux

To repozytorium zawiera zestaw skryptów Bash ułatwiających podstawową administrację systemem Linux, takich jak aktualizacja systemu, konfiguracja SSH czy instalacja wybranych usług (np. Docker). Skrypty są przeznaczone do uruchamiania z uprawnieniami administratora (root lub `sudo`).

## Zawartość

- Skrypty automatyzujące typowe zadania administracyjne
- Proste, czytelne pliki `.sh`, które można modyfikować pod własne potrzeby
- Każdy skrypt opisany w nagłówku komentarzami, co robi i jakie ma wymagania

## Wymagania

- System Linux z powłoką Bash
- Dostęp do konta z uprawnieniami `root` lub możliwością użycia `sudo`
- Podstawowa znajomość pracy w terminalu

## Nadawanie uprawnień do wykonywania skryptów

1. Sklonuj repozytorium lub skopiuj wybrany skrypt do katalogu roboczego
2. Nadaj plikowi uprawnienia do wykonywania poleceniem:
  ```
chmod +x nazwa_skryptu.sh
  ```
4. Uruchom skrypt:
- jako zwykły użytkownik (jeśli nie wymaga roota):
  ```
  ./nazwa_skryptu.sh
  ```
- z uprawnieniami administratora:
  ```
  sudo ./nazwa_skryptu.sh
  ```

## Uwagi

- Zawsze sprawdzaj zawartość skryptu przed uruchomieniem
- Niektóre skrypty tworzą kopie zapasowe modyfikowanych plików konfiguracyjnych
- Skrypty są testowane na Ubuntu/Debian, ale mogą działać również na innych dystrybucjach
